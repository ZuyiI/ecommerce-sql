# ecommerce-sql

This repository documents the exploration of key factors that contribute to the likelihood of an e-commerce order being completed or canceled. The analysis uses a dataset representing Pakistan’s largest collection of retail e-commerce transactions, spanning from March 2016 to August 2018, and was gathered from various e-commerce sellers.

## Dataset

The core dataset for this analysis (originally an Excel file, sourced from Kaggle) contains approximately half a million transaction records. It includes detailed information such as:
* Item ID, Order Status (Completed, Canceled, Refund, etc.)
* Date of Order, SKU, Price, Quantity, Grand Total
* Category (Fashion, Mobiles, Electronics, Appliances, etc.)
* Payment Method (Credit Card, Easy-Paisa, Jazz-Cash, Cash-on-Delivery, etc.)
* Customer ID

## Business Questions Explored

* What factors contribute to the likelihood of an order being completed or canceled?
* How does the payment method affect the completion or cancellation of orders?
* Are there certain product categories that have higher cancellation rates compared to others? If yes, what might be the reasons?
* What is the average price of items per product category?
* Is there any relationship between the price of the item/product and the likelihood of the order being canceled?
* Does having discounts affect the cancellation of orders?

## Summary of Findings

* **Payment Method:** Cash-based payments (Cash at Doorstep, COD) generally showed higher completion rates, which could reflect customer preference for payment upon receipt during 2016-2018. Digital wallets and online banking methods had lower completion rates, suggesting less trust or adoption at the time.
* **Product Category & Price:** Categories with higher average item prices (like Entertainment, Mobiles & Tablets, Appliances, Computing) also showed higher cancellation rates. Suggesting increased buyer caution for expensive items.
* **Price Range:** While mid-price ranges (500-2000) showed higher cancellation rates, there wasn't a strictly linear relationship across all price points. Notably, items "Above 2000" had cancellation rates similar to "Below 500", possibly due to more committed buyers for higher-value essential items.
* **Discounts:** Orders placed without discounts formed a larger proportion of canceled orders (56% vs. 44%), which implies that discounts might increase customer commitment or take advantage of "fear of missing out."
