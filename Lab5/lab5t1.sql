Use  University;
create table Campus(
CampusID INTEGER(5) Primary Key NOT NULL,
CampusName VARCHAR(30) NOT NULL,
CampusAddress VARCHAR(50) NULL,
Country VARCHAR(20) NULL,
City VARCHAR(20) NULL,
isOpen BIT NOT NULL);
create table Building(BuildingID INTEGER(5) Primary Key NOT NULL,
BuildingName VARCHAR(30) NULL,
Address VARCHAR(30) NULL,
CampusID Integer(5) null,
constraint fk1 foreign key(CampusID) References Campus(`CampusID`) 
on delete set null on update cascade);
insert into campus values(1,'campusa','abc','Pak','Lhr',0),(2,'campusb','abc','Pak','Lhr',1),
(3,'campusc','cde','Pak','Lhr',0),(4,'campusd','bcd','Pak','kwl',1),(5,'campuse','def','Pak','Mul',1);
insert into building values(1,'buildinga','abc',1),(2,'buildingb','abc',1),
(3,'buildingc','bcd',2),(4,'buildingd','cde',4),(5,'buildinge','def',3);
select * from Campus;
 select* from building;
 select *from building where CampusID=1;
 Update Campus  set CampusName='MyCampus' where CampusID=1;
 select *from Campus;
 Delete  from Campus where CampusName='MyCampus';
 


