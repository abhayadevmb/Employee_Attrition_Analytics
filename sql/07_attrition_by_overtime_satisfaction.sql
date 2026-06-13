-- ==========================================================
-- Business Question 6: How does the combination of working Overtime and 
--                      Job Satisfaction levels impact employee attrition?
-- ==========================================================
-- Objective: Investigate if high job satisfaction can buffer the negative impacts of overtime.

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

/* 
------------------------------------------------------------
🔍 HR INSIGHT:
* Overtime is an overwhelming predictor of attrition.
* For employees working Overtime (OverTime = Yes):
  - Medium Satisfaction: 37.68% attrition
  - Low Satisfaction: 35.71% attrition
  - High Satisfaction: 33.88% attrition (three times higher than the 9.97% rate for non-overtime peers)
  - Very High Satisfaction: 21.12% attrition
* Even highly satisfied employees will burn out and leave at high rates (~34%) when subjected to consistent overtime.

💡 RECOMMENDED BUSINESS ACTIONS:
1. Limit overtime requirements across all business units, prioritizing high-turnover roles like Sales.
2. Track overtime metrics proactively. Do not assume high satisfaction scores insulate employees from burnout.
3. Review compensation or time-off in-lieu (TOIL) policies for roles where overtime is unavoidable.
------------------------------------------------------------
*/
