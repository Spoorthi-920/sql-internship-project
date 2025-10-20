-- SQL Internship Project: Apple Retail Sales
-- File: 01_create_database_and_tables.sql
-- Purpose: Create database and define all tables 
-- for Apple Retail Sales tracking system


-- Step 1: Create the database
CREATE DATABASE apple_retail_sales;

-- Step 2: Switch to the newly created database
USE apple_retail_sales;

-- Table: category
-- Purpose: Store product categories 
CREATE TABLE category (
    category_id VARCHAR(10) PRIMARY KEY,  -- unique ID for each category
    category_name VARCHAR(100) NOT NULL   -- Name of the category
);

-- Table: products
-- Purpose: Store product details including category, launch date, and price
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    category_id VARCHAR(10) NOT NULL,
    launch_date DATE,
    price NUMERIC(10, 2),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Table: stores
-- Purpose: Store retail store details including city and country
CREATE TABLE stores (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(150) NOT NULL,
    city VARCHAR(100),
    country VARCHAR(100)
);

-- Table: sales
-- Purpose: Track sales transactions including quantity and linked store/product
CREATE TABLE sales (
    sale_id VARCHAR(20) PRIMARY KEY,
    sale_date DATE NOT NULL,
    store_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table: warranty
-- Purpose: Track warranty claims linked to sales
CREATE TABLE warranty (
    claim_id VARCHAR(20) PRIMARY KEY,
    claim_date DATE NOT NULL,
    sale_id VARCHAR(20) NOT NULL,
    repair_status VARCHAR(50),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);


