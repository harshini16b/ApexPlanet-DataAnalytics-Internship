-- ============================================================
-- ApexPlanet Internship — Task 2: SQL Business Questions
-- Dataset: ApexPlanet_Cleaned_Dataset
-- ============================================================

-- ─────────────────────────────────────────────────────────────
-- Q1: What are the top 5 products by total revenue?
-- ─────────────────────────────────────────────────────────────
SELECT
    Product,
    ROUND(SUM(Total_Sales), 2)        AS Total_Revenue,
    COUNT(Order_ID)                    AS Total_Orders,
    ROUND(AVG(Total_Sales), 2)         AS Avg_Order_Value
FROM sales
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 5;

/*
RESULT:
Product   | Total_Revenue  | Total_Orders | Avg_Order_Value
----------|----------------|--------------|----------------
Laptop    | 25,443,008.51  | 169          | 150,551.53
Mobile    | 25,335,573.19  | 167          | 151,710.62
Book      | 25,031,689.40  | 166          | 150,793.91
Rice      | 22,231,711.28  | 168          | 132,331.62
Chair     | 21,521,561.48  | 168          | 128,104.53
*/

-- ─────────────────────────────────────────────────────────────
-- Q2: What is the monthly revenue trend throughout the year?
-- ─────────────────────────────────────────────────────────────
SELECT
    Month,
    Month_Name,
    ROUND(SUM(Total_Sales), 2)         AS Monthly_Revenue,
    COUNT(Order_ID)                    AS Orders_Count,
    ROUND(AVG(Total_Sales), 2)         AS Avg_Order_Value
FROM sales
GROUP BY Month, Month_Name
ORDER BY Month ASC;

/*
RESULT:
Month | Month_Name | Monthly_Revenue | Orders_Count | Avg_Order_Value
------|------------|-----------------|--------------|----------------
1     | January    | 10,905,580.72   | 82           | 132,994.89
2     | February   | 11,511,181.46   | 80           | 143,889.77
3     | March      | 13,059,899.94   | 86           | 151,859.30  ← Peak
4     | April      | 12,222,700.17   | 81           | 150,898.77
5     | May        | 10,984,689.25   | 82           | 133,959.62
6     | June       | 12,912,332.64   | 87           | 148,417.61
7     | July       | 11,746,226.80   | 85           | 138,190.91
8     | August     |  9,448,471.22   | 73           | 129,430.43  ← Dip
9     | September  |  9,179,896.29   | 72           | 127,498.56  ← Lowest
10    | October    | 12,500,936.50   | 81           | 154,333.78
11    | November   | 12,627,620.22   | 83           | 152,139.52
12    | December   | 12,299,904.44   | 88           | 139,771.64
*/

-- ─────────────────────────────────────────────────────────────
-- Q3: Which cities generate the highest revenue?
-- ─────────────────────────────────────────────────────────────
SELECT
    City,
    ROUND(SUM(Total_Sales), 2)         AS Total_Revenue,
    COUNT(Order_ID)                    AS Total_Orders,
    ROUND(SUM(Total_Sales) * 100.0 /
        (SELECT SUM(Total_Sales) FROM sales), 2) AS Revenue_Pct
FROM sales
GROUP BY City
ORDER BY Total_Revenue DESC;

/*
RESULT:
City      | Total_Revenue  | Total_Orders | Revenue_Pct
----------|----------------|--------------|------------
Patna     | 20,826,584.43  | 144          | 14.81%
Kolkata   | 18,884,349.57  | 129          | 13.43%
Bengaluru | 18,773,574.32  | 127          | 13.35%
Mumbai    | 18,757,050.17  | 131          | 13.34%
Hyderabad | 17,166,766.87  | 120          | 12.21%
Delhi     | 16,097,079.00  | 116          | 11.45%
Pune      | 14,513,175.90  | 113          | 10.32%
Gaya      | 14,380,859.39  | 120          | 10.22%
*/

-- ─────────────────────────────────────────────────────────────
-- Q4: What is the revenue contribution of each product category?
-- ─────────────────────────────────────────────────────────────
SELECT
    Category,
    ROUND(SUM(Total_Sales), 2)          AS Total_Revenue,
    COUNT(Order_ID)                     AS Total_Orders,
    ROUND(AVG(Unit_Price), 2)           AS Avg_Unit_Price,
    ROUND(SUM(Total_Sales) * 100.0 /
        (SELECT SUM(Total_Sales) FROM sales), 2) AS Revenue_Pct
