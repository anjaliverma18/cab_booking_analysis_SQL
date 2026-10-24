use capstone;
describe cabs;
describe drivers;
select*from drivers;
describe feedback;
select* from feedback;
describe bookings;
select * from bookings;

-- drivers with average rating below 3.0-- 
select d.driverid, d.name, round(avg(f.rating),2) as avgrating
from drivers d
join cabs c on d.driverid=c.driverid
join bookings b on c.cabID=b.cabId
join feedback f on b.bookingID=f.bookingID
where f.rating is not null
group by d.driverid, d.name
having avgrating<3;
-- driver secured rating below3.0, need training and action, scope of improvement in providing service
-- customer handling-- strategies-- personality development, grooming & communication, driving skill test--

describe tripdetails;
SELECT distanceKM from tripdetails;

-- top 5 drivers completed longest trips in terms of distance--
select d.driverid, d.name, round(sum(tripdetails.distanceKM),2) as totaldistance
from drivers d
join cabs c on d.driverid=c.driverid
join bookings b on c.cabID=b.cabID
join tripdetails on b.bookingid=tripdetails.bookingid
where b.status="completed"
group by d.driverid, d.name 
order by totaldistance desc
limit 5;
-- insights: top 5 drivers completed longest trips, shows dedication towards customer service,
-- eligible for rewards and perks to boost customer engagement--


-- drivers with high %age of cancelled trips --
select d.driverid, d.name,
sum(b.status="completed") as cancelled, count(*) as totalbookings,
round(100*sum(b.status="completed")/count(*),2) as cancellationrate
from drivers d
join cabs c on d.driverid=c.driverid
join bookings b on c.cabID=b.cabID
group by d.driverid, d.name
having cancellationrate>50;
-- drivers having cancelled trips by more than 50%, show unreliability, delayed service to the customers--
-- training support required to the drivers-- 



