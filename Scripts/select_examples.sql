select nazevModelu, rokNavrhu from zbran inner join vyrobce on zbran.id_vyr = vyrobce.id_vyr
where vyrobce.nazev = 'Česká zbrojovka a.s.';

select jmeno, prijmeni from zakaznik inner join adresa on adresa.id_adresy = zakaznik.id_adresy
inner join zeme on adresa.id_zeme = zeme.id_zeme
where zeme.zkratka != 'CZ';

select nazevModelu, nazev from zbran inner join typ on
zbran.id_typu = typ.id_typu;

select distinct zeme.id_zeme as key1, zeme.nazev as z1 from zeme  
inner join adresa on adresa.id_zeme = zeme.id_zeme
inner join vyrobce on vyrobce.id_adresy = adresa.id_adresy
inner join zbran on zbran.id_vyr = vyrobce.id_vyr
where zbran.id_typu = 6
minus
select distinct zeme.id_zeme as key1, zeme.nazev as z1 from zeme  
inner join adresa on adresa.id_zeme = zeme.id_zeme
inner join vyrobce on vyrobce.id_adresy = adresa.id_adresy
inner join zbran on zbran.id_vyr = vyrobce.id_vyr
where zbran.id_typu != 6;

select z.jmeno, z.prijmeni, sum(prodej_polozky.mnozstvi*polozka.cena) as utrata from zakaznik z
inner join adresa on z.id_adresy = adresa.id_adresy
inner join zeme on adresa.id_zeme = zeme.id_zeme
inner join prodej on prodej.id_zakaznika = z.id_zakaznika
inner join prodej_polozky on prodej_polozky.id_prodeje = prodej.id_prodeje
inner join polozka on polozka.id_polozky = prodej_polozky.id_polozky
where zeme.zkratka = 'CZ' group by z.jmeno, z.prijmeni;

select sum(prodej_polozky.mnozstvi) as mnozstvi from prodej_polozky
inner join polozka on polozka.id_polozky = prodej_polozky.id_polozky
inner join munice on munice.id_polozky = polozka.id_polozky
where munice.nazev='5.56x45mm NATO';

select v.id_vyr, v.nazev from vyrobce v 
inner join zbran on v.id_vyr = zbran.id_vyr
inner join typ on typ.id_typu = zbran.id_typu
where v.rokZalozeni < 1940
having count(DISTINCT zbran.id_typu) >= 3
group by v.id_vyr, v.nazev order by v.id_vyr;

select z.id_polozky, z.nazevModelu, polozka.cena, munice.nazev as nazevMunice from zbran z inner join
polozka on polozka.id_polozky = z.id_polozky inner join
munice on z.id_munice = munice.id_polozky
order by polozka.cena DESC, z.nazevModelu ASC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

select z.id_zam, z.jmeno, z.prijmeni from zamestnanec z inner join prodej on prodej.id_zam = z.id_zam 
inner join prodej_polozky on prodej_polozky.id_prodeje = prodej.id_prodeje 
inner join polozka p on p.id_polozky = prodej_polozky.id_polozky 
inner join zbran on zbran.id_polozky = p.id_polozky 
inner join vyrobce on zbran.id_vyr = vyrobce.id_vyr 
where zbran.id_vyr >= ALL (select id_vyr from vyrobce)
group by z.id_zam, z.jmeno, z.prijmeni;

select id_vyr from vyrobce
minus
select vyr.id_vyr from vyrobce vyr 
inner join zbran zbr on zbr.id_vyr = vyr.id_vyr 
inner join polozka pol on pol.id_polozky = zbr.id_polozky
inner join prodej_polozky prpl on prpl.id_polozky = pol.id_polozky
inner join prodej prod on prod.id_prodeje = prpl.id_prodeje
inner join zamestnanec zames on zames.id_zam = prod.id_zam
where zames.id_zam =
(select zames.id_zam from (select z.id_zam, z.jmeno, z.prijmeni from 
zamestnanec z inner join prodej on prodej.id_zam = z.id_zam 
inner join prodej_polozky on prodej_polozky.id_prodeje = prodej.id_prodeje 
inner join polozka p on p.id_polozky = prodej_polozky.id_polozky 
inner join zbran on zbran.id_polozky = p.id_polozky 
inner join vyrobce on zbran.id_vyr = vyrobce.id_vyr 
where zbran.id_vyr >= ALL (select id_vyr from vyrobce)
group by z.id_zam, z.jmeno, z.prijmeni));

select * from zbran natural join vyrobce;

select jmeno, prijmeni, zamCis from zamestnanec inner join prodej on
prodej.id_zam = zamestnanec.id_zam having count(prodej.id_zam) > 5 group by jmeno,prijmeni,zamCis;

select z.nazevModelu, z.roknavrhu, nazev  from zbran z cross join typ where typ.id_typu = z.id_typu and z.nazevModelu LIKE '%.%';

select id_polozky, cena, polozka_type from polozka where id_polozky not in (select id_polozky from prodej_polozky)

select typ.id_typu, nazev from typ left outer join zbran on zbran.id_typu = typ.id_typu 
where zbran.id_typu is NULL;

