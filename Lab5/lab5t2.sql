create schema Gyminfo;
use Gyminfo;
create table Gym(
GymName Varchar(20)primary key not null,
ownr Varchar(20) null,
street varchar(30) null);
create table Customer(
CustomerName varchar(20) primary key not null,
street varchar(30) null,
age integer(2)  null);
create table Frequents(
Customername varchar(30) default null,
Gymname varchar(20)default null,
constraint fk1 foreign key(Customername) REFERENCES Customer(CustomerName)
on delete cascade on update cascade,
constraint fk2 foreign key(Gymname) references Gym(GymName)
on delete cascade on update cascade);
Replace Gym (GymName,street) values('gyma','st1'),('gymb','st1'),('gymc','st2');
Replace Customer(CustomerName,street,age)values('Usman','st1',21),('Shahid','st2',21),('abid','st1',23);
insert into frequents values ('usman','gyma'),('usman','gymb'),('usman','gymc');
select * from Customer;
select Gym.street as gs from Gym;
select  CustomerName,Gymname  from Customer 
Inner Join Gym on Customer.street=Gym.street;
select Frequents.Gymname from Frequents where Customername='usman';
