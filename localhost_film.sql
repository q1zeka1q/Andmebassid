CREATE TABLE film(
filmID INT PRIMARY KEY AUTO_INCREMENT,
filmNimetus varchar(30) not null,
aasta int,
eelarveHind decimal(7,1));
SELECT * FROM film;

insert into film(filmNimetus, aasta, eelarveHind)
values(' ', 2024, 40010.5)

create table zanr(
zanrID int primary key identity(1,1),
zanrNimetused varchar(20) unique
)

insert into zanr(zanrNimetused)
values ('draama'), ('detektiv');
select * from zanr;

-- tabeli film struktuuri muutmine-->uue stolbets lisamine
alter table film add zanrID int;
select * from film
-- TABELI FILM muutmine struktur--> FK lisamine mis on seotud tabeliga zanr(zanrID)
alter table film add constraint fk_zanr
foreign key (zanrID) REFERENCES zanr(zanrID);

select * from film;
select * from zanr;
update film set zanrID=1 wheRe filmID=1 
