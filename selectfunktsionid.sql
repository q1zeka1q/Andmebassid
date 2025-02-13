create database targv24ev;

use  targv24ev;
---------------------------------------------------------
create table laps(
lapsID int primary key identity(1,1),
nimi varchar(50) not null,
pikkus smallint,
synniaatsta smallint,
synnilinn varchar(20)
);
----------------------------------------------------------------
select * from laps;

insert into laps(nimi, pikkus,synniaatsta,synnilinn)
values 
('Kati', 156, 2001, 'Tallinn'),
('Ravil', 176, 1998, 'Kohtla-Järve'),
('Evgeniy', 177, 2000, 'Puru'),
('Anna', 156, 2006, 'Tartu'),
('Nikita', 186, 2009, 'Narva');

--sorterimine
--asc, desc suurimas väikseni
select nimi, pikkus
from laps
order by pikkus DESC, nimi;

--lapsed, mis on sündinud peale 2005
select nimi, synniaatsta
from laps
where synniaatsta >=2005
order by nimi;

-- distinct
select distinct synniaatsta
from laps
where synniaatsta>2000;

-- between 

-- lapsed mis on sündinud (2000 kuni 2005)
select nimi, synniaatsta
from laps
where synniaatsta between 2000 and 2005;

select nimi, synniaatsta
from laps
where synniaatsta >= 2000 and synniaatsta <= 2005;


--like
--näita lapsed, kelle nimi algab N
--% kõik võimalikud sümnoolid
-- sisaldab N täht - %N%
select nimi 
from laps
where nimi like'%N%';


--Täpsem määratud tähtede arv _
select nimi 
from laps
where nimi like'_a__';


--and /or
select nimi 
from laps
where nimi like 'N%'
or synnilinn like 'Tartu';

select nimi 
from laps
where nimi like 'N%'
and synnilinn like 'Tartu';

--agregaaatfunktsion --->sum, avg, min, max, count, AS lastearv ДОБОВЛЯЕМ СТОЛБЕЦ
select count (nimi) AS lastearv
from laps;

select avg (pikkus) AS 'keskmine pikkus'
from laps
where synnilinn='Tallinn';

--näita kekmine pikkus linnade järgi
-- group by

select avg (pikkus) AS 'keskmine pikkus', synnilinn
from laps
group by synnilinn;


--näita laste arv mis on sündinud
-- konkretsel süniaastal

select synniaatsta, count(*) AS lastearv
from laps
group by synniaatsta;



--having
--keskmine pikkus iga sünniaasta järgi
select synniaatsta, avg(pikkus) AS keskmine
from laps
group by synniaatsta
having avg(pikkus)>160;

select synniaatsta, avg(pikkus) AS keskmine
from laps
where not synniaatsta=2000
group by synniaatsta


--seotud tabel
create table loom(
loomID int primary key identity(1,1),
loomnimi varchar(50),
lapsID int,
foreign key (lapsID) references laps(lapsID)
);
insert into loom(loomnimi, lapsID)
values 
('kass shari', 1),
('koer Bbobik', 2),
('morskaja svinka hrusha', 3),
('kinguru tuzik', 3),
('elevant mõsh', 3);

select * from loom;
--select seotud tabeli põhjal
select * from loom, laps; -- ei näita õiget andmet


 --- INNER JOIN ЭТО ВНУТРЕНЕЕ СОИДЕНЕНИЕ
select * from loom
INNER JOIN laps
on loom.lapsID=laps.lapsID;

select * from loom,laps
where loom.lapsID=laps.lapsID;

---lihtne vaade
select l.loomnimi, la.nimi, la.synniaatsta
from loom l,laps la
where l.lapsID=la.lapsID;
