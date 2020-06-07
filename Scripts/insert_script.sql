--  purpose:	DDL script for database school project
--  author:     Jakub Böhm

SET AUTOCOMMIT ON;

--CHANGES DATE FORMAT, SO 7 BYTE DATE TYPE CAN FIT TIME ASWELL
commit;
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-mm-YYYY hh24:mi:ss';

--I AM NOT INSERTING ANY PRIMARY KEYS, I MADE SEQUENCES AND TRIGGERS GENERATING THEM

commit;
insert into zeme(nazev, zkratka) values ('Německo','D');
insert into zeme(nazev, zkratka) values ('Belgie','B');
insert into zeme(nazev, zkratka) values ('Česká republika','CZ');
insert into zeme(nazev, zkratka) values ('Arizona','AZ');
insert into zeme(nazev, zkratka) values ('Severní Karolína','NC');
insert into zeme(nazev, zkratka) values ('Georgie','GA');
insert into zeme(nazev, zkratka) values ('Izrael','IL');
insert into zeme(nazev, zkratka) values ('Švýcarsko','CH');
insert into zeme(nazev, zkratka) values ('Tennessee','TN');
insert into zeme(nazev, zkratka) values ('New York','NY');
insert into zeme(nazev, zkratka) values ('Connecticut','CT');
insert into zeme(nazev, zkratka) values ('Massachusetts','MA');
insert into zeme(nazev, zkratka) values ('Francie','F'); --13

insert into typ(nazev) values('Revolver'); --1
insert into typ(nazev) values('Pistole');
insert into typ(nazev) values('Samopal');
insert into typ(nazev) values('Osobní obranná zbraň');
insert into typ(nazev) values('Karabina');
insert into typ(nazev) values('Útočná puška');
insert into typ(nazev) values('Puška');
insert into typ(nazev) values('Lehký kulomet');
insert into typ(nazev) values('Granátomet');
insert into typ(nazev) values('Minomet');
insert into typ(nazev) values('Dělo'); --11
insert into typ(nazev) values('Odstřelovací puška');
insert into typ(nazev) values('Brokovnice');

insert into adresa(mesto, PSC, id_zeme) values ('Oberndorf am Neckar','78727', 1);
insert into adresa(mesto, PSC, id_zeme) values ('Herstal','4040', 2);
insert into adresa(mesto, PSC, id_zeme) values ('Uherský Brod','68801', 3);
insert into adresa(mesto, PSC, id_zeme) values ('Phoenix','85024', 4);
insert into adresa(mesto, PSC, id_zeme) values ('Madison','27025', 5);
insert into adresa(mesto, PSC, id_zeme) values ('Black Creek','31308', 6);
insert into adresa(mesto, PSC, id_zeme) values ('Ramat-Hasharon','4710001', 7);
insert into adresa(mesto, PSC, id_zeme) values ('Eckernförde','24340', 1);
insert into adresa(mesto, PSC, id_zeme) values ('Murfreesboro','37133', 9);
insert into adresa(mesto, PSC, id_zeme) values ('Ilion','13357', 10);
insert into adresa(mesto, PSC, id_zeme) values ('Hartford','06144', 11);
insert into adresa(mesto, PSC, id_zeme) values ('Springfield','01104', 12);

insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Heckler and Koch GmbH',1948,1);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Fabrique Nationale Herstal',1889,2);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Česká zbrojovka a.s.',1936,3);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Armalite',1954,4);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Bushmaster Firearms International',1973,5);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Daniel Defense, Inc',2002,6);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Israel Weapon Industries',1933,7);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('SIG Sauer GmbH and Co.KG',1976,8);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Barrett Firearms Manufacturing',1982,9);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Remington Arms Company, LLC',1816,10);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Colt''s Manufacturing Company, LLC',1855,11);
insert into vyrobce(nazev, rokZalozeni, id_adresy) values ('Smith and Wesson',1852,12);

