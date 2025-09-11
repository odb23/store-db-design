-- CREATE STORE DATABASE
create database omart_supplies;


--- CREATE TABLES AND RELATIONSHIPS
create table omart_supplies.store(
	store_id int not null auto_increment unique,
    store_address varchar(30) not null,
    
    constraint store_pk primary key (store_id)
);

create table omart_supplies.employee(
	employee_id int not null auto_increment ,
    employee_first_name varchar(25) not null,
    employee_last_name varchar(25) not null,
    employee_house_number int not null,
    employee_street varchar(20) not null,
    employee_city char(3) not null,
    is_manager boolean not null default false,
	employee_mobile_number char(11) not null,
    employee_email_address varchar(35),
    manager_id int,
    store_id int,
    
    constraint employee_pk primary key (employee_id), 
    constraint employee_fk1 foreign key (store_id) references omart_supplies.store(store_id) on  update restrict on delete restrict,
    constraint employee_fk2 foreign key (manager_id) references omart_supplies.employee(employee_id) on  update restrict on delete restrict
);

create table omart_supplies.customer(
	customer_id int not null auto_increment unique,
    customer_first_name varchar(25) not null,
    customer_last_name varchar(25) not null,
    customer_house_number int,
    customer_street varchar(30),
    customer_city char(3),
    customer_mobille_number char(11) not null,
    customer_email_address varchar(35),
    
    constraint customer_pk primary key (customer_id)
);

create table omart_supplies.payment_method (
	id int not null auto_increment unique,
    payment_type enum('cash', 'transfer', 'pos'),
    constraint payment_pk primary key (id)
);

create table omart_supplies.order_data(
	receipt_number int not null unique,
    order_date datetime not null,
    customer_id int not null,
    employee_id int not null,
    total_amount decimal(10,2) not null,
    payment_method int not null,
    
    constraint order_pk primary key (receipt_number),
    constraint order_fk1 foreign key (customer_id) references omart_supplies.customer(customer_id) on  update restrict on delete restrict,
    constraint order_fk2 foreign key (employee_id) references omart_supplies.employee(employee_id) on  update restrict on delete restrict,
    constraint order_fk4 foreign key (payment_method) references omart_supplies.payment_method(id) on  update cascade on delete restrict
);

create table omart_supplies.product_category(
	id int not null auto_increment unique,
    name varchar(20) not null,
    
    constraint category_pk primary key (id)
);

create table omart_supplies.product(
	product_id int not null auto_increment unique,
    product_name varchar(20) not null,
    product_category int,
    qunatity_threshold int not null,
    unit_price decimal(10,2) not null,
    
    constraint product_pk primary key(product_id),
    constraint product_fk foreign key (product_category) references omart_supplies.product_category(id) on  update cascade on delete restrict
);

create table omart_supplies.product_order_data (
	order_id int not null,
    product_id int not null,
    qunatity_ordered int not null,
    
    constraint pod_fk1 foreign key (order_id) references omart_supplies.order_data(receipt_number) on  update restrict on delete restrict,
    constraint pod_fk2 foreign key (product_id) references omart_supplies.product(product_id) on  update restrict on delete restrict
);

create table omart_supplies.price_history(
	product_id int not null,
    price decimal(10,2) not null,
    update_date datetime not null,
    
    constraint ph_fk foreign key (product_id) references omart_supplies.product(product_id) on  update restrict on delete restrict
);

create table omart_supplies.supplier (
	supplier_id int not null auto_increment unique,
    supplier_name varchar(30) not null,
    supplier_work_number char(11) not null,
    supplier_email_address varchar(35),
    
    constraint supplier_pk primary key(supplier_id)
);

create table omart_supplies.supply_data (
	invoice_number varchar(30) not null,
    supply_date datetime not null,
    store_id int not null,
    employee_id int not null,
    supplier_id int not null,
    
    constraint supply_pk primary key (invoice_number),
    constraint supply_fk foreign key (store_id) references omart_supplies.store(store_id) on  update restrict on delete restrict,
    constraint supply_fk2 foreign key (employee_id) references omart_supplies.employee(employee_id) on  update restrict on delete restrict,
    constraint supply_fk3 foreign key (supplier_id) references omart_supplies.supplier(supplier_id) on  update restrict on delete restrict
);

create table omart_supplies.product_supply_data (
	product_id int not null,
    supply_id varchar(30) not null,
    supplied_quantity int not null,
    
    constraint psd_fk foreign key (product_id) references omart_supplies.product(product_id) on  update restrict,
    constraint psd_k2 foreign key (supply_id) references omart_supplies.supply_data(invoice_number) on  update restrict on delete restrict
);

create table omart_supplies.weekly_product_stock_data (
	product_id int not null,
    store_id int not null,
    confirmed_by int not null,
    stock_date datetime not null,
    product_quantity int not null,
    
    constraint wpsd_fk foreign key (product_id) references omart_supplies.product(product_id)on  update restrict on delete restrict,
    constraint wpsd_fk2 foreign key (store_id) references omart_supplies.store(store_id) on  update restrict on delete restrict,
    constraint wpsd_fk3 foreign key (confirmed_by) references omart_supplies.employee(employee_id) on  update restrict on delete restrict
)
