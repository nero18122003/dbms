use E_commerce;
create table supplier (
  SUPP_ID int primary key auto_increment,
  SUPP_NAME varchar(50) not null,
  SUPP_CITY varchar(50)not null,
  SUPP_PHONE varchar(50)not null
);
select * from supplier;

create table customer (
  CUS_ID int primary key auto_increment,
  CUS_NAME varchar(20) not null,
  CUS_PHONE varchar(10)not null,
  CUS_CITY varchar(30)not null,
  CUS_GENDER char
);
select * from customer;

create table category (
 CAT_ID int primary key auto_increment,
 CAT_NAME varchar(20) not null
);
select * from category;

create table product (
 PRO_ID int primary key auto_increment,
 PRO_NAME varchar(20) not null default 'Dummy',
 PRO_DESC varchar(60),
 CAT_ID int,
 foreign key(CAT_ID)references category(CAT_ID)
);
select * from product;

create table supplier_pricing (
 PRICING_ID int primary key auto_increment,
PRO_ID int,
 SUPP_ID int,
 foreign key(PRO_ID)references product(PRO_ID),
 foreign key(SUPP_ID)references supplier(SUPP_ID),
 SUPP_PRICE int default 0
);
select * from supplier_pricing;

create table `order` (
 ORD_ID int primary key auto_increment,
 ORD_AMOUNT int not null,
 ORD_DATE date not null,
 CUS_ID int,
 PRICING_ID int,
 foreign key(CUS_ID)references customer(CUS_ID),
 foreign key(PRICING_ID)references supplier_pricing(PRICING_ID)
);
select * from `order`;

