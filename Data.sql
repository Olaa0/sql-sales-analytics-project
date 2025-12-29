-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sales_id INTEGER PRIMARY KEY,
    date_id INTEGER,
    customer_id INTEGER,
    product_id INTEGER,
    store_id INTEGER,
    promo_id INTEGER,
    quantity INTEGER,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (promo_id) REFERENCES dim_promo(promo_id)
);

-- =========================
-- DATE
-- =========================
INSERT INTO dim_date VALUES
(1, '2025-01-10', 2025, 1, 10),
(2, '2025-02-15', 2025, 2, 15),
(3, '2025-03-20', 2025, 3, 20);

-- =========================
-- CUSTOMER
-- =========================
INSERT INTO dim_customer VALUES
(1, 'Alice Johnson', 'Consumer', 'Dublin', 'Ireland', '2024-06-01'),
(2, 'Brian Smith', 'Corporate', 'Cork', 'Ireland', '2024-03-15'),
(3, 'Clare O''Neill', 'Consumer', 'Galway', 'Ireland', '2024-09-10');

-- =========================
-- PRODUCT
-- =========================
INSERT INTO dim_product VALUES
(1, 'Laptop Pro', 'Electronics', 'TechBrand', 800),
(2, 'Office Chair', 'Furniture', 'ComfortCo', 120),
(3, 'Wireless Mouse', 'Electronics', 'TechBrand', 25);

-- =========================
-- STORE
-- =========================
INSERT INTO dim_store VALUES
(1, 'Dublin Central', 'East', 'Dublin'),
(2, 'Cork Outlet', 'South', 'Cork'),
(3, 'Galway Store', 'West', 'Galway');

-- =========================
-- PROMO
-- =========================
INSERT INTO dim_promo VALUES
(1, 'Winter Sale', 0.10),
(2, 'Clearance', 0.20);

-- =========================
-- SALES
-- =========================
INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 1, 1, 1, 1000),
(2, 1, 2, 2, 2, NULL, 5, 150),
(3, 2, 1, 3, 1, NULL, 3, 40),
(4, 2, 3, 1, 3, 2, 1, 950),
(5, 3, 2, 3, 2, NULL, 10, 35),
(6, 3, 1, 2, 1, 1, 2, 160);
