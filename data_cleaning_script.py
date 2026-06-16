"""
ApexPlanet Internship - Task 1: Data Immersion & Wrangling
Data Cleaning & Transformation Script
Author: Intern
Dataset: ApexPlanet_DataAnalytics_Dataset.xlsx
"""

import pandas as pd
import numpy as np

# ============================================================
# STEP 1: LOAD DATA
# ============================================================
print("=" * 60)
print("STEP 1: LOADING DATA")
print("=" * 60)

df = pd.read_excel('ApexPlanet_DataAnalytics_Dataset.xlsx')
print(f"Dataset loaded: {df.shape[0]} rows, {df.shape[1]} columns")
print(f"Columns: {df.columns.tolist()}")

# ============================================================
# STEP 2: DATA QUALITY ASSESSMENT
# ============================================================
print("\n" + "=" * 60)
print("STEP 2: DATA QUALITY ASSESSMENT")
print("=" * 60)

# Missing Values
print("\n[1] Missing Values:")
missing = df.isnull().sum()
print(missing[missing > 0])

# Duplicate Rows
print(f"\n[2] Fully Duplicate Rows: {df.duplicated().sum()}")

# Duplicate Order IDs
dup_orders = df['Order_ID'].duplicated().sum()
print(f"[3] Duplicate Order_IDs: {dup_orders}")

# Data Types
print(f"\n[4] Data Types:")
print(df.dtypes)

# Basic Statistics
print(f"\n[5] Basic Statistics:")
print(df.describe())

# ============================================================
# STEP 3: DATA CLEANING
# ============================================================
print("\n" + "=" * 60)
print("STEP 3: DATA CLEANING")
print("=" * 60)

# --- Fix 1: Resolve Duplicate Order_IDs ---
# These are likely data entry errors; reassign new unique IDs
dup_mask = df['Order_ID'].duplicated(keep='first')
counter = 1
new_ids = df['Order_ID'].copy()
for idx in df[dup_mask].index:
    new_ids[idx] = f"ORD{int(df.loc[idx, 'Order_ID'].replace('ORD', '')) + 900000 + counter}"
    counter += 1
df['Order_ID'] = new_ids
print(f"✅ Fixed {dup_mask.sum()} duplicate Order_IDs by reassigning unique IDs")

# --- Fix 2: Convert Order_Date to proper datetime format ---
df['Order_Date'] = pd.to_datetime(df['Order_Date'], format='%Y-%m-%d')
print(f"✅ Converted Order_Date column to datetime format")

# --- Fix 3: Handle missing Age values ---
# Strategy: Fill with median age (robust to outliers)
median_age = df['Age'].median()
missing_age_count = df['Age'].isnull().sum()
df['Age'] = df['Age'].fillna(median_age).astype(int)
print(f"✅ Filled {missing_age_count} missing Age values with median: {int(median_age)}")

# --- Fix 4: Handle missing City values ---
# Strategy: Fill with mode (most frequent city)
mode_city = df['City'].mode()[0]
missing_city_count = df['City'].isnull().sum()
df['City'] = df['City'].fillna(mode_city)
print(f"✅ Filled {missing_city_count} missing City values with mode: '{mode_city}'")

# --- Fix 5: Standardize Gender values (already clean, but ensure consistency) ---
df['Gender'] = df['Gender'].str.strip().str.title()
print(f"✅ Standardized Gender column formatting")

# --- Fix 6: Standardize Category and Product capitalization ---
df['Category'] = df['Category'].str.strip().str.title()
df['Product'] = df['Product'].str.strip().str.title()
print(f"✅ Standardized Category and Product formatting")

# ============================================================
# STEP 4: FEATURE ENGINEERING
# ============================================================
print("\n" + "=" * 60)
print("STEP 4: FEATURE ENGINEERING (New Columns)")
print("=" * 60)

# Extract date parts
df['Year'] = df['Order_Date'].dt.year
df['Month'] = df['Order_Date'].dt.month
df['Month_Name'] = df['Order_Date'].dt.strftime('%B')
df['Day_of_Week'] = df['Order_Date'].dt.strftime('%A')
print("✅ Created: Year, Month, Month_Name, Day_of_Week from Order_Date")

# Age Groups for segmentation
bins = [17, 25, 35, 45, 55, 65]
labels = ['18-25', '26-35', '36-45', '46-55', '56-65']
df['Age_Group'] = pd.cut(df['Age'], bins=bins, labels=labels)
print("✅ Created: Age_Group (customer segmentation by age)")

# Revenue per unit
df['Revenue_Per_Unit'] = (df['Total_Sales'] / df['Quantity']).round(2)
print("✅ Created: Revenue_Per_Unit (Total_Sales / Quantity)")

# ============================================================
# STEP 5: FINAL VALIDATION
# ============================================================
print("\n" + "=" * 60)
print("STEP 5: FINAL VALIDATION")
print("=" * 60)

print(f"Total Rows: {len(df)}")
print(f"Total Columns: {len(df.columns)}")
print(f"Missing Values Remaining: {df.isnull().sum().sum()}")
print(f"Duplicate Order_IDs Remaining: {df['Order_ID'].duplicated().sum()}")
print(f"\nFinal Columns: {df.columns.tolist()}")
print(f"\nSample of Clean Data:")
print(df.head(5).to_string())

# ============================================================
# STEP 6: EXPORT CLEANED DATASET
# ============================================================
output_file = 'ApexPlanet_Cleaned_Dataset.xlsx'
df.to_excel(output_file, index=False)
print(f"\n✅ Cleaned dataset exported to: {output_file}")
print("\n🎉 Data Cleaning Complete!")
