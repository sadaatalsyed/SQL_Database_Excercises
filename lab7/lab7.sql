create schema hotelBooking;

use hotelBooking;

create table hotel( hotelno varchar(10) primary key, 
hotelname varchar(20), city varchar(20) );

insert into hotel values('fb01', 'Grosvenor', 'London');

insert into hotel values('fb02', 'Watergate', 'Paris');

insert into hotel values('ch01', 'Omni Shoreham', 'London');

insert into hotel values('ch02', 'Phoenix Park', 'London');

insert into hotel values('dc01', 'Latham', 'Berlin');

create table room( roomno numeric(5), hotelno varchar(10), 
type varchar(10), price decimal(5,2), primary key (roomno, hotelno), 
foreign key (hotelno) REFERENCES hotel(hotelno) );

insert into room values(501, 'fb01', 'single', 19);

insert into room values(601, 'fb01', 'double', 29);

insert into room values(701, 'fb01', 'family', 39);

insert into room values(1001, 'fb02', 'single', 58);

insert into room values(1101, 'fb02', 'double', 86);

insert into room values(1001, 'ch01', 'single', 29.99);

insert into room values(1101, 'ch01', 'family', 59.99);

insert into room values(701, 'ch02', 'single', 10);

insert into room values(801, 'ch02', 'double', 15);

insert into room values(901, 'dc01', 'single', 18);

insert into room values(1001, 'dc01', 'double', 30);

insert into room values(1101, 'dc01', 'family', 35);

create table guest( guestno numeric(5), guestname varchar(20),
 guestaddress varchar(50), primary key (guestno) );

insert into guest values(10001, 'John Kay', '56 High St, London');

insert into guest values(10002, 'Mike Ritchie', '18 Tain St, London');

insert into guest values(10003, 'Mary Tregear', '5 Tarbot Rd, Aberdeen');

insert into guest values(10004, 'Joe Keogh', '2 Fergus Dr, Aberdeen');

insert into guest values(10005, 'Carol Farrel', '6 Achray St, Glasgow');

insert into guest values(10006, 'Tina Murphy', '63 Well St, Glasgow');

insert into guest values(10007, 'Tony Shaw', '12 Park Pl, Glasgow');

create table booking( hotelno varchar(10), guestno numeric(5), 
datefrom datetime, dateto datetime,
 roomno numeric(5),
 primary key (hotelno, guestno, datefrom), foreign key (roomno, hotelno)
 REFERENCES room(roomno, hotelno), foreign key (guestno) REFERENCES guest(guestno) );

insert into booking values('fb01', 10001, '02-04-01', '02-04-08', 501);

insert into booking values('fb01', 10004, '04-04-15', '04-05-15', 601);

insert into booking values('fb01', 10005, '03-05-02', '03-05-07', 501);

insert into booking values('fb01', 10001, '04-05-01', null, 701);

insert into booking values('fb02', 10003, '09-04-05', '10-04-04', 1001);

insert into booking values('ch01', 10006, '04-04-21', null, 1101);

insert into booking values('ch02', 10002, '04-04-25', '04-05-06', 801);

insert into booking values('dc01', 10007, '06-05-13', '06-05-15', 1001);

insert into booking values('dc01', 10003, '12-05-20', null, 1001);


/*t1*/

select guestname, guestaddress from guest
 where 
guestaddress like '%London%' order by guestname ;
/*t2*/

select hotelname,room.roomno from hotel,room 
where 
hotel.hotelno=room.hotelno order by hotelname;

/*t3*
/
select hotelno, Count(room.price),AVG(room.price) AS AVERAGE_PRICE from room
 
where 
room.hotelno in (
select hotelno from hotel where city='London') 
group by hotelno;

/*t4*/

select Max(price),room.type from room group by room.type order by room.type;

/*t5*/

select hotelname, city, type from hotel, room where 
hotel.hotelno=room.hotelno;

select hotelname,city ,count(distinct room.type) from hotel,room 
where room.hotelno=hotel.hotelno group by hotelname,room.type;

/*t6*/

select distinct hotelname,city,hotel.hotelno from hotel, guest,booking 
where hotel.hotelno=booking.hotelno and guest.guestno=booking.guestno and 
guestaddress like'%London%';

/*t7*/

select hotel.hotelname, city, Count(hotel.hotelno),hotel.hotelno from hotel,booking 
where hotel.hotelno=booking.hotelno  group by hotel.hotelno;

/*t8*/

select guest.guestname, booking.hotelno from booking, guest 
where
booking.guestno=guest.guestno and booking.dateto is null;

/*t9*/

select  Distinct  hotelname, roomno, booking.guestno,booking.datefrom 
from 
hotel,booking
 
where 
booking.hotelno=hotel.hotelno and (booking.datefrom  like '%2003_%' 
OR booking.datefrom  like '%2004_%' );
/*t10*/

select  Distinct  hotelno from hotel
 where not exists (select booking.hotelno from booking);

/*t11*/

(select distinct guestno, datefrom from booking where datefrom <'2015-05-01');

