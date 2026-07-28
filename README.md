# E-Commerce Fraud & Chargeback Risk Analytics

SQL + Power BI analysis identifying high-risk transaction patterns in e-commerce fraud, using account age and order value as key risk signals.

## Business Problem

E-commerce companies lose revenue to fraud in two ways: undetected fraudulent orders, and chargebacks — where a customer disputes a charge with their bank, and the merchant loses the product, the money, and pays a penalty fee. Fraud/risk teams need to continuously monitor which transaction patterns carry the highest risk, so they can flag suspicious orders without adding friction for genuine customers.

This project analyzes transaction-level data to answer: **which factors actually predict fraud, and how can a company act on that with a simple, high-precision rule?**

## Dataset

- Source: "Fraudulent E-Commerce Transactions" (Kaggle), stratified sample of 73,648 transactions
- Columns: Transaction ID, Customer ID, Transaction Amount, Transaction Date, Payment Method, Product Category, Quantity, Customer Age, Device Used, Is Fraudulent, Account Age (Days), Transaction Hour
- Overall fraud rate: **5.01%** (3,692 of 73,648 transactions)

## Tools Used

- **MySQL** — data cleaning and 7 business-question queries
- **Power BI** — interactive dashboard with drill-down page

## Key Findings

| Factor | Result | Signal Strength |
|---|---|---|
| Payment Method | 4.87%–5.14% fraud rate across all methods | ❌ No signal |
| Product Category | 4.80%–5.31% fraud rate across all categories | ❌ No signal |
| Time of Day | 4.18%–6.15% fraud rate across all hours | ❌ No signal |
| Device Used | 4.91%–5.15% fraud rate across all devices | ❌ No signal |
| **Account Age** | Accounts under 30 days old: **22.47%** fraud rate vs ~3% for older accounts | ✅ Strong signal |
| **Order Value** | Orders above ₹500: **16.11%** fraud rate vs 2.99% for orders under ₹50 | ✅ Strong signal |
| **Combined Risk** | Accounts under 30 days **AND** orders above ₹500: **50.84%** fraud rate | 🔥 Very strong signal |

### The headline insight

Transactions that are both from a **new account (under 30 days old)** and **valued above ₹500** have a fraud rate of **50.84%** — nearly **12x higher** than the rest of the dataset (4.38%). This segment is only **1.37%** of total transactions but accounts for **13.9%** of all fraud cases.

Surface-level attributes (payment method, category, time, device) show no meaningful fraud signal. Fraud here is driven by **behavioral/transactional attributes**, not categorical ones — and the combination of two weak-to-moderate signals produces a very strong one.

## Dashboard

The Power BI dashboard has two pages:
1. **Overview** — headline risk metric, fraud rate breakdowns by account age, order value, payment method, product category, and a daily fraud trend

<img width="1165" height="650" alt="Screenshot 2026-07-28 184243" src="https://github.com/user-attachments/assets/0b2b892c-5f0f-415e-9218-cc5f96b05772" />


   
2. **High-Risk Transactions** — a filtered, drillable table of the flagged high-risk segment

<img width="1163" height="655" alt="Screenshot 2026-07-28 184402" src="https://github.com/user-attachments/assets/a0c16605-cf63-42b5-bf63-d8ddb5eb7e61" />


## Business Recommendation

Implement a mandatory manual review or additional verification step (OTP, delayed shipping, ID confirmation) for any transaction where:
- The account is **under 30 days old**, AND
- The order value **exceeds ₹500**

This single rule targets a segment where a transaction is more likely to be fraudulent than legitimate — while affecting less than 1.5% of total order volume, minimizing friction for genuine customers.

## Files in This Repo

- `queries.sql` — all 7 SQL queries used in the analysis
- `e-commerce fraud.docx` — detailed write-up of each query, result, and insight
- `fraud.pbix` — the Power BI dashboard file
- `screenshots/` — dashboard screenshots for quick viewing without opening Power BI
