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




