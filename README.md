# Employee Attrition Prediction & HR Business Intelligence

![Status](https://img.shields.io/badge/Status-Work%20In%20Progress-orange)

**Project Status**: Work in Progress. Phases 1 (Data Engineering & Normalization) and 2 (SQL Business Intelligence) are fully completed. Currently preparing for Phase 3 (Exploratory Data Analysis).

Employee turnover is one of the most expensive hidden costs in any organization. When a skilled employee walks out the door, the company doesn't just lose a person — it loses institutional knowledge, team momentum, and productivity. Studies estimate the cost of replacing a single employee ranges from **50% to 200% of their annual salary**.

This project dives into **1,470 employee records** from IBM's HR dataset to answer one core question:

> *"Can we predict which employees are about to leave — and what's driving it?"*

## Project Workflow

### Phase 1 — Data Engineering & Modeling (Pandas)
- Clean and wrangle raw CSV data
- Normalize into a relational schema (5 tables)
- Load into PostgreSQL database

### Phase 2 — Business Intelligence (SQL)
- KPI queries: attrition by department, role, salary band
- Window functions, CTEs, JOINs across normalized tables
- Uncover actionable HR insights

### Phase 3 — Exploratory Data Analysis (Pandas + Visualization)
- Distribution plots, heatmaps, correlation analysis
- Visual storytelling with matplotlib/seaborn

### Phase 4 — Predictive Modeling (Scikit-learn / XGBoost)
- Binary classification: Will this employee leave?
- Models: Logistic Regression → Random Forest → XGBoost
- Class imbalance handling with SMOTE
- Feature importance & business impact analysis

## SQL Business Intelligence & Insights

### Question 1: What is the overall employee attrition rate?
* **Results**: 1,470 total employees, 237 departures (**16.12% attrition rate**).
* **Insight**: The company's turnover is higher than the standard healthy range (typically 10% to 12%). This suggests that there are general retention challenges that need to be addressed.
* **Business Action**: Set a target to bring overall attrition down to 12% or lower over the next year by implementing targeted retention programs based on the specific risk groups identified below.

### Question 2: Which departments have the highest rates of employee attrition?
* **Results**: Sales (**20.62%**), HR (**19.05%**), R&D (**13.84%**).
* **Insight**: Sales and HR have the highest turnover rates, both near 20%. R&D is closer to a healthy range at 13.8%, although it accounts for the largest number of total departures (133 exits) because it is the largest department.
* **Business Action**: Review compensation packages, commission structures, and workload issues in Sales. For the HR department, focus on career growth pathways and work-life balance to stabilize the team.

### Question 3: How does employee attrition vary by their field of education?
* **Results**: HR (**25.93%**), Technical Degree (**24.24%**), Marketing (**22.01%**), Life Sciences (**14.69%**), Medical (**13.58%**), Other (**13.41%**).
* **Insight**: Employees with HR and Technical Degree backgrounds leave at the highest rates. Staff with Life Sciences and Medical backgrounds (who represent the majority of the workforce) are much more stable.
* **Business Action**: Review the types of work assigned to technical degree holders to ensure they have opportunities to develop their skills, and analyze progression paths for HR and Marketing roles.

### Question 4: Do employees with lower monthly income leave the company at higher rates?
* **Results**: Low (< $5k): **21.76%**, Medium ($5k - $10k): **11.14%**, High ($10k - $15k): **13.51%**, Executive ($15k+): **3.76%**.
* **Insight**: There is a clear link between lower pay and higher attrition. Employees earning under $5,000 per month have a 21.76% attrition rate and account for 68% of all departures.
* **Business Action**: Evaluate starting pay rates against market benchmarks, and prioritize salary reviews or adjustment budgets for strong performers in the under $5,000 monthly income bracket.

### Question 5: How does employee work-life balance affect attrition rates?
* **Results**: Bad: **31.25%**, Best: **17.65%**, Good: **16.86%**, Better: **14.22%**.
* **Insight**: Employees who rate their work-life balance as "Bad" have an attrition rate of 31.25%, which is double the company average. Interestingly, those who rate it as "Best" also leave at a slightly higher rate (17.65%), which can occur if employees feel underutilized or lack challenging work.
* **Business Action**: Address workload distribution for teams reporting bad work-life balance, and introduce flexible work options. For those with highly flexible schedules, ensure they have sufficient career growth opportunities to keep them engaged.

### Question 6: How does the combination of working Overtime and Job Satisfaction levels impact employee attrition?
* **Results**:
  * **Overtime = Yes**: Medium Satisfaction (**37.68%**), Low (**35.71%**), High (**33.88%**), Very High (**21.12%**).
  * **Overtime = No**: Low Satisfaction (**17.56%**), High (**9.97%**), Medium (**9.48%**), Very High (**6.94%**).
* **Insight**: Overtime is a strong driver of attrition. Working overtime raises the attrition rate to over 33% even for employees who report high job satisfaction. This indicates that high job satisfaction alone is not enough to prevent burnout.
* **Business Action**: Establish guidelines for managing overtime hours. Monitor actual overtime patterns rather than relying solely on satisfaction surveys to assess team well-being.

## Tech Stack

| Tool | Purpose |
|:-----|:--------|
| Python / Pandas | Data cleaning, wrangling, EDA |
| PostgreSQL | Relational database |
| SQL | JOINs, CTEs, window functions |
| Matplotlib / Seaborn | Visualizations |
| Scikit-learn / XGBoost | ML models |
| imbalanced-learn (SMOTE) | Class imbalance |
