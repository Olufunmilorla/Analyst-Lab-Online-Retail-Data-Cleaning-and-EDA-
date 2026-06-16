# Analyst-Lab-Online-Retail-Data-Cleaning-and-EDA-
Data Cleaning, Validation, Exploratory Data Analysis (EDA), and Visualization of an Online Retail Dataset using SQL Server Management Studio (SSMS).
# Online Retail Data Cleaning and Exploratory Data Analysis

## Project Overview

This project was completed as part of my Data Analytics Internship at Decode Labs. The objective was to clean, validate, and analyze a raw online retail dataset using SQL Server Management Studio (SSMS).

The project focuses on transforming messy transactional data into a structured and analysis-ready dataset while uncovering meaningful business insights through Exploratory Data Analysis (EDA) and data visualization.



## Dataset Description

The dataset contains online retail transactions including:

* Invoice Number
* Product Code
* Product Description
* Quantity Purchased
* Invoice Date
* Unit Price
* Customer ID
* Country

Each record represents a product purchased within a customer transaction.



## Tools Used

* SQL Server Management Studio (SSMS)
* Microsoft Excel / Power BI
* GitHub



## Data Cleaning Process

The following data cleaning tasks were performed:

### Missing Values

* Identified columns containing missing values.
* Replaced missing Customer IDs with "Unknown".
* Handled missing product descriptions appropriately.

### Duplicate Records

* Detected duplicate rows using SQL queries.
* Removed duplicate records to improve data quality.

### Standardization

* Standardized text formatting.
* Trimmed extra spaces.
* Ensured consistent data types and date formats.

### Data Validation

* Checked for invalid quantities and prices.
* Investigated anomalies and unusual values.
* Verified data consistency across records.


## Exploratory Data Analysis

The following analyses were performed:

1. Top Selling Products
2. Most Frequently Purchased Products
3. Revenue by Country
4. Monthly Sales Trend
5. Customer Purchasing Behaviour



## Visualizations

The project includes:

* Bar Chart: Top Selling Products
* Map: Revenue by Country
* Line Chart: Monthly Revenue Trend
* Pie Chart: Top Customers by Spending
* Bar chart: Top Purchased Products


## Key Insights

### 1. Best-Selling Products

A small group of products generated the majority of sales volume, indicating strong customer demand.

### 2. Revenue Concentration

Certain countries contributed significantly more revenue than others, highlighting key market regions.

### 3. Seasonal Trends

Sales increased during specific months, suggesting seasonal purchasing behaviour.

### 4. Customer Value

A small percentage of customers accounted for a large share of total revenue.

### 5. Pricing Distribution

Most products were sold within a moderate price range, with a few high-priced outliers.



## Repository Contents

* Cleaned Dataset (.csv)
* SQL Cleaning and EDA Queries (.sql)
* Dashboard Visualizations
* Project Documentation


## Author

Completed by Ogunmefun Olufunmilola

Data Analytic Intern – ANALYST LAB
