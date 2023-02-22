create database if not exists recap;
use recap;

create table clients( id_client INT, name varchar(20), Primary Key (Id_client));
insert into clients
values('1', 'John Doe'), ('2', 'John Smith'), ('3', 'Tom Red');
select * from clients;

create table sales 
(po_id varchar(20), year YEAR, amount Float, department varchar(20), client_id INT, 
Primary Key (po_id, year),
foreign key
(client_id) references clients(id_client));

INSERT INTO sales
(po_id, year, amount, department, client_id)
VALUES ('02-Nov', 2020, 3000, 'Paris',1), ('02-Dec', 2021,
4000, 'Oslo',1), ('04-Dec', 2021, 2000, 'Oslo',3), ('05-Dec', 2021, 1000,
'Milan',3);
SELECT * FROM sales;

SELECT c.name, 
s.amount, s.year,
s.department
FROM clients c
LEFT JOIN sales s
ON
s.client_id=c.id_client;
