#Order by clause task
USE sql_store;
SELECT order_id, quantity*unit_price as totalprice
 FROM order_items
 WHERE order_id =2
 ORDER BY totalprice ,order_id;
------------------------*****--------------------------------

#Limit clause task
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3  

---------------------------*****-----------------------------

#Joining 2 differnt tabels  
SELECT order_id,name, o.unit_price,p.product_id 
FROM order_items o
 JOIN products p on o.product_id=p.product_id
 
 ---------------------------*****-----------------------------
 
 #Joining 3 different Tabels
USE sql_invoicing;
SELECT p.client_id,p.date,pm.name as payment_method,c.name 
FROM clients c
JOIN payments p ON c.client_id=p.client_id
JOIN payment_methods pm ON p.payment_method=pm.payment_method_id 

 ---------------------------*****-----------------------------
 
 #Left and Right join task
USE sql_store;
SELECT o.order_id,o.order_date,c.first_name as customer,os .name as shipper_name
FROM orders o
LEFT JOIN customers c  ON o.customer_id=c.customer_id
RIGHT JOIN order_statuses os ON o.order_id=os.order_status_id

 ---------------------------*****-----------------------------
 
 # Joining 2 tables using USING clause 
USE sql_invoicing;
SELECT p.date,c.name as customer,p.amount,pm.name as payment_method
FROM clients c
JOIN payments p 
USING(client_id)
JOIN payment_methods pm ON p.payment_method=pm.payment_method_id 


 ---------------------------*****-----------------------------
 
  #UNION CLAUSE Task
 USE sql_store;
SELECT c.first_name,c.points,
"silver" as status
FROM customers c
WHERE POINTS<2000
UNION
  SELECT c.first_name,c.points,
"GOLD"AS STATUS
FROM customers c
WHERE 2000<points<3000 
  
   ---------------------------*****-----------------------------
 
 #INSERT INTO task
USE sql_store;
INSERT INTO products (name,quantity_in_stock,unit_price)
VALUES ("SMK",70,1.2),("SAHIL",80,2.2),("JGHG",96,3.2)

 ---------------------------*****-----------------------------
 
   #IMPLICIT JOIN 

  SELECT c.points,c.customer_id,o.comments
  FROM customers c
  JOIN orders o ON c.customer_id=o.customer_id;
 
 
 -- Using implicit joins
  USE sales;
  SELECT count(*) 
  FROM customers c , transactions t
 WHERE c.customer_code=t.customer_code
  
 ---------------------------*****-----------------------------
 
 -- ORDER BY CLAUSE

USE sql_invoicing;
SELECT c.name,c.client_id,p.invoice_id,p.amount,p.date,pm.name AS payment_method
FROM clients c
JOIN payments p on c.client_id=p.client_id
JOIN payment_methods pm  on p.payment_method=pm.payment_method_id
order by name

 ---------------------------*****-----------------------------
 
 -- Joining 3 differnt tables using outer join getting all the out puts not only that with matchs the condition  USE sales;
  USE sql_store;
  SELECT o.order_id,o.order_date,c.first_name AS customer ,s.name AS shippers_name,os.name AS order_status
  FROM customers c 
  JOIN orders o ON c.customer_id=o.customer_id
 LEFT JOIN shippers s ON o.shipper_id=s.shipper_id
 LEFT JOIN order_statuses os ON o.status =os.order_status_id
 
  ---------------------------*****-----------------------------
  
   #Joining tables using USING clause
 USE sql_invoicing;
 SELECT p.date,c.name AS customer,p.amount,pm.name AS payment_method
 FROM clients c
  JOIN payments p
      USING (client_id)
 JOIN payment_methods pm on p.payment_method=pm.payment_method_id;    
 
 ---------------------------*****--------------------------------
 
 #ALTER TABLE
USE SQL_INVOICING;
SELECT sum(earnings),count(earnings)
FROM clients
ALTER TABLE clients
ADD  earnings=salary*month varchar(100)
order BY desc
LIMIT 1;

---------------------------*****--------------------------------
