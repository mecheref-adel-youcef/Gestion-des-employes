DROP DATABASE stage;
CREATE DATABASE stage;
	USE stage;

	CREATE TABLE Employee(
		IdEmp int auto_increment primary key ,
		Nom varchar(20) not null  ,
		Prenom varchar(20) not null ,
		gendre varchar(20) not null ,
		DateDemploi datetime default now(),	
		Phone varchar(20) not null,
    	Salaire int  not null,
		wilaya varchar(20) not null,
		Photo varchar(100)  default 'photo_stage/profil.jpg' , /*lien du photo*/
		Description text not null 
		
		);
	

/*

	SELECT * FROM employee where nom like "%woman%" or 
	prenom like "%woman%" or gendre like "%woman%" or 
	datedemploi like "%woman%" or phone like "%woman%" or 
	salaire like "%woman%" or wilaya like "%woman%" or 
	description like "%woman%"  ;*/