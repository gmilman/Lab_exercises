/*#### 1. From the `order_items` table, find the price of the highest priced order and lowest price order.*/
-- highest price --
select order_id, price from order_items
order by price desc
limit 1;

select	max(price) from order_items; -- also gives answer

-- ans 6735

-- lowest price --
select order_id, price from order_items
order by price
limit 1;
-- answer = 0.85 --



#### 2. From the `order_items` table, what is range of the shipping_limit_date of the orders?

select DATEDIFF(month, min(shipping_limit_date), max(shipping_limit_date))
from order_items;

select max(shipping_limit_date) from order_items;

#### 3. From the `customers` table, find the states with the greatest number of customers.
-- sp, RJ MG, RS, top 4 states --
select customer_state, count(*) from customers
group by customer_state
order by count(*) desc;


#### 4. From the `customers` table, within the state with the greatest number of customers, find the cities with the greatest number of customers.
-- Sao paulo then campinas then guarulhos
select customer_city, count(*) from customers
where customer_state = "SP"
group by customer_city
order by count(*) desc;


#### 5. From the `closed_deals` table, how many distinct business segments are there (not including null)?
select count(distinct(business_segment)) from closed_deals;
-- 33 --




#### 6. From the `closed_deals` table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
-- construction-tools-house- garden, phone-mobile, home decor

select  business_segment, sum(declared_monthly_revenue) as total_rev from closed_deals
group by business_segment
order by total_rev desc
limit 3;

#### 7. From the `order_reviews` table, find the total number of distinct review score values.
-- answer = 5 --
select count(distinct(review_score)) from order_reviews;


#### 8. In the `order_reviews` table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
-- excellent	57420 (for some reason can't get query to return the review score...

select * from order_reviews;
alter table order_reviews
add column review_category varchar(255);

update order_reviews set review_category =
	case 
		when review_score = 1
			then "terrible"
		when review_score = 2
			then "bad"
		when review_score = 3
			then  "average"
		when review_score = 4
			then "good"
		when review_score = 5
			then "excellent"
		end ;
select	review_category, count(*) from order_reviews
group by review_category
order by 2 desc;

/*#### 9. From the `order_reviews` table, find the review value occurring most frequently and how many times it occurs. */
-- review_score  5, occuring 	57420-- not sure quite what this question is getting at
select review_score, count(*) from order_reviews
group by review_score
order by 2 desc;
