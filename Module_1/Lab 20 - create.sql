create database car_company;
use car_company;
create table cars
	(VIN varchar(255),
    manufacturer varchar(255),
    colour varchar(255),
    year varchar(4));
create unique index ID
	on cars (VIN);
    

create table customers
	(Customer_ID int,
    Name varchar(255),
    Phone varchar(255),
    Email varchar(255),
    Address varchar(255),
    City varchar(255),
    State varchar(255),
    Country varchar(255),
    Postal varchar(255));
create unique index ID
	on customers (customer_id);

create table salesperson
	(Staff_ID int,
    Name varchar(255),
    Store varchar(255));
create unique index ID
	on salesperson (Staff_ID);
create table invoices
	(Invoice_number int, date date, car varchar(255), customer int, sales_person int);

create unique index id
	on invoices (Invoice_number);
use car_company;

alter table invoices
	add primary key (Invoice_number),
    add foreign key (customer) references customers (customer_id);
alter table salesperson
	add primary key (staff_id);
alter table customers
	add primary key (customer_id);
alter table cars
	add primary key (VIN);