-- SEED DB TABLES
insert into omart_supplies.store (`store_id`, `store_address`)
values (1,"Ikeja, Lagos"),
		(2, "V.I, Lagos");
        
insert into `omart_supplies`.`employee`
(`employee_id`,`employee_first_name`,`employee_last_name`,`employee_house_number`,
`employee_street`, `employee_city`,`is_manager`,`employee_mobile_number`,`employee_email_address`,`manager_id`,
`store_id`)
VALUES (1,"Oluwadamilare","Odulaja",432,"Herbert Str","lag",1,"09998736437","dami@dami.com",null,1),
	(2,"Oluwadamilare","Adekogbe",123,"Sammy man Str.","lag",1,"38368892767","dami@kogbre.com",null,1),
    (3,"Elijah","Oluwatosin",75,"H.Ajoghe Str.","lag",0,"67452123567","elijah@tosin.com",1,1),
    (4,"Sammy","Joshua",546,"Ade Oworo","lag",0,"45543789083","sammy@geemail.co",1,2),
    (5,"Odey","Thomas",878,"Pope Onipanu","lag",0,"67393638276","tomOdey@hotmail.com",2,2),
    (6,"Musa","Abdullahi",23,"Community Rd.","lag",0,"74657897978",null,2,2);
    
insert into `omart_supplies`.`customer`
(`customer_id`,`customer_first_name`,`customer_last_name`,`customer_house_number`,`customer_street`,`customer_city`,`customer_mobille_number`,
`customer_email_address`)
VALUES (1,"FolaShade" ,"Folawiyo" , "324" ,"Adesina, Ifo", "ogn","34546780093" , null),
(2,"Alexis" ,"iwobi" , "12" ,"Billoniare ave", "lag","89379938939" , "alexisiwobi@ngnmail.com"),
(3,"Briani" ,"Chukwu" , "1" ,"Chukwu Cresent", "lag","63826772688" , "brichuwks@sasm.za");

insert into `omart_supplies`.`payment_method`
(`id`,
`payment_type`)
VALUES (1, "cash"), (2, "pos"), (3, "transfer");

insert into `omart_supplies`.`order_data`
(`receipt_number`,
`order_date`,
`customer_id`,
`employee_id`,
`total_amount`,
`payment_method`)
VALUES (1,"2023-09-23",2,1,354700.00,1),
(2,"2023-09-23",2,2,354700.00,1),
(3,"2023-09-23",1,3,45800.00,2),
(4,"2023-09-23",1,3,1090000.00,2),
(5,"2023-09-24",3,4,54700.00,2),
(6,"2023-09-25",2,5,3154700.00,1),
(7,"2023-12-15",2,5,5354700.00,1);



