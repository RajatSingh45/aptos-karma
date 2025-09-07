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

test_move/
├── README.md # 📖 Root documentation (setup + integration guide)
│
├── move_project/ # ⚡ Blockchain Smart Contracts (Move)
│ ├── Move.toml
│ ├── build/ # Auto-generated compiled bytecode
│ └── sources/
│ ├── work_gem.move # Work verification contract
│ ├── karma_score.move # Karma reputation logic (optional on-chain)
│ └── micro_loan.move # Loan pool & lending logic
│
├── frontend/ # 🎨 React + Tailwind + ts-sdk Frontend
│ ├── public/
│ │ └── index.html
│ ├── src/
│ │ ├── App.tsx # Root app with navigation
│ │ ├── App.css
│ │ ├── index.tsx
│ │ ├── react-app-env.d.ts
│ │ │
│ │ ├── components/ # 👇 UI/Passport components
│ │ │ ├── passport/ # WorkGem + Passport widgets
│ │ │ ├── ui/ # Reusable Shadcn/ui components
│ │ │ ├── AnimatedBackground.tsx
│ │ │ ├── Header.tsx
│ │ │ ├── KarmaPassport.tsx # 🚀 Main user dashboard
│ │ │ └── WelcomeScreen.tsx
│ │ │
│ │ ├── dashboards/ # Role-based dashboards
│ │ │ ├── CompanyDashboard.tsx
│ │ │ ├── EmployeeDashboard.tsx
│ │ │ └── LoanProviderDashboard.tsx
│ │ │
│ │ ├── integrations/
│ │ │ └── AptosKarmaIntegration.tsx # 💎 Glue: blockchain <-> ML <-> frontend
│ │ │
│ │ └── components/shared/
│ │ └── config.ts # Shared constants: module address, API URLs
│ │
│ ├── package.json
│ └── tailwind.config.js
│
├── oracle_service/ # 🤖 AI/ML Oracle Service
│ ├── main.py # FastAPI app exposing /karma_score
│ ├── convert_pubkey.py # Optional key conversion utils
│ ├── requirements.txt # Python dependencies
│ └── README.md # API docs & how to run ML service
│
└── scripts/ # 🛠 Helper scripts
├── check_store.js # Fetch WorkGemStore from company account
├── demo_flow.js # End-to-end: create gem → fetch → AI → loan
└── deploy.sh # Automate compile + publish Move contracts

yaml
Copy code

---

## 🚀 Quick Start  

### 1️⃣ Setup Move Contracts  
```bash
cd move_project
aptos move compile
aptos move publish --profile default
Contracts:

work_gem.move → Work verification

karma_score.move → Reputation logic

micro_loan.move → Loan pool management

2️⃣ Run the Oracle Service (AI/ML)
bash
Copy code
cd oracle_service
python -m venv venv
source venv/bin/activate  # (or venv\Scripts\activate on Windows)
pip install -r requirements.txt
uvicorn main:app --reload --port 8000
API Endpoints:

GET /health → Health check

POST /karma_score → Returns ML-calculated karma score

3️⃣ Start the Frontend
bash
Copy code
cd frontend
npm install
npm run dev
Frontend Features:

Employee Passport with WorkGems

Company Dashboard to issue gems

Loan Provider Dashboard to approve/reject micro-loans

Integration with Aptos contracts + ML Oracle

4️⃣ Demo Flow (Optional)
End-to-end script (contracts → oracle → frontend):

bash
Copy code
cd scripts
bash deploy.sh
node demo_flow.js
⚡ Tech Stack
Blockchain: Aptos + Move

Backend: FastAPI (ML Oracle)

Frontend: React + Tailwind + ts-sdk

Integration: Aptos SDK + REST API

🛠 Helper Scripts
deploy.sh → Compile & publish contracts

demo_flow.js → Demo flow (WorkGem → Karma → Loan)

check_store.js → Query on-chain WorkGemStore

📌 Notes
Update frontend/src/config.ts with your published contract address and API base URL.

oracle_service/convert_pubkey.py handles Aptos key conversion if required.

Use aptos account fund-with-faucet --account <addr> to fund test accounts on devnet.

👨‍💻 Contributors
Rajat Singh – Full Stack + Blockchain Developer

Agnik Paul – Frontend Developer

Soumyadeep Sarkar – AI/ML Engineer

📜 License
MIT – feel free to fork and build on top of this.

yaml
Copy code
