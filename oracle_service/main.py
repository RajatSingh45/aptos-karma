from fastapi import FastAPI
from pydantic import BaseModel
import time
from nacl.signing import SigningKey

app = FastAPI()

# Generate signing key (in production, load from secure storage)
signing_key = SigningKey.generate()
verify_key = signing_key.verify_key
PUBLIC_KEY_HEX = verify_key.encode().hex()

# Models
class WorkGem(BaseModel):
    rating: float
    category: str
    hours: int

class ScoreRequest(BaseModel):
    worker_address: str
    work_gems: list[WorkGem]

# Utility: calculate Karma Score
def calculate_karma(work_gems: list[WorkGem]) -> int:
    if not work_gems:
        return 0
    return int(sum([gem.rating * gem.hours for gem in work_gems]))

@app.post("/calculate-score")
def calculate_score(request: ScoreRequest):
    score = calculate_karma(request.work_gems)

    # Assign tier
    if score < 50:
        tier = "Bronze"
    elif score < 150:
        tier = "Silver"
    else:
        tier = "Gold"

    # 🔑 Message format agreed with blockchain dev
    message = f"KarmaScore:{score}:{request.worker_address}".encode()

    # Sign message
    signature = signing_key.sign(message).signature.hex()

    payload = {
        "worker_address": request.worker_address,
        "karma_score": score,
        "tier": tier,
        "timestamp": int(time.time()),
        "signature": signature,
        "public_key": PUBLIC_KEY_HEX
    }

    return payload

@app.get("/health")
def health_check():
    return {"status": "ok", "public_key": PUBLIC_KEY_HEX}

# Optional test route
@app.get("/test")
def test():
    example_worker = "0x51CCbE2A92e70cE15CAa86FB7dA1e6A4dd6A4B3c"
    gems = [WorkGem(rating=5, category="delivery", hours=10)]
    score = calculate_karma(gems)
    message = f"KarmaScore:{score}:{example_worker}".encode()
    signature = signing_key.sign(message).signature.hex()
    return {
        "worker_address": example_worker,
        "karma_score": score,
        "tier": "Silver",
        "timestamp": int(time.time()),
        "signature": signature,
        "public_key": PUBLIC_KEY_HEX
    }
