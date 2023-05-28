create schema reservation_boats;

use  reservation_boats;

create table Sailor(sid int(4) primary key not null,
sname VARCHAR(30) Null,
rating int(2) null, age float(4) null);

create table Boat(bid int(4) primary key not null,
bname varchar(10) null,color varchar(10) null);

create table Reserve(sid int(4) not null,
bid int(4) not null,day_  date null,
 
foreign key (sid) references Sailor(sid) on delete cascade on update cascade,

 foreign key (bid) references Boat(bid) on delete cascade on update cascade);


insert into Sailor values(22,'Dustin',7,45),
(29,'Brutus',1,33),(31,'Lubber',8,55),(32,'Andy',8,25.5),

(58,'Rusty',10,35),(64,'Horatio',7,35),(71,'Zorba',10,16),(74,'Horatio',9,35),
(85,'Art',3,25.5),(95,'Bob',3,63.5);
insert into Boat values(101,'Interlake','Blue'),
(102,'Interlake','Red'),(103,'Clipper','Green'),(104,'Marine','Red');


insert into Reserve values(22,101,19981010),(22,102,19981010),(22,103,19980810),
(22,104,19980710),
(31,102,19981011),(31,103,19980611),(31,104,19981211),
(64,101,19980509),(64,102,19980809),(74,103,19980809);


select * from Sailor;
 select * from Reserve;
 select * from Boat ;
 
/*task 1*/

 create view name_age as select sname,age from Sailor;

/*task2*/
 
select sname, rating from Sailor where (rating>7);
 
/*task3*/
 
select sname from Sailor,Reserve 
where Sailor.sid=Reserve.sid And Reserve.bid=103;
  
/*task4*/
  
select sid from Boat,Reserve where Boat.bid=Reserve.bid And Boat.color='Red'; 

/*task5*/
   
 select sname,sid from Sailor
 where sid In (
select sid from Boat,Reserve where Boat.bid=Reserve.bid And Boat.color='Red'); 
    
/*OR*/
    
select sname,Sailor.sid from Sailor,Reserve,Boat
 where
 Sailor.sid=Reserve.sid and Reserve.bid=Boat.bid and Boat.color='Red';
    
/*task6*/
    
select Boat.color from Sailor,Reserve,Boat 
where 
Sailor.sid=Reserve.sid and Reserve.bid=Boat.bid and Sailor.sname='Lubber';
    
/*task7*/
    
select sname,Sailor.sid,Count(*) from Sailor,Reserve,Boat
 where 
Sailor.sid=Reserve.sid and Reserve.bid=Boat.bid 
Group by Sailor.sname having Count(*)>=1;
    
/*task8*/
    
select age from Sailor where sname like 'B%_%s';
    
/*task9*/
    
select Sailor.sname ,Count(Sailor.sname) from Sailor,Reserve,Boat 
where Sailor.sid=Reserve.sid 
 and Reserve.bid=Boat.bid and (Boat.color='Red' OR Boat.color='Green') group by Sailor.sname;
    
/*Task10*/
   
 select distinct Sailor.sid, Sailor.rating, Reserve.bid  
from Sailor 

left outer join Reserve on Sailor.sid=Reserve.sid 
WHERE ( Sailor.rating=10 OR Reserve.bid=104); 
   
