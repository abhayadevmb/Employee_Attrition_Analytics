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
