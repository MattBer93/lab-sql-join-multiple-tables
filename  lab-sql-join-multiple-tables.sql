use sakila;

-- Write a query to display for each store its store ID, city, and country.
select s.store_id, c.city, co.country
from store s
join address 
using(address_id) 
join city c 
using(city_id)
join country co
using(country_id);

-- Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(p.amount) as total_per_store
from store s
join staff 
using(store_id)
join payment p 
using(staff_id)
group by s.store_id;

-- What is the average running time of films by category?
select ca.category_id, ca.name, avg(length) as avg_duration
from category ca
join film_category
using(category_id) 
join film 
using(film_id) 
group by ca.category_id, ca.name;

-- Which film categories are longest?
select ca.category_id, ca.name, `length` 
from category ca
join film_category
using(category_id) 
join film 
using(film_id) 
group by ca.category_id, `length`
order by `length` desc
limit 20;

-- Display the most frequently rented movies in descending order.
select film_id, title, rental_rate
from film
order by rental_rate desc;

select * from film;

-- List the top five genres in gross revenue in descending order.
select ca.name, sum(amount) as total
from category ca
join film_category 
using(category_id)
join film
using(film_id)
join inventory 
using(film_id)
join rental 
using (inventory_id)
join payment 
using(rental_id)
group by ca.name
order by sum(amount) desc;

-- Is "Academy Dinosaur" available for rent from Store 1? - yes, 4 movies with this title are available
select title, store_id, count(title)
from film 
join inventory 
using(film_id)
join store 
using(store_id)
where title = 'academy dinosaur' and store_id = 1
group by store_id;











