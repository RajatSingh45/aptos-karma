# 🌟 WorkGem + MicroLoanPool on Aptos  

🚀 **WorkGem** is a blockchain-powered proof-of-work and microfinance solution built on **Aptos (Move)**.  
Employees earn verifiable **WorkGems** for tasks completed, track their **Karma Score**, and access **micro-loans** based on reputation.  

---

## ✨ Features  
- 🪙 WorkGems as Proof of Work  
- 📊 Karma Passport (AI-powered reputation)  
- 💰 MicroLoan Pool (trust-based lending)  
- 🖥 Employee, Company & Loan Provider Dashboards  
- 🔗 On-Chain Verifiability with Aptos  

---

## 📂 Project Structure  

test_move/
├── README.md # 📖 Root documentation (integration steps, setup guide)
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

## 📸 Screenshots  

### 🏠 Employee Dashboard  
<img src="screenshots/karma_passport.jpg" alt="Karma Passport" width="800"/>  

### 💰 Loan Request Flow  
<img src="screenshots/loan_request.jpg" alt="Loan Request" width="800"/>  
<img src="screenshots/submitting_transaction.jpg" alt="Submitting Transaction" width="800"/>  
<img src="screenshots/loan_approved.jpg" alt="Loan Approved" width="800"/>  

---

## 👨‍💻 Contributors  
- [**Rajat Singh**](https://github.com/RajatSingh45) – Full Stack + Blockchain Developer  
- [**Agnik Paul**](https://github.com/Agnik47) – Frontend Developer  
- [**Soumyadeep Sarkar**](https://github.com/Soumyadeep143) – AI/ML Engineer  
