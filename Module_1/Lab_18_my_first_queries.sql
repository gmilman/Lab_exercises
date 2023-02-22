create schema ironhack_examples; -- creates database --
use example_db; -- not sure what use does --
select * from applestore; -- original table--

/**1. What are the different genres?**/
select distinct prime_genre from applestore
order by prime_genre; 
/* Book
Business
Education
Entertainment
Finance
Food & Drink
Games
Health & Fitness
Lifestyle
Medical
Music
Navigation
News
Photo & Video
Productivity
Reference
Shopping
Social Networking
Sports
Travel
Utilities
Weather*/

/**2. Which is the genre with the most apps rated?**

Games = 8717381*/

select prime_genre, sum(rating_count_tot) as rating_tot from applestore
group by prime_genre
order by rating_tot desc;

/**3. Which is the genre with most apps?**
Games	169*/ 
 select prime_genre, count(1) as num_of_apps from applestore
group by prime_genre
order by num_of_apps desc;

/**4. Which is the one with least?**
Medical	1*/
select prime_genre, count(1) as num_of_apps from applestore
group by prime_genre
order by num_of_apps asc;

/*Find the top 10 apps most rated.**/
select track_name, rating_count_tot from applestore
order by  rating_count_tot desc
limit 10;

/*Facebook	2974676
Pandora - Music & Radio	1126879
Pinterest	1061624
Bible	985920
Angry Birds	824451
Fruit Ninja Classic	698516
Solitaire	679055
PAC-MAN	508808
Calorie Counter & Diet Tracker by MyFitnessPal	507706
The Weather Channel: Forecast, Radar & Alerts	495626*/

/**6. Find the top 10 apps best rated by users.**
Plants vs. Zombies	426463	5
Domino's Pizza USA	258624	5
Plants vs. Zombies HD	163598	5
TurboScan Pro - document & receipt scanner: scan multiple pages and photos to PDF	28388	5
Sworkit - Custom Workouts for Exercise & Fitness	16819	5
Fieldrunners 2	14214	5
Headspace	12819	5
:) Sudoku +	11447	5
Dragon Island Blue	9119	5
Sudoku +	5397	5*/


select track_name, rating_count_tot, user_rating, price, prime_genre from applestore
order by user_rating desc,  rating_count_tot desc
limit 10; /* sort by user rating, and then number of ratings, gives those with 5 star rating 
and the most number of ratings. limit to 10. these are the criteria which define the best rated apps to me,
 since more than 10 are 5 star rated*/

/**7. Take a look at the data you retrieved in question 5. Give some insights.**
Extarcting other data gives better insight,e.g. price per app, ratings as well as no. of ratings, and genre*/

select track_name, rating_count_tot, user_rating, price, prime_genre from applestore
order by rating_count_tot desc;

/*The apps with the most rating do not necessarily have the best reviews, generally household names. mix , games, social, and then diverse other genres
 - mostly free apps */
 
 /**8. Take a look at the data you retrieved in question 6. Give some insights.**
as above, more data extracted to make any sort of interpretations*/
select track_name, rating_count_tot, user_rating, price, prime_genre from applestore
order by user_rating desc, rating_count_tot desc
limit 10;

/*- mostly paying apps, not generally very expensive though
-big proportion ar games, the health and fitness*/

/**9. Now compare the data from questions 5 and 6. What do you see?** paying apps are generally better rated...*/

/*10. How could you take the top 3 regarding both user ratings and number of votes?**
via weighting rating with number of votes*/


/**11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
- looking at specific genres x user rating x no of ratings--*/



select prime_genre,  price, avg(user_rating), avg(rating_count_tot), from applestore
group by 1, 
order by 1, 2 desc ;


