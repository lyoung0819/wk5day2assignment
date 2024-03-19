-- MOVIE THEATRE ERD + DATABASE SETUP 

-- CREATE ALL TABLES (comment out where fkeys are needed):

CREATE TABLE customer(
	customer_ID SERIAL PRIMARY KEY,
	cust_first_name VARCHAR,
	cust_last_name VARCHAR NOT NULL, 
	cust_min_age_req BOOLEAN NOT NULL
);

CREATE TABLE purchased_ticket(
	ticket_id SERIAL PRIMARY KEY,
	location_purchased BOOLEAN NOT NULL
);

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR NOT NULL,
	movie_length TIMESTAMP,
	genre VARCHAR NOT NULL,
	rating VARCHAR NOT NULL
);

CREATE TABLE purchased_snack (
	purchased_snack_id SERIAL PRIMARY KEY,
	snack_name VARCHAR NOT NULL
	--FKEY: movie_id
);

-- ADDING NEW COLS & FKEYS: 
-- FK 1
ALTER TABLE purchased_ticket ADD COLUMN IF NOT EXISTS customer_id INTEGER;
ALTER TABLE purchased_ticket ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);
-- FK 2
ALTER TABLE movie ADD COLUMN IF NOT EXISTS ticket_id INTEGER;
ALTER TABLE movie ADD FOREIGN KEY(ticket_id) REFERENCES purchased_ticket(ticket_id);
-- FK 3
ALTER TABLE purchased_snack ADD COLUMN IF NOT EXISTS purchased_ticket INTEGER;
-- named the column incorrectly, so need to rename 
ALTER TABLE purchased_snack RENAME COLUMN purchased_ticket TO ticket_id; 

ALTER TABLE purchased_snack ADD FOREIGN KEY(ticket_id) REFERENCES purchased_ticket(ticket_id);
-- FK 4
ALTER TABLE purchased_snack ADD COLUMN IF NOT EXISTS movie_id INTEGER;
ALTER TABLE purchased_snack ADD FOREIGN KEY(movie_id) REFERENCES movie(movie_id);



-- Want to add 'unique' constraint to customer_id ... 
ALTER TABLE customer ADD CONSTRAINT unique_customer UNIQUE (customer_id);



-- JOIN TABLES IN ERD NOT SHOWN HERE:
-- CREATE TABLE customer_snack ()
-- CREATE TABLE snack_movie ()
-- END JOIN TABLES
