CREATE TABLE employee_demographics (
    "EmployeeNumber" INT PRIMARY KEY,
    "Age" INT,
    "Gender" VARCHAR(10),
    "MaritalStatus" VARCHAR(20),
    "Education" VARCHAR(30),
    "EducationField" VARCHAR(30)
);

CREATE TABLE job_details (
    "EmployeeNumber" INT PRIMARY KEY REFERENCES employee_demographics("EmployeeNumber"),
    "Department" VARCHAR(50),
    "JobRole" VARCHAR(50),
    "JobLevel" VARCHAR(30),
    "BusinessTravel" VARCHAR(30),
    "DistanceFromHome" INT,
    "OverTime" VARCHAR(10)
);

CREATE TABLE compensation (
    "EmployeeNumber" INT PRIMARY KEY REFERENCES employee_demographics("EmployeeNumber"),
    "MonthlyIncome" INT,
    "HourlyRate" INT,
    "DailyRate" INT,
    "MonthlyRate" INT,
    "PercentSalaryHike" INT,
    "StockOptionLevel" VARCHAR(20)
);

CREATE TABLE survey_responses (
    "EmployeeNumber" INT PRIMARY KEY REFERENCES employee_demographics("EmployeeNumber"),
    "EnvironmentSatisfaction" VARCHAR(20),
    "JobSatisfaction" VARCHAR(20),
    "RelationshipSatisfaction" VARCHAR(20),
    "WorkLifeBalance" VARCHAR(20),
    "JobInvolvement" VARCHAR(20)
);

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
