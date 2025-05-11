CREATE DATABASE IF NOT EXISTS OLA;
USE OLA;
SHOW DATABASES;


#1. Retrieve all successful bookings:
select * from Successful_booking;


#2. Find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle_type;

#3. get the total number of canceled rides by customers:
create view canceled_rides_by_customers as
select count(*) from booking
where booking_status ='canceled by customer';

select * from canceled_rides_by_customers;


#4. List top 5 customer who booked the highest number of rides:
Create view Top_5_customer as
select customer_id ,count(booking_id) as total_rides
from booking
group by customer_id
order by total_rides desc limit 5;

select * from Top_5_customer;

#5. get the number of rides canceled by drivers due to personal and car-related issues:
create view rides_canceled_by_drivers_P_C_issues as
select count(*) from booking
where canceled_rides_by_driver ='personal & car related issue';

#6. Find the maximum and minimum driver ratings for prime sedan bookings:
create view max_min_driver_rating as
select max(driver_ratings) as max_rating,
min(driver_ratings) as min_rating
from booking where vehicle_type = 'Prime Sedan';

select * from max_min_driver_rating;

#7. retrieve all rides where payment was made using upi:
create view UPI_payment as
select * from booking
where payment_method = 'UPI';

select * from UPI_payment;


#8. find the average customer rating per vehicle type:
create view avg_cust_rating as
select vehicle_type, avg(customer_rating) as avg_customer_rating
from booking
group by vehicle_type;

select * from avg_cust_rating;


#9. calculate the total booking values of rides completed successfully:
select sum(booking_value) as total_successful_ride_value
from booking
where booking_status='success';


#10: list all incomplete rides along with the reason:
select booking_id, incomplete_rides_reason
from booking
where incomplete_rides='yes';








