CREATE TABLE dbo.application (
    SK_ID_CURR INT PRIMARY KEY,
    NAME_CONTRACT_TYPE NVARCHAR(50),
    CODE_GENDER NVARCHAR(10),
    FLAG_OWN_CAR NVARCHAR(10),
    FLAG_OWN_REALTY NVARCHAR(10),
    CNT_CHILDREN INT,
    AMT_INCOME_TOTAL DECIMAL(18, 2),
    AMT_CREDIT DECIMAL(18, 2),
    AMT_ANNUITY DECIMAL(18, 2),
    AMT_GOODS_PRICE DECIMAL(18, 2),
    NAME_TYPE_SUITE NVARCHAR(50),
    NAME_INCOME_TYPE NVARCHAR(50),
    NAME_EDUCATION_TYPE NVARCHAR(50),
    NAME_FAMILY_STATUS NVARCHAR(50),
    NAME_HOUSING_TYPE NVARCHAR(50),
    REGION_POPULATION_RELATIVE DECIMAL(10, 8),
    DAYS_BIRTH INT,
    DAYS_EMPLOYED INT,
    DAYS_REGISTRATION INT,
    DAYS_ID_PUBLISH INT,
    OWN_CAR_AGE INT,
    FLAG_MOBIL INT,
    FLAG_EMP_PHONE INT,
    FLAG_WORK_PHONE INT,
    FLAG_CONT_MOBILE INT,
    FLAG_PHONE INT,
    FLAG_EMAIL INT,
    OCCUPATION_TYPE NVARCHAR(50),
    CNT_FAM_MEMBERS INT,
    REGION_RATING_CLIENT INT,
    REGION_RATING_CLIENT_W_CITY INT,
    WEEKDAY_APPR_PROCESS_START NVARCHAR(10),
    HOUR_APPR_PROCESS_START INT,
    REG_REGION_NOT_LIVE_REGION INT,
    REG_REGION_NOT_WORK_REGION INT,
    LIVE_REGION_NOT_WORK_REGION INT,
    REG_CITY_NOT_LIVE_CITY INT,
    REG_CITY_NOT_WORK_CITY INT,
    LIVE_CITY_NOT_WORK_CITY INT,
    ORGANIZATION_TYPE NVARCHAR(50),
    EXT_SOURCE_1 DECIMAL(10, 8),
    EXT_SOURCE_2 DECIMAL(10, 8),
    EXT_SOURCE_3 DECIMAL(10, 8),
    APARTMENTS_AVG DECIMAL(10, 8),
    BASEMENTAREA_AVG DECIMAL(10, 8),
    YEARS_BEGINEXPLUATATION_AVG DECIMAL(10, 8),
    YEARS_BUILD_AVG DECIMAL(10, 8),
    COMMONAREA_AVG DECIMAL(10, 8),
    ELEVATORS_AVG DECIMAL(10, 8),
    ENTRANCES_AVG DECIMAL(10, 8),
    FLOORSMAX_AVG DECIMAL(10, 8),
    FLOORSMIN_AVG DECIMAL(10, 8),
    LANDAREA_AVG DECIMAL(10, 8),
    LIVINGAPARTMENTS_AVG DECIMAL(10, 8),
    LIVINGAREA_AVG DECIMAL(10, 8),
    NONLIVINGAPARTMENTS_AVG DECIMAL(10, 8),
    NONLIVINGAREA_AVG DECIMAL(10, 8),
    APARTMENTS_MODE DECIMAL(10, 8),
    BASEMENTAREA_MODE DECIMAL(10, 8),
    YEARS_BEGINEXPLUATATION_MODE DECIMAL(10, 8),
    YEARS_BUILD_MODE DECIMAL(10, 8),
    COMMONAREA_MODE DECIMAL(10, 8),
    ELEVATORS_MODE DECIMAL(10, 8),
    ENTRANCES_MODE DECIMAL(10, 8),
    FLOORSMAX_MODE DECIMAL(10, 8),
    FLOORSMIN_MODE DECIMAL(10, 8),
    LANDAREA_MODE DECIMAL(10, 8),
    LIVINGAPARTMENTS_MODE DECIMAL(10, 8),
    LIVINGAREA_MODE DECIMAL(10, 8),
    NONLIVINGAPARTMENTS_MODE DECIMAL(10, 8),
    NONLIVINGAREA_MODE DECIMAL(10, 8),
    APARTMENTS_MEDI DECIMAL(10, 8),
    BASEMENTAREA_MEDI DECIMAL(10, 8),
    YEARS_BEGINEXPLUATATION_MEDI DECIMAL(10, 8),
    YEARS_BUILD_MEDI DECIMAL(10, 8),
    COMMONAREA_MEDI DECIMAL(10, 8),
    ELEVATORS_MEDI DECIMAL(10, 8),
    ENTRANCES_MEDI DECIMAL(10, 8),
    FLOORSMAX_MEDI DECIMAL(10, 8),
    FLOORSMIN_MEDI DECIMAL(10, 8),
    LANDAREA_MEDI DECIMAL(10, 8),
    LIVINGAPARTMENTS_MEDI DECIMAL(10, 8),
    LIVINGAREA_MEDI DECIMAL(10, 8),
    NONLIVINGAPARTMENTS_MEDI DECIMAL(10, 8),
    NONLIVINGAREA_MEDI DECIMAL(10, 8),
    FONDKAPREMONT_MODE NVARCHAR(50),
    HOUSETYPE_MODE NVARCHAR(50),
    TOTALAREA_MODE DECIMAL(10, 8),
    WALLSMATERIAL_MODE NVARCHAR(50),
    EMERGENCYSTATE_MODE NVARCHAR(50),
    OBS_30_CNT_SOCIAL_CIRCLE INT,
    DEF_30_CNT_SOCIAL_CIRCLE INT,
    OBS_60_CNT_SOCIAL_CIRCLE INT,
    DEF_60_CNT_SOCIAL_CIRCLE INT,
    DAYS_LAST_PHONE_CHANGE INT,
    FLAG_DOCUMENT_2 INT,
    FLAG_DOCUMENT_3 INT,
    FLAG_DOCUMENT_4 INT,
    FLAG_DOCUMENT_5 INT,
    FLAG_DOCUMENT_6 INT,
    FLAG_DOCUMENT_7 INT,
    FLAG_DOCUMENT_8 INT,
    FLAG_DOCUMENT_9 INT,
    FLAG_DOCUMENT_10 INT,
    FLAG_DOCUMENT_11 INT,
    FLAG_DOCUMENT_12 INT,
    FLAG_DOCUMENT_13 INT,
    FLAG_DOCUMENT_14 INT,
    FLAG_DOCUMENT_15 INT,
    FLAG_DOCUMENT_16 INT,
    FLAG_DOCUMENT_17 INT,
    FLAG_DOCUMENT_18 INT,
    FLAG_DOCUMENT_19 INT,
    FLAG_DOCUMENT_20 INT,
    FLAG_DOCUMENT_21 INT,
    AMT_REQ_CREDIT_BUREAU_HOUR INT,
    AMT_REQ_CREDIT_BUREAU_DAY INT,
    AMT_REQ_CREDIT_BUREAU_WEEK INT,
    AMT_REQ_CREDIT_BUREAU_MON INT,
    AMT_REQ_CREDIT_BUREAU_QRT INT,
    AMT_REQ_CREDIT_BUREAU_YEAR INT
);

