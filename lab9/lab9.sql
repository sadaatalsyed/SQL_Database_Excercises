/*1*/

create view VIEW1 as select room.*, guestname from room,hotel,guest,booking 
where room.hotelno=hotel.hotelno and 
room.roomno=booking.roomno 
and guest.guestno=booking.guestno and hotelname="Marriot" 
and  datefrom is not null;
select * from  VIEW1;

/*2*/

CREATE VIEW view2 AS select guestname, guestaddress from guest
 where guestaddress like '%London%' order by guestname;

SELECT * from VIEW2;

/*3*/

create view VIEW3 as select * from booking where dateto is null;

select * from  VIEW3;
/*4*/

insert into view2(guestname,guestaddress) values ('basit shah','Khanewal,Punjab');

select * from guest;

/*5*/

update view1 set price=price*5;
select * from room;

