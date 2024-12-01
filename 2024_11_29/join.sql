-- Active: 1732690371528@@127.0.0.1@3306@sakila

-- 모든 고객의 대여 현황 조회 : 1:N 관계
SELECT 
    c.first_name,
    c.last_name,
    r.rental_date,
    r.return_date
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
ORDER BY c.last_name;

SELECT first_name, last_name FROM customer

SELECT * FROM rental;

-- 영화별 대여 현황 : M:N 관계
SELECT 
    f.title,
    r.rental_date
FROM film f 
LEFT JOIN inventory i ON f.film_id = i.film_id 
LEFT JOIN rental r ON i.inventory_id = r.inventory_id;


-- 예시1 대댓글
-- 1.테이블 생성
CREATE TABLE comments (
    id INT PRIMARY KEY,
    content TEXT,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES comments(id)
);

-- 2.더미 데이터 추가
INSERT INTO comments VALUES
(1, '안녕하세요', NULL),           -- 원댓글
(2, '반갑습니다', NULL),           -- 원댓글
(3, '네 안녕하세요!', 1),          -- 1번 댓글의 대댓글
(4, '저도 반가워요', 1),           -- 1번 댓글의 대댓글
(5, '답글 드립니다', 2),           -- 2번 댓글의 대댓글
(6, '안녕', NULL);                -- 원댓글

-- 댓글과 대댓글을 함께 조회
SELECT 
    parent.id as parent_id,
    parent.content as parent_content,
    child.id as reply_id,
    child.content as reply_content
FROM comments parent
LEFT JOIN comments child ON child.parent_id = parent.id
WHERE parent.parent_id IS NULL;  -- 원댓글만 기준으로 조회

-------------------------예제-------------------------

-- 1.고객 정보 조회

-- 고객의 기본 정보, 주소
SELECT c.first_name, c.last_name, c.email, a.address 
FROM customer c
LEFT JOIN address a ON c.address_id = a.address_id;

-- 고객의 기본 정보, 주소, 도시 조회
SELECT c.first_name, c.last_name, a.address, ci.city
FROM customer c
LEFT JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id;

-- 고객의 기본 정보, 주소, 도시, 국가 조회
SELECT c.first_name, c.last_name, c.email, a.address, ci.city, co.country
FROM customer c
LEFT JOIN address a ON c.address_id = a.address_id
LEFT JOIN city ci ON a.city_id = ci.city_id
LEFT JOIN country co ON ci.country_id = co.country_id;

-- 도시별 고객 수 조회
SELECT ci.city, COUNT(c.customer_id) as customer_count
FROM customer c
LEFT JOIN address a ON c.address_id = a.address_id
LEFT JOIN city ci ON a.city_id = ci.city_id
GROUP BY ci.city
ORDER BY customer_count

-- 2.영화 정보 조회

-- 배우가 출연한 영화 조회
SELECT a.first_name, a.last_name , f.title
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id;

SELECT a.first_name, a.last_name , f.title
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id;

SELECT a.first_name, a.last_name , f.title
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON fa.actor_id = a.actor_id
WHERE a.actor_id is null;

-- 만약, 배우가 없는 다큐멘터리 영화가 있다고 칩시다.
-- 우리가 영화 상세정보 조회에 출연한 배우 목록을 확인하고 싶어요
-- 그때,
  -- 스파이더맨 : 주인공
  -- 스파이더맨 : 서브주인공
  -- 스파이더맨 : null
-- 다큐멘터리 영화도 우리 사이트의 영화 디테일 페이지에서 보여주고 싶을 때
-- left join

-- 배우 정보가 없는 영화 찾기
SELECT *
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
WHERE fa.actor_id is NULL;

-- 배우별 출연 영화 수
SELECT a.first_name, a.last_name,COUNT(fa.film_id)
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name;

-- 영화 별 출연 배우 수
SELECT f.title,COUNT(a.actor_id)
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id

--영화의 카테고리 정보
SELECT f.title, c.name as category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category c ON fc.category_id = c.category_id
ORDER BY f.title;

--카테고리 별 영화 수
SELECT c.name, COUNT(f.film_id) 
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id;

--배우가 출연한 영화를 카테고리 포함 조회
SELECT a.first_name, a.last_name , f.title, c.name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
LEFT JOIN film_category fc on f.film_id = fc.film_id
LEFT JOIN category c on fc.category_id = c.category_id