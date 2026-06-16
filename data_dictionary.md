# 📘 Data Dictionary — ApexPlanet Analytics Dataset
**Task 1: Data Immersion & Wrangling**  
**Intern:** ApexPlanet Data Analytics Internship  
**Dataset:** ApexPlanet_DataAnalytics_Dataset.xlsx  
**Total Records:** 1,000 rows | **Original Columns:** 12 | **Final Columns:** 18

---

## 🔵 Original Columns

| # | Column Name | Data Type | Description | Business Relevance | Issues Found |
|---|-------------|-----------|-------------|-------------------|--------------|
| 1 | **Order_ID** | String | Unique identifier for each order (e.g., ORD100002) | Used to track individual transactions | 8 duplicate IDs found — fixed |
| 2 | **Order_Date** | String → DateTime | Date the order was placed (format: YYYY-MM-DD) | Enables time-series and seasonal analysis | Stored as string — converted to datetime |
| 3 | **Customer_ID** | String | Unique identifier for each customer (e.g., CUST5529) | Links orders to specific customers for lifetime analysis | No issues |
| 4 | **Customer_Name** | String | Anonymized customer name (e.g., Customer_227) | Used for labeling; not for analysis | No issues |
| 5 | **Age** | Integer | Customer's age in years (range: 18–65) | Customer demographic segmentation | 20 missing values — filled with median (41) |
| 6 | **Gender** | String | Customer's gender (Male / Female) | Demographic analysis and targeted marketing | No issues |
| 7 | **City** | String | City where customer is located | Geographic sales distribution analysis | 13 missing values — filled with mode (Patna) |
| 8 | **Product** | String | Name of product purchased (Rice, Book, Mobile, Laptop, Shoes, Furniture) | Product performance and popularity tracking | No issues |
| 9 | **Category** | String | Product category (Grocery, Education, Electronics, Fashion, Furniture) | Category-level revenue and trend analysis | No issues |
| 10 | **Quantity** | Integer | Number of units purchased per order (range: 1–10) | Volume analysis and demand forecasting | No issues |
| 11 | **Unit_Price** | Float (₹) | Price per single unit of product | Pricing analysis and margin calculation | No issues |
| 12 | **Total_Sales** | Float (₹) | Total revenue = Quantity × Unit_Price | Primary revenue KPI; used in all financial analysis | Verified: matches Quantity × Unit_Price ✅ |

---

## 🟢 New Engineered Columns (Added During Cleaning)

| # | Column Name | Data Type | How It Was Created | Business Relevance |
|---|-------------|-----------|-------------------|-------------------|
| 13 | **Year** | Integer | Extracted from Order_Date | Yearly trend analysis |
| 14 | **Month** | Integer | Extracted from Order_Date (1–12) | Monthly sales patterns |
| 15 | **Month_Name** | String | Extracted from Order_Date (e.g., "January") | Readable monthly reporting |
| 16 | **Day_of_Week** | String | Extracted from Order_Date (e.g., "Monday") | Weekday vs weekend sales behavior |
| 17 | **Age_Group** | Category | Binned Age into: 18-25, 26-35, 36-45, 46-55, 56-65 | Customer segmentation by generation |
| 18 | **Revenue_Per_Unit** | Float (₹) | Total_Sales ÷ Quantity | Effective price paid per unit; useful for discount/deal analysis |

---

## 📊 Summary of Data Issues Found & Fixed

| Issue | Column(s) Affected | Count | Fix Applied |
|-------|--------------------|-------|-------------|
| Missing Values | Age | 20 | Filled with median age (41 years) |
| Missing Values | City | 13 | Filled with most frequent city (Patna) |
| Duplicate IDs | Order_ID | 8 | Reassigned new unique Order IDs |
| Wrong Data Type | Order_Date | All 1000 | Converted string → datetime |
| No issues | All others | — | Data is clean ✅ |

---

## 📌 Key Dataset Facts

- **Time Period:** 2025 (full year)
- **Cities Covered:** Bengaluru, Kolkata, Hyderabad, Patna, Mumbai, Delhi, Chennai, Pune
- **Products:** Rice, Book, Mobile, Laptop, Shoes, Furniture
- **Categories:** Grocery, Education, Electronics, Fashion, Furniture
- **Age Range:** 18 – 65 years
- **Revenue Range:** ₹437 – ₹4,93,678 per order
- **Gender Split:** Male / Female (binary)

---

*Generated as part of ApexPlanet Data Analytics Internship — Task 1*
