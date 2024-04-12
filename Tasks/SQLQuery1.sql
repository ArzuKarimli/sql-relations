create table Students_Db(
[Id] int primary key identity(1,1),
[FullName] nvarchar (80),
[Email] varchar (80)
)

insert into Students_Db([FullName],[Email])
values('Kerimova Arzu','arzu@gmail.com'),
       ('Esedove Aysu','aysu@gmail.com'),
	   ('Eliyeva Nezaket','nazli@gmail.com'),
	   ('Kerimov Omer','omer@gmail.com')

select * from Students_Db


declare @symbol varchar(1)='@'
select LEFT ([Email],CHARINDEX(@symbol,[Email])-1) from Students_Db;

declare @symbol1 varchar(1)='@'
select SUBSTRING ([Email],1,CHARINDEX(@symbol1,[Email])-1) from Students_Db;



DECLARE @symbol2 VARCHAR(1) = '@';
SELECT RIGHT([Email], LEN([Email]) - CHARINDEX(@symbol2, [Email])) from Students_Db;

DECLARE @symbol3 VARCHAR(1) = '@';
SELECT SUBSTRING([Email],CHARINDEX(@symbol3, [Email]) + 1, LEN([Email])) from Students_Db;


