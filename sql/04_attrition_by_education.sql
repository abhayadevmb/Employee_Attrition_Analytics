-- ==========================================================
-- Business Question 3: How does employee attrition vary by their field of education?
-- ==========================================================
-- Objective: Analyze if specific educational backgrounds correlate with higher turnover rates.

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

/* 
------------------------------------------------------------
🔍 HR INSIGHT:
* Employees from Human Resources (25.93% attrition) and Technical Degree (24.24% attrition) 
  backgrounds have the highest rates of departure.
* Employees with Medical (13.58% attrition) and Life Sciences (14.69% attrition) backgrounds
  showed much greater stability.

💡 RECOMMENDED BUSINESS ACTIONS:
1. Technical Degrees: Review growth pathways for technical talent. Often, technical workers leave if they feel they are performing routine work rather than building skills.
2. Human Resources & Marketing: Since these fields also show elevated attrition, review starting compensation plans and career development initiatives to retain specialized talent.
------------------------------------------------------------
*/
