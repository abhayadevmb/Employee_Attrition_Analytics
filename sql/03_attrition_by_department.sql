-- ==========================================================
-- Business Question 2: Which departments have the highest rates of employee attrition?
-- ==========================================================
-- Objective: Identify if retention issues are concentrated in specific business units.

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

/* 
------------------------------------------------------------
🔍 HR INSIGHT:
* Sales (20.62% attrition) and Human Resources (19.05% attrition) are highly elevated,
  running double the standard benchmark.
* Research & Development (13.84% attrition) is closest to a healthy range, though it contains
  the highest absolute number of exits (133 departures) due to its larger size.

💡 RECOMMENDED BUSINESS ACTIONS:
1. Sales: Conduct audits on sales quotas, review incentive alignments, and analyze manager-specific turnover.
2. Human Resources: Since HR is a very small department (63 people), even small losses disrupt continuity. Run targeted career development reviews for HR specialists.
------------------------------------------------------------
*/
