SELECT 
    sr."WorkLifeBalance",
    COUNT(*) AS "Total_Employees",
    SUM(CASE WHEN ch."Attrition" = 'Yes' THEN 1 ELSE 0 END) AS "Total_Attrited",
    ROUND(
        (SUM(CASE WHEN ch."Attrition" = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*)) * 100, 
        2
    ) AS "Attrition_Rate_Percent"
FROM survey_responses sr
JOIN career_history ch ON sr."EmployeeNumber" = ch."EmployeeNumber"
GROUP BY sr."WorkLifeBalance"
ORDER BY "Attrition_Rate_Percent" DESC;
