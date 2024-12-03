--평균 대여 금액(rental_rate)보다 비싼 영화를 조회하시오.
--영화를 조회하시오 - 대여 금액이 평균 대여금액보다 비싼

SELECT *
FROM film
WHERE rental_rate > (
SELECT AVG(rental_rate)
FROM film
);

--대여 횟수가 40회 이상인 고객이 대여한 영화들을 조회하시오 
--영화를 조회하시오 - 특정 고객이 대여한 - 대여횟수가 40회 이상인 고객이

SELECT customer_id,COUNT(customer_id)
FROM rental
GROUP BY customer_id
HAVING COUNT(customer_id) > 40;

SELECT * FROM rental

SELECT DISTINCT f.film_id, f.title
FROM customer cu
JOIN rental ren ON cu.customer_id = ren.customer_id
JOIN inventory inv ON ren.inventory_id = inv.inventory_id
JOIN film f ON inv.film_id = f.film_id
WHERE cu.customer_id IN (
  SELECT customer_id
  FROM rental
  GROUP BY customer_id
  HAVING COUNT(customer_id) > 40
);

-- GROUP BY ren.customer_id
-- HAVING COUNT(ren.customer_id) > 40;

--Action 카테고리 영화를 한번도 빌린적 없는 고객을 조회하시오
--고객을 조회하시오 - Action 카테고리 영화에 대한 대여 기록이 존재하지 않는

SELECT * FROM customer;

SELECT cu.first_name, cu.last_name
FROM customer cu
LEFT JOIN rental ren on cu.customer_id = ren.customer_id
LEFT JOIN inventory inv on ren.inventory_id = inv.inventory_id
LEFT JOIN film f on inv.film_id = f.film_id
LEFT JOIN film_category fc on f.film_id = fc.film_id
LEFT JOIN category ca on fc.category_id = ca.category_id
WHERE ca.name not in (
  SELECT name
  FROM category
  WHERE name = 'Action'
)
