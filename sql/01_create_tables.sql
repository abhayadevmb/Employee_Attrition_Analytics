-- SQL Schema for Employee Attrition Database (PostgreSQL)

-- 1. Create Employee Demographics Table (Parent Table)
CREATE TABLE employee_demographics (
    "EmployeeNumber" INT PRIMARY KEY,
    "Age" INT,
    "Gender" VARCHAR(10),
    "MaritalStatus" VARCHAR(20),
    "Education" VARCHAR(30),
    "EducationField" VARCHAR(30)
);

-- 2. Create Job Details Table
CREATE TABLE job_details (
    "EmployeeNumber" INT PRIMARY KEY REFERENCES employee_demographics("EmployeeNumber"),
    "Department" VARCHAR(50),
    "JobRole" VARCHAR(50),
    "JobLevel" VARCHAR(30),
    "BusinessTravel" VARCHAR(30),
    "DistanceFromHome" INT,
    "OverTime" VARCHAR(10)
);

-- 3. Create Compensation Table
CREATE TABLE compensation (
    "EmployeeNumber" INT PRIMARY KEY REFERENCES employee_demographics("EmployeeNumber"),
    "MonthlyIncome" INT,
    "HourlyRate" INT,
    "DailyRate" INT,
    "MonthlyRate" INT,
    "PercentSalaryHike" INT,
    "StockOptionLevel" VARCHAR(20)
);

-- 4. Create Survey Responses Table
CREATE TABLE survey_responses (
    "EmployeeNumber" INT PRIMARY KEY REFERENCES employee_demographics("EmployeeNumber"),
    "EnvironmentSatisfaction" VARCHAR(20),
    "JobSatisfaction" VARCHAR(20),
    "RelationshipSatisfaction" VARCHAR(20),
    "WorkLifeBalance" VARCHAR(20),
    "JobInvolvement" VARCHAR(20)
);

-- 5. Create Career History Table
CREATE TABLE career_history (
    "EmployeeNumber" INT PRIMARY KEY REFERENCES employee_demographics("EmployeeNumber"),
    "Attrition" VARCHAR(10),
    "NumCompaniesWorked" INT,
    "TotalWorkingYears" INT,
    "TrainingTimesLastYear" INT,
    "PerformanceRating" VARCHAR(20),
    "YearsAtCompany" INT,
    "YearsInCurrentRole" INT,
    "YearsSinceLastPromotion" INT,
    "YearsWithCurrManager" INT
);
