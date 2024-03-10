create table customer_ry(
    customer_id SERIAL primary key,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    phone_number VARCHAR (15),
    address VARCHAR (150),
    billing_info VARCHAR (150)
);
    
create table car_ry(
	car_id SERIAL primary key,
	make VARCHAR (100),
	model VARCHAR (100),
	color VARCHAR (100),
	year VARCHAR (4)
);
      
create table salesperson_ry(
	salesperson_id SERIAL primary key,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	phone_number VARCHAR (15)
);

create table mechanic_ry(
	mechanic_id SERIAL primary key,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	phone_number VARCHAR (15)
);

create table parts_ry(
	upc SERIAL primary key,
	description VARCHAR (150),
	amount numeric (3,2),
	price numeric (5,2)
);

create table dealership_ry(
	dealership_id SERIAL primary key,
	address VARCHAR (150),
	phone_number VARCHAR (15),
	car_id INTEGER not null,
	salesperson_id INTEGER not null,
	mechanic_id INTEGER not null,
    foreign key(car_id) references car_ry(car_id),
    foreign key(salesperson_id) references salesperson_ry(salesperson_id),
    foreign key(mechanic_id) references mechanic_ry(mechanic_id)
);

create table sales_invoice_ry(
	sales_invoice_id SERIAL primary key,
	date TIME,
	car_id INTEGER not null,
	customer_id INTEGER not null,
	salesperson_id INTEGER not null,
	foreign key(car_id) references car_ry(car_id),
	foreign key(customer_id) references customer_ry(customer_id),
	foreign key(salesperson_id) references salesperson_ry(salesperson_id)
);

create table service_ticket_ry(
	service_ticket_id SERIAL primary key,
	date TIME,
	comments VARCHAR (200),
	car_id INTEGER not null,
	customer_id INTEGER not null,
	mechanic_id INTEGER not null,
	upc INTEGER not null,
	foreign key(car_id) references car_ry(car_id),
	foreign key(customer_id) references customer_ry(customer_id),
	foreign key(mechanic_id) references mechanic_ry(mechanic_id),
	foreign key(upc) references parts_ry(upc)
);

alter table sales_invoice_ry
add price NUMERIC(8, 2);