--ADDRESSES ARE MOSTLY MADE UP, AS WELL AS CUSTOMERS ( used fakenamegenerator.com )

insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Braunerova','2071','Praha','18000',3); --13
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Bystřická','30','Bystrovany','77900',3);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Adelova','211','Plzeň','30100',3);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Česká','222','České Budějovice','37001',3);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Klimenta Čermáka','1247','Čáslav','28601',3);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Strickstrasse','113','Zürich','8015',8);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Stationsstraat','407','Idegem','9506',2);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Prager Str','66','Starnberg','82304',1);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Družstevní','86','Unhošt','27351',3);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Jindřichova','171','Stráž nad Nežárkou','37802',3);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Jiráskova','281','Slatinany','53821',3);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Rue de Strasbourg','29','CLERMONT-FERRAND','63000',13);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Strmá','271','Kuncice pod Ondrejníkem','73913',3);
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Pivovarská','808','Praha','18000',3); --26
insert into adresa(ulice, cisloPopis, mesto, PSC, id_zeme) values('Sokolská','11','Praha','18000',3); --27

insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Martin','Cvoček','+420151515155','macvocek@seznam.cz', 13);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Kateřina','Bledá','+420656520201','bledk@email.cz', 14);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Rudolf','Starý','+420778845663','kocicka1512@seznam.cz', 15);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Jiří','Novák','+420774444125','nvjirik@volny.cz', 16);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Monika','Procházková','+420325566030','MonikaProchazkova@armyspy.com', 17);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Lucas','Eiffel','+41-31-2426271','LucasEiffel@teleworm.us', 18);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Julie','Cvočková','+420333454741','jucvocek@seznam.cz', 13);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Hur Ibtihal','Tannous','0495661352','HurIbtihalTannous@rhyta.com', 19);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Yasmin','Baxter','08151929920','YasminBaxter@teleworm.us', 20);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Vladislav','Kolesnikov','+420779857009','VladislavKolesnikov@teleworm.us', 21);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Zemfira','Vinogradova','+420397293026','ZemfiraVinogradova@rhyta.com', 22);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Carolina','Shcherbakova','+420469289922','CarolinaShcherbakova@dayrep.com', 23);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Ármann','Svavarsson','04.43.35.21.03','ArmannSvavarsson@teleworm.us', 24);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Alexander','Straka','+420593630891','AlexanderStraka@rhyta.com', 25);
insert into zakaznik(jmeno, prijmeni, telefon, email, id_adresy) values('Václav','Vacek','+420329026649','VaclavVacek@armyspy.com', 26);

