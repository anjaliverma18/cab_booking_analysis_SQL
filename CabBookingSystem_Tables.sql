create database capstone;
use capstone;
describe customers;
select * from customers;
describe drivers;
select * from drivers;
describe cabs;
select* from cabs;
describe bookings;
select * from bookings;
describe tripdetails;
select * from tripdetails;
describe feedback;
select* from feedback;


alter table bookings
add constraint foreign key(customerID) references customers(customerID);
alter table bookings
add constraint foreign key(cabID) references cabs(cabID); 
alter table tripdetails
add constraint foreign key(bookingID) references bookings(bookingID);

