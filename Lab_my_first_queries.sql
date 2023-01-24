create schema ironhack_examples; -- creates database --
use example_db; -- not sure what use does --
select * from applestore;

select track_name, rating_count_tot, user_rating, price, prime_genre from applestore
order by user_rating desc,  rating_count_tot desc
limit 10;

select track_name, rating_count_tot, user_rating, price, prime_genre from applestore
order by   rating_count_tot desc
limit 10;

select user_rating, avg(price) as average_price  from applestore
group by 1
order by user_rating desc ;






select prime_genre, rating_count_tot, user_rating, avg(price)  from applestore 
group by user_rating order by user_rating desc,  rating_count_tot desc limit 10
