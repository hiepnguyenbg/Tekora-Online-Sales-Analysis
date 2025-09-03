# Tekora Online Sales Analysis


Table of Contents

- [Project Background](#project-background)
- [Data Structure and Initial Checks](#data-structure-and-initial-checks)
- [Executive Summary](#executive-summary)
- [Insights Deep-Dive](#insights-deep-dive)
    - [Sales Trends](#sales-trends)
    - [Product Performance](#product-performance)
    - [Regional Comparisons](#regional-comparisons)
    - [Loyalty Program Performance](#loyalty-program-performance)
- [Recommendations](#recommendations)
- [Assumptions and Caveats](#assumptions-and-caveats)




# Project Background
Tekora, established in 2018, is a global e-commerce company selling popular electronic products like Apple, Samsung, and ThinkPad via its website and mobile app. The company has significant amounts of data on its sales, marketing efforts, operational efficiency, product offerings, and loyalty program. As a data analyst at Tekora, I'm partnering with the Head of Operations to extract insights and deliver recommendations to improve performance across sales, product, and marketing teams. This project examines online sales data from January 2019 to December 2022 to uncover critical insights that will improve Tekora's commercial success. 

Insights and recommendations are provided on the following key areas:

- **Sales Trends Analysis:** Evaluation of historical sales patterns, focusing on North Star Metrics - Revenue, Order Volume, and Average Order Value (AOV).
- **Product Level Performance:** An analysis of Tekora's various product lines, understanding their impact on sales and returns.
- **Regional Comparisons:** An evaluation of sales and orders by region.
- **Loyalty Program Success:** An assessment of the loyalty program on sales.


SQL queries used to import data into MySQL can be found [here](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Dataset%20Import.sql). 

SQL queries used to inspect the dataset can be found [here](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Initial%20Data%20Checks.sql).  

SQL queries to export cleaned data ready for analysis in Tableau can be found [here](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Cleaning%20Data%20for%20Analysis.sql).  

An interactive Tableau dashboard used to report and explore online sales trends can be found [here](https://public.tableau.com/app/profile/hiepnguyenbg/viz/TekoraSalesAnalysis/TrendDashboard).

# Data Structure and Initial Checks

Tekora's database structure as seen below consists of four tables: `orders`, `customers`, `geo_lookup`, and `order_status`, with a total row count of nearly 80k records.

![Tekora ERD](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Tekora%20ERD.jpg)

Prior to beginning the analysis, a variety of checks were conducted for quality control and familiarization with the datasets. The SQL queries utilized to inspect and perform quality checks can be found [here](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Initial%20Data%20Checks.sql).

# Executive Summary

### Overview of Findings

After peaking in early 2020, Tekora's sales have continued to decline, with significant drops in 2022. Key performance indicators have all shown year-over-year decreases: revenue by 42%, order volume by 36%, and AOV by 9%, largely due to post-pandemic market normalization and competitive pressures. The company has also grown heavily reliant on a small number of key products. In addition, North America and EMEA regions contribute 81% of total sales. Tekora can benefit from optimizing product offerings, targeting best-performing regions, and enhancing the loyalty program to increase customer lifetime value and sustain revenue growth.


# Insights Deep Dive

### Sales Trends:

* **The Post-Pandemic Dip.** Tekora's sales peaked in May 2020 with 2,727 orders totaling $797K monthly revenue, a boom fueled by pandemic-induced changing consumer behavior. However, revenue has been on a steady decline year-over-year basis for 22 consecutive months since March 2021 to levels just above the 2019 baseline.
* **An Unusual Seasonal Pattern.** Unlike typical retail trends, Tekora's sales have consistently shown an unexpected seasonal pattern. Sales peak in March and October, while the crucial holiday months of November and December are periods of the lowest revenue. This warrants further investigation into the root cause.
  
* **A New Baseline of Concern.** Despite the downward trend, full-year 2022 remained above the pre-pandemic 2019 baseline in all three key performance indicators. This is primarily due to the relatively strong first half of the year, which recorded sales and order count well above the same period in 2019, up 59% and 60% respectively. However, the consistent year-over-year decline in the second half of 2022 still represents a significant business challenge.
  

![Sales Trends](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Trend%20Dashboard.png)


### Product Performance:

* **Heavy Reliance on a Few Key Products.** The company's sales are heavily concentrated, with 85% of all orders and 70% of total sales driven by just three products: Gaming Monitors, Apple AirPods, and Samsung Cable Packs. This indicates an over-reliance on a very narrow product portfolio.

* **Underperforming Products.** The company is failing to capture sales from certain products with market potential.  Despite the general success of the Apple brand, iPhones consistently underperform, accounting for less than 1% of total orders. Similarly, the lower-cost Bose SoundSport Headphones have also generated less than 1% of revenue, failing to gain traction as an alternative to the top-selling AirPods (on average, $40 cheaper).
  
* **High Volume, Low-Value Products.** The accessories category, largely driven by the Samsung Cable Pack, has grown its share of total orders to 32% in 2022. However, the Samsung Cable Pack contributes only 2% of total revenue, suggesting it is frequently used in promotions or priced too low to significantly impact the bottom line.

![Product Performance](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Product%20Dashboard.png)



### Regional Comparisons:

* **Over-Reliance on a Few Key Regions.** The business is heavily concentrated in North America and EMEA, which together contributed 81% of total sales with the U.S. alone accounting for 48%.  After a temporary fall in 2021, North America increased its revenue share to 55% in 2022, reinforcing its position as the company's most important market.
 
* **Regional AOV Disparities.** A deeper look into Average Order Value (AOV) reveals significant regional disparities. The APAC region has experienced the highest AOV since 2020, remaining at $237 in 2022, which is 38% higher than the lowest-performing region, Latin America. This highlights APAC as a key market for high-value orders.
  


![Regional Comparisons](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Region%20Dashboard.png)


### Loyalty Program Performance

* **Growing Contribution to Company Revenue.** The loyalty program has become a key revenue driver, with the percentage of sales from members increasing from just 8% in 2019 to 57% in 2022. The program's monthly contribution to revenue peaked at 61% in March 2022. However, a key area of concern has emerged in new member acquisition, which peaked in 2021 at 13,407 new accounts before falling by nearly 50% in 2022.
  
* **Higher Value and Engagement.** In 2022, loyalty members consistently outperformed non-members across all key metrics. They generated $500K more in sales, placed 800 more orders, and spent $39 more per order, demonstrating their higher value and stronger engagement with the brand.
  

![Loyalty Program](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Loyalty%20Dashboard.png)




# Recommendations:

Based on the uncovered insights, the following recommendations have been provided: 

**Optimizing Product & Category Offerings**

* **Strategic Product Portfolio Management.** Given the over-reliance on a few key products, expand the accessory category with new product lines, such as Apple charging cables, to provide upsell opportunities and broaden the revenue base.
  
* **Capitalize on Product Ecosystems.** Introduce higher-cost Samsung products in categories like laptops and cellphones to capitalize on the growing share of Samsung accessory sales.
  
* **Re-evaluate Underperforming Products.** Address consistently underperforming products by enhancing marketing for iPhones to previous Apple product buyers and evaluating the viability of Bose SoundSport Headphones by exploring bundles or promotional sales to clear inventory before a potential discontinuation.

**Driving Customer & Regional Growth**

* **Focus on High-Performing Regions.** Continue allocating resources to North America and EMEA with regionalized marketing strategies. In addition, launch a targeted campaign to drive loyalty program sign-ups specifically in the APAC region to capitalize on the high average order value of these customers.

* **Enhance the Loyalty Program.** Push forward a data-driven tiered rewards program to convert non-members into loyal members.
  * Offer a one-time sign-up discount to increase new member acquisition.
  * Use targeted ads to previous customers to increase the marketing of membership benefits and savings.
  * Use referral bonuses to turn your best customers into powerful advocates, driving long-term, sustainable growth.



# Assumptions and Caveats:

* **Imperfect Data Schema Normalization.** A separate `products` table should exist to prevent duplicates in the `orders` table. Moreover, since each order can have at most one status, the `order_status` table may be unnecessary. It also contains a redundant `purchase_ts` column.

* **Refund Records.** No refunds were recorded in 2022, which represents an anomaly that requires further investigation.


