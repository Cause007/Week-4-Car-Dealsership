create table "Store" (
	store_id int primary key,
	"Address" varchar(150),
	"Owner Info" varchar(250)
);

create table "Customer" (
	customer_id int primary key,
	"First Name" varchar(100),
	"Last Name" varchar(100),
	"Address" varchar(150),
	"Billing Info" varchar(150)
);

create table "Salesperson" (
	salesperson_id int primary key,
	"First Name" varchar(100),
	"Last Name" varchar(100),
	store_id int,
	foreign key(store_id) references "Store"(store_id)
);

create table "Mechanic" (
	mechanic_id int primary key,
	"First Name" varchar(100),
	"Last Name" varchar(100),
	store_id int,
	foreign key(store_id) references "Store"(store_id)
);

create table "Car" (
	car_serial int primary key,
	"Make" varchar(100),
	"Model" varchar(100),
	"Year" numeric(4,0),
	store_owned int,
	customer_owned int,
	foreign key(store_owned) references "Store"(store_id),
	foreign key(customer_owned) references "Customer"(customer_id)
);

create table "Parts" (
	part_id int primary key,
	"Name" varchar(100),
	"Description" varchar(300),
	"Inventory" int,
	store_id int,
	foreign key(store_id) references "Store"(store_id)
);

create table "Invoice" (
	invoice_id int primary key,
	"Salesperson" int,
	"Customer" int,
	car_serial int,
	"Purchase Date" timestamp,
	foreign key("Salesperson") references "Salesperson"(salesperson_id),
	foreign key("Customer") references "Customer"(customer_id),
	foreign key(car_serial) references "Car"(car_serial)
);

create table "Service Ticket" (
	service_id int primary key,
	"Salesperson" int,
	"Mechanic" int,
	"Customer" int,
	"Service Summary" varchar(500),
	"New Parts" int,
	"Service Date" timestamp,
	foreign key("Salesperson") references "Salesperson"(salesperson_id),
	foreign key("Mechanic") references "Mechanic"(mechanic_id),
	foreign key("Customer") references "Customer"(customer_id),
	foreign key("New Parts") references "Parts"(part_id)
);

create table "Service History" (
	car_serial int,
	service_id int,
	foreign key(car_serial) references "Car"(car_serial),
	foreign key(service_id) references "Service Ticket"(service_id)
);

alter table "Service Ticket"
drop column "Service Date";

alter table "Service Ticket"
add column "Service Date" date default current_date;
	
	