select ulice, cisloPopis, mesto, PSC, zkratka from adresa inner join zeme on
adresa.id_zeme = zeme.id_zeme full outer join zakaznik on
zakaznik.id_adresy = adresa.id_adresy full outer join vyrobce on
vyrobce.id_adresy = adresa.id_adresy 
where adresa.id_adresy not in (select id_adresy from zakaznik) and adresa.id_adresy
not in (select id_adresy from vyrobce);

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-mm-YYYY hh24:mi:ss';
select w.id_prodeje, w.datProd, w.pozn, z.jmeno, z.prijmeni from 
(select p.id_prodeje, p.datProd, p.pozn, p.id_zam
from prodej p 
where 2018=(to_char(p.datProd, 'YYYY'))
minus
select p1.id_prodeje, p1.datProd, p1.pozn, p1.id_zam
from prodej p1 inner join zamestnanec z on
z.id_zam = p1.id_zam and z.jmeno='Jakub' and z.prijmeni='Švibek'
where 2018=(to_char(p1.datProd, 'YYYY'))
) w inner join zamestnanec z on z.id_zam = w.id_zam;

select id_zam, jmeno, prijmeni, zamCis, (select count(id_prodeje) from prodej p where p.id_zam = z.id_zam ) as pocetProdeju from zamestnanec z;

select z.vyrCis as vc,z.nazevModelu as nm,z.rokNavrhu as rn,t.nazev as n1,v.nazev as n2,m.nazev as n3, p.cena as cena from zbran z inner join
typ t on t.id_typu = z.id_typu inner join
vyrobce v on v.id_vyr = z.id_vyr inner join
munice m on m.id_polozky = z.id_munice inner join
polozka p on p.id_polozky = z.id_polozky
where exists (select pp.cena from polozka pp where pp.id_polozky = z.id_polozky and cena > 15000)

select v.nazev from vyrobce v
inner join adresa a on a.id_adresy = v.id_adresy
inner join zeme z on z.id_zeme = a.id_zeme
where z.zkratka != 'D'
union
select za.prijmeni from zakaznik za
inner join adresa aa on aa.id_adresy = za.id_adresy
inner join zeme ze on ze.id_zeme = aa.id_zeme
where ze.zkratka != 'D';

select p.datProd, z.jmeno, z.prijmeni, pp.mnozstvi, m.nazev from prodej p
inner join zamestnanec z on z.id_zam = p.id_zam
inner join prodej_polozky pp on pp.id_prodeje = p.id_prodeje
inner join polozka po on po.id_polozky = pp.id_polozky
inner join munice m on m.id_polozky = po.id_polozky
where pp.mnozstvi >= 30
intersect
select p.datProd, z.jmeno, z.prijmeni, pp.mnozstvi, m.nazev from prodej p
inner join zamestnanec z on z.id_zam = p.id_zam
inner join prodej_polozky pp on pp.id_prodeje = p.id_prodeje
inner join polozka po on po.id_polozky = pp.id_polozky
inner join munice m on m.id_polozky = po.id_polozky
where (po.cena*pp.mnozstvi) > 1000;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-mm-YYYY hh24:mi:ss';
select z.id_zam, z.jmeno, z.prijmeni, z.zamCis from zamestnanec z
cross join prodej p 
where p.id_zam = z.id_zam
and 2017=(to_char(p.datProd, 'YYYY'))
having count(p.id_zam) >= 1
group by z.id_zam, z.jmeno, z.prijmeni, z.zamCis
order by z.id_zam ASC;

select z.id_zam, z.jmeno, z.prijmeni, z.zamCis from zamestnanec z
inner join prodej p on p.id_zam = z.id_zam
where 2017=(to_char(p.datProd, 'YYYY'))
having count(p.id_zam) >= 1
group by z.id_zam, z.jmeno, z.prijmeni, z.zamCis
order by z.id_zam ASC;

select z.id_zam, z.jmeno, z.prijmeni, z.zamCis from zamestnanec z
right join prodej p on p.id_zam = z.id_zam
where 2017=(to_char(p.datProd, 'YYYY'))
having count(p.id_zam) >= 1
group by z.id_zam, z.jmeno, z.prijmeni, z.zamCis
intersect
select z.id_zam, z.jmeno, z.prijmeni, z.zamCis from zamestnanec z
left join prodej p on p.id_zam = z.id_zam
where 2017=(to_char(p.datProd, 'YYYY'))
having count(p.id_zam) >= 1
group by z.id_zam, z.jmeno, z.prijmeni, z.zamCis
order by id_zam ASC;

create view zbrane_a_munice as
select z.nazevModelu, z.rokNavrhu, m.nazev from zbran z
inner join munice m on m.id_polozky = z.id_munice;

select zm.nazevModelu, zm.rokNavrhu from zbrane_a_munice zm
where zm.nazev = '5.56x45mm NATO';

insert into zamestnanec(jmeno,prijmeni,zamCis)
select jmeno,prijmeni,id_zakaznika from zakaznik;

update vyrobce set rokZalozeni = 2019
where rokZalozeni in (select rokZalozeni from vyrobce where nazev like '%f%');

delete from vyrobce
where id_vyr IN (select id_vyr from zbran inner join munice on zbran.id_munice = munice.id_polozky where munice.nazev = '5.56x45mm NATO');

select jmeno, prijmeni from zakaznik inner join adresa on
adresa.id_adresy = zakaznik.id_adresy
inner join zeme on zeme.id_zeme = adresa.id_zeme
where zeme.zkratka != 'D';

select id_vyr, nazev, rokZalozeni from vyrobce
where rokZalozeni < 1975
