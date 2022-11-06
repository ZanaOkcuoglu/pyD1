-- Primary Key oluşturma 1 yol
CREATE TABLE ogrenciler5
(
id char(4) PRIMARY KEY,
isim varchar(50) NOT NULL,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date
);
-- Primary key oluşturma 2. yol
CREATE TABLE ogrenciler4
(
id char(4),
isim varchar(50) NOT NULL,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date,
CONSTRAINT ogrpk PRIMARY KEY (id)
);

---------- PK --| Foreign Key
CREATE TABLE tedarikciler3
(
tedarikci_id char(10),
tedarikci_ismi varchar(50),
iletisim_isim varchar(50),
CONSTRAINT tedarikci_pk PRIMARY KEY (tedarikci_id)
);


CREATE TABLE urunler
(
tedarikci_id char(10),
product_id char(10),
CONSTRAINT urunler_fk FOREIGN KEY (tedarikci_id)

REFERENCES tedarikciler3 (tedarikci_id)
);

--------------------
Instructor Erol Evren
 5:07 PM
CREATE TABLE calisanlar
(
id varchar(10) Primary Key,
isim varchar(30) Unique,
maas int not null,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id char(10),
sokak varchar(10),
cadde varchar(10),
sehir varchar(10),
CONSTRAINT adrsfk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
)
INSERT INTO calisanlar VALUES('10902', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('11012', 'B. Mehmet Sahin', 5000, '2018-04-14'); -- Unique olduğu için kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', 4500, '2019-04-12'); -- Not null olduğu için kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CANO', 5000, '2018-04-14'); -- Unique olduğu için kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', 4950, '2018-04-14'); -- Not null olduğu için kabul etmez
INSERT INTO calisanlar VALUES('10666', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('10125', 'osman can', 2000, '2018-04-14');  -- Unique olduğu için kabul etmez
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- Primary Key
INSERT INTO calisanlar VALUES( '10522', 'filiz ' ,12000, '2018-04-14'); -- Primary Key
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');
SELECT * from calisanlar;
SELECT * from adresler;
select calisanlar.isim, adresler.sehir from calisanlar, adresler
where calisanlar.id = adresler.adres_id;



-- CHECK Constraint Kullanımı
CREATE TABLE sehirler2
(
alan_kodu int PRIMARY KEY,
isim varchar(20) NOT NULL,
nufus int CHECK (nufus>0)
);
INSERT INTO sehirler2 VALUES (123,'erol',-5000); -- olmadi
INSERT INTO sehirler2 VALUES (123,'erol',5005);  -- oldu :)
SELECT * from sehirler2;