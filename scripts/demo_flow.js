import { Aptos, AptosConfig, Network } from "@aptos-labs/ts-sdk";
import fetch from "node-fetch";

const aptos = new Aptos(
  new AptosConfig({ network: Network.TESTNET })
);

// Replace with your deployed contract + account keys
const MODULE_ADDRESS = "0xYourModuleAddress";
const COMPANY_PRIVATE_KEY = "0x...";
const EMPLOYEE_ADDRESS = "0x...";
const ORACLE_URL = "http://localhost:8000/karma_score"; // AI/ML FastAPI service

async function demoFlow() {
  try {
    // 1️⃣ Company mints a WorkGem
    console.log("⛏ Minting WorkGem...");
    // TODO: Call entry function from your work_gem.move
    // (similar to publish_work_gem)

    // 2️⃣ Fetch WorkGemStore
    console.log("📦 Fetching employee WorkGems...");
    // TODO: Fetch resources using aptos.getAccountResources

    // 3️⃣ Send WorkGem to AI oracle
    console.log("🤖 Sending to AI service...");
    const response = await fetch(ORACLE_URL, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        worker: EMPLOYEE_ADDRESS,
        work_gems: [
          { category: "Engineering", rating: 5, timestamp: Date.now() }
        ]
      })
    });
    const aiResult = await response.json();
    console.log("✨ AI Karma Score:", aiResult);

    // 4️⃣ Loan provider uses Karma Score
    if (aiResult.score > 70) {
      console.log("💰 Loan approved!");
    } else {
      console.log("🚫 Loan rejected, low score.");
    }
  } catch (err) {
    console.error("❌ Error in demo flow:", err);
  }
}

demoFlow();
