import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score
from sklearn.metrics import confusion_matrix
from sklearn.metrics import roc_curve,auc
sns.set_theme(style="whitegrid")

df = pd.read_csv("D:/data_example/Project_one/diabetes.csv")
print(df.head())

df.info()
df.describe()

#检查异常值
cols = ["Glucose","BloodPressure","SkinThickness","Insulin","BMI"]
for col in cols:
    print(col, (df[col] == 0).sum())

#将 0 转换为缺失值
cols = ["Glucose","BloodPressure","SkinThickness","Insulin","BMI"]
df[cols] = df[cols].replace(0, np.nan)
print(df.isnull().sum())

#缺失值处理
df.fillna(df.median(), inplace=True)
print(df.isnull().sum())

#糖尿病分布分析
sns.countplot(x="Outcome", data=df)
plt.title("Diabetes Distribution")
plt.show()

#年龄分布
plt.figure(figsize=(8,5))
sns.histplot(df["Age"], bins=20)
plt.title("Age Distribution")
plt.show()

#BMI 与糖尿病关系
plt.figure(figsize=(8,5))
sns.boxplot(x="Outcome", y="BMI", data=df)
plt.title("BMI vs Diabetes")
plt.show()

#血糖与糖尿病关系
plt.figure(figsize=(8,5))
sns.boxplot(x="Outcome", y="Glucose", data=df)
plt.title("Glucose vs Diabetes")
plt.show()

#相关性分析
plt.figure(figsize=(10,8))
corr = df.corr()
sns.heatmap(
    corr,
    annot=True,
    cmap="coolwarm"
)
plt.title("Correlation Heatmap")
plt.show()

#识别最重要风险因素
corr["Outcome"].sort_values(ascending=False)

df.to_csv("D:/data_example/Project_one/diabetes_clean.csv", index=False)

df = pd.read_csv("D:/data_example/Project_one/diabetes_clean.csv")
#数据准备
x = df.drop('Outcome',axis = 1)
y = df['Outcome']
x_train,x_test,y_train,y_test = train_test_split(
    x,y,test_size = 0.2,random_state = 42
)

#模型训练
model = LogisticRegression(max_iter = 1000)
model.fit(x_train,y_train)

#模型预测
y_pred = model.predict(x_test)

#模型评估
accuracy = accuracy_score(y_test,y_pred)
print('accuracy:',accuracy)

#混淆矩阵
cm = confusion_matrix(y_test,y_pred)
print(cm)

#ROC曲线
y_proba = model.predict_proba(x_test)[:,1]
fpr,tpr,_ = roc_curve(y_test,y_proba)
roc_auc = auc(fpr,tpr)
print(roc_auc)
plt.plot(fpr,tpr)
plt.title('ROC Curve')
plt.savefig("D:/data_example/Project_one/ROC_curve.png")
plt.show()

#特征重要性
importance = pd.Series(
    model.coef_[0],
    index=x.columns,
).sort_values(ascending=False)
print(importance)
importance.plot(kind='bar')
plt.title('Feature Importance')
plt.ylabel('Importance')
plt.xlabel('Feature')
plt.savefig("D:/data_example/Project_one/feature_importance.png")
plt.show()
