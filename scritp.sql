-- LOG720
-- LAB2
-- Equipe 4-----------------------
-- references creation
-----------------------
-- Members : Libam

-----------------------
-- drop tables
-----------------------

DROP TABLE IF EXISTS dossier_infraction;
DROP TABLE IF EXISTS dossier_reaction;
DROP TABLE IF EXISTS reaction ;
DROP TABLE IF EXISTS infraction ;
DROP TABLE IF EXISTS dossier ;


------------------
-- table creation
------------------

CREATE TABLE reaction (
   id_reaction SERIAL 
  ,niveau int NOT NULL
  ,description varchar (300) 
  ,PRIMARY KEY("id_reaction")
);

CREATE TABLE infraction (
   id_infraction SERIAL 
  ,niveau int NOT NULL
  ,description varchar (300)
  ,PRIMARY KEY("id_infraction")
);

CREATE TABLE dossier (
   id_dossier SERIAL 
  ,nom varchar(50) NOT NULL
  ,prenom varchar(50) NOT NULL
  ,noplaque varchar(8) NOT NULL
  ,nopermis varchar(8) NOT NULL
  ,PRIMARY KEY("id_dossier")
);

CREATE TABLE dossier_reaction (
   ordre SERIAL
  ,id_dossier int NOT NULL
  ,id_reaction int NOT NULL
  ,PRIMARY KEY("ordre","id_dossier","id_reaction")
);

CREATE TABLE dossier_infraction (
   ordre SERIAL
  ,id_dossier int NOT NULL
  ,id_infraction int NOT NULL
  ,PRIMARY KEY("ordre","id_dossier","id_infraction")
);


CREATE TABLE users
(
   user_name varchar(15) NOT NULL
  ,user_pass varchar(15) NOT NULL
  ,PRIMARY KEY("user_name")
);


CREATE TABLE roles
(
   role_name varchar(15) NOT NULL
  ,PRIMARY KEY("role_name")
);

CREATE TABLE user_roles
(
   user_name varchar(15) NOT NULL
  ,role_name varchar(15) NOT NULL
  ,PRIMARY KEY("user_name","role_name")
);

-----------------------
-- references creation
-----------------------

ALTER TABLE user_roles ADD CONSTRAINT fk_user_roles_user_name FOREIGN KEY (user_name) REFERENCES users (user_name); 
ALTER TABLE user_roles ADD CONSTRAINT fk_user_roles_role_name FOREIGN KEY (role_name) REFERENCES roles (role_name); 
ALTER TABLE dossier_reaction ADD CONSTRAINT fk_dossier_reaction_id_dossier FOREIGN KEY (id_dossier) REFERENCES dossier (id_dossier); 
ALTER TABLE dossier_reaction ADD CONSTRAINT fk_dossier_reaction_id_reaction FOREIGN KEY (id_reaction) REFERENCES reaction (id_reaction); 
ALTER TABLE dossier_infraction ADD CONSTRAINT fk_dossier_infraction_id_dossier FOREIGN KEY (id_dossier) REFERENCES dossier (id_dossier); 
ALTER TABLE dossier_infraction ADD CONSTRAINT fk_dossier_infraction_id_infraction FOREIGN KEY (id_infraction) REFERENCES infraction (id_infraction); 
ALTER TABLE dossier ADD CONSTRAINT unique_permit_nubmber UNIQUE (nopermis);


-----------------------
--  Insert data
-----------------------

--Infraction Table

insert into infraction (niveau, description) values(9,'Pissing on the street');

insert into infraction (niveau, description) values(7,'Burning lights');

insert into infraction (niveau, description) values(4,'Walking nacked');

insert into infraction (niveau, description) values(11,'Insulting an officer');

insert into infraction (niveau, description) values(10,'Beate his wife on the street');

--Folder Table

insert into dossier (prenom, nom, nopermis, noplaque)
  values ('Franck', 'Libam', '12345' , '54325');

insert into dossier (prenom, nom, nopermis, noplaque)
  values ('Don', 'Draper', 'gul251' , '251gul');

insert into dossier (prenom, nom, nopermis, noplaque)
  values ('Rafael', 'Nadal', 'rafa2000' , '2000rafa');


--infraction_dossier Table

insert into dossier_infraction (id_dossier,id_infraction) 
  values(4,770);

insert into dossier_infraction (id_dossier,id_infraction) 
  values(4,771);

insert into dossier_infraction (id_dossier,id_infraction) 
  values(4,772);

insert into dossier_infraction (id_dossier,id_infraction) 
  values(4,773);

insert into dossier_infraction (id_dossier,id_infraction) 
  values(4,773);

-- roles insertion

insert into roles (role_name) values('administrateur');
insert into roles (role_name) values ('policier');

-- users insertion 

insert into users (user_name,user_pass) values ('franck','tomcat');

insert into users (user_name,user_pass) values ('admin','admin');

-- relationship between users and roles

insert into user_roles (user_name,role_name) values ('franck', 'policier');

insert into user_roles (user_name, role_name) values ('admin', 'administrateur');
