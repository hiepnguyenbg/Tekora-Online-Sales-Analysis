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

After peaking in early 2020, Tekora's sales have continued to decline, with significant drops in 2022. Key performance indicators have all shown year-over-year decreases: revenue by 42%, order volume by 36%, and AOV by 9%, largely due to post-pandemic market normalization and competitive pressures. Tekora can benefit from optimizing product offerings, targeting best-performing regions, and enhancing the loyalty program to increase customer lifetime value and sustain revenue growth.


# Insights Deep Dive

### Sales Trends:

* The company's sales peaked in May 2020 with 2,727 orders totaling $797K monthly revenue. This corresponds with the boom in economy-wide spending due to pandemic-induced changing consumer behavior.

* Tekora exhibits a seasonal pattern, with peak sales in March and October and the lowest sales in November and December, despite the holiday season.
  
* Beginning in March 2021, revenue declined on a year-over-year basis for 22 consecutive months. In the second half of 2022, revenue fell by nearly 50% year-over-year, approaching pre-pandemic figures.
  
* Despite the downward trend, full-year 2022 remained above the pre-pandemic 2019 baseline in all three key performance indicators. This is primarily due to the relatively strong first half of the year, which recorded sales and order count well above the same period in 2019, up 59% and 60% respectively.
  

![Sales Trends](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Trend%20Dashboard.png)


### Product Performance:

* 85% of the company's orders are from just three products, Gaming Monitor, Apple AirPods Headphones, and Samsung Charging Cable Pack. These three products accounted for $2.6M in sales in 2022, 70% of the company's total.
  
* Laptop sales soared in 2020, with MacBook orders increasing by 430% and ThinkPad by 220%, perhaps due to the switch to online learning at the beginning of the pandemic. 

* In the headphones category, the Bose SoundSport Headphones have underperformed, contributing to less than 1% of total revenues and orders despite being, on average, $40 cheaper than the well-performing AirPods.
  
* The accessory category (Samsung products) continues to grow as a share of orders, at 32% in 2022, up from 21% in 2020. Samsung Cable Pack represents 20% of orders but only 2% of revenue, likely due to its low price or use in promotions.
  
* The company is heavily reliant on the continued popularity of Apple products, with the brand accounting for 48% of total sales in 2022. Apple's iPhone has yet to make an impact though, registering less than 1% of orders in 2022.

![Product Performance](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Product%20Dashboard.png)



### Regional Comparisons:

* North America and EMEA contributed 81% of sales, with the U.S. alone accounting for 48%. After witnessing the largest fall in 2021, North America grew in importance in 2022, increasing revenue share to 55% and order share to 54% among known regions.
  
* APAC has exprienced the highest AOV since 2020. Sales and average order value (AOV) fell across all regions in 2022, but APAC, along with North America, remained the largest AOV at $237, 38% above Latin America, the lowest performer.
  


![Regional Comparisons](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Region%20Dashboard.png)


### Loyalty Program Performance

* The loyalty program has grown in popularity since its implementation in 2018. Members as a share of revenue peaked in March 2022 at 61%. On an annual basis, members have increased to 57% of revenue in 2022, up from 8% in 2019.
  
* In 2022, loyalty members led in key metrics, generating $500K more in sales, spending $39 more ($248 to $209) per order, and placing 800 more orders than non-loyalty members.
  

![Loyalty Program](https://github.com/hiepnguyenbg/Tekora-Online-Sales-Analysis/blob/main/assets/Loyalty%20Dashboard.png)




# Recommendations:

Based on the uncovered insights, the following recommendations have been provided: 

* With 85% of orders and 70% of revenue coming from just three products, signaling over-reliance. **Expanding the accessory category with new product lines, particularly Apple charging cables, would provide upsell opportunities.**
  
* Despite the general sales success of Apple products, iPhone sales have been disappointingly low (1% of revenue in 2022). **Enhancing marketing efforts to previous Apple product buyers could boost sales.**
  
* Look to capitalize on the growing share of Samsung accessories (32% of order count in 2022) by **introducing higher-cost Samsung products in already carried product categories such as laptops and cellphones.**
  
* **Re-evaluate Bose SoundSport Headphones.** As the product has never made up more than 1% of annual revenue, evaluate the product’s viability and consider bundling or promotional sales to non-Apple loyalty members to clear inventory before potential discontinuation.

* **Focus on high-performing regions.** Continue allocating resources to North America and EMEA with regionalized marketing and product availability strategies tailored to local preferences.
  
* **Continue and push forward the loyalty program.** Focus on a data-driven tiered rewards program to convert single-purchase customers into loyal members. Implement personalized campaigns that incentivize repeat purchases and use referral bonuses to turn your best customers into powerful advocates, driving long-term, sustainable growth.


# Assumptions and Caveats:

* **Imperfect data schema normalization.** A separate `products` table should exist to prevent duplicates in the `orders` table. Moreover, since each order can have at most one status, the `order_status` table may be unnecessary. It also contains a redundant `purchase_ts` column.

* **Refund Records.** No refunds were recorded in 2022, which represents an anomaly that requires further investigation.