CREATE TABLE dbo.bureau (
    SK_ID_CURR INT,
    SK_ID_BUREAU INT PRIMARY KEY,
    CREDIT_ACTIVE NVARCHAR(50),
    CREDIT_CURRENCY NVARCHAR(10),
    DAYS_CREDIT INT,
    CREDIT_DAY_OVERDUE INT,
    DAYS_CREDIT_ENDDATE INT,
    DAYS_ENDDATE_FACT INT,
    AMT_CREDIT_MAX_OVERDUE DECIMAL(18, 2),
    CNT_CREDIT_PROLONG INT,
    AMT_CREDIT_SUM DECIMAL(18, 2),
    AMT_CREDIT_SUM_DEBT DECIMAL(18, 2),
    AMT_CREDIT_SUM_LIMIT DECIMAL(18, 2),
    AMT_CREDIT_SUM_OVERDUE DECIMAL(18, 2),
    CREDIT_TYPE NVARCHAR(50),
    DAYS_CREDIT_UPDATE INT,
    AMT_ANNUITY DECIMAL(18, 2)
);
CREATE TABLE dbo.installment (
    SK_ID_PREV INT,
    SK_ID_CURR INT,
    NUM_INSTALMENT_VERSION INT,
    NUM_INSTALMENT_NUMBER INT,
    DAYS_INSTALMENT INT,
    DAYS_ENTRY_PAYMENT INT,
    AMT_INSTALMENT DECIMAL(18, 2),
    AMT_PAYMENT DECIMAL(18, 2),
    PRIMARY KEY (SK_ID_PREV, NUM_INSTALMENT_NUMBER) -- Menambahkan primary key gabungan sesuai yang memungkinkan dalam konteks ini
);
CREATE TABLE dbo.previous_application (
    SK_ID_PREV INT PRIMARY KEY,
    SK_ID_CURR INT,
    NAME_CONTRACT_TYPE NVARCHAR(50),
    AMT_ANNUITY DECIMAL(18, 2),
    AMT_APPLICATION DECIMAL(18, 2),
    AMT_CREDIT DECIMAL(18, 2),
    AMT_DOWN_PAYMENT DECIMAL(18, 2),
    AMT_GOODS_PRICE DECIMAL(18, 2),
    WEEKDAY_APPR_PROCESS_START NVARCHAR(10),
    HOUR_APPR_PROCESS_START INT,
    FLAG_LAST_APPL_PER_CONTRACT NVARCHAR(10),
    NFLAG_LAST_APPL_IN_DAY INT,
    RATE_DOWN_PAYMENT DECIMAL(18, 4),
    RATE_INTEREST_PRIMARY DECIMAL(18, 4),
    RATE_INTEREST_PRIVILEGED DECIMAL(18, 4),
    NAME_CASH_LOAN_PURPOSE NVARCHAR(50),
    NAME_CONTRACT_STATUS NVARCHAR(50),
    DAYS_DECISION INT,
    NAME_PAYMENT_TYPE NVARCHAR(50),
    CODE_REJECT_REASON NVARCHAR(50),
    NAME_TYPE_SUITE NVARCHAR(50),
    NAME_CLIENT_TYPE NVARCHAR(50),
    NAME_GOODS_CATEGORY NVARCHAR(50),
    NAME_PORTFOLIO NVARCHAR(50),
    NAME_PRODUCT_TYPE NVARCHAR(50),
    CHANNEL_TYPE NVARCHAR(50),
    SELLERPLACE_AREA INT,
    NAME_SELLER_INDUSTRY NVARCHAR(50),
    CNT_PAYMENT INT,
    NAME_YIELD_GROUP NVARCHAR(50),
    PRODUCT_COMBINATION NVARCHAR(50),
    DAYS_FIRST_DRAWING INT,
    DAYS_FIRST_DUE INT,
    DAYS_LAST_DUE_1ST_VERSION INT,
    DAYS_LAST_DUE INT,
    DAYS_TERMINATION INT,
    NFLAG_INSURED_ON_APPROVAL INT
);
select top(5) * from dbo.bureau

