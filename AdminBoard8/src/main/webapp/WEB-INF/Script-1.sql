SELECT * FROM hanjadata;
SELECT count(*) FROM hanjadata;

CREATE TABLE freeboard_comment AS 
SELECT * FROM FREECOMMENT;

SELECT * FROM TABLENAMELIST ;

DROP SEQUENCE boardConfig_idx_seq;
CREATE SEQUENCE boardConfig_idx_seq;
DROP TABLE boardConfig;
CREATE TABLE boardConfig(
	idx NUMBER PRIMARY KEY,
	tableName varchar2(100) NOT null,
	boardName varchar2(100) NOT null,
	readLevel number(5) DEFAULT 0,
	writeLevel number(5) DEFAULT 0,
	commentLevel number(5) DEFAULT 0,
	fileLevel number(5) DEFAULT 0
);

INSERT INTO boardConfig VALUES
(boardConfig_idx_seq.nextval,'freeboard','자유게시판',1,2,2,1);

SELECT * FROM boardConfig;

DELETE FROM BOARDCONFIG WHERE idx=22;



SELECT * FROM HOBBY_MUSIC;



SELECT * FROM mainboard;

ALTER TABLE mainboard ADD(tableName varchar2(255)); 

select * from employees;


CREATE TABLE employees(
	id varchar2(10) PRIMARY KEY,
	password varchar(10) NOT NULL,
	name varchar2(24),
	lev char(1),
	enter varchar2(10),
	gender char(1),
	phone varchar2(30)
);
SELECT * FROM test;
SELECT * FROM userList;
SELECT * FROM USERLIST_ROLE;
INSERT INTO employees VALUES ('kim','1234','김두환','1','1991-04-13','1','010-1234-1234');

update employees set password='5555',name='김듀환',lev='1',enter='2020-02-22',gender='1',phone='011-1234-1234' WHERE ID='user03';

SELECT * FROM employees;




SELECT * FROM plant;
SELECT * FROM test;
INSERT INTO TEST VALUES (test_idx_seq.nextval,'1234','123','테스트스트레스','테스트스트레스',SYSDATE,'111',0);

insert into test values 
			(freeboard_idx_seq.nextval,'123','123','123',SYSDATE,'123',0);
			
		
DROP SEQUENCE game_files_idx_seq;		
DROP SEQUENCE game_idx_seq;		
SELECT * FROM game_files_idx_seq;


SELECT * FROM USER_SEQUENCES;

