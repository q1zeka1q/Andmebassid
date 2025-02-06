--SQL SALVESTATUD PROTSEDUURID -- Funktsioonid - mitu SQL käsku käivetakse järjest
--SQL server
create database procTARgv24;

use procTARgv24;
create table uudised(
uudisID int PRIMARY KEY identity(1,1),
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
)
select * from uudised;
insert into uudised (uudiseTeema, kuupaev, autor, kirjeldus)
values(
'udune ilm', '2025-02-06', 'postimees', 'Elektri puudumine')
--protseduri loomine
--Sisestab uudised tabelisse ja kohe näitab
create procedure lisaUudis
@uusTeema varchar(50),
@paev date,
@autor varchar(50),
@kirjeldus text
as
begin
insert into uudised (
uudiseTeema, kuupaev, autor, kirjeldus)
values(
@uusTeema, @paev, @autor, @kirjeldus)
select * from uudised;
end;
--kutse
exec lisaUudis 'windows 11', '2025-02-06', 'õpetaja Pant', 'w11 ei töötata multimedia klassis';
--teine kutse võimalus
exec lisaUudis 
@uusTeema='1.märts on juba kevad',
@paev= '2025-02-06',
@autor= 'õpetaja Merkulova',
@kirjeldus='puudub';


--protsedur, mis kustutab tabelist id järgi
create procedure kustutaUuddis
@id int
as
begin
select * from uudised;
delete from uudised where uudisID=@id;
select * from uudised;
end;
--kutsume
exec kustutaUuddis 3;
exec kustutaUuddis @id=3;



create procedure uuendakirjeldus
@uuskirjeldus text
as
begin
select * from uudised;
update uudised set kirjeldus=@uuskirjeldus
where kirjeldus like 'puudub';
select * from uudised;
end;

--kutse
exec uuendakirjeldus 'uus tekst kirjeldused';

-- protseduur mis otsib ja nätab uudis esimese tähte järgi
create procedure otsingUudiseTeema
@taht char(1)
as
begin
select * from uudised
where uudiseTeema like @taht +'%';
end
--kutse
exec otsingUudiseTeema 'w';

--XAMPP

create table uudised(
uudisID int PRIMARY KEY identity(1,1),
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
)
insert into uudised (uudiseTeema, kuupaev, autor, kirjeldus)
values(
'udune ilm', '2025-02-06', 'postimees', 'Elektri puudumine')

begin
insert into uudised (
uudiseTeema, kuupaev, autor, kirjeldus)
values(
@uusTeema, @paev, @autor, @kirjeldus)
select * from uudised;
end

call lisaUudis ('windows 11', '2025-02-06', 'õpetaja Pant', 'w11 ei töötata multimedia klassis')

























