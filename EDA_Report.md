# 📊 EDA Report — ApexPlanet Data Analytics Internship
## Task 2: Exploratory Data Analysis & Business Intelligence

**Intern:** Harshini | **Dataset:** ApexPlanet Sales 2025 | **Records:** 1,000 orders

---

## 1. 📋 Descriptive Statistics

### Numerical Variables

| Metric | Age | Quantity | Unit Price (₹) | Total Sales (₹) |
|--------|-----|----------|----------------|-----------------|
| **Mean** | 41.35 | 5.44 | 25,486 | 1,39,399 |
| **Median** | 41 | 5 | 25,398 | 1,08,594 |
| **Min** | 18 | 1 | 145 | 437 |
| **Max** | 65 | 10 | 49,997 | 4,93,677 |
| **Std Dev** | 13.68 | 2.84 | 14,179 | 1,14,100 |

**Key Observations:**
- Customer age is **uniformly distributed** from 18 to 65 years, mean age is 41
- Quantity per order ranges from 1 to 10 — average of ~5 units per order
- Total Sales has a **wide spread** (₹437 to ₹4.9L), indicating diverse product price ranges
- Unit Price median ~₹25K shows the dataset is skewed toward high-value electronics

### Categorical Variables

| Column | Unique Values | Most Common |
|--------|--------------|-------------|
| Gender | 2 | Male (51.1%) |
| City | 8 | Patna (14.4%) |
| Product | 6 | Fairly balanced |
| Category | 5 | Electronics (33.6%) |

---

## 2. 💼 SQL Business Questions & Answers

### Q1: Top Products by Revenue
**Laptop (₹25.4M) and Mobile (₹25.3M) lead**, followed closely by Book (₹25M). Electronics dominate. Shoes are the lowest at ₹19.8M.

### Q2: Monthly Revenue Trend
**March (₹13.1M) is the peak month.** A significant dip occurs in August (₹9.4M) and September (₹9.2M) — the lowest months. Revenue recovers strongly in Oct–Dec.

### Q3: Revenue by City
**Patna leads with ₹20.8M (14.8% share).** Kolkata, Bengaluru, and Mumbai are close behind. Gaya is the lowest at ₹14.4M.

### Q4: Category Revenue Share
**Electronics dominates at 36.1% (₹50.8M)** — nearly double any other category. Education (17.8%), Grocery (15.8%), Furniture (15.3%), and Fashion (14.1%) are fairly balanced.

### Q5: Gender Analysis
Male and Female customers are nearly equal — Males generate ₹71.4M (51.1%), Females ₹67.9M (48.9%). **No significant gender gap in purchasing behavior.**

### Q6: Age Group Revenue
**36–45 age group is the top spender (₹31.5M, 22.4%).** The 18–25 group is lowest (₹22.3M, 15.8%). Middle-aged customers are the primary revenue drivers.

### Q7: Best Day of Week
**Wednesday is the best sales day (₹21.5M).** Tuesday is the weakest (₹19.1M). Weekday sales are generally stronger than weekends.

---

## 3. 🔗 Multivariate Analysis & Correlation

### Correlation Heatmap Findings

| Variable Pair | Correlation | Interpretation |
|--------------|-------------|----------------|
| Total_Sales ↔ Unit_Price | **~0.89** | Strong positive — price drives revenue |
| Total_Sales ↔ Quantity | **~0.45** | Moderate — more units = more revenue |
| Age ↔ Total_Sales | **~0.02** | Very weak — age doesn't predict spending |
| Age ↔ Quantity | **~0.01** | No relationship |

### Age vs Sales by Category
- **Electronics purchases are spread across all ages** — no age bias
- **Grocery is more frequent in 30–50 age group**
- No strong age-based product preference detected

### Gender × Category Heatmap
- Males and Females **spend equally** across all categories
- Both genders spend most on **Electronics**
- No category is exclusively preferred by one gender

---

## 4. 📊 Key Business Insights

| # | Insight | Action Recommended |
|---|---------|-------------------|
| 1 | Electronics = 36% of all revenue | Expand electronics inventory & promotions |
| 2 | March is peak, Sep is lowest | Run campaigns in Aug–Sep to boost sales |
| 3 | Patna leads in revenue | Investigate why — replicate in low cities |
| 4 | 36–45 age group is highest spender | Target this segment with premium products |
| 5 | Wednesday is best sales day | Launch offers/deals on Wednesdays |
| 6 | 18–25 group spends least | Design entry-level products & student offers |
| 7 | Male/Female split is 51/49 | Marketing can be gender-neutral |

---

## 5. 📈 KPI Dashboard — Key Metrics to Track

| KPI | Value | Benchmark Goal |
|-----|-------|---------------|
| **Total Revenue** | ₹1,39,39,944 | Grow 15% YoY |
| **Total Orders** | 1,000 | Increase by 20% |
| **Avg Order Value** | ₹1,39,399 | Maintain above ₹1.2L |
| **Top Product** | Laptop | Maintain #1 position |
| **Top City** | Patna | Expand to Gaya |
| **Best Month** | March | Replicate with campaigns |
| **Best Day** | Wednesday | Run weekly Wednesday deals |

---

## 6. 🛠️ Tools Used

- **Python** — Data analysis & visualization
- **Pandas / NumPy** — Statistical computations
- **Matplotlib / Seaborn** — Charts and heatmaps
- **SQL** — Business question queries
- **Excel** — Dashboard mockup

---

*ApexPlanet Data Analytics Internship — Task 2 EDA Report | Harshini | 2025*
