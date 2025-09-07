import { Aptos, AptosConfig, Network } from "@aptos-labs/ts-sdk";

// Replace with your deployed contract + account
const MODULE_ADDRESS = "0xYourModuleAddress";
const COMPANY_ACCOUNT = "0xCompanyAccountAddress";

const aptos = new Aptos(
  new AptosConfig({ network: Network.TESTNET })
);

async function checkWorkGemStore() {
  try {
    const resources = await aptos.getAccountResources({ accountAddress: COMPANY_ACCOUNT });
    const store = resources.find((r) =>
      r.type.includes(`${MODULE_ADDRESS}::work_gem::WorkGemStore`)
    );

    console.log("✅ WorkGemStore for Company:", JSON.stringify(store, null, 2));
  } catch (err) {
    console.error("❌ Error fetching store:", err);
  }
}

checkWorkGemStore();
