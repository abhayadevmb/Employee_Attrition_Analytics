-- ==========================================================
-- Business Question 4: Do employees with lower monthly income leave the company at higher rates?
-- ==========================================================
-- Objective: Analyze the relationship between pay levels and voluntary attrition.

WITH income_bands AS (
    SELECT 
        "EmployeeNumber",
        "MonthlyIncome",
        CASE 
            WHEN "MonthlyIncome" < 5000 THEN 'Low (< $5k)'
            WHEN "MonthlyIncome" >= 5000 AND "MonthlyIncome" < 10000 THEN 'Medium ($5k - $10k)'
            WHEN "MonthlyIncome" >= 10000 AND "MonthlyIncome" < 15000 THEN 'High ($10k - $15k)'
            ELSE 'Executive ($15k+)'
        END AS "Income_Band"
    FROM compensation
)
SELECT 
    ib."Income_Band",
    COUNT(*) AS "Total_Employees",
    SUM(CASE WHEN ch."Attrition" = 'Yes' THEN 1 ELSE 0 END) AS "Total_Attrited",
    ROUND(
        (SUM(CASE WHEN ch."Attrition" = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*)) * 100, 
        2
    ) AS "Attrition_Rate_Percent"
FROM income_bands ib
JOIN career_history ch ON ib."EmployeeNumber" = ch."EmployeeNumber"
GROUP BY ib."Income_Band"
ORDER BY MIN(ib."MonthlyIncome") ASC;

/* 
------------------------------------------------------------
🔍 HR INSIGHT:
* Employees earning less than $5,000/month represent the vast majority of departures (163 exits)
  with a highly elevated attrition rate of 21.76%.
* Attrition drops significantly for the Medium ($5k - $10k) and High ($10k - $15k) bands to ~11% - 13.5%.
* Executive level employees ($15k+) have the lowest attrition rate at 3.76%.
* Pay levels have a strong inverse relationship with turnover risk.

💡 RECOMMENDED BUSINESS ACTIONS:
1. Conduct market salary mapping to verify if entry-level salaries are competitive.
2. Build structured retention plans and pay-adjustment budgets specifically targeted at critical, 
   high-performing roles earning below $5,000/month.
------------------------------------------------------------
*/
