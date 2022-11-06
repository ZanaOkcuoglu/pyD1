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