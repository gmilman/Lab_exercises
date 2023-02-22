Select publishers.pub_name, COUNT(titles.title_id) AS no_publications
From publishers
LEFT JOIN titles
ON publishers.pub_id = titles.pub_id
GROUP BY publishers.pub_name;
-- dont neccessarily need to specify the table in the select statement,
-- especially if there are no duplicates in col. name,  but it is more clear.

-- alternative - with renaming of tables with shorthand

Select p.pub_name, COUNT(t.title_id) AS no_publications
From publishers p 
LEFT JOIN titles t
ON p.pub_id = t.pub_id
GROUP BY p.pub_name;

Select p.pub_name, COUNT(t.title_id) AS no_publications
From publishers p 
Right JOIN titles t
ON p.pub_id = t.pub_id
GROUP BY p.pub_name;