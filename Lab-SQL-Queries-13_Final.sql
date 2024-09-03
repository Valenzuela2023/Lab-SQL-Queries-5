-- Drop column picture from staff.

SELECT

	picture

FROM 

	sakila.staff;

    

ALTER TABLE sakila.staff

DROP COLUMN picture;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

SELECT

	*

FROM sakila.staff;

 

INSERT INTO sakila.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update)

VALUES (3, 'Tammy', 'Sanders', 5, 'tammy.sanders@sakilastaff.com', 1, 1, 'Tammy' , 345, NOW());

 

SELECT *

FROM sakila.staff;

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 

SELECT *

FROM sakila.rental;

 

SELECT * FROM sakila.rental ORDER BY rental_id DESC LIMIT 1;

 

INSERT INTO sakila.rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)

VALUES (16050, NOW(), 9, 130, NOW(), 1, NOW());

-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

SELECT COUNT(*) FROM sakila.customer 

WHERE active = 0;

 

CREATE TABLE deleted_users (

    customer_id INT,

    email VARCHAR(255),

    date DATE

);

 

INSERT sakila.deleted_users (customer_id, email, date)

SELECT customer_id, email, CURDATE() AS date

FROM sakila.customer

WHERE active = 0;

 

SELECT * FROM sakila.deleted_users;

-- Delete the non active users from the table customer

SELECT customer_id FROM sakila.customer WHERE active = 0;

 

DELETE FROM sakila.payment

WHERE customer_id IN (SELECT customer_id FROM sakila.customer WHERE active = 0);

 

SELECT * FROM sakila.payment;

 

DELETE FROM sakila.rental

WHERE customer_id IN (SELECT customer_id FROM sakila.customer WHERE active = 0);

 

DELETE FROM sakila.customer

WHERE active = 0;

