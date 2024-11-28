-- Active: 1732690371528@@127.0.0.1@3306@world

--인구 많은 순으로 정렬
SELECT Name, Population 
FROM city 
ORDER BY Population DESC;

--국가순으로 정렬 후, 같은 국가 내에서는 인구순 정렬
SELECT Name, CountryCode, Population 
FROM city 
ORDER BY CountryCode , Population DESC;

--기본적으로 NULL은 작은 값으로 취급된다
-- 1.다음과 같이 오름차순 내에서 NULL이 뒤로 정렬되도록 할 수 있다.
SELECT Name, IndepYear FROM country 
ORDER BY `IndepYear` IS NULL, `IndepYear`

-- 2.다음과 같이 내림차순 내에서 NULL이 먼저 정렬되도록 할 수 있다.
SELECT Name, IndepYear FROM country 
ORDER BY IndepYear IS NULL DESC, IndepYear DESC;

------------------------------------실습------------------------------------

--country 테이블에서 대륙별로 정렬하고, 같은 대륙 내에서는 GNP가 높은 순으로 정렬하여 Name, Continent, GNP을 조회하시오 -
SELECT `Name`,`Continent`,`GNP`
FROM country
ORDER BY `Continent`, `GNP` DESC;
    
-- country 테이블에서 기대수명이 짧은 순으로 정렬하되, NULL값은 마지막에 나오도록 정렬하여 Name, LifeExpectancy을 조회하시오
SELECT `Name`, `LifeExpectancy`
FROM country
ORDER BY `LifeExpectancy` is null, `LifeExpectancy` asc;

-- 대륙 별 국가 수가 많은 순서대로 Continent, 국가 수를 조회하시오.
SELECT `Continent`, COUNT(*) 
FROM country
GROUP BY `Continent`
ORDER BY COUNT(*) desc;

-- 독립년도가 있는 국가들의 대륙 별 평균 기대수명이 높은 순서대로 Continent, 평균 기대수명을 조회하시오
SELECT `Continent`, AVG(`LifeExpectancy`)
FROM country
WHERE `IndepYear` is not null
GROUP BY `Continent`
ORDER BY AVG(`LifeExpectancy`) DESC;
