
-- challeng 1 subqueries the long way
-- sucha complicated way of doing things, initially i did this by creating a temporary table
select au_id, sum(total_advance) + sum(total_royalties) as profits
from(
select 
    title_id, 
    au_id, 
    sum(advance) as total_advance, 
    sum(sales_royalty) as total_royalties 

from 
    (select t.title_id, ta.au_ID, 
            t.advance * t.royalty/100 as advance, 
            t.price*t.ytd_sales*t.royalty/100*ta.royaltyper/100 as sales_royalty
        from titles t
        join titleauthor ta
        on t.title_id= ta.title_id
        group by t.title_id, ta.au_id) royalties
      group by title_id, au_id) aggregated_profits
      group by au_id
      order by profits desc;
      
-- challenge 2 - subqueries the best ways
create TEMPORARY TABLE if not exists royalties
select t.title_id, ta.au_ID, 
	t.advance * t.royalty/100 as advance, 
    t.price*t.ytd_sales*t.royalty/100*ta.royaltyper/100 as sales_royalty
from titles t
join titleauthor ta
on t.title_id= ta.title_id
;

with agg_profits as
(select title_id, au_id, sum(advance) as total_advance, sum(sales_royalty) as total_royalties from royalties
group by title_id, au_id)
select au_id, sum(total_advance) + sum(total_royalties) as profits
from agg_profits
group by 	au_id
order by profits desc;

-- challenge 3
-- create a permanent table named `most_profiting_authors` to hold the data about the most profiting authors. 
-- The table should have 2 columns:

create table most_profiting_authors

with agg_profits as
(select title_id, au_id, sum(advance) as total_advance, sum(sales_royalty) as total_royalties from royalties
group by title_id, au_id)
select au_id, sum(total_advance) + sum(total_royalties) as profits
from agg_profits
group by 	au_id
order by profits desc;

select m.au_id, au_fname, au_lname, profits 
from most_profiting_authors m
join authors a
on m.au_id=a.au_id;