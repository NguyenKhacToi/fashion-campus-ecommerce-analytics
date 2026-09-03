# Fashion Campus E-commerce Analytics

Business Data Analytics project analyzing customer acquisition, sales performance, customer journey, and retention for a fashion e-commerce business using Python, SQL, and Power BI.

## 1. Business Problem

Fashion Campus is a fashion e-commerce business serving young urban customers in Indonesia.

As the customer base grows, the business needs to better understand:

* How customers are acquired and engaged
* How customers purchase and generate sales
* Where customers drop off during the shopping journey
* Which customers return and make repeat purchases
* Which customer segments have higher or lower value
* How customer retention can be improved

This project analyzes customer, product, transaction, and clickstream data to generate business insights that can support Marketing and Business decision-making.

> **Note:** The dataset does not contain sufficient cost information to calculate COGS, profit, or profit margin. Therefore, profitability analysis is outside the current project scope.

## 2. Objectives

The project aims to:

1. Analyze customer acquisition and engagement patterns
2. Evaluate sales and purchasing behavior
3. Analyze the customer journey and conversion funnel
4. Segment customers based on purchasing behavior and value
5. Measure customer retention and repeat-purchase behavior
6. Identify actionable opportunities for improving customer engagement and retention

## 3. Business Questions

### Customer & Acquisition

* Which customer acquisition sources contribute the most users?
* How does customer engagement differ across acquisition sources?
* Which acquisition channels are associated with stronger purchasing behavior?

### Sales & Customer Value

* How do sales and order volumes change over time?
* What is the Average Order Value (AOV)?
* Which products or product categories generate the most sales?
* Which customers contribute the highest monetary value?
* What customer segments can be identified using RFM analysis?

### Customer Journey

* How do users move through the e-commerce journey?
* At which stages do users drop off?
* Which traffic sources have better conversion performance?

### Retention

* How many customers make repeat purchases?
* How does retention change across customer cohorts?
* Which customer segments show stronger or weaker retention?
* Which customers may require re-engagement?

## 4. Dataset

The project uses the **Fashion Campus** dataset containing multiple data sources related to an e-commerce business:

* Customer data
* Product data
* Transaction data
* Clickstream data

The dataset will be audited before the analytical data model is finalized.

The initial data audit will examine:

* Dataset structure and table grain
* Data types
* Missing values
* Duplicate records
* Date ranges
* Category inconsistencies
* Numerical anomalies
* Relationships between tables
* Data quality issues

**Dataset source:** Kaggle – Fashion Campus

## 5. Tech Stack

| Tool                 | Purpose                                             |
| -------------------- | --------------------------------------------------- |
| Python               | Data profiling, cleaning exploration, EDA           |
| Pandas / NumPy       | Data manipulation and analysis                      |
| Matplotlib / Seaborn | Exploratory visualization                           |
| SQL / BigQuery       | Data cleaning, transformation and business analysis |
| Power BI             | Data modeling, DAX and dashboard development        |
| Git / GitHub         | Version control and portfolio documentation         |
| VS Code              | Development environment                             |

## 6. Data Pipeline

The planned data workflow is:

```text
Fashion Campus Dataset
        ↓
Raw Data
        ↓
Data Profiling & Quality Assessment
        ↓
BigQuery Bronze
        ↓
Data Cleaning & Transformation
        ↓
BigQuery Silver
        ↓
Business Data Model / Gold Layer
        ↓
Power BI
        ↓
Business Insights & Recommendations
```

The final pipeline will be adjusted based on the actual data structure and quality discovered during the data audit.

## 7. Data Model

The data model has not yet been finalized.

It will be designed after completing the initial data audit and identifying:

* Table grain
* Primary and foreign keys
* Relationships between entities
* Required dimensions and fact tables
* Analytical requirements

The expected analytical entities may include:

* Customer
* Product
* Date
* Transaction
* Clickstream

The final schema will be documented after the modeling phase.

## 8. Analysis

The analysis will focus on four major areas:

### 8.1 Customer Acquisition & Engagement

Analyze customer sources, traffic sources, and engagement behavior.

### 8.2 Sales & Customer Value

Analyze sales, orders, AOV, purchasing behavior, and RFM-based customer segments.

### 8.3 Customer Journey

Analyze clickstream behavior and the conversion funnel to identify major drop-off points.

### 8.4 Retention

Analyze repeat purchases, customer cohorts, retention patterns, and potentially at-risk customer groups.

Detailed findings will be added after the analysis is completed.

## 9. Dashboard

A Power BI dashboard will be developed to provide an interactive view of:

* Sales performance
* Customer metrics
* Customer segmentation
* Conversion funnel
* Retention and cohort analysis

The dashboard structure will be finalized after the data model and analysis are completed.

## 10. Key Insights

**To be updated after completing the analysis.**

Insights will focus on:

* Customer acquisition performance
* Sales and purchasing behavior
* Customer value segments
* Funnel conversion and drop-offs
* Retention and repeat-purchase behavior

## 11. Business Recommendations

**To be updated after completing the analysis.**

Recommendations will be derived from the analytical findings and will focus on areas such as:

* Customer acquisition
* Customer engagement
* Conversion optimization
* Customer retention
* Re-engagement of valuable or at-risk customers

## 12. Project Structure

```text
fashion-campus-ecommerce-analytics/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│
├── sql/
│
├── src/
│
├── powerbi/
│
├── docs/
│
├── .gitignore
├── requirements.txt
├── README.md
└── LICENSE
```

> Project structure will evolve as the analysis and data pipeline are developed.
