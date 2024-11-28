-- Active: 1732690371528@@127.0.0.1@3306@world

SELECT * FROM country;

--논리 연산자
WHERE population > 1000000 AND Continent = 'asia'
WHERE population > 1000000 OR Continent = 'asia'
WHERE NOT population < 1000000

--범위
WHERE population BETWEEN 1000000 AND 2000000
WHERE population NOT BETWEEN 1000000 AND 2000000

WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31'

--포함
WHERE Code IN ('KOR', 'JPN', 'CHN')
WHERE Code NOT IN ('KOR', 'JPN', 'CHN')

--NULL여부
WHERE LifeExpectancy IS NULL
WHERE LifeExpectancy IS NOT NULL

--패턴매칭
WHERE Name LIKE 'S%'        -- S로 시작
WHERE Name LIKE '%on'       -- on으로 끝남
WHERE Name LIKE '%on%'      -- on이 포함
WHERE Name NOT LIKE 'S%'    -- S로 시작하지 않음

-------------------------------실습-------------------------------

-- 인구가 800만 이상인 도시의 Name, Population을 조회하시오
SELECT c.`Name` 도시이름, c.`Population` 인구수 FROM city c
WHERE c.`Population` >= 8000000;

-- 한국(KOR)에 있는 도시의 Name, CountryCode를 조회하시오
SELECT c.`Name`, c.`CountryCode` FROM city c
WHERE c.`CountryCode` = 'kor'

- 이름이 'San'으로 시작하는 도시의 Name을 조회하시오
SELECT c.`Name` FROM city c
WHERE c.`Name` LIKE 'san%'

- 인구가 100만에서 200만 사이인 한국 도시의 Name을 조회하시오
SELECT * FROM city c
WHERE c.`Population` BETWEEN 1000000 and 2000000
and c.`CountryCode` = 'kor'

- 인구가 500만 이상인 한국, 일본, 중국의 도시의 Name, CountryCode, Population 을 조회하시오
SELECT c.`Name`, c.`CountryCode`, c.`Population` FROM city c
WHERE c.`Population` >= 5000000
AND (c.`CountryCode` = 'kor' or c.`CountryCode` = 'jpn' or c.`CountryCode` = 'chn')

SELECT c.`Name`, c.`CountryCode`, c.`Population` FROM city c
WHERE c.`Population` >= 5000000
AND c.`CountryCode` IN ('kor', 'jpn', 'chn');

SELECT * FROM country c
WHERE c.`Continent` = 'asia'

-- 오세아니아 대륙에서 예상 수명의 데이터가 없는 나라의 Name, LifeExpectancy, Continent를 조회하시오.
SELECT c.`Name`, c.`LifeExpectancy`, c.`Continent` FROM country c
WHERE c.`Continent` = 'Oceania'
AND c.`LifeExpectancy` IS null;
