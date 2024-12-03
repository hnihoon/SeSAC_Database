-- Active: 1732694339715@@127.0.0.1@3306@sakila
-- 적어도 한 번이라도 대여된 적이 있는 영화들 찾기

-- 영화는 영화인데
-- 적어도 한 번이라도 대여된 적이 있는

-- 영화는 영화인데
SELECT * 
FROM film f
-- WHERE 

-- 적어도 한 번이라도 대여된 적이 있는
SELECT DISTINCT i.film_id
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id;

SELECT * 
FROM film f
WHERE f.film_id IN (
  SELECT DISTINCT i.film_id
  FROM rental r
  JOIN inventory i ON r.inventory_id = i.inventory_id
);
