create schema dim
create schema fact

CREATE TABLE dim.sfaff (
	staff_sk INT PRIMARY KEY,
    staff_id INT NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    position VARCHAR(100) NOT NULL,
    start_date DATETIME NOT NULL,
    location VARCHAR(100) NOT NULL,
    ingest_time DATETIME2 NOT NULL
);

CREATE TABLE dim.sales_outlet (
    sales_outlet_sk INT PRIMARY KEY,
    sales_outlet_id INT NOT NULL,
    sales_outlet_type VARCHAR(50) NOT NULL,
    store_address VARCHAR(255) NOT NULL,
    store_city VARCHAR(100) NOT NULL,
    store_state_province VARCHAR(100) NOT NULL,
    manager INT NULL,
    beans_goal INT NULL,
    beverage_goal INT NULL,
    food_goal INT NULL,
    merchandise_goal INT NULL,
    total_goal INT NULL,
    ingest_time DATETIME2 NOT NULL
);

CREATE TABLE dim.dates (
    transaction_date DATETIME NOT NULL,
    week_desc VARCHAR(50) NOT NULL,
    month_id INT NOT NULL,
    month_name VARCHAR(50) NOT NULL,
    quarter_id INT NOT NULL,
    year_id INT NOT NULL,
    ingest_time DATETIME2 NOT NULL,
    PRIMARY KEY (transaction_date)
);

CREATE TABLE dim.product (
    product_sk INT PRIMARY KEY,
    Product_ID INT NOT NULL,
    Product_Category VARCHAR(100) NOT NULL,
    Product_Group VARCHAR(100) NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Product_Description TEXT NOT NULL,
    Current_Retail_Price DECIMAL(10, 2) NOT NULL,
    Unit_Of_Measure_Grams DECIMAL(10, 3) NOT NULL,
    Promo_YN VARCHAR(3) NOT NULL,
    New_Product_YN VARCHAR(3) NOT NULL,
    Tax_Exempt_YN VARCHAR(3) NOT NULL,
    Product_Type VARCHAR(100) NOT NULL,
    Current_Wholesale_Price DECIMAL(10, 2) NOT NULL,
    ingest_time DATETIME2 NOT NULL
);

CREATE TABLE fact.sales (
    transaction_sk INT PRIMARY KEY,
    transaction_id INT NOT NULL,
    transaction_datetime DATETIME2 NOT NULL,
    sales_outlet_sk INT NOT NULL,
    product_sk INT NOT NULL,
    customer_sk INT NOT NULL,
    staff_sk INT NOT NULL,
    quantity INT NOT NULL,
    total_sold_out INT NOT NULL,
    line_item_amount DECIMAL(10, 2) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    promo_item VARCHAR(3) NOT NULL
);

CREATE TABLE dim.customers (
    customer_sk INT PRIMARY KEY,
    customer_id INT NOT NULL,
    home_store VARCHAR(100) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_since DATETIME NOT NULL,
    loyalty_card_number VARCHAR(20) NOT NULL,
    birthdate DATETIME NOT NULL,
    gender VARCHAR(10) NOT NULL,
    ingest_time DATETIME2 NOT NULL
);