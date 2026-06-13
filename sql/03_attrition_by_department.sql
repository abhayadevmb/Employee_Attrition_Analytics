SELECT 
    jd."Department",
    COUNT(*) AS "Total_Employees",
    SUM(CASE WHEN ch."Attrition" = 'Yes' THEN 1 ELSE 0 END) AS "Total_Attrited",
    ROUND(
        (SUM(CASE WHEN ch."Attrition" = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*)) * 100, 
        2
    ) AS "Attrition_Rate_Percent"
FROM job_details jd
JOIN career_history ch ON jd."EmployeeNumber" = ch."EmployeeNumber"
GROUP BY jd."Department"
ORDER BY "Attrition_Rate_Percent" DESC;
