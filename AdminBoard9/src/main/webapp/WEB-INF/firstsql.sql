

--공지사항 게시판테이블 생성
CREATE TABLE notice(
	idx number(10) PRIMARY KEY,
	name varchar2(100) NOT NULL,
	subject varchar2(255) NOT NULL,
	content varchar2(2000) NOT NULL,
	regDate TIMESTAMP DEFAULT SYSDATE,
	ip varchar2(30) NOT NULL,
	hit number(10) DEFAULT 0
);

--공지사항 게시판 시퀀스 생성
CREATE SEQUENCE notice_idx_seq;

--공지사항 게시판 댓글 시퀀스 생성
CREATE SEQUENCE notice_comment_idx_seq;
 
--공지사항 게시판 댓글 테이블 생성
CREATE TABLE notice_comment(
	idx number(10) PRIMARY KEY, 
	ref number(10) NOT NULL,	
	name varchar2(100) NOT NULL,
	password varchar2(100) NOT NULL,
	content varchar2(2000) NOT NULL,
	regDate TIMESTAMP DEFAULT SYSDATE,
	ip varchar2(30) NOT NULL
);
 

--공지사항 게시판 파일 업로드 테이블 생성
CREATE TABLE notice_files(
	idx NUMBER PRIMARY KEY,
	ref NUMBER NOT NULL,
	ofile  varchar2(255) NOT NULL,
	sfile  varchar2(255) NOT NULL
);

--공지사항 게시판 파일 업로드 테이블 시퀀스 생성;
CREATE SEQUENCE notice_files_idx_seq;


-- 관리자 테이블 관리 테이블 생성 
CREATE TABLE boardConfig(
	idx NUMBER PRIMARY KEY,
	tableName varchar2(100) NOT null,
	boardName varchar2(100) NOT null,
	readLevel number(5) DEFAULT 0,
	writeLevel number(5) DEFAULT 0,
	commentLevel number(5) DEFAULT 0,
	fileLevel number(5) DEFAULT 0
); 



-- 관리자 테이블 시퀀스 생성
CREATE SEQUENCE boardConfig_idx_seq;

-- 게시판 글쓰기 테이블시퀀스 생성
CREATE SEQUENCE freeboard_idx_seq;

-- 게시판 코멘트 테이블시퀀스 생성
CREATE SEQUENCE comment_idx_seq;


-- 유저 관리 테이블 생성
CREATE TABLE userList(
	userid varchar2(100) NOT NULL,
	pwd varchar2(100) NOT NULL,
	name varchar2(100) NOT NULL,
	email varchar2(100) NOT null
);

-- 유저 등급 테이블 생성
CREATE TABLE userList_role(
	username varchar(45) NOT NULL,
	role varchar(45) NOT NULL
);


-- 관리자 아이디 테이블 생성 
INSERT INTO userlist VALUES ('admin', '1234', 'admin', 'admin@admin.com');

-- 관리자 role 유저 생성
INSERT INTO userlist_role VALUES ('admin', 'ROLE_ADMIN');
 
   
-- 테이블 및 데이터 입력 확인

SELECT * FROM userList;

SELECT * FROM USERLIST_ROLE;

SELECT * FROM notice;

SELECT * FROM BOARDCONFIG;




 