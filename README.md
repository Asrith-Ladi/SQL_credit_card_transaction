# Credit Card Transactions Analysis

## Overview

This project involves analyzing a credit card transactions dataset to understand spending habits in India. The dataset was sourced from Kaggle and can be found [here](https://www.kaggle.com/datasets/thedevastator/analyzing-credit-card-spending-habits-in-india).

## Data Cleaning and Preparation

The initial dataset required some preprocessing before it could be effectively analyzed. The following steps were taken:
1. **Column Renaming**: All column names were converted to lowercase.
2. **Space Replacement**: Any spaces in column names were replaced with underscores.

The cleaned dataset was then imported into a SQL Server database for further analysis.

## Queries and Analysis

A series of SQL queries were developed to extract insights from the dataset. Below are the details of each query along with their purpose:

1. **Top 5 Cities by Spend**
   - **Query**: Identify the top 5 cities with the highest credit card spends and calculate their percentage contribution to the total credit card spends.
   - **Purpose**: Understand which cities contribute the most to overall credit card spending.

2. **Highest Spend Month for Each Card Type**
   - **Query**: Determine the month with the highest spend for each card type and the corresponding amount spent.
   - **Purpose**: Identify seasonal spending trends for different types of credit cards.

3. **Cumulative Spend of 1,000,000 for Each Card Type**
   - **Query**: Retrieve the transaction details for each card type when their cumulative total spend reaches 1,000,000.
   - **Purpose**: Analyze the transactions contributing to significant spend milestones.

4. **City with Lowest Percentage Spend for Gold Card Type**
   - **Query**: Find the city that has the lowest percentage of total spends for the gold card type.
   - **Purpose**: Determine the geographical regions where gold card usage is minimal.

5. **Highest and Lowest Expense Types by City**
   - **Query**: For each city, identify the highest and lowest expense types.
   - **Purpose**: Gain insights into the spending categories dominating or lagging in each city.

6. **Percentage Contribution of Female Spends by Expense Type**
   - **Query**: Calculate the percentage contribution of spends by females for each expense type.
   - **Purpose**: Understand the spending patterns of female cardholders across different expense categories.

7. **Highest MoM Growth in Jan-2014**
   - **Query**: Identify the card and expense type combination that experienced the highest month-over-month growth in January 2014.
   - **Purpose**: Spot significant growth trends at the beginning of 2014.

8. **City with Highest Spend-to-Transaction Ratio on Weekends**
   - **Query**: Determine the city with the highest ratio of total spend to the number of transactions during weekends.
   - **Purpose**: Analyze weekend spending efficiency across cities.

9. **City with Fastest 500 Transactions**
   - **Query**: Find out which city took the least number of days to reach its 500th transaction after the first transaction in that city.
   - **Purpose**: Measure the transaction activity speed in different cities.

## Dataset

The dataset used for this analysis is available in a zip file which contains the following:
- A CSV file with credit card transaction details.

## How to Use

1. **Data Import**: Import the cleaned dataset into a SQL Server database.
2. **Run Queries**: Execute the provided SQL queries to generate the required insights.

## Results

The results of each query have been documented and can be found in the solutions directory. These insights can help in understanding spending behaviors, identifying trends, and making data-driven decisions for credit card usage and marketing strategies.

## Conclusion

This project demonstrates the power of SQL in analyzing large datasets to extract meaningful insights. By understanding credit card spending habits, businesses and financial institutions can better tailor their products and services to meet the needs of their customers.
