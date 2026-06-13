SELECT 
    jd."OverTime",
    sr."JobSatisfaction",
    COUNT(*) AS "Total_Employees",
    SUM(CASE WHEN ch."Attrition" = 'Yes' THEN 1 ELSE 0 END) AS "Total_Attrited",
    ROUND(
        (SUM(CASE WHEN ch."Attrition" = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*)) * 100, 
        2
    ) AS "Attrition_Rate_Percent"
FROM job_details jd
JOIN survey_responses sr ON jd."EmployeeNumber" = sr."EmployeeNumber"
JOIN career_history ch ON jd."EmployeeNumber" = ch."EmployeeNumber"
GROUP BY jd."OverTime", sr."JobSatisfaction"
ORDER BY jd."OverTime" DESC, "Attrition_Rate_Percent" DESC;
