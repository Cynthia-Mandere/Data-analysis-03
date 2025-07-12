#  Café Sales Dashboard - Power BI Project

##  Overview

This Power BI dashboard visualizes sales performance for a café, highlighting key metrics like revenue, item popularity, and customer purchasing trends. The goal is to provide actionable insights to support decision-making in pricing, inventory, and marketing.

##  Data Cleaning (Performed in MySQL + Power BI)

- Removed duplicates and irrelevant entries
- Converted `Transaction Date` and `Total Spent` to appropriate data types
- Recalculated missing `Total Spent` values using: `Quantity × Price per Unit`
- Standardized numerical values to 1 decimal place
- Handled `NULL` and blank entries (e.g., replaced unknown payment methods with "Unknown")



##  KPIs & Visuals

### Key Performance Indicators (KPIs)
-  **Total Revenue**
-  **Total Orders**
-  **Average Spend**


## Tools Used

- **MySQL** – For data cleaning
- **Power BI** – For data visualization
- **Excel** – Initial data inspection
- **Flaticon** – Dashboard icons

---

