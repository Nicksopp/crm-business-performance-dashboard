# 🧠 CRM Business Performance Dashboard

This project simulates a real-world Zoho CRM analytics workflow — from raw data to business insights — using PostgreSQL for backend querying and Zoho Analytics for dashboard creation.

---

## 🔧 Tools Used

- 🐘 PostgreSQL – Data Storage & SQL Queries
- 📊 Zoho Analytics – Dashboard & KPI Visualization
- 📂 Excel – Initial data cleaning and prep

---

## 📊 Dashboard Preview

![Dashboard Overview](![Screenshot 2025-06-30 172940](https://github.com/user-attachments/assets/d5402872-2753-42d0-bb6e-fa66d8ee97fa)
)

## 📁 Project Structure

| Folder | Description |
|--------|-------------|
| `data/` | Cleaned datasets used in the project |
| `sql/` | SQL queries used for analysis |
| `dashboard/` | PDF export of the final Zoho dashboard |
| `screenshots/` | Visuals of key insights for preview |

---

## 📈 Business Problem

A CRM SaaS company is facing:
- High customer churn (nearly 47% overall)
- A drop of **13.7%** customers in a single month (June 2025)
- Feature usage skewed toward only a few tools
- Industry-wise performance imbalance

---

## 🔍 Key Insights

- **📉 Churn spike:** 73.6% churn in May 2025 — urgent action needed
- **📈 Customer loss:** 3.83K in May → 3.30K in June = **13.74% drop**
- **🌍 Country concentration:** Certain regions dominate customer and revenue base
- **🏭 Industry gaps:** Churn varies sharply across industries
- **⚙️ Feature use:** “Reports” and “Email Campaigns” dominate usage

---

## ✅ Recommended Actions

- Launch **re-engagement campaign** for churned customers
- Customize onboarding by **industry**
- Promote most used features in early lifecycle (first 7 days)
- Analyze **Nov–Apr cohorts** where churn grew steeply

---

## 📦 Data Sources

- 500+ simulated customers
- 1000+ sales records
- 1500+ feature usage entries

---

## 🚀 How to Recreate This Project

1. Load data into PostgreSQL using `\copy` or pgAdmin
2. Run queries from `/sql/queries.sql`
3. Import tables into Zoho Analytics
4. Build dashboard from saved chart reports
5. Export as PDF or publish live

---

## 🧠 What I Learned

- Cleaned messy data using Excel + SQL logic
- Created formula columns in Zoho Analytics (`total_revenue`)
- Applied filters, top N, date-based grouping
- Extracted business insights from data visualization

---

## 📬 Contact

If you found this project helpful or would like to collaborate, feel free to connect!
 
📧 nikeshpurohitt@gmail.com
