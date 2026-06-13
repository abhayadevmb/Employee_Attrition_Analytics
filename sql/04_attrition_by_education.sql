SELECT 
    d."EducationField",
    COUNT(*) AS "Total_Employees",
    SUM(CASE WHEN ch."Attrition" = 'Yes' THEN 1 ELSE 0 END) AS "Total_Attrited",
    ROUND(
        (SUM(CASE WHEN ch."Attrition" = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*)) * 100, 
        2
    ) AS "Attrition_Rate_Percent"
FROM employee_demographics d
JOIN career_history ch ON d."EmployeeNumber" = ch."EmployeeNumber"
GROUP BY d."EducationField"
ORDER BY "Attrition_Rate_Percent" DESC;
