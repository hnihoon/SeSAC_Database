-- LIMIT : 갯수
-- OFFSET : OFFSET에 해당하는 다음 값 부터

--앞에서부터 5개 조회 (id가 1 ~ 5)
SELECT * FROM city LIMIT 5;

--10개 이후로부터 5개 조회 (id가 11 ~ 15)
SELECT * FROM city LIMIT 5 OFFSET 10;