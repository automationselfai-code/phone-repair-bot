# 🔧 JERRYTECH Phone Repair Bot

An AI-powered WhatsApp chatbot for **JERRYTECH Global Communications** — automating customer support, repair inquiries, and lead capture for a phone repair business in Lagos, Nigeria.

---

## 🚀 What It Does

- Automatically responds to customer WhatsApp messages 24/7
- Answers FAQs about repair services, pricing, and turnaround time
- Captures customer name, phone model, and fault description
- Routes complex inquiries to a human agent
- Sends follow-up messages after repair completion
- Logs all customer interactions to Airtable

---

## 🛠 Tech Stack

| Tool | Purpose |
|------|---------|
| Node.js | Runtime environment |
| WhatsApp Business API | Messaging channel |
| OpenAI API | AI response generation |
| Airtable | Customer data & lead storage |
| Docker | Containerization |
| n8n | Workflow automation engine |

---

## 📁 Project Structure

```
phone-repair-bot/
├── .env.example                      # Environment variables template
├── .gitignore                        # Files excluded from Git
├── docker-compose.yml                # Docker setup
├── README.md                         # This file
├── docs/
│   └── airtable-setup.md             # Airtable configuration guide
├── workflows/
│   ├── 01-webhook-verification.json  # WhatsApp webhook handshake
│   ├── 02-greeting-flow.json         # Welcome message flow
│   └── 03-main-router-booking.json   # Main message router & booking
└── scripts/
    └── backup-workflows.sh           # Workflow backup script
```

---

## ⚙️ Setup & Installation

### Prerequisites
- Node.js v18+
- Docker & Docker Compose
- A self-hosted or cloud n8n instance
- WhatsApp Business API access
- OpenAI API key
- Airtable account

### 1. Clone the repo
```bash
git clone https://github.com/YOUR_USERNAME/phone-repair-bot.git
cd phone-repair-bot
```

### 2. Configure environment variables
```bash
cp .env.example .env
```
Open `.env` and fill in your API keys (see section below).

### 3. Run with Docker
```bash
docker-compose up -d
```

### 4. Import n8n workflows
- Open your n8n instance
- Go to **Workflows → Import from File**
- Import each `.json` file from the `/workflows` folder in order (01 → 02 → 03)
- Activate each workflow

---

## 🔑 Environment Variables

```env
# WhatsApp
WHATSAPP_TOKEN=your_whatsapp_token_here
WEBHOOK_VERIFY_TOKEN=your_custom_verify_token

# OpenAI
OPENAI_API_KEY=your_openai_key_here

# Airtable
AIRTABLE_API_KEY=your_airtable_key_here
AIRTABLE_BASE_ID=your_base_id_here

# n8n
N8N_HOST=your_n8n_host_url
```

> ⚠️ Never commit your `.env` file to GitHub. It is already listed in `.gitignore`.

---

## 📊 Workflow Overview

| File | Workflow | Description |
|------|----------|-------------|
| `01-webhook-verification.json` | Webhook Verification | Handles WhatsApp webhook handshake with Meta |
| `02-greeting-flow.json` | Greeting Flow | Sends welcome message to new contacts |
| `03-main-router-booking.json` | Main Router & Booking | Routes messages by intent and captures repair bookings |

---

## 🧠 How the Bot Works

```
Customer sends WhatsApp message
        ↓
n8n Webhook receives message
        ↓
OpenAI classifies intent (FAQ / Booking / Human Handoff)
        ↓
┌───────────────────────────────┐
│  FAQ → Auto-reply with answer │
│  Booking → Capture details    │
│  Complex → Route to human     │
└───────────────────────────────┘
        ↓
Log interaction to Airtable
```

---

## 📖 Documentation

- [Airtable Setup Guide](docs/airtable-setup.md)
- [WhatsApp Business API Docs](https://developers.facebook.com/docs/whatsapp)
- [n8n Documentation](https://docs.n8n.io)

---

## 🏢 About JERRYTECH

**JERRYTECH Global Communications** is a phone repair and accessories business based in Ikorodu, Lagos, Nigeria. Founded in 2020, accredited in 2023. Services include phone repairs, buying/selling, trade-ins, and accessories.

---

## 👨‍💻 Built By

**Jeremiah Odinachi** (he/him) — AI Automation Consultant & Founder, JERRYTECH Global Communications  
📧 automation.selfai@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/jeremiah-odinachi-705564214)  
🐙 [GitHub](https://github.com/jeremiahautomationselfai-code)

---

## 📄 License

MIT License — feel free to fork and adapt for your own business.
