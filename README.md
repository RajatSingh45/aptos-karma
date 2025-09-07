To give you a downloadable `README.md` file, I need to provide the content as a text block that you can copy and paste into a file on your computer. Simply save the content below into a new file named `README.md`.

````markdown
# 🌟 TestMove – WorkGem + Karma + MicroLoan dApp

A decentralized application on **Aptos** that verifies work history (**WorkGem**), builds reputation (**Karma Score**), and enables **micro-loans** for employees. This system combines **Move smart contracts**, an **AI/ML oracle**, and a **React frontend**.

---

## ✨ Features

* **WorkGems as Proof of Work**
    Employees earn unique digital assets for verified tasks.
* **Karma Passport**
    An AI-powered reputation score that builds trust on-chain.
* **MicroLoan Pool**
    Access small loans directly, with terms based on your on-chain reputation.
* **Role-Based Dashboards**
    Dedicated interfaces for employees, companies, and loan providers.
* **On-Chain Verifiability**
    All work history is stored immutably on the Aptos blockchain.

---

## 📂 Project Structure

The **TestMove** dApp is organized into four primary directories, each with a distinct role in the application's architecture:

* **`move_project/`**: This directory contains the core of the dApp's business logic, written in the **Move** programming language.
    * `work_gem.move`: Manages the creation and on-chain verification of **WorkGems** as proof of completed tasks.
    * `karma_score.move`: Implements the on-chain logic for handling the **Karma Score**, a user's reputation.
    * `micro_loan.move`: Contains the smart contracts for managing the **MicroLoan Pool** and the lending process, including loan applications and approvals.
* **`oracle_service/`**: This is a standalone **FastAPI** application that acts as the **AI/ML Oracle**.
    * `main.py`: Exposes a REST API endpoint, `/karma_score`, which receives on-chain data and uses a machine learning model to calculate and return a reputation score.
    * `requirements.txt`: Lists all Python dependencies required for the service.
* **`frontend/`**: This is the client-side application built with **React**, **Tailwind**, and the **Aptos SDK**.
    * `App.tsx`: The main component that handles routing and overall application layout.
    * `components/`: This folder is further organized into subdirectories for specific UI elements.
        * `passport/`: Contains components directly related to a user's **Karma Passport**, such as `WorkGemLedger.tsx` and `XPProgressBar.tsx`.
        * `ui/`: Houses reusable, low-level UI components from **Shadcn/ui** to ensure a consistent design system.
    * `dashboards/`: Contains the high-level dashboard components for each user role: `EmployeeDashboard.tsx`, `CompanyDashboard.tsx`, and `LoanProviderDashboard.tsx`.
* **`scripts/`**: This directory contains automation scripts to streamline development and testing.
    * `deploy.sh`: A shell script that automates the compilation and deployment of the **Move** contracts.
    * `demo_flow.js`: A **Node.js** script that provides a complete end-to-end demonstration of the dApp's core functionality, from creating a WorkGem to receiving a loan.

---

## ⚙️ Quick Start

Follow these steps to set up and run the dApp locally.

### 1. Setup Move Contracts

Navigate to the `move_project` directory, compile the contracts, and publish them to your Aptos account.

```bash
cd move_project
aptos move compile
aptos move publish --profile default
````

***Note:*** After publishing, update the contract address in `frontend/src/components/shared/config.ts`.

### 2\. Run the Oracle Service

This service calculates the Karma Score. Start it using a Python virtual environment.

```bash
cd oracle_service
python -m venv venv
source venv/bin/activate  # Use `venv\Scripts\activate` on Windows
pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```

The service will be running on `http://localhost:8000`.

### 3\. Start the Frontend

In a new terminal, navigate to the `frontend` directory and start the React application.

```bash
cd frontend
npm install
npm run dev
```

Your dApp will now be live, integrated with your local Aptos contracts and the ML oracle.

### 4\. Run the Demo Flow (Optional)

An end-to-end script is available to demonstrate the entire process: creating a WorkGem, fetching it, sending it to the oracle for a score, and using that score to apply for a loan.

```bash
cd scripts
bash deploy.sh
node demo_flow.js
```

-----

## 🛠 Tech Stack

  * **Blockchain**: Aptos + Move
  * **Backend**: FastAPI (for the ML Oracle)
  * **Frontend**: React, Tailwind, and Aptos SDK
  * **Integration**: Aptos SDK + REST API

-----

## 🤝 Contributors

  * **Rajat Singh**: Full Stack + Blockchain Developer
  * **Agnik Paul**: Frontend Developer
  * **Soumyadeep Sarkar**: AI/ML Engineer

-----

## 📝 License

This project is licensed under the **MIT License**. Feel free to fork and build on top of it.

```
```
