create table Employees(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Surname] nvarchar(50),
[Email] varchar(100)
)
insert into Employees([Name],[Surname],[Email])
values('Arzu','Kerimova','arzu@gmail.com'),
      ('Omer','Kerimov','omar@gmail.com'),
	  ('Nezrin','Eliyeva','nazrin@gmail.com')

select * from Employees

Alter Table Employees ADD default 'XXX' for [Surname]

insert into Employees([Name],[Email]) 
values('Oruc','oruc@gmail.com')

alter table Employees 
add Age int check (Age>18)

insert into Employees ([Name],[Email],[Age])
values('Oruc','oruc11@gmail.com',18)


insert into Employees ([Name],[Email],[Age])
values('Oruc','oruc11@gmail.com',19)

select count(*) as 'Employee count' from Employees

select Sum(Age) as 'Employee age sum' from Employees

select Avg(Age) as 'Employee Avg age ' from Employees

select Max(Age) as 'Employee Max age ' from Employees

select Min(Age) as 'Employee Min age ' from Employees

select SUBSTRING('Semed bey',1,3)

select REPLACE ('salamlar','s','d')

select SUBSTRING([Surname],1,4) from Employees

declare @avgAge int= (select AVG(Age) from Employees)
declare @sumAge int= (select Sum(Age) from Employees)

if(@sumAge > @avgAge)
   print 'Yes'
else 
    print 'No'


create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar (50)
)

insert into Countries([Name])
values('Azerbaycan'),
       ('Turkiye'),
	   ('ispaniya'),
	   ('Almaniya')

select * from Countries

create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[CountryId] int,
foreign key (CountryId) references Countries(Id)
)
select * from Cities

insert into Cities([Name],[CountryId])
values('Baku',1),
       ('Aghsu',1),
	   ('Susha',1),
	   ('Antalya',2),
	   ('Madrid',3),
	   ('Barselona',3),
	   ('Berlin',4),
	   ('Hamburg',4)

select * from Cities where CountryId=1


create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Email] nvarchar(100),
[Address] nvarchar(200),
[Age] int,
[CityId] int,
foreign key (CityId) references Cities(Id)
)
select * from Students

create table Teachers(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Salary] float,
[Age] int,
[CityId] int,
foreign key (CityId) references Cities(Id)
)

create table Teachersstudents(
[Id] int primary key identity(1,1),
[TeacherId] int,
[StudentId] int,
foreign key (TeacherId) references Teachers(Id),
foreign key (StudentId) references Students(Id)
)

select ct.Name as 'City' , co.Name as 'Country' from Countries co
inner join Cities ct
on co.Id = ct.CountryId



select ct.Name as 'City' , co.Name as 'Country' from Countries co
left join Cities ct
on co.Id = ct.CountryId

select ct.Name as 'City' , co.Name as 'Country' from Countries co
right outer join Cities ct
on co.Id = ct.CountryId

select ct.Name as 'City' , co.Name as 'Country' from Countries co
full outer join Cities ct
on co.Id = ct.CountryId

select st.Name as 'Student name', st.Email 'Student Email',st.Age 'Student age',
ct.Name as 'City name' ,co.name 'Country ' from Students st
join Cities ct
on ct.Id=st.CityId
join Countries co
on ct.CountryId=co.Id
join TeachersStudents ts
on st.Id = ts.StudentId
join Teachers t
on t.Id = ts.TeacherId
where t.Id=1
