#find the running total of rental payments for each customer in the payment table, ordered by payment date. 
# By selecting the customer_id, payment_date, and amount columns from the payment table, and 
# then applying the SUM function to the amount column within each customer_id partition, ordering by payment_date.

use sakila;
select customer_id, payment_date, amount, sum(amount) over(partition by customer_id order by payment_date) as running_total
from payment;

## find the rank and dense rank of each payment amount within each payment date 
##by selecting the payment_date and amount columns from the payment table, 
## and then applying the RANK and DENSE_RANK functions 
## to the amount column within each payment_date partition, ordering by amount in descending order.

select py_date, amount,
		rank() over(partition by py_date order by amount desc) as 'rank',
        dense_rank() over(partition by py_date order by amount desc) as 'dense_rank'
from
(select date(payment_date) as py_date, amount
from payment) date_format;

# alternative 1
select date(payment_date), amount,
		rank() over(partition by date(payment_date) order by amount desc) as 'rank',
        dense_rank() over(partition by date(payment_date) order by amount desc) as 'dense_rank'
from payment;

# alternative 2


##find the ranking of each film based on its rental rate, within its respective category. 
## Hint: you need to extract the information from the film,film_category and category tables after applying join on them.

select film_id, film.title, rental_rate, c.name,
		dense_rank() over(partition by c.name order by rental_rate desc)
from film
join film_category using(film_id)
join category c using(category_id);

# (OPTIONAL) update the previous query from above to retrieve only the top 5 films within each category
select *  from
(select film_id, film.title as title, rental_rate, c.name as category,
		dense_rank() over(partition by c.name order by rental_rate desc, film.title) as 'rank',
        row_number() over(partition by c.name order by rental_rate desc, film.title) as row_num
from film
join film_category using(film_id)
join category c using(category_id)) as sub_q
where row_num <=5;

## find the difference between the current and previous payment amount 
# and the difference between the current and next payment amount, for each customer in the payment table
# Hint: select the payment_id, customer_id, amount, and payment_date columns from the payment table, 
# and then applying the LAG and LEAD functions to the amount column, partitioning by customer_id and ordering by payment_date.

select payment_id, customer_id, amount,  payment_date,
		(amount - lag(amount) over(partition by customer_id order by payment_date)) as 'lag',
        (amount - lead(amount) over(partition by customer_id order by payment_date)) as 'lead'
from payment;