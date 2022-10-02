--*The Basic Commands*
------------------------------------------------------------------ 
-- select
------------------------------------------------------------------ 

select * from patient;

select id_patient, sexe from patient;

select count(*) from patient;

-- Q1 Afficher la table séjour 
select * from sejour


-- where
------------------------------------------------------------------ 

select *
from patient 
where sexe = 'M';

select *
from patient
where date_naissance > '1960-01-01';

-- Q2 Sélectionner les patients de la ville 1
select * from patient 
where id_ville = '1'
-- Q3 Afficher les patients nés après le 31/03/1986
select * from patient 
where  date_naissance > '1986-03-31'


-- AND
------------------------------------------------------------------ 

select *
from patient
where date_naissance > '1960-01-01'
and sexe = 'F';

-- Q4 Afficher les séjours commencés après le 01/02/2020 dans l’hôpital 1
select *
from sejour
WHERE date_debut_sejour > '2020-02-01'
and id_hopital = '1'

-- IN
------------------------------------------------------------------ 

select * 
from patient
where id_ville in (1, 2);

-- Q5 Afficher les séjours des hôpitaux 1 et 3
select *
from sejour
WHERE 	id_hopital IN (1,3)

-- GROUP BY
------------------------------------------------------------------ 

select sexe, count(*)
from patient
group by sexe;

-- Q6 Compter le nombre de patient par ville
select id_ville, count(*)
from patient
group by id_ville;


-- Q7 Compter le nombre de séjours par hopital
select id_hopital, count(*)
from sejour
group by id_hopital;

-- INNER JOIN
------------------------------------------------------------------ 

select *
from patient p inner join ville v 
on p.id_patient = v.id_ville;

-- Q8 Modifier la requête précédente pour n'afficher que l'id_patient et le nom de la ville
select *
from patient p inner join ville v 
on p.id_ville = v.id_ville;

-- Q9 Afficher, pour chaque séjour, les hôptiaux dans lesquels ils ont eu lieu

select *
from sejour s inner join hopital h
on s.id_hopital = h.id_hopital;

-- Q10 Compter le nombre de patients par ville en affichant le NOM de la ville

select v.ville, count(id_patient) as nbr_patient from patient p inner join ville v
on p.id_ville = v.id_ville
group by v.ville;

-- Q11 Compter le nombre de séjours par hôpital en affichant le NOM de l'hôpital
select h.hopital, count(id_sejour) as nbr_sejour from sejour s
inner join hopital h
on s.id_hopital = h.id_hopital
group by h.hopital;

-- Q12 Compter le nombre de patients femme par ville en affichant le nom de la ville
select v.ville, count(id_patient) as nbr_patient from patient p 
inner join ville v
on p.id_ville = v.id_ville
where p.sexe = 'F'
group by v.ville;


-- Q13 Compter le nombre de séjours commençés après le 01/02/2020 pour chaque hôpital en affichant le nom de l'hôpital

select h.hopital, count(id_sejour) as nbr_sejour from sejour s 
inner join hopital h
on s.id_hopital = h.id_hopital
where date_debut_sejour > '2020-02-01'
group by h.hopital;

-- insert
------------------------------------------------------------------ 

-- Exécuter la requête et **interpréter** le résultat :

insert into ville
(id_ville, ville)
values(6, 'Béthune');
--Une ligne est ajoutée à la dernière ligne de la table de ville 
--où id_ville = 6 et ville = Béthune

-- Q13 Insérer Loos dans la table ville
insert into ville
(id_ville, ville)
values(7, 'Loos');

-- update
------------------------------------------------------------------ 

-- Exécuter la requête et **interpréter** le résultat :

update ville set ville = 'Lens' where id_ville = 6;

--la ville Béthune(id_ville=6) est remplacée par Lens

-- Q14 Remplacer le libellé de la ville numéro 7 par Douai
 
update ville set ville = 'Douai' where id_ville = 7;

-- delete
------------------------------------------------------------------ 

-- Exécuter la requête et **interpréter** le résultat :

delete from ville where id_ville = 6;

--La ville de Lens avec id_ville = 6 est suprimée 

-- Q15 supprimer la ville numéro 7
delete from ville where id_ville = 7;