insert into polozka(cena) values(9); --1
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values(1,'5.56x45mm NATO',190,915,1765); --1
insert into polozka(cena) values(85000); --2
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values(2,'TSV6259ART','G36C',1997,1,6,1); --2
insert into polozka(cena) values(4); --3
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values(3,'9x19mm Parabellum',130,340,450); --3
insert into polozka(cena) values(17000); --4
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (4,'R9FADXUWKA','MP5A1',1968,1,3,3); --4
insert into polozka(cena) values(19); --5
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values(5,'7.62x51mm NATO',392,838,3275); --5
insert into polozka(cena) values(105000); --6
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (6,'AHU5ZDB3LB','PSG1',1970,1,12,5); --6
insert into polozka(cena) values(17000); --7
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (7,'N7QLXNB82U','P2000',1982,1,2,3); --7
insert into polozka(cena) values(50); --8
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values (8,'12 Gauge',617,114,1500); --8
insert into polozka(cena) values(60000); --9
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (9,'8XBY8AE53J','HK512',1970,1,13,8); --9
insert into polozka(cena) values(45000); --10
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (10,'RXDTDHMDAQ','G3',1950,1,6,5); --10
insert into polozka(cena) values(35000); --11
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (11,'ULMLMRPGRN','HK33',2001,1,6,1); --11
insert into polozka(cena) values(60000); --12
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (12,'ESGL2AVL2S','FAL',1953,2,6,5); --12
insert into polozka(cena) values(7); --13
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values (13,'5.7x28mm',120,650,540); --13
insert into polozka(cena) values(20000); --14
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (14,'59VGHT5UBQ','Five-seveN',1995,2,2,13); --14
insert into polozka(cena) values(45000); --15
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (15,'LFPQNTE49E','F2000',2001,2,4,1); --15
insert into polozka(cena) values(65000); --16
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (16,'9YBZZ3NEUR','SCAR-L',2004,2,6,1); --16
insert into polozka(cena) values(70000); --17
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (17,'EFYFYHEUA8','SCAR-H',2006,2,6,5); --17
insert into polozka(cena) values(10); --18
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values (18,'7.62x39mm',250,718,2036); --18
insert into polozka(cena) values(8900); --19
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (19,'4T3H2CJGD6','Vz.58',1958,3,6,18); --19
insert into polozka(cena) values(10000); --20
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (20,'G746Q3XTEX','CZ-75',1975,3,2,3); --20
insert into polozka(cena) values(15000); --21
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (21,'EFNW9Q5LWJ','CZ 805 BREN',2011,3,6,1); --21
insert into polozka(cena) values(9000); --22
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (22,'3TWSE335EY','AR-10',1958,4,6,5); --22
insert into polozka(cena) values(56000); --23
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (23,'6FSA3QJTQB','AR-15',1958,4,6,1); --23
insert into polozka(cena) values(45000); --24
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (24,'FVFGCQTRDK','Masada',2006,5,6,1); --24
insert into polozka(cena) values(15000); --25
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (25,'NHQHC4753A','M4 Carbine',1994,6,5,1); --25
insert into polozka(cena) values(40000); --26
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (26,'MTATN65P5T','TAR-21',2001,7,6,1); --26
insert into polozka(cena) values(7); --27
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values (27,'.45 ACP',231,260,507); --27
insert into polozka(cena) values(9000); --28
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (28,'974DQEZTTN','Uzi',1948,7,3,27); --28
insert into polozka(cena) values(19000); --29
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (29,'PYX74EFQTR','Jericho 941',1990,7,2,27); --29
insert into polozka(cena) values(110000); --30
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (30,'DBEJY7FGW9','Negev NG-7',1985,7,8,5); --30
insert into polozka(cena) values(15000); --31
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (31,'WYQVTYFTDX','P226',1980,8,2,3); --31
insert into polozka(cena) values(35000); --32
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (32,'74GJJT8U6J','MPX',2013,8,4,3); --32
insert into polozka(cena) values(15000); --33
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (33,'MF5GTJSKCX','P224',1980,8,2,3); --33
insert into polozka(cena) values(110); --34
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values (34,'.50 BMG',624,900,17205); --34
insert into polozka(cena) values(150000); --35
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (35,'MWLY28W8PS','M82',1980,9,12,34); --35
insert into polozka(cena) values(100); --36
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values (36,'25x59mm',3086,600,14500); --36
insert into polozka(cena) values(150000); --37
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (37,'E7G3WCFW6E','XM109',1994,9,12,36); --37
insert into polozka(cena) values(30000); --38
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (38,'JU6XD5R9AW','R700',1962,10,12,5); --38
insert into polozka(cena) values(12000); --39
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (39,'SCNML3GM8H','Colt 1911',1911,10,2,27); --39
insert into polozka(cena) values(4); --40
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values (40,'.32 ACP',73,320,240); --40
insert into polozka(cena) values(30000); --41
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (41,'8UBCMHMWZX','Colt 1903',1903,11,2,40); --41
insert into polozka(cena) values(6); --42
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values (42,'.44 Magnum',240,360,1008); --42
insert into polozka(cena) values(20000); --43
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (43,'243NCHVSBN','.44 Magnum',1950,12,1,42); --43
insert into polozka(cena) values(10); --44
insert into munice(id_polozky, nazev, hmotnost, rychlost, energie) values (44,'.500 Magnum',325,550,3174); --44
insert into polozka(cena) values(35000); --45
insert into zbran(id_polozky, vyrCis, nazevModelu, rokNavrhu, id_vyr, id_typu, id_munice) values (45,'U9J4FSMTTN','.500 Magnum',2003,12,1,44); --45

