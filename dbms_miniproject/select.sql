---------------------------------- 메인 페이지 ----------------------------------
--선생님목록
SELECT * FROM instructor

--강좌목록
SELECT chair.chair_title, chair.chair_start_date, chair.chair_date, chair.chair_end_date,chair_img,cev.chair_evaluate_point
FROM chair
LEFT JOIN instructor inst ON inst.inst_id = chair.inst_id
LEFT JOIN user us ON inst.user_id = us.user_id
LEFT JOIN chair_evaluate cev ON chair.chair_id = cev.chair_id;

--마이페이지
SELECT * FROM `user`;

--선생님목록일부
SELECT * 
FROM instructor LIMIT 5

--강좌목록일부
SELECT chair.chair_title, chair.chair_start_date, chair.chair_date, chair.chair_end_date,chair_img,cev.chair_evaluate_point
FROM chair
LEFT JOIN instructor inst ON inst.inst_id = chair.inst_id
LEFT JOIN user us ON inst.user_id = us.user_id
LEFT JOIN chair_evaluate cev ON chair.chair_id = cev.chair_id
LIMIT 5;

---------------------------------- 검색 결과 페이지 ----------------------------------

--검색
SELECT * 
FROM chair
LEFT JOIN instructor inst ON chair.inst_id = inst.inst_id
LEFT JOIN category cate ON inst.category_id = cate.category_id
LEFT JOIN user us ON inst.user_id = us.user_id
WHERE us.user_name LIKE '%기%' 
OR chair.chair_title like '%기%'
OR cate.category_name LIKE '%기%';

---------------------------------- 마이 페이지 ----------------------------------

--내가 신청한 강좌 목록
SELECT us.user_name
FROM chair_signup cs
LEFT JOIN `user` us ON cs.user_id = us.user_id
WHERE us.user_id = 1

--내가 관심 등록한 선생님
SELECT us.user_name, inst.inst_img
FROM inst_bookmk inb
LEFT JOIN instructor inst ON inb.user_id2 = inst.user_id
LEFT JOIN `user` us ON inst.user_id = us.user_id

--내가 관심 등록한 강좌
SELECT us.user_name,cour.course_title, cour.course_img, ce.course_evaluate_point
FROM course cour
LEFT JOIN course_bookmk cobo ON cour.course_id = cobo.course_id
LEFT JOIN user us ON cobo.user_id = us.user_id
LEFT JOIN course_evaluate ce ON cour.course_id = ce.course_id
WHERE us.user_id = 1

--내 게시글 목록
SELECT us.user_name, post.post_title, post.post_const, post.post_date, post.post_type
FROM post
LEFT JOIN `user` us ON post.user_id = us.user_id
LEFT JOIN  course cour ON post.course_id = cour.course_id;

--내 댓글 목록
SELECT comm.comment_const, comm.comment_date
FROM comment comm
LEFT JOIN `user` us ON us.user_id = comm.user_id
LEFT JOIN post ON comm.post_id = post.post_id;
