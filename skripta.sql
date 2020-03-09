drop database if exists bazapp;
create database bazapp default character set utf8;
# ovu sljedeću liniju copy/psate u command prompt
# PRIPAZITI SAMO NA PUTANJU DATOTEKE
# c:\xampp\mysql\bin\mysql.exe -uedunova -pedunova --default_character_set=utf8 < C:\xampp\htdocs\projekt\skripta.sql



use bazapp;

/* kreiranje tablice mt */
create table mt(
sifra       int not null primary key auto_increment,
mt_broj		varchar(10) not null, /* mt_broj => 1030, 1040 .... */
noj     	char(60) not null /* og(organizacijska jedinica) => marketing / it podrska .... */
);


/* kreiranje tablice racunalo */
create table racunalo(
sifra           int not null primary key auto_increment,
naziv		    varchar(20) not null, /* pc-racunalo */
ip			    varchar(50) not null, /* ip adresa racunala */
tip             int not null, /* vanjski ključ */
aktivan		    boolean, /* status - aktivno/neaktivno */
invbr		    varchar(10) not null, /* inventarni broj => 2685 */
wsname		    int not null, /* poveznica s ERP sustavom */
terminal	    varchar(50) not null, /* poveznica s RDP(remote desktop access */
mt 				int not null /* vanjski ključ */
);


/* kreiranje tablice operater */
create table operater(
sifra       int not null primary key auto_increment,
email       varchar(50) not null,
lozinka     char(60) not null,
ime         varchar(50) not null,
prezime     varchar(50) not null,
uloga       varchar(20) not null
);


create table tip(
sifra       int not null primary key auto_increment,	
naziv		varchar(20) not null /* radna stanica, kasa, server */
);


insert into operater values 
(null,'renato.topic@gmail.com',
'1234','Edunova','Operater','oper');
insert into operater values 
(null,'admin@gmail.com',
'9876','Edunova','Administrator','admin');
insert into operater values 
(null,'pero.peric@gmail.com',
'9876','Edunova','Operater','oper');


/*
insert tablica 'mt' 
*/

insert into mt(sifra,mt_broj,noj)
	values 
(null,1099,'PJ Transport'),
(null,1271,'PJ Servis'),
(null,1110,'GS Ivankovo'),
(null,1120,'GS Vinkovci'),
(null,1140,'GS Valpovo'),
(null,1150,'TPJ Osijek'),
(null,1205,'TPJ Vinkovci'),
(null,1210,'TPJ Vukovar'),
(null,1215,'TPJ Đakovo'),
(null,1220,'TPJ Slatina'),
(null,1225,'TPJ Daruvar'),
(null,1230,'TPJ Našice'),
(null,1235,'TPJ Našice'),
(null,1240,'TPJ Valpovo'),
(null,1245,'TPJ Osijek');


/*
insert tablica 'racunalo' 
*/

insert into racunalo(sifra,naziv,ip,tip,aktivan,invbr,wsname,terminal,mt)
	values 
(null,'PC03-02','10.45.0.20','1','true','2385','101','pcentar33','1'),
(null,'PC02-08','10.45.0.18','2','true','1425','121','terminal48','5'),
(null,'PC01-05','10.40.0.10','3','true','1719','333','pcentar12','3'),
(null,'PC06-07','10.45.10.20','2','true','5459','212','terminal232','2');



/*
insert tablica 'tips' 
*/
insert into tip(sifra,naziv)
	values
(null,'radna stanica'),
(null,'kasa'),
(null,'server');


/* 
POVEZIVANJE TABLICA
*/

alter table racunalo add foreign key (sifra) references mt(sifra);

alter table racunalo add foreign key (tip) references tip(sifra);

