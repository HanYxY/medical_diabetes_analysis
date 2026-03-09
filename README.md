# Diabetes Data Analysis Project

## Project Overview

This project analyzes diabetes risk factors using the Pima Indians Diabetes Dataset.  
The goal is to explore relationships between medical indicators and diabetes outcomes using SQL, Python, and Power BI.

The project includes:

- SQL for database creation and statistical analysis
- Python for data cleaning, exploratory data analysis, and machine learning
- Power BI for interactive data visualization
---
## Dataset

The dataset contains medical diagnostic measurements for female patients.

Main variables include:

- Pregnancies
- Glucose
- Blood Pressure
- Skin Thickness
- Insulin
- BMI
- Diabetes Pedigree Function
- Age
- Outcome (0 = No Diabetes, 1 = Diabetes)

Dataset source:  
Pima Indians Diabetes Dataset

---

## Project Structure
diabetes-data-analysis
│
├── data
│ └── diabetes.csv

├── sql
│ └── diabetes_analysis.sql

├── python
│ └── diabetes_analysis.py

├── powerbi
│ └── diabetes_dashboard.pbix

├── images
│ └── dashboard.png

└── README.md

---

## SQL Analysis

SQL was used to:

- Create the diabetes database
- Create the medical_diabetes table
- Perform exploratory data analysis
- Calculate diabetes distribution
- Analyze age and BMI risk groups
- Identify high-risk patients

Main SQL file:
SQL/diabetes_analysis.sql

---

## Python Analysis

Python was used for:

- Data cleaning
- Exploratory data analysis (EDA)
- Machine learning modeling
- Feature importance analysis

Main libraries used:

- pandas
- numpy
- matplotlib
- scikit-learn

Model used:

Random Forest Classifier

---

## Python Visualizations

### Feature Importance
![Feature Importance](images/feature_importance.png)

### Glucose Analysis
![Glucose Analysis](images/glucose_vs_diabetes.png)

### ROC Curve
![ROC Curve](images/ROC_curve.png)

---

## Power BI Dashboard

Power BI was used to build an interactive dashboard to visualize diabetes risk patterns.

Main dashboard components include:

- Diabetes outcome distribution
- Age vs diabetes rate
- BMI vs diabetes risk
- Glucose level analysis
- Key performance indicators

---

## Example Dashboard

![Dashboard](images/powerbi_dashboard.png)

---

## Key Insights

Key findings from the analysis include:

- Higher glucose levels strongly correlate with diabetes risk
- Obese patients show significantly higher diabetes rates
- Diabetes risk increases with age
- Glucose and BMI are the most important predictors in the model

---

## Tools Used

- MySQL
- Python
- Pandas
- Scikit-learn
- Matplotlib
- Power BI
- GitHub
