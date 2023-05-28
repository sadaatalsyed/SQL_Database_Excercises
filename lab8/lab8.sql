/*1*/

select count(*) ,sum(price) from room where type="double";

/*2*/

select distinct* from booking where (datefrom like '%____08%') 
or (dateto like '%____08');

/*3*/

select room.type,price from hotel, room 
where hotel.hotelno=room.hotelno  
and hotelname='Avari ' 
and city="Lahore";

/*4*/

select guest.guestno, guestname,hotel.hotelname from hotel, booking, guest 
where hotel.hotelno=booking.hotelno 
and 
booking.guestno=guest.guestno 
and dateto>date();

/*6*/

select hotelno from booking where datefrom is null ;

/*7*/

select hotel.hotelname,room.price from room, booking, hotel 
where room.roomno=booking.roomno and hotel.hotelno=room.hotelno 

and hotel.hotelname="Hotel Inn" and booking.datefrom is null;

/*8*/

select sum(room.price) from room, booking 
where room.roomno=booking.roomno and booking.datefrom is null;

/*9*/

select price from room, booking 
where room.roomno=booking.roomno and booking.datefrom is null
 
group by room.type having count(type)>2;

/*10*/

select price ,price*1.02 from room ;

