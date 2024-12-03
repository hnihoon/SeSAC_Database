-- Active: 1732694339715@@127.0.0.1@3306@world
-- 평균 인구수보다 인구가 많은 도시들 조회 - world
-- 평균 인구수보다 -> 10000-
-- 인구가 많은 
-- 도시들 조회 - world

SELECT c.`Name`
FROM city c
WHERE c.`Population` > 10000 ;-- 10000 대신 평균 인구수

SELECT AVG(c.`Population`)
FROM city c;
-- 350468.2236

SELECT c.`Name`
FROM city c
WHERE c.`Population` > 350468.2236

SELECT c.`Name`
FROM city c
WHERE c.`Population` > (
  SELECT AVG(c.`Population`)
  FROM city c
  );

-------------------------------------------------------
-- 가장 많은 인구를 가진 도시의 국가 정보 - world
-- 국가 정보는 국가 정보 인데,
-- 가장 많은 인구를 가진 도시의

-- 어떤 국가의 정보를 보여줘.
SELECT co.`Name` 
FROM country co
WHERE ~~~

-- 가장 많은 인구를 가진 도시.
SELECT * 
FROM city ci
ORDER BY ci.`Population` DESC
LIMIT 1;

-- 가장 많은 인구를 가진 도시의 국가코드
SELECT `CountryCode`
FROM city ci
ORDER BY ci.`Population` DESC
LIMIT 1



SELECT co.`Name` 
FROM country co
WHERE co.`Code` = (
  SELECT `CountryCode`
  FROM city ci
  ORDER BY ci.`Population` DESC
  LIMIT 1
)

-------------------------------------------------------------
-- 인구 500만 이상인 도시가 있는 국가 찾기 - world
-- 국가는 국가인데
-- 인구 500만 이상인 도시가 있는

-- 국가는 국가인데
SELECT * 
FROM country co;

-- 인구 500만 이상인 도시

SELECT * 
FROM city ci
WHERE ci.`Population` > 5000000

-- 인구 500만 이상인 도시가 있는 국가 찾기 - world

SELECT co.`Name`
FROM country co
WHERE co.`Code` IN (
  SELECT ci.`CountryCode`
  FROM city ci
  WHERE ci.`Population` > 5000000
)

-- 500만 이상의 인구를 가진 도시에 대한 정보 + 국가 정보
SELECT DISTINCT co.`Name`
FROM country co
JOIN city ci ON co.`Code` = ci.`CountryCode`
WHERE ci.`Population` > 5000000