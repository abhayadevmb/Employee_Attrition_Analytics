-- ==========================================================
-- Business Question 5: How does employee work-life balance affect attrition rates?
-- ==========================================================
-- Objective: Analyze how survey-reported work-life balance ratings correlate with turnover.

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

/* 
------------------------------------------------------------
🔍 HR INSIGHT:
* Employees who rate their work-life balance as "Bad" have an extremely high attrition 
  rate of 31.25%, which is double the company baseline of 16.12%.
* Employees who rate their balance as "Best" also show slightly elevated attrition (17.65%),
  which could indicate that employees with very light workloads feel under-challenged or underutilized.
* The lowest attrition is found in the "Better" group at 14.22%.

💡 RECOMMENDED BUSINESS ACTIONS:
1. Conduct workload audits for departments/teams that disproportionately report "Bad" work-life balance.
2. Implement flexible working options, remote work days, or set strict limits on out-of-hours communications.
3. Review training and progression paths for the "Best" work-life balance group to ensure they remain engaged.
------------------------------------------------------------
*/
