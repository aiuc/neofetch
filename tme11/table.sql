CREATE TABLE TD (
noTD smallint not null,
codeUE varchar(10),
niveau varchar(10),
salle varchar(10),
jour varchar(8) not null,
heure varchar(5) not null,
noEns smallint,
PRIMARY KEY ( NoTD, codeUE ),
UNIQUE (salle,jour,heure)) ;


CREATE TABLE INSCRIPTION (
noEtud smallint,
noTD smallint,
codeUE varchar(10),
PRIMARY KEY (noEtud, codeUE)) ;

CREATE TABLE LOCETUD (
NoEtud smallint,
Jour varchar(8),
Heure varchar(5),
Salle varchar(10),
PRIMARY KEY ( NoEtud, Jour, Heure ));
