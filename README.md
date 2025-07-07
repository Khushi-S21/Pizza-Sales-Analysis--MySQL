# 🍕 Pizza Sales Analysis – SQL Project

## 📌 Overview

This project presents an exploratory data analysis (EDA) of a fictional pizza sales dataset using **SQL**. The goal is to derive key business insights around order trends, revenue generation, product performance, and time-based patterns.

The dataset was imported into a MySQL database, and multiple SQL queries were executed to answer business-driven questions. This project demonstrates hands-on skills in database design, JOINs, subqueries, aggregate functions, window functions, and performance analysis.

---

## 🧾 Data Model

- **Tables Used:**
  - `orders`: Contains order ID, date, and time
  - `order_details`: Contains quantities and pizza references per order
  - `pizzas`: Contains pizza size, price, and type ID
  - `pizza_types`: Contains pizza name, category, and description

---

## 🔍 Key Business Questions Answered

- 🧮 **How many total orders were placed?**
- 💰 **What is the total revenue from pizza sales?**
- 🧀 **Which pizza generated the highest revenue?**
- 🥇 **What is the most popular pizza size and type?**
- 🕒 **How does order volume vary by hour of the day?**
- 📅 **What is the average number of pizzas ordered per day?**
- 💸 **Which pizza categories contribute most to revenue?**
- 📈 **How does revenue accumulate over time (cumulative revenue)?**
- 🧾 **What are the top 3 pizzas by revenue in each category?**

---

## 💡 SQL Concepts Demonstrated

- `JOIN`, `GROUP BY`, `ORDER BY`, `LIMIT`, `WHERE`, `COUNT`, `SUM`
- `ROUND()`, `AVG()`, `RANK()` window function
- Nested subqueries for daily averages and ranking
- Revenue calculation using price × quantity
- Category-wise and type-wise breakdown of performance

---

## 🛠 Tools Used

- **MySQL** (SQL syntax)
- Sample pizza sales dataset (CSV files: pizzas, pizza_types, orders, order_details)
- SQL script file: `project 1.sql`

---

## 📂 How to Use

1. Create a database in MySQL:
   ```sql
   CREATE DATABASE pizzahut;
   ```
2. Import CSV files (pizzas, pizza_types, orders, order_details)
3. Run the `project 1.sql` file to execute the analysis queries
4. Interpret outputs in your SQL editor (e.g., MySQL Workbench, VS Code with extensions, DBeaver, etc.)

---

## 📈 Sample Insights

- The most ordered pizza type is in the **"Classic"** category.
- **Large size pizzas** are the most popular by volume.
- **Deluxe Veggie, BBQ Chicken**, and **Pepperoni** top revenue charts.
- Peak order times are during **evenings and late afternoons**.
- Over time, **cumulative revenue trends upward**, suggesting growing demand.

---

## 🙋‍♀️ Author

**Khushi Satrawla**  

## 📎 License

This project is for educational and portfolio purposes. The dataset is simulated and not associated with any real pizza brand.
