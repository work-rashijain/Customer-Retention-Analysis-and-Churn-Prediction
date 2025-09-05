CREATE DATABASE db_Churn;

-- load data using import data wizard

SELECT * FROM db_churn.customer_data;
SELECT COUNT(*) FROM customer_data;

-- table name change to stg_Churn

SELECT Gender, Count(Gender) as TotalCount,
Count(Gender) * 1.0 / (Select Count(*) from stg_Churn)  as Percentage
from stg_Churn
Group by Gender;

SELECT Contract, Count(Contract) as TotalCount,
Count(Contract) * 1.0 / (Select Count(*) from stg_Churn)  as Percentage
from stg_Churn
Group by Contract;

SELECT Customer_Status, Count(Customer_Status) as TotalCount, Sum(Total_Revenue) as TotalRev,
Sum(Total_Revenue) / (Select sum(Total_Revenue) from stg_Churn) * 100  as RevPercentage
from stg_Churn
Group by Customer_Status;

SELECT State, Count(State) as TotalCount,
Count(State) * 1.0 / (Select Count(*) from stg_Churn)  as Percentage
from stg_Churn
Group by State
Order by Percentage desc;

-- changing blank values to null values
UPDATE stg_Churn
SET
    Customer_ID = NULLIF(TRIM(Customer_ID), ''),
    Gender = NULLIF(TRIM(Gender), ''),
    Age = NULLIF(TRIM(Age), ''),
    Married = NULLIF(TRIM(Married), ''),
    State = NULLIF(TRIM(State), ''),
    Number_of_Referrals = NULLIF(TRIM(Number_of_Referrals), ''),
    Tenure_in_Months = NULLIF(TRIM(Tenure_in_Months), ''),
    Value_Deal = NULLIF(TRIM(Value_Deal), ''),
    Phone_Service = NULLIF(TRIM(Phone_Service), ''),
    Multiple_Lines = NULLIF(TRIM(Multiple_Lines), ''),
    Internet_Service = NULLIF(TRIM(Internet_Service), ''),
    Internet_Type = NULLIF(TRIM(Internet_Type), ''),
    Online_Security = NULLIF(TRIM(Online_Security), ''),
    Online_Backup = NULLIF(TRIM(Online_Backup), ''),
    Device_Protection_Plan = NULLIF(TRIM(Device_Protection_Plan), ''),
    Premium_Support = NULLIF(TRIM(Premium_Support), ''),
    Streaming_TV = NULLIF(TRIM(Streaming_TV), ''),
    Streaming_Movies = NULLIF(TRIM(Streaming_Movies), ''),
    Streaming_Music = NULLIF(TRIM(Streaming_Music), ''),
    Unlimited_Data = NULLIF(TRIM(Unlimited_Data), ''),
    Contract = NULLIF(TRIM(Contract), ''),
    Paperless_Billing = NULLIF(TRIM(Paperless_Billing), ''),
    Payment_Method = NULLIF(TRIM(Payment_Method), ''),
    Monthly_Charge = NULLIF(TRIM(Monthly_Charge), ''),
    Total_Charges = NULLIF(TRIM(Total_Charges), ''),
    Total_Refunds = NULLIF(TRIM(Total_Refunds), ''),
    Total_Extra_Data_Charges = NULLIF(TRIM(Total_Extra_Data_Charges), ''),
    Total_Long_Distance_Charges = NULLIF(TRIM(Total_Long_Distance_Charges), ''),
    Total_Revenue = NULLIF(TRIM(Total_Revenue), ''),
    Customer_Status = NULLIF(TRIM(Customer_Status), ''),
    Churn_Category = NULLIF(TRIM(Churn_Category), ''),
    Churn_Reason = NULLIF(TRIM(Churn_Reason), '');
    
    
SELECT 
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,
    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM stg_Churn;

CREATE TABLE db_Churn.prod_Churn AS
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals,
    Tenure_in_Months,
    IFNULL(Value_Deal, 'None') AS Value_Deal,
    Phone_Service,
    IFNULL(Multiple_Lines, 'No') AS Multiple_Lines,
    Internet_Service,
    IFNULL(Internet_Type, 'None') AS Internet_Type,
    IFNULL(Online_Security, 'No') AS Online_Security,
    IFNULL(Online_Backup, 'No') AS Online_Backup,
    IFNULL(Device_Protection_Plan, 'No') AS Device_Protection_Plan,
    IFNULL(Premium_Support, 'No') AS Premium_Support,
    IFNULL(Streaming_TV, 'No') AS Streaming_TV,
    IFNULL(Streaming_Movies, 'No') AS Streaming_Movies,
    IFNULL(Streaming_Music, 'No') AS Streaming_Music,
    IFNULL(Unlimited_Data, 'No') AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    IFNULL(Churn_Category, 'Others') AS Churn_Category,
    IFNULL(Churn_Reason , 'Others') AS Churn_Reason
FROM db_Churn.stg_Churn;

/* -----------------------------------------------------------------
 STEP 7: BETWEEN – Customers aged 25–40 with tenure 12–24 months
 → What it does: Filters customers based on age and tenure range.
 → Why taken: To identify a focused customer segment (young to mid-age 
   with moderate tenure) that might be more likely to churn or upgrade.
----------------------------------------------------------------- */
SELECT Age, Tenure_in_Months, COUNT(*) AS Customer_Count
FROM prod_Churn
WHERE Age BETWEEN 25 AND 40
  AND Tenure_in_Months BETWEEN 12 AND 24
GROUP BY Age, Tenure_in_Months
ORDER BY Age, Tenure_in_Months;


