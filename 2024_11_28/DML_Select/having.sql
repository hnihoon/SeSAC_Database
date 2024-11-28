--대륙 별 국가 수가 20개가 넘는 대륙, 국가 수 조회
SELECT `Continent`, COUNT(*) as country_count
FROM country
GROUP BY `Continent`
HAVING country_count > 20;

--Region 별 평균 인구가 10000000이 넘는 지역, 평균 인구 조회
SELECT Region, AVG(Population) as avg_pop
FROM country
GROUP BY Region
HAVING avg_pop > 10000000;

--대륙 별 인구가 1000만 이상인 국가의 수가 10개가 넘는 대륙, 국가 수 조회
SELECT Continent, COUNT(*) as big_countries 
FROM country 
WHERE Population >= 10000000 
GROUP BY Continent
HAVING big_countries > 10;

--HAVING절에는 SELECT절에 포함되지 않는 집계함수가 포함될 수 있다.
SELECT Continent, COUNT(*) as country_count
FROM country
GROUP BY Continent
HAVING AVG(Population) > 10000000 ;

--------------------------------------실습--------------------------------------

-- District별 평균 인구가 100만 이상이면서 도시 수가 3개 이상인 District,  도시 수, 총 인구를 구하시오 - city
SELECT `District`,
        COUNT(*) as 도시수,
        SUM(`Population`) as 총인구수
FROM city
GROUP BY `District`
HAVING AVG(`Population`) >= 1000000
and   COUNT(*) >= 3;

-- 아시아 대륙의 국가들 중에서, Region별 평균 GNP가 1000 이상인 Region,  평균 GNP를 조회하시오 - country
SELECT `Region`, AVG(`GNP`)
FROM country
WHERE `Continent` = 'asia'
GROUP BY `Region`
HAVING AVG(`GNP`) > 10000;

-- 독립년도가 1900년 이후인 국가들 중에서, 대륙별 평균 기대수명이 70세 이상인 Continent, 평균 기대수명을 조회하시오. - country
SELECT `Continent`, AVG(`LifeExpectancy`) as 기대수명
FROM country
WHERE `IndepYear` > 1900
GROUP BY `Continent`
HAVING avg(`LifeExpectancy`) > 70

-- CountryCode별 도시 평균 인구가 100만 이상이고 도시 최소 인구가 50만 이상인 CountryCode, 총 도시수, 총 인구수를 조회하시오. - city
SELECT `CountryCode`, COUNT(*), SUM(`Population`)
FROM city
GROUP BY `CountryCode`
HAVING AVG(`Population`) >= 1000000
and MIN(`Population`) >= 500000;