CREATE TABLE dbo.loan_modeling (
    customer_no INT PRIMARY KEY,
    high_approval_credit float,
    avg_approval_credit float,
    count_consumer_loans INT,
    count_credit_active INT,
    count_credit_overdue INT,
    count_payday_30 INT,
    income float,
    cnt_children INT
);

create view dbo.loan_modeling as

select a.SK_ID_CURR,MAX(b.AMT_CREDIT) AS high_approval_credit
from dbo.application a
LEFT JOIN 
    dbo.previous_application b ON a.SK_ID_CURR = b.SK_ID_CURR
GROUP BY a.SK_ID_CURR



SELECT 
    a.SK_ID_CURR AS customer_no,
    MAX(b.AMT_CREDIT) AS high_approval_credit,
    AVG(b.AMT_CREDIT) AS avg_approval_credit,
    COUNT(b.NAME_CONTRACT_TYPE) AS count_consumer_loans,
    COUNT(c.CREDIT_ACTIVE) AS count_credit_active,
    COUNT(c.CREDIT_DAY_OVERDUE) AS count_credit_overdue,
    COUNT(CASE WHEN d.DAYS_INSTALMENT > 30 THEN d.DAYS_INSTALMENT END) AS count_payday_30,
    SUM(a.AMT_INCOME_TOTAL) AS income,
    COUNT(a.CNT_CHILDREN) AS cnt_children
