# Airtable Setup Guide — JERRYTECH Bot

Create a free Airtable account at airtable.com, then set up one Base with two tables below.

---

## Base

Name it: `JERRYTECH Bot`

Copy the Base ID from the URL:
`https://airtable.com/appXXXXXXXXXXXXXX/...`
                      ↑ this is your AIRTABLE_BASE_ID

---

## Table 1: Sessions

Tracks which step of a conversation each customer is on.

| Field Name   | Field Type    | Notes                                      |
|--------------|---------------|--------------------------------------------|
| Phone        | Phone number  | **Primary field** — unique per customer    |
| Step         | Single line   | idle / booking_device / booking_problem / booking_date / booking_time |
| TempDevice   | Single line   | Stores device during booking flow          |
| TempProblem  | Long text     | Stores problem description                 |
| TempDate     | Single line   | Stores preferred date (free text)          |

> The bot uses Airtable's `performUpsert` API to create or update by Phone automatically.
> You do NOT need to add records manually.

---

## Table 2: Bookings

Stores completed repair bookings.

| Field Name    | Field Type     | Notes                                    |
|---------------|----------------|------------------------------------------|
| Reference     | Single line    | Auto-generated e.g. JT-483921           |
| CustomerName  | Single line    | From WhatsApp profile                    |
| Phone         | Phone number   | Customer's WhatsApp number               |
| Device        | Single select  | Options: iPhone, Samsung, Tecno, Infinix, Other |
| Problem       | Long text      | Customer's description                   |
| PreferredDate | Single line    | Date as typed by customer                |
| PreferredTime | Single select  | Options: Morning (9am–12pm), Afternoon (12–4pm), Evening (4–6pm) |
| Status        | Single select  | Options: Pending, Confirmed, In Progress, Completed, Cancelled |
| CreatedAt     | Created time   | Auto-set by Airtable                     |

---

## Get your Airtable Personal Access Token

1. Go to: https://airtable.com/create/tokens
2. Click **+ Create new token**
3. Name: `jerrytech-bot`
4. Scopes: `data.records:read`, `data.records:write`
5. Access: Select your `JERRYTECH Bot` base
6. Copy the token — this is your `AIRTABLE_API_KEY`

---

## Add to your n8n Environment Variables

In your n8n at selfai-hub.xyz, go to:
**Settings → Environment Variables** and add:

```
AIRTABLE_API_KEY=patXXXXXXXXXXXXXX
AIRTABLE_BASE_ID=appXXXXXXXXXXXXXX
```
