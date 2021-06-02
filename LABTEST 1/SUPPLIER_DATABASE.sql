drop database supplier;
create database supplier;
use supplier;
create table suppliers(
sid int,
sname  varchar(30),
saddress varchar(30),
primary key(sid)
);

create table parts(
pid int,
pname varchar(30),
color varchar(30),
primary key(pid)
);

create table catalog(
sid int,
pid int,
cost real,
foreign key(sid)references suppliers(sid)on delete cascade on update cascade,
foreign key(pid)references parts(pid)on delete cascade on update cascade
);
create table accounts(
acctid int not null,
accname varchar(20) not null,
Balanceamt real,
primary key(acctid)


);

insert into suppliers values(10,"jennie","m g road");
insert into suppliers values(20,"rose","jaynagar");
insert into suppliers values(30,"kou","church street");
insert into suppliers values(40,"felirox","jp nagar");
insert into suppliers values(50,"chiyo","khubha plot");
select *from suppliers;

insert into parts values(001,"pen","red");
insert into parts values(002,"pencil","blue");
insert into parts values(003,"eraser","yellow");
insert into parts values(004,"calculator","black");
insert into parts values(005,"scale","white");
select * from parts;

insert into catalog values(10,001,5000);
insert into catalog values(20,002,10000);
insert into catalog values(30,003,8000);
insert into catalog values(40,004,70000);
insert into catalog values(50,005,50000);
select *from catalog;

insert into accounts values(01,"jennie",10000);
insert into accounts values(002,"rose",20000);
insert into accounts values(003,"kou",30000);
insert into accounts values(004,"felirox",15000);
insert into accounts values(005,"chiyo",50000);
select *from accounts;


/*4*/
select s.sname from suppliers s where s.sid in(select ca.sid
from catalog ca, parts p where ca.pid=p.pid and p.color='red'
group by ca.sid having count(ca.pid)=(select count(*) from parts p where p.color='red'));


/*5*/
select s.sid,s.sname,s.saddress 
from suppliers s, accounts a 
where s.sname=a.accname and a.Balanceamt >= 25000;

/*6*/
select * from parts;

update parts set pid=27 where color='yellow' ;

select * from parts;


/*7*/
SELECT DISTINCT s.sname 
FROM Catalog C, suppliers s
WHERE C.cost > 20000 and s.sid = C.sid;