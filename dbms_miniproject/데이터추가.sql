-- Active: 1732690371528@@127.0.0.1@3306@mini_db
INSERT INTO `user` 
VALUES 
(1, '신짱구', 'aaaa@naver.com', '01011111111', 19990128, '남자', '1232132312312', '수강생', '액션가면'),
(2, '김철수', 'bbbb@gmail.com', '01022222222', 19900214, '남자', 'sdasdasd123', '강사', '엘리트'),
(3, '이맹구', 'cccc@naver.com', '01033333333', 19921028, '남자', 'asdsadimg', '수강생', '괴짜'),
(4, '박유리', 'haha@gmain.com', '01044444444', 19970311, '여자', 'afiw1234i%123', '수강생', '아이돌지망생');

INSERT INTO category
VALUES(1, '국어'),
(2,'영어'),
(3,'수학');

INSERT INTO student 
VALUES(1,1,'유치원생'),
(2,3,'무직'),
(3,4,'개백수');

INSERT INTO instructor 
VALUES(1,2,2,'imgimgimgimgimg', '잘나가는 영어강사');

INSERT INTO course 
VALUES(1,1,2,2,'기초영어','기초부터 탄탄한!!', '2024-12-04', 90, '2025-02-03','2024-12-04 11:35','chairimg');

INSERT INTO course_signup
VALUES (1,1,1,2,1,0,'2024-12-04 11:37'),
(2,1,1,2,3,1,'2024-12-04 11:38'),
(3,1,1,2,4,1,'2024-12-04 11:36');

INSERT INTO course_evaluate
VALUES(1,1,1,1,2,'너무좋았어요!','영어공부하기 좋은 강의!',5);

INSERT INTO course_evaluate
VALUES(2,3,1,1,2,'별로에요😫!','그저그럼!',3);

INSERT INTO inst_bookmk
VALUES(1,1,2,2,'2024-12-04 15:19');

INSERT INTO course_bookmk
VALUES(1,1,1,'2024-12-04 15:37');

INSERT INTO post
VALUES(1,1,1,'사과가 영어로 뭐죠?','바나나는 아는데...','2024-12-04 16:02','질문/답변 게시판');

INSERT INTO comment 
VALUES(1,1,1,1,'뭐래','2024-12-04 16:04');

INSERT INTO lecture
VALUES(1,1,'영어강의1', '영어강의1내용','16:04' , now())

INSERT INTO lecture_meta
VALUES(1,1,'영어강의자료1', '영어강의자료1',now(), '강의자료링크')