insert into zamestnanec(jmeno,prijmeni,zamCis) values('Kryštof','Pochobradský','693872GRTSH3');
insert into zamestnanec(jmeno,prijmeni,zamCis) values('Jakub','Švibek','A6G673VPZKX8');
insert into zamestnanec(jmeno,prijmeni,zamCis) values('Petr','Tlustý','JAQS8JFBA7UK');
insert into zamestnanec(jmeno,prijmeni,zamCis) values('Zdeněk','Krupička','HQM468X29WZW');
insert into zamestnanec(jmeno,prijmeni,zamCis) values('Ondra','Pazourek','3D2GXRYF4GLH');
insert into zamestnanec(jmeno,prijmeni,zamCis) values('Matěj','Pilný','3D2G77GHGW');

insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('26-02-2018 18:36:23','',1,1); --1
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(1,1,30);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(1,2,1);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('03-01-2017 13:05:55','',2,4); --2
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(2,8,15);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(2,9,1);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('30-12-2017 16:22:44','',3,2); --3
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(3,27,60);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(3,28,1);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('22-10-2018 14:00:02','',4,4); --4
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(4,34,30);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('06-05-2018 14:22:01','',5,5); --5
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(5,2,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(5,23,2);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(5,1,120);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('07-01-2019 15:41:20','',6,3); --6
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(6,25,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(6,26,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(6,1,60);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('27-01-2019 11:44:59','',4,1); --7
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(7,18,60);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('17-02-2019 13:21:14','',7,5); --8
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(8,12,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(8,5,15);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('16-02-2019 13:22:44','',4,2); --9
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(9,4,2);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('17-02-2019 13:21:14','',7,5); --10
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(10,13,10);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('26-03-2019 11:12:11','',8,1); --11
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(11,29,1);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('26-04-2019 16:22:45','',9,2); --12
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(12,30,1);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('20-11-2018 14:14:16','',10,4); --13
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(13,3,50);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(13,32,1);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('30-01-2019 17:14:16','',11,2); --14
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(14,24,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(14,1,30);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('14-10-2018 16:14:55','',12,1); --15
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(15,17,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(15,5,60);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(15,22,1);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('01-05-2019 15:00:14','',13,4); --16
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(16,10,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(16,5,30);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('11-03-2018 14:55:44','',14,5); --17
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(17,15,1);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('21-01-2019 16:14:24','',15,2); --18
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(18,15,1);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('26-02-2019 18:11:36','',6,2); --19
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(19,19,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(19,18,30);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(19,31,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(19,3,30);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(19,21,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(19,1,30);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('05-06-2018 16:19:02','',1,5); --20
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(20,11,1);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('11-01-2018 10:12:55','',7,3); --21
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(21,5,60);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('14-04-2019 16:41:37','',3,5); --22
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(22,27,60);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('27-07-2018 16:14:55','',11,4); --23
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(23,27,60);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('22-09-2018 14:55:12','',12,3); --24
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(24,8,15);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('01-10-2018 10:10:55','',15,2); --25
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(25,6,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(25,5,15);
insert into prodej(datProd,pozn,id_zakaznika,id_zam) values('12-2-2018 15:15:44','',3,6); --26
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,2,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,15,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,20,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,23,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,24,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,25,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,29,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,33,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,35,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,38,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,41,1);
insert into prodej_polozky(id_prodeje,id_polozky,mnozstvi) values(26,45,1);
