# Apple Retail Sales SQL Project

## Overview
This project demonstrates **SQL database design** for a fictional Apple retail network. 
It focuses on **creating tables, establishing relationships, and visualizing the database schema**.

The project includes **five main tables**:

1. **Category** – stores product categories (e.g., iPhone, iPad, Accessories)  
2. **Products** – stores product details including category, launch date, and price  
3. **Stores** – stores retail store details including city and country  
4. **Sales** – tracks sales transactions including quantity and linked store/product  
5. **Warranty** – tracks warranty claims linked to sales  

---

## What I Did
- **Downloaded the dataset** from Kaggle ([link to dataset](https://www.kaggle.com/datasets/amangarg08/apple-retail-sales-dataset)). 
- **Uploaded the dataset** to PostgreSQL using pgAdmin.  
- **Created tables** for categories, products, stores, sales, and warranty.  
- **Established relationships** between tables using **primary keys** and **foreign keys** to ensure data integrity.  
- **Visualized the database schema** using [dbdiagram.io](https://dbdiagram.io/) to generate an **ERD diagram**.  


---

## How to Use
1. **Open pgAdmin** and connect to your PostgreSQL server.  
2. **Run the SQL script** `01_schema_setup.sql` to create tables and relationships.  
3. **Optionally**, refer to `ERD_diagram.png` to visualize the database structure.  

---

## Skills Demonstrated
- Database design and normalization  
- Table creation in PostgreSQL using SQL  
- Establishing **primary key** and **foreign key relationships**  
- ERD generation using dbdiagram.io  

---

