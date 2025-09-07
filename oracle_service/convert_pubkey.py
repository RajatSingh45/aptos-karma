import requests

def hex_to_move_vector(hex_str: str) -> str:
    # Remove "0x" prefix if present
    hex_str = hex_str.strip().lower().replace("0x", "")
    
    # Split into 2-character chunks
    bytes_list = [hex_str[i:i+2] for i in range(0, len(hex_str), 2)]
    
    # Format with 0x
    formatted = ", ".join([f"0x{b}" for b in bytes_list])
    
    # Wrap into Move const
    move_const = f"""const ORACLE_PUBLIC_KEY: vector<u8> = [
    {formatted}
];"""
    return move_const


if __name__ == "__main__":
    # Call your FastAPI health endpoint
    try:
        response = requests.get("http://127.0.0.1:8000/health")
        response.raise_for_status()
        data = response.json()
        public_key = data["public_key"]
        print(f"Public Key: {public_key}\n")
        
        move_code = hex_to_move_vector(public_key)
        print("Generated Move Constant:\n")
        print(move_code)
    except Exception as e:
        print("Error fetching public key:", e)
