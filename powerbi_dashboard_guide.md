# Power BI Dashboard Guide

## DAX Measures
Total Revenue = SUM(dataset[gross_revenue])
Total Profit = SUM(dataset[profit])
Profit Margin % = DIVIDE([Total Profit], [Total Revenue], 0) * 100
Total Orders = DISTINCTCOUNT(dataset[order_id])
Return Rate % = AVERAGE(dataset[returned]) * 100
Avg Delivery Days = AVERAGE(dataset[delivery_days])

## Slicers
- Region
- Category
- Sales Channel
- Customer Segment
- Order Date

## Visuals
- KPI cards
- Monthly revenue line chart
- Revenue by category
- Profit by region
- Return rate by category
- Revenue by payment method
- Low inventory table
