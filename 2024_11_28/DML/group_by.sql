-- Active: 1732690371528@@127.0.0.1@3306@world

--대륙 별 국가 수
SELECT Continent, COUNT(*) as country_count
FROM country
GROUP BY Continent;

-- Region 별 평균 인구
SELECT Region, AVG(Population) as avg_pop
FROM country
GROUP BY Region;

-- 대륙 별 최소/최대 인구
SELECT Continent,
   MIN(Population) as min_pop,
   MAX(Population) as max_pop
FROM country
GROUP BY Continent;

-- 대륙 별 인구가 1000만 이상인 국가의 수
SELECT Continent, COUNT(*) as big_countries 
FROM country 
WHERE Population >= 10000000 
GROUP BY Continent;

--------------------------실습--------------------------

-- 대륙별 총 인구수를 구하시오.
SELECT `Continent`, SUM(`Population`) total_pop
FROM country
GROUP BY `Continent`;

-- Region별로 GNP가 가장 높은 Region을 찾으시오
SELECT `Region` , MAX(`GNP`) 
FROM country
GROUP BY `Region`

-- 대륙별 평균 GNP와 평균 인구를 구하시오
SELECT `Continent`,AVG(`GNP`),AVG(`Population`)
FROM country
GROUP BY `Continent`

-- 인구가 50만에서 100만 사이인 도시들에 대해, District별 도시 수를 구하시오
SELECT `District`, COUNT(*)
FROM city
WHERE `Population` BETWEEN 500000 and 10000000
GROUP BY `District`

-- 아시아 대륙 국가들의 Region별 총 GNP를 구하세요
SELECT c.`Region`, SUM(c.`GNP`) total_gnp
FROM country c
WHERE c.`Continent` = 'asia'
GROUP BY c.`Region`