use ppub;
-- CHALLENGE 1--
select t.title, p.pub_name, a.au_lname, a.au_fname
from publishers p
right join titles t
	on  p.pub_id=t.pub_id 
right join titleauthor ta
	on t.title_id= ta.title_id
 inner join authors a
	on ta.au_id = a.au_id;
    
 -- challenge 2 ---
 select * from titleauthor;
    
    select p.pub_name, a.au_fname, a.au_lname, count(ta.au_id) as num_pubs
		from publishers p
        right join titles t
			on p.pub_id = t.pub_id
		right join titleauthor ta
			on t.title_id = ta.title_id
		left join authors a
			on ta.au_id = a.au_id
		group by a.au_lname, a.au_fname, p.pub_name
        order by num_pubs desc;

-- challenge 3
select a.au_id, a.au_lname, a.au_fname, sum(s.qty) as total_sales
 from authors a
 left join titleauthor ta
	on a.au_id= ta.au_id
 left join sales s
	on ta.title_id = s.title_id
group by a.au_id, a.au_lname, a.au_fname
order by total_sales desc
limit 3;

-- challenge 4 ranking including no publications

select a.au_id, a.au_lname, a.au_fname, ifnull(sum(s.qty),0) as total_sales
 from authors a
 left join titleauthor ta
	on a.au_id= ta.au_id
 left join sales s
	on ta.title_id = s.title_id
group by a.au_id, a.au_lname, a.au_fname
order by total_sales desc;
