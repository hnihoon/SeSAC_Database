-- Active: 1732690371528@@127.0.0.1@3306@sakila

--배우가 출연한 영화의 제목을 조회
SELECT a.first_name, a.last_name, f.title
FROM actor a
LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id;

--first_name이 `PENELOPE` 인 배우가 출연한 영화의 제목을 조회
SELECT a.first_name, a.last_name, f.title
FROM actor a
LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
WHERE a.first_name = 'PENELOPE';    
    
--영화 별 출연 배우의 수를 조회
SELECT COUNT(a.actor_id)
FROM actor a
LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
GROUP BY f.film_id;
    
--영화 별 출연 배우의 수가 5가 넘는 데이터를 배우의 수가 큰순으로 조회
SELECT COUNT(a.actor_id)
FROM actor a
LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
GROUP BY f.film_id
HAVING COUNT(a.actor_id) > 5
ORDER BY COUNT(a.actor_id) DESC;

--고객의 대여 정보 조회
SELECT * 
FROM rental ren
LEFT JOIN customer cu ON ren.customer_id = cu.customer_id;

--고객이 대여한 영화 정보 조회
SELECT cu.first_name, cu.last_name, f.title
FROM customer cu
LEFT JOIN rental ren ON cu.customer_id = ren.customer_id
LEFT JOIN inventory inv ON ren.inventory_id = inv.inventory_id
LEFT JOIN film f ON inv.film_id = f.film_id;

--`YENTL IDAHO` 영화를 대여한 고객 정보 조회
SELECT cu.first_name, cu.last_name, f.title
FROM customer cu
LEFT JOIN rental ren ON cu.customer_id = ren.customer_id
LEFT JOIN inventory inv ON ren.inventory_id = inv.inventory_id
LEFT JOIN film f ON inv.film_id = f.film_id
WHERE f.title = 'YENTL IDAHO';

--배우별로 출연한 영화의 등급(rating)을 조회
SELECT ac.first_name,ac.last_name, f.title, f.rating
FROM actor ac
LEFT JOIN film_actor fa ON ac.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
ORDER BY ac.first_name, ac.last_name, f.title;


--1번 고객이 자주 대여한 영화의 카테고리를 찾으시오
SELECT ca.name, COUNT(*)
FROM customer cu
LEFT JOIN rental ren ON cu.customer_id = ren.customer_id
LEFT JOIN inventory inv ON ren.inventory_id = inv.inventory_id
LEFT JOIN film f ON inv.film_id = f.film_id
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category ca ON fc.category_id = ca.category_id
WHERE cu.customer_id = 1
GROUP BY ca.category_id
ORDER BY COUNT(*) DESC LIMIT 1;

--각 직원이 일하는 매장의 주소와 도시를 조회
SELECT sta.first_name, sta.last_name, addre.address, ci.city
FROM staff sta
LEFT JOIN address addre ON sta.address_id = addre.address_id
LEFT JOIN city ci ON addre.city_id = ci.city_id;

--고객별로 대여한 영화 제목과 지불한 금액, 날짜를 조회
SELECT cu.first_name, cu.last_name, 
        f.title, f.rental_rate, ren.rental_date
FROM customer cu
LEFT JOIN rental ren ON cu.customer_id = ren.customer_id
LEFT JOIN inventory inv on ren.inventory_id = inv.inventory_id
LEFT JOIN film f on inv.film_id = f.film_id
ORDER BY cu.first_name


--국가별 고객 수를 조회
SELECT country, COUNT(*)
FROM country co
LEFT JOIN city ci on co.country_id = ci.country_id
LEFT JOIN address addre ON ci.city_id = addre.city_id
LEFT JOIN customer cu ON addre.address_id = cu.address_id
GROUP BY country