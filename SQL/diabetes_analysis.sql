-- 创建数据库
CREATE 	DATABASE project_one_diabetes;

-- 使用数据库
USE project_one_diabetes;

-- 创建表
CREATE TABLE medical_diabetes (
                                  patient_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '患者唯一标识',
                                  Pregnancies INT COMMENT '怀孕次数',
                                  Glucose INT COMMENT '空腹血糖值(mg/dL)，参考范围70-110',
                                  BloodPressure INT COMMENT '舒张压(mm Hg)，参考范围60-90',
                                  SkinThickness INT COMMENT '三头肌皮褶厚度(mm)',
                                  Insulin INT COMMENT '2小时血清胰岛素(mu U/ml)',
                                  BMI FLOAT COMMENT '身体质量指数，参考范围18.5-24',
                                  DiabetesPedigreeFunction FLOAT COMMENT '糖尿病家族史风险系数',
                                  Age INT COMMENT '年龄(岁)',
                                  Outcome INT COMMENT '是否患糖尿病：0=否，1=是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='糖尿病临床数据集';

-- 导入CSV文件

-- 进行探索性数据分析
-- 理解数据结构
DESCRIBE medical_diabetes;

-- 查看数据量
SELECT COUNT(*) FROM medical_diabetes;

-- 查看前十行
SELECT *
FROM medical_diabetes
LIMIT 10;

-- 查看基本统计指标
SELECT
    AVG(Glucose) AS avg_glucose,
    AVG(BMI) AS avg_bmi,
    AVG(Age) AS avg_age,
    AVG(BloodPressure) AS avg_bp
FROM medical_diabetes;

-- 检查异常值
SELECT COUNT(*)
FROM medical_diabetes
WHERE Glucose = 0;

SELECT COUNT(*)
FROM medical_diabetes
WHERE BMI = 0;

SELECT COUNT(*)
FROM medical_diabetes
WHERE BloodPressure = 0;

-- 糖尿病比例分析
SELECT
    Outcome,
    COUNT(*) AS patient_count
FROM medical_diabetes
GROUP BY Outcome;

-- 计算百分比
SELECT
    Outcome,
    COUNT(*) AS patient_count,
    ROUND(
            COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2
    ) AS percentage
FROM medical_diabetes
GROUP BY Outcome;

-- 年龄与糖尿病关系
SELECT
    FLOOR(Age/10)*10 AS age_group,
    COUNT(*) AS total_patients,
    AVG(Outcome) AS diabetes_rate
FROM medical_diabetes
GROUP BY age_group
ORDER BY age_group;

-- BMI 与糖尿病关系
SELECT
    CASE
        WHEN BMI < 18.5 THEN 'Underweight'
        WHEN BMI < 25 THEN 'Normal'
        WHEN BMI < 30 THEN 'Overweight'
        ELSE 'Obese'
        END AS bmi_category,
    COUNT(*) AS patient_count,
    AVG(Outcome) AS diabetes_rate
FROM medical_diabetes
GROUP BY bmi_category
ORDER BY diabetes_rate DESC;

-- 血糖与糖尿病关系
SELECT
    CASE
        WHEN Glucose < 100 THEN 'Normal'
        WHEN Glucose < 125 THEN 'Prediabetes'
        ELSE 'Diabetes Level'
        END AS glucose_category,
    COUNT(*) AS patient_count,
    AVG(outcome) AS diabetes_rate
FROM medical_diabetes
GROUP BY glucose_category;

-- 高风险人群识别
SELECT *
FROM medical_diabetes
WHERE Glucose > 140
  AND BMI > 30
  AND Age > 45;
