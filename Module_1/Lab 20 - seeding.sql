use car_company;
alter	table cars
add column model varchar(255);

insert into cars (VIN, manufacturer, model, year, colour)
	values ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');

insert into cars (VIN, manufacturer, model, year, colour)
	values ("ZM8G7BEUQZ97IH46V" , "Peugeot" , "Rifter" , "2019" , "Red");

insert into cars (VIN, manufacturer, model, year, colour)
	values ("RKXVNNIHLVVZOUB4M" , "Ford" , "Fusion" , "2018" , "White");
insert into cars (VIN, manufacturer, model, year, colour)
	values ("HKNDGS7CU31E9Z7JW" , "Toyota" , "RAV4" , "2018" , "Silver");
insert into cars (VIN, manufacturer, model, year, colour)
	values ("DAM41UDN3CHU2WVF6" , "Volvo" , "V60" , "2019" , "Gray");
insert into cars (VIN, manufacturer, model, year, colour)
	values ("DAM41UDN3CHU2WVF6" , "Volvo" , "V60 Cross Country" , "2019" , "Gray");
-- this last one did not enter as is duplicate VIN ID

insert into customers (customer_ID, Name, Phone, email, address, city, state, country, postal)
	values ("10001" , "Pablo Picasso" , "+34 636 17 63 82" , "-" , "Paseo de la Chopera, 14" , "Madrid" , "Madrid" , "Spain" , "28045");
insert into customers (customer_ID, Name, Phone, email, address, city, state, country, postal)
	values ("20001" , "Abraham Lincoln" , "+1 305 907 7086" , "-" , "120 SW 8th St" , "Miami" , "Florida" , "United States" , "33130");
insert into customers (customer_ID, Name, Phone, email, address, city, state, country, postal)
		values ("30001" , "Napoléon Bonaparte" , "+33 1 79 75 40 00" , "-" , "40 Rue du Colisée" , "Paris" , "Île-de-France" , "France" , "75008");
   
insert into salesperson (staff_ID, Name, store)
	values ( "0001" , "Petey Cruiser" , "Madrid");

insert into salesperson
 values("00002" , "Anna Sthesia" , "Barcelona");
 
 select * from salesperson;
 
 insert into salesperson
	values ("00003" , "Paul Molive" , "Berlin");
insert into salesperson
	values("00004" , "Gail Forcewind" , "Paris");
insert into salesperson
	values ("00005" , "Paige Turner" , "Mimia");
insert into salesperson
	values ("00006" , "Bob Frapples" , "Mexico City");
insert into salesperson
	values ("00007" , "Walter Melon" , "Amsterdam");
insert into salesperson
	values ("00008" , "Shonda Leer" , "São Paulo");
    
select * from invoices;
alter table invoices
	drop constraint customer;
use car_company;    
insert into invoices (invoice_number, date , car, customer, sales_person)
	values('852399038' , '2018-08-22', '0' , '1' , '3');
    
   /* ID | VIN | Manufacturer | Model | Year | Color |
| --- | --- | --- | --- | --- | --- |
| 0 | 3K096I98581DHSNUP | Volkswagen | Tiguan | 2019 | Blue |
| 1 | ZM8G7BEUQZ97IH46V | Peugeot | Rifter | 2019 | Red |
| 2 | RKXVNNIHLVVZOUB4M | Ford | Fusion | 2018 | White |
| 3 | HKNDGS7CU31E9Z7JW | Toyota | RAV4 | 2018 | Silver |
| 4 | DAM41UDN3CHU2WVF6 | Volvo | V60 | 2019 | Gray |
| 5 | DAM41UDN3CHU2WVF6 | Volvo | V60 Cross Country | 2019 | Gray |