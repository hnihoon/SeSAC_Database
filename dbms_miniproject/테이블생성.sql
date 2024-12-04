CREATE TABLE `user` (
	`user_id`	int	NOT NULL,
	`user_name`	varchar(750)	NOT NULL	COMMENT '세게에서 가장 긴 이름 746글자',
	`user_email`	varchar(50)	NOT NULL,
	`user_phone`	varchar(11)	NOT NULL,
	`user_birth`	int	NOT NULL,
	`user_gender`	varchar(5)	NOT NULL,
	`user_img`	varchar(255)	NULL,
	`user_type`	enum('강사','수강생')	NOT NULL	COMMENT '강사&수강생',
	`user_nickname`	varchar(10)	NOT NULL
);

CREATE TABLE `instructor` (
	`inst_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`category_id`	int	NOT NULL,
	`inst_img`	varchar(255)	NULL,
	`inst_career`	varchar(255)	NULL
);

CREATE TABLE `student` (
	`stu_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`stu_job`	varchar(255)	NOT NULL
);

CREATE TABLE `inst_bookmk` (
	`inst_bmk_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`user_id2`	int	NOT NULL,
	`category_id`	int	NOT NULL,
	`inst_create_date`	timestamp	NOT NULL
);

CREATE TABLE `course` (
	`course_id`	int	NOT NULL,
	`inst_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`category_id`	int	NOT NULL,
	`course_title`	varchar(20)	NOT NULL,
	`course_const`	varchar(255)	NOT NULL,
	`course_start_date`	date	NOT NULL,
	`course_date`	int	NOT NULL,
	`course_end_date`	date	NOT NULL,
	`course_create_date`	timestamp	NOT NULL,
	`course_img`	varchar(255)	NULL
);

CREATE TABLE `course_bookmk` (
	`course_bmk_id`	int	NOT NULL,
	`course_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`course_bmk_create_date`	timestamp	NOT NULL
);

CREATE TABLE `post` (
	`post_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`course_id`	int	NOT NULL,
	`post_title`	varchar(20)	NOT NULL,
	`post_const`	varchar(255)	NOT NULL,
	`post_date`	timestamp	NOT NULL,
	`post_type`	enum('질문/답변 게시판', '스터디 모집 게시판')	NOT NULL	COMMENT '질문/답변 게시판, 스터디 모집 게시판'
);

CREATE TABLE `comment` (
	`comment_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`post_id`	int	NOT NULL,
	`parent_id`	int	NOT NULL,
	`comment_const`	varchar(255)	NOT NULL,
	`comment_date`	timestamp	NOT NULL
);

CREATE TABLE `course_evaluate` (
	`course_evaluate_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`course_id`	int	NOT NULL,
	`inst_id`	int	NOT NULL,
	`category_id`	int	NOT NULL,
	`course_evaluate_title`	varchar(255)	NOT NULL,
	`course_evaluate_const`	varchar(255)	NOT NULL,
	`course_evaluate_point`	int	NOT NULL
);

CREATE TABLE `course_signup` (
	`course_signup_id`	int	NOT NULL,
	`course_id`	int	NOT NULL,
	`inst_id`	int	NOT NULL,
	`category_id`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`course_signup_progress`	boolean	NOT NULL	COMMENT '수강중, 수강취소',
	`course_signup_start`	timestamp	NOT NULL
);

CREATE TABLE `lecture` (
	`lecture_id`	int	NOT NULL,
	`course_id`	int	NOT NULL,
	`lecture_title`	varchar(20)	NOT NULL,
	`lecture_const`	varchar(255)	NOT NULL,
	`lecture_runtime`	time	NULL,
	`lecture_start_time`	timestamp	NULL
);

CREATE TABLE `lecture_assign` (
	`lecture_assign_id`	int	NOT NULL,
	`lecture_id`	int	NOT NULL,
	`lecture_assign_title`	varchar(20)	NOT NULL,
	`lecture_assign_const`	varchar(255)	NOT NULL,
	`lecture_assign_create_date`	timestamp	NOT NULL
);

CREATE TABLE `quiz` (
	`quiz_id`	int	NOT NULL,
	`lecture_id`	int	NOT NULL,
	`quiz_title`	varchar(20)	NOT NULL,
	`quiz_const`	varchar(255)	NOT NULL
);

CREATE TABLE `quiz_submit` (
	`quiz_submit`	int	NOT NULL,
	`user_id`	int	NOT NULL,
	`quiz_id`	int	NOT NULL,
	`lecture_id`	int	NOT NULL,
	`quiz_check`	boolean	NOT NULL,
	`quiz_time`	timestamp	NOT NULL,
	`quiz_score`	int	NOT NULL
);