/* -----------------------------------------------------------------
 STEP 8: HAVING – States with more than 100 churned customers
 → What it does: Uses HAVING to filter states after aggregation.
 → Why taken: To highlight states with a significant churn base where 
   retention strategies should be prioritized.
----------------------------------------------------------------- */
SELECT State, COUNT(*) AS Churned_Customers
FROM prod_Churn
WHERE Customer_Status = 'Churned'
GROUP BY State
HAVING COUNT(*) > 100
ORDER BY Churned_Customers DESC;


/* -----------------------------------------------------------------
 STEP 9: Subquery – Customers with above-average revenue
 → What it does: Finds how many customers earn more than overall avg revenue.
 → Why taken: To focus on high-value customers who are critical for 
   revenue retention and should be given priority in engagement.
----------------------------------------------------------------- */
SELECT COUNT(*) AS Customers_Above_Avg_Revenue
FROM prod_Churn
WHERE Total_Revenue > (
    SELECT AVG(Total_Revenue) 
    FROM prod_Churn
);


/* -----------------------------------------------------------------
 STEP 10: Nested Query – States with highest churn percentage
 → What it does: Calculates churn % by state using an inner aggregate query.
 → Why taken: To not just look at churn counts, but also churn *rate*, 
   giving fair comparison between states of different sizes.
----------------------------------------------------------------- */
SELECT State, Churned_Count, Total_Count,
       (Churned_Count * 100.0 / Total_Count) AS Churn_Percentage
FROM (
    SELECT State,
           COUNT(*) AS Total_Count,
           SUM(CASE WHEN Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Count
    FROM prod_Churn
    GROUP BY State
) t
ORDER BY Churn_Percentage DESC;


/* -----------------------------------------------------------------
 STEP 11: CASE WHEN – Categorize customers into revenue buckets
 → What it does: Classifies customers into Low, Medium, High revenue groups.
 → Why taken: To segment customers based on revenue contribution 
   and design differentiated retention/loyalty strategies.
----------------------------------------------------------------- */
SELECT 
    Revenue_Category, 
    COUNT(*) AS Customer_Count,
    ROUND(AVG(Total_Revenue),2) AS Avg_Revenue,
    ROUND(SUM(Total_Revenue),2) AS Total_Revenue
FROM (
    SELECT Customer_ID, Total_Revenue,
           CASE 
               WHEN Total_Revenue < 1000 THEN 'Low'
               WHEN Total_Revenue BETWEEN 1000 AND 5000 THEN 'Medium'
               ELSE 'High'
           END AS Revenue_Category
    FROM prod_Churn
) t
GROUP BY Revenue_Category
ORDER BY Total_Revenue DESC;


/* -----------------------------------------------------------------
 STEP 12: Window Function – Top 3 churned customers by revenue in each state
 → What it does: Uses RANK() to find top churned customers within each state.
 → Why taken: To identify the highest-value customers lost in each state 
   so that similar profiles can be targeted for retention.
----------------------------------------------------------------- */
SELECT * FROM (
    SELECT Customer_ID, State, Total_Revenue,
           RANK() OVER (PARTITION BY State ORDER BY Total_Revenue DESC) AS Churn_Rank
    FROM prod_Churn
    WHERE State IS NOT NULL
      AND Customer_Status = 'Churned'
) t
WHERE Churn_Rank <= 3;


/* -----------------------------------------------------------------
 STEP 13: CTE – Contracts where avg revenue > overall avg
 → What it does: Uses a CTE to compare contract-wise avg revenue with overall avg.
 → Why taken: To evaluate which contract types drive above-average revenue 
   and could be promoted more aggressively.
----------------------------------------------------------------- */
WITH AvgRevenue AS (
    SELECT Contract, AVG(Total_Revenue) AS AvgRev
    FROM prod_Churn
    GROUP BY Contract
)
SELECT *
FROM AvgRevenue
WHERE AvgRev > (SELECT AVG(Total_Revenue) FROM prod_Churn);


/* -----------------------------------------------------------------
 STEP 14: Joins – Churn analysis by payment type
 → What it does: Maps payment methods to digital/offline types 
   and calculates churn rate by category.
 → Why taken: To study if payment mode (digital vs offline) has any 
   impact on churn behavior and customer stickiness.
----------------------------------------------------------------- */
CREATE TABLE Payment_Method_Lookup (
    Payment_Method VARCHAR(50) PRIMARY KEY,
    Payment_Type VARCHAR(50)
);

INSERT INTO Payment_Method_Lookup VALUES
('Credit Card', 'Digital'),
('Bank Transfer', 'Digital'),
('Electronic Check', 'Digital'),
('Mailed Check', 'Offline');

-- Example join to view payment type with revenue
SELECT p.Customer_ID, p.Total_Revenue, l.Payment_Type
FROM prod_Churn p
INNER JOIN Payment_Method_Lookup l
    ON p.Payment_Method = l.Payment_Method;

-- Aggregated churn analysis by payment type
SELECT l.Payment_Type,
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN p.Customer_Status = 'Churned' THEN 1 ELSE 0 END) AS Churned_Customers,
       (SUM(CASE WHEN p.Customer_Status = 'Churned' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS Churn_Rate_Percent
FROM prod_Churn p
INNER JOIN Payment_Method_Lookup l
    ON p.Payment_Method = l.Payment_Method
GROUP BY l.Payment_Type;


Create View vw_ChurnData as
	select * from prod_Churn where Customer_Status In ('Churned', 'Stayed');

Create View vw_JoinData as
	select * from prod_Churn where Customer_Status = 'Joined'
