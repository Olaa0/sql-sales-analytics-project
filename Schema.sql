

-- =========================
-- DIMENSION TABLES
-- =========================

USE practice;

CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY,
    date DATE,
    year INTEGER,
    month INTEGER,
    day INTEGER
);

CREATE TABLE dim_customer (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    segment TEXT,
    city TEXT,
    country TEXT,
    signup_date DATE
);

CREATE TABLE dim_product (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    brand TEXT,
    unit_cost DECIMAL(10,2)
);

CREATE TABLE dim_store (
    store_id INTEGER PRIMARY KEY,
    store_name TEXT,
    region TEXT,
    city TEXT
);

CREATE TABLE dim_promo (
    promo_id INTEGER PRIMARY KEY,
    promo_name TEXT,
    discount_pct DECIMAL(5,2)
);