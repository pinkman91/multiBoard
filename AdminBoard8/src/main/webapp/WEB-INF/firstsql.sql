
CREATE TABLE boardConfig(
	idx NUMBER PRIMARY KEY,
	tableName varchar2(100) NOT null,
	boardName varchar2(100) NOT null,
	readLevel number(5) DEFAULT 0,
	writeLevel number(5) DEFAULT 0,
	commentLevel number(5) DEFAULT 0,
	fileLevel number(5) DEFAULT 0
); 
-- 관리자 테이블 관리 테이블 생성 



CREATE SEQUENCE boardConfig_idx_seq;
-- 관리자 테이블 시퀀스 생성
CREATE SEQUENCE freeboard_idx_seq;
-- 게시판 글쓰기 테이블시퀀스 생성
CREATE SEQUENCE comment_idx_seq;
-- 게시판 코멘트 테이블시퀀스 생성

-- 유저 관리 테이블 생성
CREATE TABLE userList(
	userid varchar2(100) NOT NULL,
	pwd varchar2(100) NOT NULL,
	name varchar2(100) NOT NULL,
	email varchar2(100) NOT null
);
CREATE TABLE userList_role(
	username varchar(45) NOT NULL,
	role varchar(45) NOT NULL
);



INSERT INTO userlist VALUES ('admin', '1234', 'admin', 'admin@admin.com');
-- 관리자 아이디 테이블 생성 
INSERT INTO userlist_role VALUES ('admin', 'ROLE_ADMIN');
-- 관리자 role 유저 생성 
   
-- 테이블 및 데이터 입력 확인
SELECT * FROM userList;

SELECT * FROM USERLIST_ROLE;





INSERT INTO TEST VALUES (test_idx_seq.nextval,'1234','테스트스트레스','테스트스트레스',SYSDATE,'111',0);

 