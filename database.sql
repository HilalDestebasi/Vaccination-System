--CREATE OPERATIONS
CREATE TABLE Person(
  person_id Serial,
  person_name character varying(30) NOT NULL,
  person_surname character varying(30) NOT NULL,
  age INTEGER NOT NULL,
  gender CHARACTER varying(10) NOT NULL,
  city character varying(25) NOT NULL,
  town CHARACTER VARYING(25) NOT NULL,
  address CHARACTER VARYING(60) NOT NULL,
  hes SERIAL,
  CONSTRAINT pk_person_id PRIMARY KEY (person_id),
  CONSTRAINT un_person_id UNIQUE(person_id),
  CONSTRAINT un_hes UNIQUE(hes)
);
CREATE TABLE HES(
  h_hes INTEGER not NULL,
  phone_number CHARACTER VARYING(15),
  health CHARACTER VARYING(15) NOT NULL,
  vaccination CHARACTER VARYING(15) NOT NULL,
  CONSTRAINT chk_health CHECK("health" IN('risky','risk-free')),
  CONSTRAINT chk_vaccination CHECK("vaccination" IN('vaccinated','unvaccinated')),
  FOREIGN KEY (h_hes) REFERENCES person(hes) ON DELETE CASCADE
);
CREATE TABLE medical_center(
  mc_id serial,
  mc_name CHARACTER VARYING(60) NOT NULL,
  city character varying(25) NOT NULL,
  town CHARACTER VARYING(25) NOT NULL,
  address CHARACTER VARYING(60) NOT NULL,
  CONSTRAINT pk_mc_id PRIMARY KEY (mc_id),
  CONSTRAINT un_mc_id UNIQUE(mc_id)
);
CREATE TABLE paramedic(
  paramedic_id serial,
  paramedic_name CHARACTER VARYING(30) NOT NULL,
  paramedic_surname CHARACTER VARYING(30) NOT NULL,
  p_mc_id INTEGER NOT NULL,
  CONSTRAINT pk_paramedic_id PRIMARY KEY(paramedic_id),
  CONSTRAINT un_paramedic_id UNIQUE(paramedic_id),
  FOREIGN KEY (p_mc_id) REFERENCES medical_center(mc_id) ON DELETE CASCADE
);
CREATE table vaccine_type(
  vac_name CHARACTER VARYING(30) not NULL,
  vac_country CHARACTER VARYING(30) not NULL,
  vac_type_id serial,
  CONSTRAINT pk_vac_type_id PRIMARY KEY (vac_type_id),
  CONSTRAINT un_vac_type_id UNIQUE(vac_type_id)
);
CREATE TABLE vaccine(
  vac_date date not NULL DEFAULT CURRENT_DATE,
  type_id integer not NULL,
  v_person_id Integer not NULL,
  v_paramedic_id INTEGER NOT NULL,
  FOREIGN KEY (v_person_id) REFERENCES person(person_id) ON DELETE CASCADE,
  FOREIGN KEY (v_paramedic_id) REFERENCES paramedic(paramedic_id) ON DELETE CASCADE,
  FOREIGN KEY (type_id) REFERENCES vaccine_type(vac_type_id) ON DELETE CASCADE
);

--INSERT OPERATIONS
INSERT into person(person_name,person_surname,age,gender,city,town,address)
VALUES	('zeynep','deste',18,'female','Tokat','merkez','bah??eli evler mahallesi'),
	('hilal','ba????',28,'female','??zmir','buca','fatih caddesi'),
        ('t??lin','sara??lar',38,'female','??stanbul','kartal','malkayas?? ??hlamur evleri'),
        ('osman','desteba????',48,'male','Erzurum','mercan','kar????yaka mahallesi'),
        ('ay??e','abbas',58,'female','Erzincan','tercan','4Nolu sa??l??k oca???? kar????s??'),
        ('nur','cihad',68,'female','Mu??','varto','b??y??k otel kar????s??'),
        ('d??rdane','serto??lu',78,'female','Antalya','alanya','novada ??n??'),
        ('beyza','y??lmaz',88,'female','Amasya','merkez','no: 146 B blok'),
        ('bu??ra','arslan',98,'male','Eski??ehir','han','vali rahmi bey soka????'),
        ('sena','alpat',8,'female','Ayd??n','ku??adas??','otogar??n kar????s??'),
	('seda','kaya',32,'female','Samsun','bafra','atat??rk bulvar??'),
	('zeliha','demir',34,'female','Van','erci??','gazi osman pa??a caddesi'),
        ('mustafa','??????k',50,'male','Giresun','merkes','15 temmuz ??ehitler caddesi'),
        ('melih','y??lmaz',55,'male','G??m????hane','ku??luk','no: 327 posta kodu:60100'),
        ('t??lay','sert',72,'female','Ni??de','keltik','k??me evler'),
	('Ali','Aslan',47,'male','Tokat','merkez','mahalle cadde');

insert into hes(h_hes,phone_number,health,vaccination)
values	(1,'0542379599','risky','unvaccinated'),
	(2,'0542248327','risk-free','vaccinated'),
        (3,'0528342409','risk-free','unvaccinated'),
        (4,'0542192389','risky','unvaccinated'),
        (5,'0562738433','risk-free','vaccinated'),
        (6,'0583593985','risky','vaccinated'),
        (7,'0584389403','risk-free','unvaccinated'),
        (8,'0510232180','risky','vaccinated'),
        (9,'0542374294','risky','unvaccinated'),
        (10,'053842899','risk-free','unvaccinated'),
	(11,'0328949233','risky','unvaccinated'),
	(12,'0237482748','risk-free','vaccinated'),
        (13,'0239842343','risk-free','unvaccinated'),
        (14,'0984383893','risky','unvaccinated'),
        (15,'05534849876','risk-free','vaccinated'),
	(16,'05438293344','risky','unvaccinated');

insert into vaccine_type(vac_name,vac_country)
VALUES	('Sinovac','China'),
	('Biontech','Germany');

INSERT INTO medical_center(mc_name,city,town,address)
values	('seyfi demirsoy','??zmir','t??naztepe','3??itim fak??ltesi'),
	('medical park','Tokat','almus','g??l kenar??'),
	('Dokuz Eyl??l University Hospital','??zmir','fahrettin altay','bimden 50 m sonra sa??da');

INSERT into paramedic(paramedic_name,paramedic_surname,p_mc_id)
VALUES	('??mer','deste',1),
	('faruk','ba????',1),
        ('beyza','baldan',2),
	('yasin','erdem',3);

INSERT into vaccine(vac_date,type_id,v_person_id,v_paramedic_id)
VALUES ('2021-03-12','1','1','1'),
	('2021-04-12','1','2','2'),
        ('2021-05-12','2','3','2'),
        ('2021-06-12','1','4','3'),
        ('2021-07-12','2','5','1'),
	('2022-03-12','1','6','4'),
	('2022-04-12','1','7','4'),
        ('2022-05-12','2','8','4'),
	('2021-08-12','1','10','1'),
	('2021-09-12','1','12','2'),
        ('2021-10-12','2','13','2'),
        ('2021-11-12','1','14','3'),
        ('2021-01-12','2','15','1'),
	('2021-03-12','1','16','3');

