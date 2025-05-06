# Hotel Booking Analysis SQL Project

This SQL project focuses on analyzing hotel booking data by using various SQL queries after cleaning the dataset. The aim is to gain insights about booking trends, customer preferences, cancellations, and revenue.

## 📁 Project Structure

- `hotel_booking_queries.sql`: Contains 25+ SQL queries with insights.
- `cleaned_hotel_booking_schema.sql`: Table creation and data cleaning steps.
- `final_report.pdf`: Detailed documentation of the project.
- `dataset.csv`:  dataset included .

  Step 1: Data Cleaning 

Removed duplicate rows using CTEs.

Handled NULL values in agent, children, company, country.

Fixed data types for phone number, credit card.

Dropped or fixed invalid entries (e.g., 0 adults with 0 children & babies).

Added a total_stay column.

Step 2: Data Analysis (25+ SQL Queries)

How many total bookings were made?

Which hotel type received more bookings?

What is the most common month for bookings?

What is the cancellation rate by hotel?

Which country had the highest number of guests?

(Each 25+ Query Include SQL Code in hotel booking.Sql)

## 📊 Key Insights

-City Hotel has higher bookings but also higher cancellations.

-Average ADR is higher for Resort Hotels.

-Most bookings are made in the months of July and August.

-Most guests are not repeated customers.

-Guests prefer room types A and D.

-Highest revenue-generating room type is “D”.

## 🔧 Skills Used

- SQL (MySQL)
- Data Cleaning
- Data Analysis
- Aggregations, Joins, Group By, Subqueries

## 🛠️ Tools Used:

-Database: MySQL

-Language: SQL

-Platform: Workbench 

✅ Conclusion:
This case study helped demonstrate how SQL can be used to clean, analyze, and extract meaningful business insights from raw hotel booking data. The insights can help hotel management make data-driven decisions.