create table rating(
 ORD_ID int,
 RAT_ID int primary key auto_increment,
 foreign key(ORD_ID)references orders(ORD_ID),
 RAT_RATSTARS int not null
 );
 select * from rating;
 
 
 insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values(1,'Rajesh Retails','Delhi',1234567890);
 insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values(2,'Appario Ltd.','Mumbai',2589631470);
 insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values(3,'Knome products','Banglore',9785462315);
 insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values(4,'Bansal Retails','Kochi',8975463285);
 insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE)values(5,'Mittal Ltd.','Lucknow',7898456532);
 
 insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values('AAKASH',9999999999,'DELHI','M');
 insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values('AMAN',9785463215,'NOIDA','M');
 insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values('NEHA',9999999999,'MUMBAI','F');
 insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values('MEGHA',9994562399,'KOLKATA','F');
 insert into customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER)values('PULKIT',7895999999,'LUCKNOW','M');
 
 insert into category(CAT_NAME)values('BOOKS');
 insert into category(CAT_NAME)values('GAMES');
 insert into category(CAT_NAME)values('GROCERIES');
 insert into category(CAT_NAME)values('ELECTRONICS');
 insert into category(CAT_NAME)values('CLOTHES');
 
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('GTA V','Windows 7 and above with i5 processor and 8GB RAM',(select CAT_ID from category where CAT_NAME='GAMES'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('TSHIRT','SIZE-L with Black, Blue and White variations',(select CAT_ID from category where CAT_NAME='CLOTHES'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',(select CAT_ID from category where CAT_NAME='ELECTRONICS'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('OATS','Highly Nutritious from Nestle',(select CAT_ID from category where CAT_NAME='GROCERIES'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('HARRY POTTER','Best Collection of all time by J.K Rowling',(select CAT_ID from category where CAT_NAME='BOOKS'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('MILK','1L Toned MIlk',(select CAT_ID from category where CAT_NAME='GROCERIES'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('Boat Earphones','1.5Meter long Dolby Atmos',(select CAT_ID from category where CAT_NAME='ELECTRONICS'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('Jeans','Stretchable Denim Jeans with various sizes and color',(select CAT_ID from category where CAT_NAME='CLOTHES'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('Project IGI','compatible with windows 7 and above',(select CAT_ID from category where CAT_NAME='GAMES'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('Hoodie','Black GUCCI for 13 yrs and above',(select CAT_ID from category where CAT_NAME='CLOTHES'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('Rich Dad Poor Dad','Written by RObert Kiyosaki',(select CAT_ID from category where CAT_NAME='BOOKS'));
 insert into product(PRO_NAME,PRO_DESC,CAT_ID)values('Train Your Brain','By Shireen Stephen',(select CAT_ID from category where CAT_NAME='BOOKS'));
 
 
 insert into supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE)
 values((select PRO_ID from product where PRO_NAME='GTA V'),(select SUPP_ID from supplier where SUPP_PHONE=2589631470),1500),
 ((select PRO_ID from product where PRO_NAME='ROG LAPTOP'),(select SUPP_ID from supplier where SUPP_PHONE=7898456532),30000),
 ((select PRO_ID from product where PRO_NAME='HARRY POTTER'),(select SUPP_ID from supplier where SUPP_PHONE=1234567890),3000),
 ((select PRO_ID from product where PRO_NAME='TSHIRT'),(select SUPP_ID from supplier where SUPP_PHONE=9785462315),2500),
 ((select PRO_ID from product where PRO_NAME='OATS'),(select SUPP_ID from supplier where SUPP_PHONE=1234567890),1000),
 ((select PRO_ID from product where PRO_NAME='Train Your Brain'),(select SUPP_ID from supplier where SUPP_PHONE=2589631470),780),
 ((select PRO_ID from product where PRO_NAME='Train Your Brain'),(select SUPP_ID from supplier where SUPP_PHONE=8975463285),789), 
 ((select PRO_ID from product where PRO_NAME='ROG LAPTOP'),(select SUPP_ID from supplier where SUPP_PHONE=1234567890),31000), 
 ((select PRO_ID from product where PRO_NAME='GTA V'),(select SUPP_ID from supplier where SUPP_PHONE=7898456532),1450),
 ((select PRO_ID from product where PRO_NAME='OATS'),(select SUPP_ID from supplier where SUPP_PHONE=2589631470),999), 
 ((select PRO_ID from product where PRO_NAME='Boat Earphones'),(select SUPP_ID from supplier where SUPP_PHONE=9785462315),549), 
 ((select PRO_ID from product where PRO_NAME='Boat Earphones'),(select SUPP_ID from supplier where SUPP_PHONE=8975463285),529), 
 ((select PRO_ID from product where PRO_NAME='MILK'),(select SUPP_ID from supplier where SUPP_PHONE=2589631470),105), 
 ((select PRO_ID from product where PRO_NAME='MILK'),(select SUPP_ID from supplier where SUPP_PHONE=1234567890),99),
 ((select PRO_ID from product where PRO_NAME='TSHIRT'),(select SUPP_ID from supplier where SUPP_PHONE=7898456532),2999), 
 ((select PRO_ID from product where PRO_NAME='HARRY POTTER'),(select SUPP_ID from supplier where SUPP_PHONE=2589631470),2999);

 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(101 ,1500,'2021-10-06',(select CUS_ID from customer where CUS_NAME='AMAN'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=1500));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(102,1000,'2021-10-12',(select CUS_ID from customer where CUS_NAME='NEHA'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=1000));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(103,30000,'2021-09-16',(select CUS_ID from customer where CUS_NAME='PULKIT'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=30000));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(104,1500,'2021-10-05',(select CUS_ID from customer where CUS_NAME='AAKASH'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=1500));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(105,3000,'2021-08-16',(select CUS_ID from customer where CUS_NAME='MEGHA'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=3000));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(106,1450,'2021-08-18',(select CUS_ID from customer where CUS_NAME='AAKASH'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=1450));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(107,789,'2021-09-01',(select CUS_ID from customer where CUS_NAME='NEHA'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=789));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(108,780,'2021-09-07',(select CUS_ID from customer where CUS_NAME='PULKIT'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=780));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(109,3000,'2021-00-10',(select CUS_ID from customer where CUS_NAME='PULKIT'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=3000));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(110,2500,'2021-09-10',(select CUS_ID from customer where CUS_NAME='AMAN'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=2500));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(111,1000,'2021-09-15',(select CUS_ID from customer where CUS_NAME='MEGHA'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=1000));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(112,789,'2021-09-16',(select CUS_ID from customer where CUS_NAME='MEGHA'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=789));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(113,31000,'2021-09-16',(select CUS_ID from customer where CUS_NAME='AAKASH'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=31000));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(114,1000,'2021-09-16',(select CUS_ID from customer where CUS_NAME='NEHA'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=1000));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(115,3000,'2021-09-16',(select CUS_ID from customer where CUS_NAME='PULKIT'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=3000));
 insert into `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID)values(116,99,'2021-09-17',(select CUS_ID from customer where CUS_NAME='AMAN'),(select PRICING_ID from supplier_pricing where SUPP_PRICE=99));
 
 insert into rating(ORD_ID,RAT_RATSTARS) VALUES
(101,4),
(102,3), 
(103,1), 
(104,2), 
(105,4), 
(106,3), 
(107,4), 
(108,4), 
(109,3), 
(110,5), 
(111,3), 
(112,4), 
(113,2), 
(114,1), 
(115,1), 
(116,0);

SELECT COUNT(t2.CUS_GENDER) as No_Of_Customers, t2.CUS_GENDER FROM 
 (
 	SELECT t1.CUS_ID,t1.CUS_NAME,t1.CUS_GENDER,t1.ORD_AMOUNT FROM
	(
		SELECT  `order`.*, customer.CUS_NAME,customer.CUS_GENDER   from `order` 
		INNER JOIN  customer WHERE  `order`.CUS_ID =customer.CUS_ID HAVING  `order`.ORD_AMOUNT>=3000
	) AS t1 GROUP BY t1.CUS_ID
 ) AS t2 GROUP BY t2.CUS_GENDER;
 
 SELECT cus_name, pro_name,ord_id,ord_date
FROM product AS p, supplier_pricing AS sp,
`order` AS ORD, customer AS cus
WHERE 
cus.CUS_ID = 2 AND
cus.CUS_ID = ORD.CUS_ID AND
p.PRO_ID = sp.PRO_ID AND
ORD.PRICING_ID = sp.PRICING_ID;

SELECT sup.SUPP_ID, SUPP_NAME,SUPP_CITY,SUPP_PHONE FROM supplier AS sup
INNER JOIN
(SELECT * FROM supplier_pricing GROUP BY SUPP_ID HAVING COUNT(SUPP_ID)>1) AS sp
ON
sup.SUPP_ID = SP.SUPP_ID;

SELECT category.CAT_ID,category.CAT_NAME, t3.PRO_NAME, MIN(t3.MIN_PRICE) AS Min_Price FROM category
INNER JOIN
	(
		 SELECT product.CAT_ID,product.PRO_NAME, t2.* FROM product
		 INNER JOIN(SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID) 
 			AS t2  WHERE t2.PRO_ID = product.PRO_ID
	) AS t3	WHERE t3.CAT_ID = category.CAT_ID 
 
group by t3.CAT_ID; 

SELECT prod.PRO_ID,prod.PRO_NAME FROM `order` AS ord
INNER JOIN  supplier_pricing AS sp
ON sp.PRICING_ID  = ORD. PRICING_ID
INNER JOIN product AS prod
ON prod.PRO_ID = sp.PRO_ID WHERE ORD.ORD_DATE>'2021-10-05';

SELECT * FROM customer AS c WHERE (c.CUS_NAME LIKE  'A%' OR c.CUS_NAME LIKE  '%A');