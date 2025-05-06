use Hotel_booking;

-- Basic Query

-- Q1: Total Number of Bookings
-- This query counts all rows in the table to find total bookings.
SELECT COUNT(*) AS total_bookings FROM hotel_booking;

-- Q2: Total Bookings by Hotel Type
-- It shows how many bookings were made in City Hotel vs Resort Hotel.
SELECT hotel, COUNT(*) AS total_bookings
FROM hotel_booking
GROUP BY hotel;

-- Q3: Peak Booking Months
-- This helps identify in which month the highest number of bookings occurred.
SELECT arrival_date_month, COUNT(*) AS total_bookings
FROM hotel_booking
GROUP BY arrival_date_month
ORDER BY total_bookings DESC;

-- Q4: find the number of bookings per year
select arrival_date_year, count(*) as total_bookings from
hotel_booking
group by arrival_date_year;

-- Q5: Most Popular Room Type 
select reserved_room_type, count(*) as total_bookings from
hotel_booking
group by reserved_room_type
order by total_bookings desc
limit 1;

-- Q6:  Show bookings where more than 2 adults were booked
select * from hotel_booking where adults>2;

-- Q7:  Find the average daily rate (ADR) for each hotel
select hotel, avg(adr) as average_rate
from hotel_booking
group by hotel;

-- Q8:  Find the most common meal type booked
select meal,count(*) as total_count
from hotel_booking
group by meal
order by total_count desc
limit 1;

-- Q9: find the Country with Maximum Bookings
SELECT country, COUNT(*) AS total_bookings 
FROM hotel_booking 
GROUP BY country 
ORDER BY total_bookings DESC
LIMIT 1;

-- Q10: find Average Special Requests Per Booking
select avg(total_of_special_requests) as avg_request
from hotel_booking;

-- Q11: find the Customers Who Booked the Most
select customer_type,count(*) as total_bookings
from hotel_booking
group by customer_type
order by total_bookings desc;

-- Q12:  find the Guests with Maximum Stays
SELECT id, (stays_in_weekend_nights + stays_in_week_nights) AS total_stays
FROM hotel_booking
ORDER BY total_stays DESC
LIMIT 1;

-- Q13: find the Average Stay Duration
select avg(stays_in_weekend_nights + stays_in_week_nights) as avg_stay
from hotel_booking;

-- Q14: find the Top 5 Most Frequently Assigned Room Types
select assigned_room_type,count(*) as total_assigned
from hotel_booking
group by assigned_room_type
order by total_assigned desc
limit 5;

-- Q15: Total Car Parking Spaces Used
SELECT SUM(required_car_parking_spaces) AS total_parking_spaces 
FROM hotel_booking;

-- Q16: find the Highest Revenue-Generating Room Type 
 select assigned_room_type, sum(adr) as total_revenue
 from hotel_booking
 group by assigned_room_type
 order by total_revenue desc
 limit 1;
 
 -- Q17: Cancellation Rate by Hotel Type 
 SELECT hotel,(COUNT(CASE WHEN is_canceled = 1 THEN 1 END) * 100.0 / COUNT(*)) AS cancellation_rate
FROM hotel_booking 
GROUP BY hotel;

-- Q18: Identifying High-Waitlist Bookings
SELECT id, days_in_waiting_list 
FROM hotel_booking 
WHERE days_in_waiting_list > 10 
ORDER BY days_in_waiting_list DESC;

-- Q19: Find how many bookings were repeated guests
SELECT COUNT(*) AS repeated_bookings 
FROM hotel_booking 
WHERE is_repeated_guest = 1;


-- Q20: Find the top 5 highest-paying customers (based on ADR)
select * from hotel_booking order by adr desc limit 5;

-- Q21: Find the total number of bookings with children
SELECT COUNT(*) AS bookings_with_children 
FROM hotel_booking 
WHERE children > 0;

-- Q22: Find customers who have made changes to their bookings
SELECT * FROM hotel_booking WHERE booking_changes > 0;

-- Q23: Find the most profitable hotel type (based on ADR)
SELECT hotel, SUM(adr) AS total_revenue
FROM hotel_booking
WHERE is_canceled = 0
GROUP BY hotel
ORDER BY total_revenue DESC;

-- Q24: Find customers who have booked the same hotel more than once
SELECT customer_type, COUNT(*) AS repeat_bookings
FROM hotel_booking
WHERE is_repeated_guest = 1
GROUP BY customer_type
ORDER BY repeat_bookings DESC;

-- Q25: Find the longest stay recorded
SELECT id, hotel, (stays_in_week_nights + stays_in_weekend_nights) AS total_stay_days
FROM hotel_booking
ORDER BY total_stay_days DESC
LIMIT 1;

-- Q26: Find the average stay duration for each customer type
SELECT customer_type,ROUND(AVG(stays_in_week_nights + stays_in_weekend_nights), 2) AS avg_stay_duration
FROM hotel_booking
GROUP BY customer_type;

-- Q27:  Find the distribution of bookings per week number
SELECT arrival_date_week_number, COUNT(*) AS total_bookings
FROM hotel_booking
GROUP BY arrival_date_week_number
ORDER BY total_bookings DESC;

-- Q28: Find the distribution of market segments (how customers found the hotel)
SELECT market_segment, COUNT(*) AS segment_count 
FROM hotel_booking 
GROUP BY market_segment 
ORDER BY segment_count DESC;