FROM 
    dbo.application a
LEFT JOIN 
    dbo.previous_application b ON a.SK_ID_CURR = b.SK_ID_CURR
LEFT JOIN 
    dbo.bureau c ON a.SK_ID_CURR = c.SK_ID_CURR
LEFT JOIN 
    dbo.installment d ON a.SK_ID_CURR = d.SK_ID_CURR
GROUP BY 
    a.SK_ID_CURR;

	CREATE VIEW lon.modeling AS
	WITH prev_app as (
		select SK_ID_CURR,
			   max(AMT_CREDIT) as high_approval_credit,
			   avg(AMT_CREDIT) as avg_approval_credit,
			   count(NAME_CONTRACT_TYPE) as count_consumer_loans
		from previous_application
		group by SK_ID_CURR
	), 
	bureau_cte as (
		select SK_ID_CURR,
			   count(CREDIT_ACTIVE) as count_credit_active
		from bureau
		where CREDIT_ACTIVE = 'Active'
		GROUP BY SK_ID_CURR
	),
	bureau_overdue_cte as (
		select SK_ID_CURR,
			   count(CREDIT_DAY_OVERDUE) as count_credit_overdue
		from bureau
		GROUP BY SK_ID_CURR
	),
	install_cte as (
		select SK_ID_CURR,
			   COUNT(DAYS_INSTALMENT) as count_payday_30
		from installment 
		WHERE DAYS_INSTALMENT>30
		GROUP BY SK_ID_CURR
	),
	app_cte as (
		select  sk_id_curr,
				sum(AMT_INCOME_TOTAL) AS income,
				count(CNT_CHILDREN) as cnt_children
		from application
		group by sk_id_curr)
	select app.sk_id_curr as customer_no,
		   prev_app.high_approval_credit,
		   prev_app.avg_approval_credit,
		   prev_app.count_consumer_loans,
		   COALESCE(bureau_cte.count_credit_active,0) as count_credit_active,
		   COALESCE(bureau_overdue_cte.count_credit_overdue,0) as count_credit_overdue,
		   COALESCE(install_cte.count_payday_30,0) as count_payday_30,
		   apptab.income,
		   apptab.cnt_children
	from application app
	left join prev_app on prev_app.SK_ID_CURR = app.SK_ID_CURR
	left join bureau_cte on bureau_cte.SK_ID_CURR = app.SK_ID_CURR 
	left join bureau_overdue_cte on bureau_overdue_cte.SK_ID_CURR = app.SK_ID_CURR 
	left join install_cte on install_cte.SK_ID_CURR = app.SK_ID_CURR 
	left join app_cte on app_cte.SK_ID_CURR = app.SK_ID_CURR

	select SK_ID_CURR,
			   count(CREDIT_ACTIVE) as count_credit_active
		from bureau
		where CREDIT_ACTIVE = 'Active'
		GROUP BY SK_ID_CURR

SELECT TOP (1000) [EmployeeID]
      ,[Name]
      ,[Position]
      ,[StartDate]
      ,[EndDate]
  FROM [dbo].[user]

truncate table [user]

INSERT INTO [user] (EmployeeID, Name, Position, StartDate, EndDate)
VALUES
    (1, 'Andi', 'Marketing', '2016-05-07', '9999-12-31'),
    (2, 'Fajar', 'Finance', '2015-11-11', '9999-12-31'),
    (3, 'Ahmad', 'Sales', '2017-01-14', '9999-12-31'),
    (4, 'Toni', 'Logistic', '2018-03-23', '9999-12-31'),
    (5, 'Rahma', 'Finance', '2019-06-13', '9999-12-31');

WITH NumberedEmployees AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY EmployeeID ORDER BY EndDate DESC) AS row_num
    FROM Employee
)
SELECT *
FROM NumberedEmployees
WHERE row_num = 1;
