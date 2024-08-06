CREATE TABLE customers (
    customer_id CHAR(32) PRIMARY KEY,
    customer_unique_id CHAR(32) NOT NULL,
    customer_zip_code_prefix INT NOT NULL,
    customer_city VARCHAR(255) NOT NULL,
    customer_state CHAR(2) NOT NULL,
    ingest_time datetime
);
CREATE TABLE orders (
    order_id CHAR(32) PRIMARY KEY,
    customer_id CHAR(32) NOT NULL,
    order_status VARCHAR(50) NOT NULL,
    order_purchase_timestamp DATETIME NOT NULL,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,
    ingest_time datetime
);


CREATE TABLE order_items (
    order_id CHAR(32) NOT NULL,
    order_item_id INT NOT NULL,
    product_id CHAR(32) NOT NULL,
    seller_id CHAR(32) NOT NULL,
    shipping_limit_date datetime NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    freight_value DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, order_item_id),
    ingest_time datetime
);

CREATE TABLE fact_customer_rfm (
    customer_id CHAR(32) NOT NULL,
    month_id CHAR(7) NOT NULL,
    recency INT NULL,
    frequency INT NULL,
    monetary DECIMAL(10, 2) NULL,
    PRIMARY KEY (customer_id, month_id)
);

create view dbo.customer_order as
SELECT
    a.customer_id,
    CONVERT(char(7), b.order_purchase_timestamp, 126) AS [month_id],
    DATEDIFF(day, MAX(b.order_purchase_timestamp), '2018-08-31') AS recency,
    COUNT(b.order_id) AS frequency,
    SUM(c.price) AS monetary
FROM dbo.customers a
LEFT JOIN dbo.orders b ON a.customer_id = b.customer_id
LEFT JOIN dbo.order_items c ON b.order_id = c.order_id
GROUP BY a.customer_id, CONVERT(char(7), b.order_purchase_timestamp, 126);

select top(10)* from dbo.customers