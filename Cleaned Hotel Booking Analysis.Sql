-- Creating Table
CREATE TABLE hotel_booking (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hotel VARCHAR(50),
    is_canceled TINYINT,
    lead_time INT,
    arrival_date_year INT,
    arrival_date_month VARCHAR(15),
    arrival_date_week_number INT,
    arrival_date_day_of_month INT,
    stays_in_weekend_nights INT,
    stays_in_week_nights INT,
    adults INT,
    children INT,
    babies INT,
    meal VARCHAR(10),
    country VARCHAR(5),
    market_segment VARCHAR(50),
    distribution_channel VARCHAR(50),
    is_repeated_guest TINYINT,
    previous_cancellations INT,
    previous_bookings_not_canceled INT,
    reserved_room_type VARCHAR(5),
    assigned_room_type VARCHAR(5),
    booking_changes INT,
    deposit_type VARCHAR(20),
    agent int,
    company INT,
    days_in_waiting_list INT,
    customer_type VARCHAR(20),
    adr FLOAT,
    required_car_parking_spaces INT,
    total_of_special_requests INT,
    reservation_status VARCHAR(20),
    reservation_status_date DATE,
    name varchar(20),
    email varchar(30),
    phonenumber varchar(20),
    credit_card varchar(20)
);

select * from hotel_booking;

-- cleaning the data
-- remove duplicates rows

SET SQL_SAFE_UPDATES = 0;

WITH duplicate_rows AS (
    SELECT MIN(id) AS min_id
    FROM hotel_booking
    GROUP BY hotel, arrival_date_year, arrival_date_month, arrival_date_day_of_month, adr
)
DELETE FROM hotel_booking
WHERE id NOT IN (SELECT min_id FROM duplicate_rows);

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe mode after running the delete query

-- Handling null values
-- Replace NULL in children,babies with 0
UPDATE hotel_booking
SET children = 0
WHERE children IS NULL;

UPDATE hotel_booking
SET babies = 0
WHERE babies IS NULL;

-- Replace NULL in agent and company with 0
UPDATE hotel_booking
SET agent = 0
WHERE agent IS NULL;

UPDATE hotel_booking
SET company = 0
WHERE company IS NULL;

-- Remove rows with 0 adults, children, and babies
DELETE FROM hotel_booking
WHERE adults = 0 AND children = 0 AND babies = 0;

-- Convert 'arrival_date_month' to proper date format 
ALTER TABLE hotel_booking
MODIFY arrival_date_month VARCHAR(20);

UPDATE hotel_booking
SET country = 'Unknown'
WHERE country IS NULL;

-- Fix incorrect lead times (negative values) 
UPDATE hotel_booking
SET lead_time = ABS(lead_time)
WHERE lead_time < 0;

-- Create a total stay column (weekend + week nights)
ALTER TABLE hotel_booking
ADD total_stay INT;

UPDATE hotel_booking
SET total_stay = stays_in_weekend_nights + stays_in_week_nights;

-- Change agent column to allow NULL values
ALTER TABLE hotel_booking MODIFY COLUMN agent INT NULL;

-- If data is already imported, update incorrect values:
UPDATE hotel_booking 
SET agent = NULL 
WHERE agent = '';

-- Check the existing column type
DESC hotel_booking;

-- Change the phonenumber column to VARCHAR to handle different formats
ALTER TABLE hotel_booking MODIFY COLUMN phonenumber VARCHAR(20);

-- If some rows have incorrect data, check for them:
SELECT phonenumber FROM hotel_booking WHERE LENGTH(phonenumber) > 20;

ALTER TABLE hotel_booking MODIFY COLUMN credit_card VARCHAR(20);