CREATE TABLE `assign_submit` (
	`Key`	VARCHAR(255)	NOT NULL,
	`lecture_assign_id`	int	NOT NULL,
	`user_id2`	int	NOT NULL,
	`assign_check`	boolean	NULL,
	`assign_time`	timestamp	NOT NULL
);

CREATE TABLE `category` (
	`category_id`	int	NOT NULL,
	`category_name`	varchar(50)	NOT NULL
);

CREATE TABLE `lecture_meta` (
	`lecture_meta_id`	int	NOT NULL,
	`lecture_id`	int	NOT NULL,
	`lecture_meta_title`	varchar(20)	NOT NULL,
	`lecture_meta_const`	varchar(255)	NOT NULL,
	`lecture_meta_date`	TIMESTAMP	NULL	DEFAULT now(),
	`lecture_meta_meta`	varchar(255)	NULL	DEFAULT null
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `instructor` ADD CONSTRAINT `PK_INSTRUCTOR` PRIMARY KEY (
	`inst_id`,
	`user_id`,
	`category_id`
);

ALTER TABLE `student` ADD CONSTRAINT `PK_STUDENT` PRIMARY KEY (
	`stu_id`,
	`user_id`
);

ALTER TABLE `inst_bookmk` ADD CONSTRAINT `PK_INST_BOOKMK` PRIMARY KEY (
	`inst_bmk_id`,
	`user_id`,
	`user_id2`,
	`category_id`
);

ALTER TABLE `course` ADD CONSTRAINT `PK_COURSE` PRIMARY KEY (
	`course_id`,
	`inst_id`,
	`user_id`,
	`category_id`
);

ALTER TABLE `course_bookmk` ADD CONSTRAINT `PK_COURSE_BOOKMK` PRIMARY KEY (
	`course_bmk_id`,
	`course_id`,
	`user_id`
);

ALTER TABLE `post` ADD CONSTRAINT `PK_POST` PRIMARY KEY (
	`post_id`,
	`user_id`,
	`course_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`comment_id`,
	`user_id`,
	`post_id`
);

ALTER TABLE `course_evaluate` ADD CONSTRAINT `PK_COURSE_EVALUATE` PRIMARY KEY (
	`course_evaluate_id`,
	`user_id`,
	`course_id`,
	`inst_id`,
	`category_id`
);

ALTER TABLE `course_signup` ADD CONSTRAINT `PK_COURSE_SIGNUP` PRIMARY KEY (
	`course_signup_id`,
	`course_id`,
	`inst_id`,
	`category_id`,
	`user_id`
);

ALTER TABLE `lecture` ADD CONSTRAINT `PK_LECTURE` PRIMARY KEY (
	`lecture_id`,
	`course_id`
);

ALTER TABLE `lecture_assign` ADD CONSTRAINT `PK_LECTURE_ASSIGN` PRIMARY KEY (
	`lecture_assign_id`,
	`lecture_id`
);

ALTER TABLE `quiz` ADD CONSTRAINT `PK_QUIZ` PRIMARY KEY (
	`quiz_id`,
	`lecture_id`
);

ALTER TABLE `quiz_submit` ADD CONSTRAINT `PK_QUIZ_SUBMIT` PRIMARY KEY (
	`quiz_submit`,
	`user_id`,
	`quiz_id`,
	`lecture_id`
);

ALTER TABLE `assign_submit` ADD CONSTRAINT `PK_ASSIGN_SUBMIT` PRIMARY KEY (
	`Key`,
	`lecture_assign_id`,
	`user_id2`
);

ALTER TABLE `category` ADD CONSTRAINT `PK_CATEGORY` PRIMARY KEY (
	`category_id`
);

ALTER TABLE `lecture_meta` ADD CONSTRAINT `PK_LECTURE_META` PRIMARY KEY (
	`lecture_meta_id`,
	`lecture_id`
);

ALTER TABLE `instructor` ADD CONSTRAINT `FK_user_TO_instructor_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `instructor` ADD CONSTRAINT `FK_category_TO_instructor_1` FOREIGN KEY (
	`category_id`
)
REFERENCES `category` (
	`category_id`
);

ALTER TABLE `student` ADD CONSTRAINT `FK_user_TO_student_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `inst_bookmk` ADD CONSTRAINT `FK_student_TO_inst_bookmk_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `student` (
	`user_id`
);

ALTER TABLE `inst_bookmk` ADD CONSTRAINT `FK_instructor_TO_inst_bookmk_1` FOREIGN KEY (
	`user_id2`
)
REFERENCES `instructor` (
	`user_id`
);

ALTER TABLE `inst_bookmk` ADD CONSTRAINT `FK_instructor_TO_inst_bookmk_2` FOREIGN KEY (
	`category_id`
)
REFERENCES `instructor` (
	`category_id`
);

ALTER TABLE `course` ADD CONSTRAINT `FK_instructor_TO_course_1` FOREIGN KEY (
	`inst_id`
)
REFERENCES `instructor` (
	`inst_id`
);

ALTER TABLE `course` ADD CONSTRAINT `FK_instructor_TO_course_2` FOREIGN KEY (
	`user_id`
)
REFERENCES `instructor` (
	`user_id`
);

ALTER TABLE `course` ADD CONSTRAINT `FK_instructor_TO_course_3` FOREIGN KEY (
	`category_id`
)
REFERENCES `instructor` (
	`category_id`
);

ALTER TABLE `course_bookmk` ADD CONSTRAINT `FK_course_TO_course_bookmk_1` FOREIGN KEY (
	`course_id`
)
REFERENCES `course` (
	`course_id`
);

ALTER TABLE `course_bookmk` ADD CONSTRAINT `FK_user_TO_course_bookmk_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_student_TO_post_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `student` (
	`user_id`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_course_TO_post_1` FOREIGN KEY (
	`course_id`
)
REFERENCES `course` (
	`course_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_user_TO_comment_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_post_TO_comment_1` FOREIGN KEY (
	`post_id`
)
REFERENCES `post` (
	`post_id`
);

ALTER TABLE `course_evaluate` ADD CONSTRAINT `FK_student_TO_course_evaluate_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `student` (
	`user_id`
);

ALTER TABLE `course_evaluate` ADD CONSTRAINT `FK_course_TO_course_evaluate_1` FOREIGN KEY (
	`course_id`
)
REFERENCES `course` (
	`course_id`
);

ALTER TABLE `course_evaluate` ADD CONSTRAINT `FK_course_TO_course_evaluate_2` FOREIGN KEY (
	`inst_id`
)
REFERENCES `course` (
	`inst_id`
);

ALTER TABLE `course_evaluate` ADD CONSTRAINT `FK_course_TO_course_evaluate_3` FOREIGN KEY (
	`category_id`
)
REFERENCES `course` (
	`category_id`
);

ALTER TABLE `course_signup` ADD CONSTRAINT `FK_course_TO_course_signup_1` FOREIGN KEY (
	`course_id`
)
REFERENCES `course` (
	`course_id`
);

ALTER TABLE `course_signup` ADD CONSTRAINT `FK_course_TO_course_signup_2` FOREIGN KEY (
	`inst_id`
)
REFERENCES `course` (
	`inst_id`
);

ALTER TABLE `course_signup` ADD CONSTRAINT `FK_course_TO_course_signup_3` FOREIGN KEY (
	`category_id`
)
REFERENCES `course` (
	`category_id`
);

ALTER TABLE `course_signup` ADD CONSTRAINT `FK_user_TO_course_signup_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `lecture` ADD CONSTRAINT `FK_course_TO_lecture_1` FOREIGN KEY (
	`course_id`
)
REFERENCES `course` (
	`course_id`
);

ALTER TABLE `lecture_assign` ADD CONSTRAINT `FK_lecture_TO_lecture_assign_1` FOREIGN KEY (
	`lecture_id`
)
REFERENCES `lecture` (
	`lecture_id`
);

ALTER TABLE `quiz` ADD CONSTRAINT `FK_lecture_TO_quiz_1` FOREIGN KEY (
	`lecture_id`
)
REFERENCES `lecture` (
	`lecture_id`
);

ALTER TABLE `quiz_submit` ADD CONSTRAINT `FK_student_TO_quiz_submit_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `student` (
	`user_id`
);

ALTER TABLE `quiz_submit` ADD CONSTRAINT `FK_quiz_TO_quiz_submit_1` FOREIGN KEY (
	`quiz_id`
)
REFERENCES `quiz` (
	`quiz_id`
);

ALTER TABLE `quiz_submit` ADD CONSTRAINT `FK_quiz_TO_quiz_submit_2` FOREIGN KEY (
	`lecture_id`
)
REFERENCES `quiz` (
	`lecture_id`
);

ALTER TABLE `assign_submit` ADD CONSTRAINT `FK_lecture_assign_TO_assign_submit_1` FOREIGN KEY (
	`lecture_assign_id`
)
REFERENCES `lecture_assign` (
	`lecture_assign_id`
);

ALTER TABLE `assign_submit` ADD CONSTRAINT `FK_student_TO_assign_submit_1` FOREIGN KEY (
	`user_id2`
)
REFERENCES `student` (
	`user_id`
);

ALTER TABLE `lecture_meta` ADD CONSTRAINT `FK_lecture_TO_lecture_meta_1` FOREIGN KEY (
	`lecture_id`
)
REFERENCES `lecture` (
	`lecture_id`
);