-- initially I didnt use the sales qty but ytd_sales as it seemed more logical for calculating author profitablility.

-- INSTRUCTIONS
-- step 1 1. Calculate the royalty of each sale for each author and the advance for each author and publication.
-- In table `sales`, a title can appear several times. The royalties need to be calculated **for each sale**.
-- Despite a title can have multiple `sales` records, the advance must be calculated **only once for each title.
	-- advance = titles.advance * titleauthor.royaltyper / 100
use ppub;
-- start with advance table

-- EXERCISE WITH SUBQUERIES
    
select ADVANCE.au_id, concat( authors.au_fname, ' ' , authors.au_lname) as name, sum(advance + sales_royalty) as profit
from 
	(select t.title_id, au_id, t.advance * ta.royaltyper/100 as advance
		from titles t
		join titleauthor ta
		on t.title_id = ta.title_id) ADVANCE
join
	(select t.title_id, ta.au_id, t.price*sales_qty.total_sales*t.royalty/100*ta.royaltyper/100 as sales_royalty
		from titleauthor ta
		join titles t
		on t.title_id=ta.title_id
	join
		(select title_id, sum(qty) as total_sales from sales
		group by title_id) 	sales_qty 
		on t.title_id=sales_qty.title_id) royalties_per_author
	on advance.au_id= royalties_per_author.au_id and advance.title_id= royalties_per_author.title_id
join authors 
on authors.au_id = royalties_per_author.au_id
group by advance.au_id, name
order by profit desc;



create temporary table  advance
;

select * from advance ; -- viewing data


-- royalties query
-- titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100

create temporary table sales_qty -- summing total sales for each title
;


create temporary table royalties_per_author


;

select* from titles;

select * from royalties_per_authour;

-- step 2 Aggregate the total royalties for each title and author

create temporary table aggr_royalties



-- sstep 3 - answer correspons with Andy's
create table most_profitable_author
select au_id, name, profit
from 
	(select aggr_royalties.au_id, name, sum(advance + sales_royalty) as profit
    from aggr_royalties
    group by au_id, name
    order by profit desc) b; 

-- EXERCISE WITH TEMPORARY TABLES

create temporary table  advance
select t.title_id, au_id, t.advance * ta.royaltyper/100 as advance
from titles t
join titleauthor ta
on t.title_id = ta.title_id;

select * from advance ; -- viewing data


-- royalties query
-- titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100

create temporary table sales_qty -- summing total sales for each title
select title_id, sum(qty) as total_sales from sales
group by title_id;


create temporary table royalties_per_author
select t.title_id, ta.au_id, t.price*s.total_sales*t.royalty/100*ta.royaltyper/100 as sales_royalty
from titleauthor ta
join titles t
on t.title_id=ta.title_id
join	sales_qty s
on t.title_id=s.title_id

;

select* from titles;

select * from royalties_per_authour;

-- step 2 Aggregate the total royalties for each title and author

create temporary table aggr_royalties
select a.au_id, concat( au.au_fname, ' ' , au.au_lname) as name, a.title_id, advance, sales_royalty 
from advance a
join royalties_per_author r
on a.au_id= r.au_id and a.title_id= r.title_id
join authors au
on au.au_id = r.au_id;


-- sstep 3 - answer correspons with Andy's
create table most_profitable_author
select au_id, name, profit
from 
	(select aggr_royalties.au_id, name, sum(advance + sales_royalty) as profit
    from aggr_royalties
    -- join authors
    -- on aggr_royalties.au_id = authors.au_id
    group by au_id, name
    order by profit desc) b; 
    
    -- could check by taking one record and doing calculation for that one record..
    
