penjualan per produk
penjualan per kategori
penjualan per store
penjuaalan perhari
total produk terjual

DROP PROCEDURE IF EXISTS GetDailySalesReport;
CREATE PROCEDURE GetDailySalesReport
AS
BEGIN
    SELECT TOP(100)
        CAST(transaction_datetime AS DATE) AS transaction_date,
		sales_outlet_sk,
        SUM(quantity) AS total_quantity,
        SUM(line_item_amount) AS total_amount
    FROM 
        fact.sales
    GROUP BY 
        CAST(transaction_datetime AS DATE),
		sales_outlet_sk
    ORDER BY 
        transaction_date,
		sales_outlet_sk;
END;

--------------------------------------------

DROP PROCEDURE IF EXISTS GetDailyProductSalesReport;
CREATE PROCEDURE GetDailyProductSalesReport
AS
BEGIN
    SELECT TOP(100)
        CAST(transaction_datetime AS DATE) AS transaction_date,
        sales_outlet_sk,
        product_sk,
        total_sold_out,
		SUM(line_item_amount) AS total_amount
    FROM 
        fact.sales
    GROUP BY 
        CAST(transaction_datetime AS DATE),
        sales_outlet_sk,
        product_sk,
		total_sold_out
    ORDER BY 
        transaction_date,
        sales_outlet_sk,
        product_sk;
END;

----------------------------------------------------


exec GetDailySalesReport
exec GetDailyProductSalesReport

---------------------------------------------------
CREATE VIEW DailyProductSalesView AS
SELECT
    CAST(transaction_datetime AS DATE) AS transaction_date,
    sales_outlet_sk,
    product_sk,
    total_sold_out,
    SUM(line_item_amount) AS total_amount
FROM 
    fact.sales
GROUP BY 
    CAST(transaction_datetime AS DATE),
    sales_outlet_sk,
    product_sk,
    total_sold_out

-----------------------------------------------------
CREATE VIEW GetDailySalesReport AS
SELECT
        CAST(transaction_datetime AS DATE) AS transaction_date,
		sales_outlet_sk,
        SUM(quantity) AS total_quantity,
        SUM(line_item_amount) AS total_amount
FROM 
    fact.sales
GROUP BY 
    CAST(transaction_datetime AS DATE),
	sales_outlet_sk


SELECT top(100) *
FROM GetDailySalesReport
ORDER BY 
    transaction_date,
	sales_outlet_sk;



SELECT top(100) *
FROM DailyProductSalesView
ORDER BY 
    transaction_date,
    sales_outlet_sk,
    product_sk;

SELECT
    YEAR(transaction_datetime) AS year,
    MONTH(transaction_datetime) AS month,
    sales_outlet_sk,
    SUM(total_sold_out) AS total_sold_out_per_month,
    SUM(line_item_amount) AS total_amount
FROM 
    fact.sales
GROUP BY 
    YEAR(transaction_datetime),
    MONTH(transaction_datetime),
    sales_outlet_sk
ORDER BY 
    year,
    month,
    sales_outlet_sk;

select top(5) * from dim.customers
select top(5) * from dim.product
select count(product_sk) from dim.product
select count(customer_sk) from dim.customers
select top(5) * from dim.dates
select top(5) * from dim.sales_outlet
select top(5) * from dim.staff
select top(5) * from fact.sales