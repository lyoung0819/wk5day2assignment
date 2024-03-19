-- MOVIE THEATRE ERD + DATABASE SETUP 

-- CREATE ALL TABLES, & comment out where fkeys are needed:

CREATE TABLE customer(
	customer_ID SERIAL PRIMARY KEY,
	cust_first_name VARCHAR,
	cust_last_name VARCHAR NOT NULL, 
	cust_min_age_req BOOLEAN NOT NULL
);

CREATE TABLE purchased_ticket(
	ticket_id SERIAL PRIMARY KEY,
	-- FKEY: customer_id 
	location_purchased BOOLEAN NOT NULL
);

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR NOT NULL,
	movie_length TIMESTAMP,
	-- fkey ticket_id 
	genre VARCHAR NOT NULL,
	rating VARCHAR NOT NULL
);

CREATE TABLE purchased_snack (
	purchased_snack_id SERIAL PRIMARY KEY,
	snack_name VARCHAR NOT NULL
	--FKEY: ticket_id
	--FKEY: movie_id
);

-- JOIN TABLES:
-- CREATE TABLE customer_snack ()
-- CREATE TABLE snack_movie ()
-- END JOIN TABLES
