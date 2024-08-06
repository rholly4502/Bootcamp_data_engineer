CREATE MASTER KEY;

DROP DATABASE SCOPED CREDENTIAL RhollyCredential
CREATE DATABASE SCOPED CREDENTIAL RhollyCredential
WITH
    IDENTITY = 'SHARED ACCESS SIGNATURE',
    SECRET = 'sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupyx&se=2024-07-31T14:56:37Z&st=2024-07-19T06:56:37Z&spr=https&sig=A6gnTltLJRr8slTzwXIvAjjEmKV5ccjUaVCnFQVCXFU%3D' --change to your SAS SECRET STORAGE ACCOUNT
GO

CREATE EXTERNAL DATA SOURCE BigDataRholly WITH
(
	LOCATION = 'https://storageaccrholly.blob.core.windows.net/', -- change to your primary endpoint
	CREDENTIAL = RhollyCredential

)

SELECT *
FROM OPENROWSET(
    BULK 'test/mart/employee/*/',
    DATA_SOURCE = 'BigDataRholly',
    FORMAT='PARQUET'
) 
WITH (
	EmployeeLogID VARCHAR(100),
    EmployeeID VARCHAR(100),
    Name VARCHAR(100),
    Position VARCHAR(100),
    StartDate VARCHAR(100),
    EndDate VARCHAR(100),
    curated_date DATETIME
) AS rows;

CREATE EXTERNAL FILE FORMAT ParquetFormat
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);



CREATE EXTERNAL TABLE rholly.employee (
	EmployeeLogID VARCHAR(100),
    EmployeeID VARCHAR(100),
    Name VARCHAR(100),
    Position VARCHAR(100),
    StartDate VARCHAR(100),
    EndDate VARCHAR(100),
    curated_date DATETIME
)
WITH (
    LOCATION = 'test/mart/employee/*/',
    DATA_SOURCE = BigDataRholly,
    FILE_FORMAT = ParquetFormat
);

CREATE VIEW [rholly].[view_employee] AS
SELECT
CONVERT(INT,[EmployeeLogID] AS [EmployeeLogID]),
CONVERT(INT,[EmployeeID] AS [EmployeeID]),
    [Name],
    [Position],
    [StartDate],
    [EndDate],
    [curated_date]
FROM
[rholly].[employee]

CREATE PROCEDURE [rholly].[sp_employee] AS
SELECT
	CONVERT(INT,[EmployeeLogID]) AS [EmployeeLogID]
	,CONVERT(INT,[EmployeeID]) AS [EmployeeID]
	,[Name]
	,[Position]
	,[StartDate]
	,[EndDate]
	,[curated_date]
FROM
[rholly].[employee]


SELECT *
FROM OPENROWSET(
    BULK 'test/fact/employee.snappy.parquet',
    DATA_SOURCE = 'BigDataRholly',
    FORMAT='PARQUET'
) 
WITH (
	EmployeeLogID VARCHAR(100),
    EmployeeID VARCHAR(100),
    Name VARCHAR(100),
    Position VARCHAR(100),
    StartDate VARCHAR(100),
    EndDate VARCHAR(100),
    curated_date DATETIME
) AS rows;

DROP EXTERNAL TABLE rholly.customers
CREATE EXTERNAL TABLE rholly.customers (
    customer_id CHAR(32),
    customer_unique_id CHAR(32),
    customer_zip_code_prefix varchar(10),
    customer_city VARCHAR(255),
    customer_state CHAR(2),
    ingest_time varchar(50)

)
WITH (
    LOCATION = 'test/mart/customers/*/',
    DATA_SOURCE = BigDataRholly,
    FILE_FORMAT = ParquetFormat
);

DROP EXTERNAL TABLE rholly.orders
CREATE EXTERNAL TABLE rholly.orders (
    order_id CHAR(32),
    customer_id CHAR(32),
    order_status VARCHAR(50),
    order_purchase_timestamp VARCHAR(50),
    order_approved_at VARCHAR(50),
    order_delivered_carrier_date VARCHAR(50),
    order_delivered_customer_date VARCHAR(50),
    order_estimated_delivery_date VARCHAR(50),
    ingest_time VARCHAR(50)

)
WITH (
    LOCATION = 'test/mart/orders/*/',
    DATA_SOURCE = BigDataRholly,
    FILE_FORMAT = ParquetFormat
);

DROP EXTERNAL TABLE rholly.order_items
CREATE EXTERNAL TABLE rholly.order_items (
    order_id CHAR(32),
    order_item_id VARCHAR(100),
    product_id CHAR(32),
    seller_id CHAR(32),
    shipping_limit_date VARCHAR(50),
    price VARCHAR(50),
    freight_value VARCHAR(50),
    ingest_time VARCHAR(100)
)
WITH (
    LOCATION = 'test/mart/order_items/*/',
    DATA_SOURCE = BigDataRholly,
    FILE_FORMAT = ParquetFormat
);

CREATE VIEW rholly.vw_customer_rfm AS
SELECT
    a.customer_id,
    CONVERT(char(7), b.order_purchase_timestamp, 126) AS [month_id],
    DATEDIFF(day, MAX(b.order_purchase_timestamp), '2018-08-31') AS recency,
    COUNT(b.order_id) AS frequency,
    SUM(CONVERT(decimal(18,2),c.price)) AS monetary
FROM rholly.customers a
LEFT JOIN rholly.orders b ON a.customer_id = b.customer_id
LEFT JOIN rholly.order_items c ON b.order_id = c.order_id
GROUP BY a.customer_id, CONVERT(char(7), b.order_purchase_timestamp, 126);

DROP EXTERNAL TABLE rholly.mongodb1
CREATE EXTERNAL TABLE rholly.mongodb1 (
    id nvarchar(255),
    course nvarchar(255),
    question nvarchar(max),
    section nvarchar(255),
    text nvarchar(MAX)
)
WITH (
    LOCATION = 'test/chalange_day_9/output/output1/',
    DATA_SOURCE = BigDataRholly,
    FILE_FORMAT = ParquetFormat
);

DROP EXTERNAL TABLE rholly.yellow_taxi
CREATE EXTERNAL TABLE rholly.yellow_taxi (
    VendorID int,
    tpep_pickup_datetime datetime,
    tpep_dropoff_datetime datetime,
    passenger_count bigint,
    trip_distance float,
    RatecodeID bigint,
    store_and_fwd_flag VARCHAR(200),
    PULocationID int,
	DOLocationID int,
	payment_type bigint,
	fare_amount float,
	extra float,
	mta_tax float,
	tip_amount float,
	tolls_amount float,
	improvement_surcharge float,
	total_amount float,
	congestion_surcharge float,
	Airport_fee float
)
WITH (
    LOCATION = 'test/chalange_day_9/soal2/yellow_parquet_january/',
    DATA_SOURCE = BigDataRholly,
    FILE_FORMAT = ParquetFormat
);

select top(100) * from rholly.yellow_taxi