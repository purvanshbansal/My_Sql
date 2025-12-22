use sakila;
select * from actor; -- actor_id (pk)
select * from film_actor; -- actor_id (fk)
select distinct (count(film_id)) from film_actor;
select distinct (count(actor_id)) from film_actor;

select a.first_name, a.actor_id from actor as a
join film_actor as fa
where a.actor_id = fa.actor_id;


desc film_actor;
select * from film; -- film_id (pk)
select * from film_actor;


select fa.film_id, fa.actor_id, f.film_id,f.title from film_actor as fa
join film as f
where fa.film_id = f.film_id;

select * from actor;





