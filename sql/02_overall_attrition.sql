-- ==========================================================
-- Business Question 1: What is the overall employee attrition rate?
-- ==========================================================
-- Objective: Establish the company-wide voluntary turnover baseline.

SELECT 
    COUNT(*) AS "Total_Employees",
    SUM(CASE WHEN "Attrition" = 'Yes' THEN 1 ELSE 0 END) AS "Total_Attrited",
    SUM(CASE WHEN "Attrition" = 'No' THEN 1 ELSE 0 END) AS "Total_Active",
    ROUND(
        (SUM(CASE WHEN "Attrition" = 'Yes' THEN 1.0 ELSE 0.0 END) / COUNT(*)) * 100, 
        2
    ) AS "Attrition_Rate_Percent"
FROM career_history;

/* 
------------------------------------------------------------
🔍 HR INSIGHT:
The company's overall attrition rate stands at 16.12% (237 exits out of 1,470 employees).
This is elevated compared to the healthy industry standard of 10% - 12%.
This indicates active retention issues that warrant targeted interventions.

💡 RECOMMENDED BUSINESS ACTIONS:
1. Target reducing company-wide voluntary turnover to 12% or lower over the next fiscal year.
2. Investigate high-risk departments and roles in subsequent steps to apply cost-effective, surgical retention programs.
------------------------------------------------------------
*/
