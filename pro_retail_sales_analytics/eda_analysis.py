import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("dataset.csv")
df["order_date"] = pd.to_datetime(df["order_date"])
df["month"] = df["order_date"].dt.to_period("M").astype(str)

print("Shape:", df.shape)
print("Revenue:", round(df["gross_revenue"].sum(), 2))
print("Profit:", round(df["profit"].sum(), 2))
print("Return Rate %:", round(df["returned"].mean() * 100, 2))

monthly_revenue = df.groupby("month")["gross_revenue"].sum().sort_index()
plt.figure(figsize=(10,5))
monthly_revenue.plot()
plt.title("Monthly Revenue Trend")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig("images/monthly_revenue_trend.png")
plt.close()

category_revenue = df.groupby("category")["gross_revenue"].sum().sort_values(ascending=False)
plt.figure(figsize=(8,5))
category_revenue.plot(kind="bar")
plt.title("Revenue by Category")
plt.xlabel("Category")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig("images/revenue_by_category.png")
plt.close()

print("Charts saved in images folder.")
