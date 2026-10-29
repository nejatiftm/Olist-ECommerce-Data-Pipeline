# Olist E-Commerce Data Warehouse

پروژه‌ی مدل‌سازی و تحلیل داده‌های فروشگاه Olist با SQL Server.

## دیتاست
Brazilian E-Commerce Public Dataset by Olist از Kaggle – [لینک]

## ابزارها
SQL Server، T-SQL، [SSMS یا هر ابزار دیگری که استفاده کردی]

## ساختار پروژه
Olist-ECommerce-Data-Pipeline/
├── 1_Staging/            تعریف جداول خام و ایمپورت داده‌ها
├── 2_Core_Modeling/      ساخت Star Schema (جداول Dimension و Fact)
└── 3_Analytics_Queries/  کوئری‌های تحلیلی SQL

## مدل داده
- Dimensions: `dim_customers`، `dim_sellers`، `dim_products`
- Facts: `fact_orders`، `fact_order_items`، `fact_order_payments`، `fact_order_reviews`

## کوئری‌های تحلیلی (`ecommerce_business_insights.sql`)
۱. روند درآمد ماهانه
۲. ۱۰ دسته‌بندی پرفروش
۳. درآمد به تفکیک استان
۴. روش‌های پرداخت
۵. میانگین امتیاز محصولات به تفکیک دسته‌بندی

## نحوه‌ی اجرا
۱. دیتاست را دانلود کن.
۲. فایل‌های `1_Staging` را اجرا کن. [روش ایمپورت]
۳. فایل‌های `2_Core_Modeling` را به ترتیب `01` و `02` اجرا کن.
۴. کوئری‌های `3_Analytics_Queries` را اجرا کن.
