SELECT 
    COUNT(*) AS "Total_Employees",
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS "Total_Attrited",
    SUM(CASE WHEN "Attrition" = 'No' THEN 1 ELSE 0 END) AS "Total_Active",
    ROUND(
        (SUM(CASE WHEN "Attrition" = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*)) * 100, 
        2
    ) AS "Attrition_Rate_Percent"
FROM career_history;
