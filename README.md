# 🌟 TestMove – WorkGem + Karma + MicroLoan dApp

🚀 A decentralized application on **Aptos** that verifies work history (**WorkGem**), builds reputation (**Karma Score**), and enables **micro-loans** for employees.  
The system combines **Move smart contracts**, an **AI/ML oracle**, and a **React frontend**.

---

## ✨ Features

- 🪙 **WorkGems as Proof of Work** – Employees earn gems for verified tasks.  
- 📊 **Karma Passport** – AI-powered reputation scoring.  
- 💰 **MicroLoan Pool** – Access small loans based on trust & XP earned.  
- 🖥 **Role-Based Dashboards** – Employee, Company & Loan Provider views.  
- 🔗 **On-Chain Verifiability** – All WorkGems stored immutably on Aptos blockchain.

---

## 📂 Project Structure

project_structure:
  test_move:
    - README.md: "📖 Root documentation (setup + integration guide)"
    - move_project: "⚡ Blockchain Smart Contracts (Move)"
      contents:
        - Move.toml: null
        - build: "Auto-generated compiled bytecode"
        - sources:
            - work_gem.move: "Work verification contract"
            - karma_score.move: "Karma reputation logic (optional on-chain)"
            - micro_loan.move: "Loan pool & lending logic"
    - frontend: "🎨 React + Tailwind + ts-sdk Frontend"
      contents:
        - public:
            - index.html: null
        - src:
            - App.tsx: "Root app with navigation"
            - App.css: null
            - index.tsx: null
            - react-app-env.d.ts: null
            - components: "UI/Passport components"
              contents:
                - passport: "WorkGem + Passport widgets"
                - ui: "Reusable Shadcn/ui components"
                - AnimatedBackground.tsx: null
                - Header.tsx: null
                - KarmaPassport.tsx: "Main user dashboard"
                - WelcomeScreen.tsx: null
            - dashboards: "Role-based dashboards"
              contents:
                - CompanyDashboard.tsx: null
                - EmployeeDashboard.tsx: null
                - LoanProviderDashboard.tsx: null
            - integrations:
                - AptosKarmaIntegration.tsx: "Glue: blockchain <-> ML <-> frontend"
            - components/shared:
                - config.ts: "Shared constants: module address, API URLs"
        - package.json: null
        - tailwind.config.js: null
    - oracle_service: "🤖 AI/ML Oracle Service"
      contents:
        - main.py: "FastAPI app exposing /karma_score"
        - convert_pubkey.py: "Optional key conversion utils"
        - requirements.txt: "Python dependencies"
        - README.md: "API docs & how to run ML service"
    - scripts: "🛠 Helper scripts"
      contents:
        - check_store.js: "Fetch WorkGemStore from company account"
        - demo_flow.js: "End-to-end: create gem → fetch → AI → loan"
        - deploy.sh: "Automate compile + publish Move contracts"

quick_start:
  setup_move_contracts:
    commands:
      - "cd move_project"
      - "aptos move compile"
      - "aptos move publish --profile default"
    contracts:
      - "work_gem.move → Work verification"
      - "karma_score.move → Reputation logic"
      - "micro_loan.move → Loan pool management"

  run_oracle_service:
    commands:
      - "cd oracle_service"
      - "python -m venv venv"
      - "source venv/bin/activate  # (or venv\\Scripts\\activate on Windows)"
      - "pip install -r requirements.txt"
      - "uvicorn main:app --reload --port 8000"
    api_endpoints:
      - "GET /health → Health check"
      - "POST /karma_score → Returns ML-calculated karma score"

  start_frontend:
    commands:
      - "cd frontend"
      - "npm install"
      - "npm run dev"
    features:
      - "Employee Passport with WorkGems"
      - "Company Dashboard to issue gems"
      - "Loan Provider Dashboard to approve/reject micro-loans"
      - "Integration with Aptos contracts + ML Oracle"

  demo_flow_optional:
    description: "End-to-end script (contracts → oracle → frontend)"
    commands:
      - "cd scripts"
      - "bash deploy.sh"
      - "node demo_flow.js"

tech_stack:
  - Blockchain: "Aptos + Move"
  - Backend: "FastAPI (ML Oracle)"
  - Frontend: "React + Tailwind + ts-sdk"
  - Integration: "Aptos SDK + REST API"

helper_scripts:
  - "deploy.sh → Compile & publish contracts"
  - "demo_flow.js → Demo flow (WorkGem → Karma → Loan)"
  - "check_store.js → Query on-chain WorkGemStore"

notes:
  - "Update frontend/src/config.ts with your published contract address and API base URL."
  - "oracle_service/convert_pubkey.py handles Aptos key conversion if required."
  - "Use aptos account fund-with-faucet --account <addr> to fund test accounts on devnet."

contributors:
  - Rajat Singh: "Full Stack + Blockchain Developer"
  - Agnik Paul: "Frontend Developer"
  - Soumyadeep Sarkar: "AI/ML Engineer"

license: "MIT – feel free to fork and build on top of this."
