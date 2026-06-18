# 🚀 ApexPlanet Data Analytics Internship

## 📋 Task 1: Data Immersion & Wrangling

### Objective
Acquire, clean, and prepare a sales dataset for analysis.

### Dataset
- **Source:** ApexPlanet_DataAnalytics_Dataset.xlsx
- **Size:** 1,000 rows × 12 columns
- **Domain:** E-commerce sales (Products, Customers, Cities)

### 🔍 Data Issues Found & Fixed
| Issue | Column | Count | Fix |
|-------|--------|-------|-----|
| Missing values | Age | 20 | Filled with median (41) |
| Missing values | City | 13 | Filled with mode (Patna) |
| Duplicate IDs | Order_ID | 8 | Reassigned unique IDs |
| Wrong data type | Order_Date | 1000 | Converted to datetime |

### ⚙️ Feature Engineering
New columns created:
- `Year`, `Month`, `Month_Name`, `Day_of_Week` — from Order_Date
- `Age_Group` — customer segmentation (18-25, 26-35, etc.)
- `Revenue_Per_Unit` — Total_Sales ÷ Quantity

### 📁 Files in This Repo
| File | Description |
|------|-------------|
| `data_dictionary.md` | Meaning, type & business relevance of each column |
| `data_cleaning_script.py` | Python/Pandas script for all cleaning steps |
| `ApexPlanet_Cleaned_Dataset.xlsx` | Final analysis-ready dataset (18 columns) |

### 🛠️ Tools Used
- Python, Pandas, NumPy, OpenPyXL


---

## 📊 Task 2: Exploratory Data Analysis & Business Intelligence

### Objective
Uncover patterns, trends, and relationships in the sales data using 
EDA, SQL, and visualizations.

### 7 Business Questions Answered (SQL)
| # | Question | Key Finding |
|---|----------|-------------|
| Q1 | Top products by revenue? | Laptop leads at ₹25.4M |
| Q2 | Monthly revenue trend? | March peak, Sep lowest |
| Q3 | Best city by revenue? | Patna — ₹20.8M (14.8%) |
| Q4 | Category revenue share? | Electronics = 36% of all revenue |
| Q5 | Revenue by gender? | Male 51% vs Female 49% — nearly equal |
| Q6 | Best age group? | 36–45 group — ₹31.5M (22.4%) |
| Q7 | Best day of week? | Wednesday — ₹21.5M |

### 📁 Files Added
| File | Description |
|------|-------------|
| `EDA_Report.md` | Full EDA report with all findings |
| `sql_queries.sql` | 7 SQL queries with results |
| `dashboard_mockup.png` | KPI Dashboard |
| `chart1_univariate.png` | Distribution charts |
| `chart2_business.png` | Revenue insights |
| `chart3_multivariate.png` | Correlation heatmap |
| `chart4_gender_day.png` | Gender & day analysis |

### 🛠️ Tools Used
Python | Pandas | Matplotlib | Seaborn | SQL


