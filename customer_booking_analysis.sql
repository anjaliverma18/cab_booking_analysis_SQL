use capstone;
select*from customers;
select*from bookings;
-- CUSTOMER AND BOOKING ANALYSIS --
-- customers completed most bookings --
select c.customerID, c.name, count(*) as bookingscompleted
from bookings b
join customers c on b.customerID=c.customerID
where b.status="completed"
group by c.customerID, c.name
order by bookingscompleted desc;
-- INSIGHTS : top customers with most completed bookings. can be used as target user for loayalty programs,
-- given priority support, trust services, high spending customers
-- customers with least completed bookings can be churned out- reason- bad experience. 


-- customer cancelled >30% of total bookings --
select* from(
select customerID,
count(*) as totalbookings,
sum(status="canceled") as totalcanceled,
round(100*sum(status="canceled")/count(*),2) as cancellationrate
from bookings
group by customerID) t
where cancellationrate>30;
-- customers with >30%  cancellationrate- possible reasons, delay of cab arrival, driver denied duty, change of drop location-- 


-- determining the busiest day of the week ---
select date_format(bookingdate,"%W") as daysofweek, count(*) as totalbookings 
from bookings
group by date_format(bookingdate,"%W") 
order by totalbookings desc
limit 1;
-- monday appears to be the busiest day of the week, reasons, office commutation, 
-- extra staff availability, cashback offers to attract bookings rest of the week. --