FROM sales
GROUP BY Category
ORDER BY Total_Revenue DESC;

/*
RESULT:
Category    | Total_Revenue  | Total_Orders | Avg_Unit_Price | Revenue_Pct
------------|----------------|--------------|----------------|------------
Electronics | 50,778,581.70  | 336          | 38,120.45      | 36.11%
Education   | 25,031,689.40  | 166          | 24,987.23      | 17.80%
Grocery     | 22,231,711.28  | 168          | 13,249.47      | 15.81%
Furniture   | 21,521,561.48  | 168          | 25,621.87      | 15.31%
Fashion     | 19,835,895.79  | 162          | 24,105.32      | 14.11%
*/

-- ─────────────────────────────────────────────────────────────
-- Q5: What is the average order value by gender?
-- ─────────────────────────────────────────────────────────────
SELECT
    Gender,
    COUNT(Order_ID)                     AS Total_Orders,
    ROUND(SUM(Total_Sales), 2)          AS Total_Revenue,
    ROUND(AVG(Total_Sales), 2)          AS Avg_Order_Value,
    ROUND(AVG(Quantity), 2)             AS Avg_Quantity
FROM sales
GROUP BY Gender
ORDER BY Total_Revenue DESC;

/*
RESULT:
Gender | Total_Orders | Total_Revenue  | Avg_Order_Value | Avg_Quantity
-------|--------------|----------------|-----------------|-------------
Male   | 511          | 71,448,362.85  | 139,820.67      | 5.46
Female | 489          | 67,951,076.60  | 138,958.23      | 5.41
*/

-- ─────────────────────────────────────────────────────────────
-- Q6: Which age group contributes the most revenue?
-- ─────────────────────────────────────────────────────────────
SELECT
    Age_Group,
    COUNT(Order_ID)                     AS Total_Orders,
    ROUND(SUM(Total_Sales), 2)          AS Total_Revenue,
    ROUND(AVG(Total_Sales), 2)          AS Avg_Order_Value,
    ROUND(SUM(Total_Sales) * 100.0 /
        (SELECT SUM(Total_Sales) FROM sales), 2) AS Revenue_Pct
FROM sales
GROUP BY Age_Group
ORDER BY Total_Revenue DESC;

/*
RESULT:
Age_Group | Total_Orders | Total_Revenue  | Avg_Order_Value | Revenue_Pct
----------|--------------|----------------|-----------------|------------
36-45     | 222          | 31,533,245.71  | 142,041.65      | 22.43%
26-35     | 208          | 29,632,336.96  | 142,463.16      | 21.08%
46-55     | 199          | 28,216,508.63  | 141,791.00      | 20.07%
56-65     | 195          | 27,733,251.41  | 142,221.80      | 19.73%
18-25     | 176          | 22,284,096.94  | 126,614.19      | 15.85%
*/

-- ─────────────────────────────────────────────────────────────
-- Q7: What is the best day of the week for sales?
-- ─────────────────────────────────────────────────────────────
SELECT
    Day_of_Week,
    COUNT(Order_ID)                     AS Total_Orders,
    ROUND(SUM(Total_Sales), 2)          AS Total_Revenue,
    ROUND(AVG(Total_Sales), 2)          AS Avg_Order_Value
FROM sales
GROUP BY Day_of_Week
ORDER BY Total_Revenue DESC;

/*
RESULT:
Day_of_Week | Total_Orders | Total_Revenue  | Avg_Order_Value
------------|--------------|----------------|----------------
Wednesday   | 147          | 21,549,419.11  | 146,vsHTTP591.97  ← Best Day
Thursday    | 136          | 20,512,059.97  | 150,823.97
Friday      | 141          | 20,099,668.17  | 142,552.97
Monday      | 138          | 19,762,540.77  | 143,207.54
Sunday      | 138          | 19,209,305.68  | 139,197.14
Saturday    | 154          | 19,161,814.72  | 124,427.37
Tuesday     | 146          | 19,104,631.23  | 130,852.27  ← Lowest
*/

-- ─────────────────────────────────────────────────────────────
-- BONUS: Top 10 highest value orders
-- ─────────────────────────────────────────────────────────────
SELECT
    Order_ID,
    Customer_Name,
    City,
    Product,
    Quantity,
    Unit_Price,
    Total_Sales,
    Order_Date
FROM sales
ORDER BY Total_Sales DESC
LIMIT 10;
