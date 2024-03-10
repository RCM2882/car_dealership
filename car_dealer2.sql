insert into customer_ry(
	customer_id,
	first_name,
	last_name,
	phone_number,
	address,
	billing_info
)values(
	'1',
	'Joe',
	'Smith',
	'555-123-4567',
	'123 Bumpy Road',
	'2112-2442-3223-3553 123 12/24'
);

insert into car_ry(
	car_id,
	make,
	model,
	color,
	year
)values(
	'100',
	'ford',
	'f-150',
	'silver',
	'2024'
);


insert into mechanic_ry(
	mechanic_id,
	first_name,
	last_name,
	phone_number
)values(
	'2',
	'Al',
	'Doe',
	'123-555-5555'
);

insert into salesperson_ry(
	salesperson_id,
	first_name,
	last_name,
	phone_number
)values(
	'3',
	'Gil',
	'Slick',
	'321-765-4321'
);

insert into sales_invoice_ry( 
	sales_invoice_id,
	date,
	price,
	car_id,
	customer_id,
	salesperson_id
)values(
	'21',
	'12:30:00',
	'50000.00',
	'100',
	'1',
	'3'
);	

create or replace procedure rebate(
	customer_id INTEGER,
	rebateAmount DECIMAL
)
language plpgsql
as $$
begin
	update price
	set amount = amount - rebateAmount
	where customer_id = customer;
	commit;
end;
$$

insert into customer_ry(
	customer_id,
	first_name,
	last_name,
	phone_number,
	address,
	billing_info
)values(
	'2',
	'Jimmy',
	'Johnson',
	'555-716-8219',
	'821 Treenut street',
	'4444-4444-4444-4444 123 06/26'
);

insert into car_ry(
	car_id,
	make,
	model,
	color,
	year
)values(
	'101',
	'Tesla',
	'Model Z',
	'White',
	'2024'
);

insert into customer_ry(
	customer_id,
	first_name,
	last_name,
	phone_number,
	address,
	billing_info
)values(
	'3',
	'Ava',
	'Brown',
	'334-729-8472',
	'246 Albion street',
	'5555-5555-6666-6666 456 03/32'
); 

insert into car_ry(
	car_id,
	make,
	model,
	color,
	year
)values(
	'102',
	'Toyota',
	'Accord',
	'Red',
	'1972'
);

insert into sales_invoice_ry(
	sales_invoice_id,
	date,
	price,
	car_id,
	customer_id,
	salesperson_id
)values(
	'2',
	'02:45:00',
	'75000.00',
	'101',
	'2',
	'3'
);

insert into sales_invoice_ry(
	sales_invoice_id,
	date,
	price,
	car_id,
	customer_id,
	salesperson_id
)values(
	'3',
	'05:22:37',
	'2000.00',
	'102',
	'3',
	'3'
);

create or replace function new_car_ry(
	_car_id INTEGER,
	_make VARCHAR (100),
	_model VARCHAR (100),
	_color VARCHAR (100),
	_year VARCHAR (4)
)
returns void
as $MAIN$
begin 
	insert into car_ry(car_id, make, model, color, year)
	values (_car_id, _make, _model, _color, _year);
end;
$MAIN$
language plpgsql;

select new_car_ry(4, 'Jeep', 'Wrangler', 'Blue', '2020');

select * from car_ry