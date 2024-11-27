-- Active 1732690371528@@127.0.0.1@3306@world

--테이블 생성
CREATE TABLE student(
    student_id VARCHAR(7) PRIMARY KEY,
    name VARCHAR(10),
    grade INT,
    major VARCHAR(20)
);

-- 외래키가 있는 테이블 생성
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(7) REFERENCES student(student_id),
    date DATE,
    status VARCHAR(10)
);

-- 테이블에 필드 추가
ALTER TABLE student
ADD phone VARCHAR(20);

--테이블의 기존 타입 수정
ALTER TABLE student 
MODIFY name VARCHAR(100) NOT NULL;

ALTER TABLE student 
DROP COLUMN phone;

DROP TABLE student ;

SELECT  FROM student;

INSERT INTO student(student_id, name, grade, major)
VALUES ('2024001', '김철수', 1, '컴공');

INSERT INTO student VALUES 
    ('2024002', '이영희', 2, '경영학'),
    ('2024003', '박민수', 3, '물리학');

SELECT  FROM student;

-- 학생의 이름을 조회하자.
SELECT name FROM student;

SELECT s.NAME FROM student s;

SELECT  FROM student WHERE grade = 1;

UPDATE student
SET grade = 2, major = '경제학'
WHERE student_id = 2024001;

DELETE FROM student WHERE student_id = '2024002';