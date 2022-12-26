create or replace trigger majus_td
after insert or update of NIVEAU on TD
for each row
begin
update TD set NIVEAU = UPPER(:new.NIVEAU);
end;
/

create or replace trigger majus_codeUE
after insert or update of codeUE on INSCRIPTION
for each row
begin
update INSCRIPTION set codeUE= UPPER(:new.codeUE);
end;
/

create or replace trigger max_ue
before insert on INSCRIPTION
for each row
declare
nb_ue integer;
begin
select count(*) into nb_ue from INSCRIPTION WHERE noEtud=:new.noEtud ;
if nb_ue >= 6 then RAISE_APPLICATION_ERROR(10000,'insertion interdite');
end if;
end;
/

create or replace trigger max_td_ue
before insert on TD
for each row
declare
nb_td integer;
begin
select count(*) into nb_td from TD WHERE codeUE=:new.codeUE;
if nb_td >= 4 then RAISE_APPLICATION_ERROR(10000,'insertion interdite');
end if;
end;
/



create or replace trigger max_ue_etudiant
before insert on INSCRIPTION
for each row
declare
nb_td integer;
begin
select count(*) into nb_td from TD WHERE noTD = :new.noTD GROUP BY noEns;
if nb_td >= 2 then RAISE_APPLICATION_ERROR(10000,'insertion interdite');
end if;
end;
/


create or replace trigger nouveau_td
before insert on INSCRIPTION
for each row
declare
jour date;
heure timestamp;
salle varchar(10);

begin
select jour, heure, salle into jour, heure, salle from TD
WHERE noTD = :new.noTD;
insert into LOCETUD values (:new.NoEtud, jour, heure , salle); 
end;
/


