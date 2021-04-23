/*	
 *	우리 회사는 서점과 고객의 중계역할을 하는 회사이다.
 *	서점의 책 판매를 고객에게 연결해주고 판매된 가격의 몇%(테이블 다 만들고 정할것)를 수익으로 얻는다.
 *	
 *		1.테이블 생성
 *		2.데이터 입력
 *		3.입력된 데이터 수 확인
 *			--SELECT COUNT(*) FROM BSTORES; 실행시 --5 이 숫자가 나와야함
 *
 */
/******************************************************************************/
--서점 데이터
CREATE TABLE BSTORES
(
	BS_CODE		CHAR(4)			NOT NULL PRIMARY KEY,
	BS_NAME		VARCHAR2(30)	NOT NULL
);

INSERT INTO BSTORES VALUES('BS01','교보문고');
INSERT INTO BSTORES VALUES('BS02','알라딘');
INSERT INTO BSTORES VALUES('BS03','YES24');
INSERT INTO BSTORES VALUES('BS04','동네책방');
INSERT INTO BSTORES VALUES('BS05','숲으로 이루어진 성');

SELECT * FROM BSTORES;
SELECT COUNT(*) FROM BSTORES;		--5

--COMMIT;
/******************************************************************************/

--장르 데이터
CREATE TABLE GENRES
(
	GR_CODE		CHAR(4)			NOT NULL PRIMARY KEY,
	GR_NAME		VARCHAR2(30)	NOT NULL
);

INSERT INTO GENRES VALUES('GR01','철학');
INSERT INTO GENRES VALUES('GR02','사회과학');
INSERT INTO GENRES VALUES('GR03','과학');
INSERT INTO GENRES VALUES('GR04','인문학');

SELECT * FROM GENRES;
SELECT COUNT(*) FROM GENRES;		--4

--COMMIT;
/******************************************************************************/

--책 데이터
CREATE TABLE BOOKS
(
    BK_CODE		CHAR(4)			NOT NULL PRIMARY KEY,
    BK_NAME		VARCHAR2(30)	NOT NULL,
    BK_WRITER	VARCHAR2(30)	NOT NULL,
	GR_CODE		CHAR(4)			NOT NULL
);

INSERT INTO BOOKS VALUES ('BK01','순수이성비판','임마누엘칸트','GR01');
INSERT INTO BOOKS VALUES ('BK02','군주론','마키아벨리','GR01');
INSERT INTO BOOKS VALUES ('BK03','예루살렘의 아이히만','한나 아렌트','GR01');
INSERT INTO BOOKS VALUES ('BK04','선량한 차별주의자','김지혜','GR02');
INSERT INTO BOOKS VALUES ('BK05','이상한 정상가족','김희경','GR02');
INSERT INTO BOOKS VALUES ('BK06','팩트풀니스','한스로슬링','GR02');
INSERT INTO BOOKS VALUES ('BK07','이기적 유전자','리처드 도킨스','GR03');
INSERT INTO BOOKS VALUES ('BK08','코스모스','칼 세이건','GR03');
INSERT INTO BOOKS VALUES ('BK09','사피엔스','유발 하라리','GR04');
INSERT INTO BOOKS VALUES ('BK10','팩트풀니스','에리히 프롬','GR04');

SELECT * FROM BOOKS;
SELECT COUNT(*) FROM BOOKS;			--10

--COMMIT;
/******************************************************************************/

--고객 데이터
CREATE TABLE CUSTOMERS
(
	CR_CODE	CHAR(4)			NOT NULL PRIMARY KEY,
	CR_NAME	VARCHAR2(20)	NOT NULL
);

INSERT INTO CUSTOMERS VALUES('CR01','배하린');
INSERT INTO CUSTOMERS VALUES('CR02','최지혜');
INSERT INTO CUSTOMERS VALUES('CR03','이지언');
INSERT INTO CUSTOMERS VALUES('CR04','김소희');
INSERT INTO CUSTOMERS VALUES('CR05','김정은');
INSERT INTO CUSTOMERS VALUES('CR06','최정은');
INSERT INTO CUSTOMERS VALUES('CR07','장은주');
INSERT INTO CUSTOMERS VALUES('CR08','박지원');

SELECT * FROM CUSTOMERS;
SELECT COUNT(*) FROM CUSTOMERS;		--8

--COMMIT;
/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

--서점별 책 보유 데이터
CREATE TABLE HOLD_BOOK
(
	HB_IDX		NUMBER(3)				NOT NULL,
	BS_CODE		CHAR(4)					NOT NULL,
    BK_CODE		CHAR(4)					NOT NULL,
	BK_STOCK	NUMBER(5)	DEFAULT 0	NOT NULL,	--책 재고(입고된 수량 - 판매된 수량) 역정규화 --안들어간경우 기본값으로 0입력 --나중에 프로시저 하고난뒤에 넣읍시다!!
	--BKPRICE	NUMBER(5)				NOT NULL,	--책 판매가 역정규화 
													--생각해보니 쓸모가 없는거 같다... 
													--여기말고 판매 데이터에서 사용하는게 좋을듯
	CONSTRAINT	HOLD_BOOK_PK	PRIMARY KEY (HB_IDX,BS_CODE,BK_CODE)
);

INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS01','BK01');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS01','BK02');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS01','BK03');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS01','BK04');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS01','BK05');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS01','BK06');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS01','BK07');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS01','BK08');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS01','BK09');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS01','BK10');

INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS02','BK01');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS02','BK02');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS02','BK03');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS02','BK04');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS02','BK05');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS02','BK06');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS02','BK07');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS02','BK08');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS02','BK09');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS02','BK10');

INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS03','BK01');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS03','BK02');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS03','BK03');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS03','BK04');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS03','BK05');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS03','BK06');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS03','BK07');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS03','BK08');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS03','BK09');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS03','BK10');

INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS04','BK01');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS04','BK02');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS04','BK03');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS04','BK04');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS04','BK05');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS04','BK06');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS04','BK07');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS04','BK08');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS04','BK09');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS04','BK10');

INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS05','BK01');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS05','BK02');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS05','BK03');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS05','BK04');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS05','BK05');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS05','BK06');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS05','BK07');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS05','BK08');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS05','BK09');
INSERT INTO HOLD_BOOK (HB_IDX,BS_CODE,BK_CODE) VALUES(1,'BS05','BK10');

SELECT * FROM HOLD_BOOK;
SELECT COUNT(*) FROM HOLD_BOOK;		--50

--COMMIT;
/******************************************************************************/

--입고 데이터
CREATE TABLE BUY_BOOK
(
	HB_IDX		NUMBER(3)		NOT NULL,	--	여기서부터
	BS_CODE		CHAR(4)			NOT NULL,	--
	BK_CODE		CHAR(4)			NOT NULL,	--	여기까지가
											--	서점별 책 보유 데이터
	BB_CNT		NUMBER(3)		NOT NULL,	--	입고된 수량
	BB_INDATE	DATE			NOT NULL,	--	입고된 날짜
	BB_IDX		NUMBER(3)		NOT NULL,	--	+ 서점별 책 보유 데이터 = 키
	CONSTRAINT	BUY_BOOK_PK		PRIMARY KEY (BB_IDX,HB_IDX,BS_CODE,BK_CODE)
);

--1월
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK01',30,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK02',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK03',40,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK04',80,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK05',20,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK06',30,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK07',10,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK08',10,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK09',80,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK10',90,'2021-01-01',1);

INSERT INTO BUY_BOOK VALUES(1,'BS02','BK01',100,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK02',20,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK03',70,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK04',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK05',30,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK06',30,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK07',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK08',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK09',60,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK10',40,'2021-01-01',1);

INSERT INTO BUY_BOOK VALUES(1,'BS03','BK01',20,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK02',20,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK03',20,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK04',30,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK05',70,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK06',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK07',90,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK08',100,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK09',30,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK10',10,'2021-01-01',1);

INSERT INTO BUY_BOOK VALUES(1,'BS04','BK01',40,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK02',40,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK03',80,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK04',90,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK05',70,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK06',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK07',30,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK08',60,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK09',60,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK10',70,'2021-01-01',1);

INSERT INTO BUY_BOOK VALUES(1,'BS05','BK01',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK02',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK03',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK04',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK05',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK06',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK07',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK08',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK09',50,'2021-01-01',1);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK10',50,'2021-01-01',1);

--2월
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK01',90,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK03',30,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK04',70,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK05',40,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK06',70,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK09',40,'2021-02-01',2);

INSERT INTO BUY_BOOK VALUES(1,'BS02','BK03',100,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK04',50,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK06',70,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK07',60,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK09',10,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK10',100,'2021-02-01',2);

INSERT INTO BUY_BOOK VALUES(1,'BS03','BK01',70,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK02',80,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK03',80,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK07',20,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK10',10,'2021-02-01',2);

INSERT INTO BUY_BOOK VALUES(1,'BS04','BK02',40,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK10',40,'2021-02-01',2);

INSERT INTO BUY_BOOK VALUES(1,'BS05','BK01',50,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK02',30,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK05',70,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK06',20,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK08',10,'2021-02-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK10',10,'2021-02-01',2);

--3월
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK01',80,'2021-03-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK04',20,'2021-03-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK07',30,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK08',90,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK10',80,'2021-03-01',2);

INSERT INTO BUY_BOOK VALUES(1,'BS02','BK02',90,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK03',10,'2021-03-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK04',30,'2021-03-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK06',100,'2021-03-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK07',40,'2021-03-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK08',20,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK10',40,'2021-03-01',3);

INSERT INTO BUY_BOOK VALUES(1,'BS03','BK03',80,'2021-03-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK04',70,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK05',80,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK08',10,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK09',10,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK10',20,'2021-03-01',3);

INSERT INTO BUY_BOOK VALUES(1,'BS04','BK01',20,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK02',90,'2021-03-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK04',50,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK05',20,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK06',90,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK09',10,'2021-03-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK10',60,'2021-03-01',3);

INSERT INTO BUY_BOOK VALUES(1,'BS05','BK05',30,'2021-03-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK07',80,'2021-03-01',2);

--4월
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK03',50,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK04',100,'2021-04-01',4);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK07',80,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS01','BK10',60,'2021-04-01',3);

INSERT INTO BUY_BOOK VALUES(1,'BS02','BK01',20,'2021-04-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK02',30,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK07',20,'2021-04-01',4);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK09',100,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS02','BK10',100,'2021-04-01',4);

INSERT INTO BUY_BOOK VALUES(1,'BS03','BK01',100,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK03',50,'2021-04-01',4);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK05',40,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK07',80,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK08',10,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS03','BK09',90,'2021-04-01',3);

INSERT INTO BUY_BOOK VALUES(1,'BS04','BK01',20,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK02',100,'2021-04-01',4);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK04',60,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK06',50,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK09',100,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS04','BK10',50,'2021-04-01',4);

INSERT INTO BUY_BOOK VALUES(1,'BS05','BK02',60,'2021-04-01',3);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK03',80,'2021-04-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK04',30,'2021-04-01',2);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK05',70,'2021-04-01',4);
INSERT INTO BUY_BOOK VALUES(1,'BS05','BK08',90,'2021-04-01',3);

INSERT INTO BUY_BOOK VALUES(1,'BS04','BK02',50,'2021-04-14',5);


SELECT * FROM BUY_BOOK;
SELECT COUNT(*) FROM BUY_BOOK;		--129

--COMMIT;
/******************************************************************************/

--서점별 판매가 데이터
CREATE TABLE PRICE_BOOK
(
	HB_IDX		NUMBER(3)		NOT NULL,	--	여기서부터
	BS_CODE		CHAR(4)			NOT NULL,	--
	BK_CODE		CHAR(4)			NOT NULL,	--	여기까지가
											--	서점별 책 보유 데이터
	BK_PRICE	NUMBER(5)		NOT NULL,	--	판매가
	PB_INDATE	DATE			NOT NULL,	--	등록일
	PB_IDX		NUMBER(3)		NOT NULL,	--	키
	CONSTRAINT	PRICE_BOOK_PK	PRIMARY KEY(PB_IDX,HB_IDX,BS_CODE,BK_CODE)
);

INSERT INTO PRICE_BOOK VALUES(1,'BS01','BK01',44000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS01','BK02',13000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS01','BK03',9500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS01','BK04',7800,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS01','BK05',6500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS01','BK06',9000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS01','BK07',5000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS01','BK08',11500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS01','BK09',18000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS01','BK10',12500,'2021-01-01',1);

INSERT INTO PRICE_BOOK VALUES(1,'BS02','BK01',40000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS02','BK02',12000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS02','BK03',9000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS02','BK04',7500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS02','BK05',6500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS02','BK06',8500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS02','BK07',5000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS02','BK08',11500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS02','BK09',20000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS02','BK10',11000,'2021-01-01',1);

INSERT INTO PRICE_BOOK VALUES(1,'BS03','BK01',50000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS03','BK02',15000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS03','BK03',9500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS03','BK04',8000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS03','BK05',7000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS03','BK06',10000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS03','BK07',6000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS03','BK08',13000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS03','BK09',15000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS03','BK10',13000,'2021-01-01',1);

INSERT INTO PRICE_BOOK VALUES(1,'BS04','BK01',44000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS04','BK02',13000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS04','BK03',9500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS04','BK04',7800,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS04','BK05',6500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS04','BK06',9000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS04','BK07',5000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS04','BK08',11500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS04','BK09',18000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS04','BK10',12500,'2021-01-01',1);

INSERT INTO PRICE_BOOK VALUES(1,'BS05','BK01',50000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS05','BK02',15000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS05','BK03',10000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS05','BK04',8000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS05','BK05',7500,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS05','BK06',10000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS05','BK07',6000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS05','BK08',13000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS05','BK09',20000,'2021-01-01',1);
INSERT INTO PRICE_BOOK VALUES(1,'BS05','BK10',13000,'2021-01-01',1);

SELECT * FROM PRICE_BOOK;
SELECT COUNT(*) FROM PRICE_BOOK;	--50

--COMMIT;
/******************************************************************************/

--판매 데이터
CREATE TABLE SELL_BOOK
(
	HB_IDX		NUMBER(3)			NOT NULL,	--	여기서부터
	BS_CODE		CHAR(4)				NOT NULL,	--
	BK_CODE		CHAR(4)				NOT NULL,	--	여기까지가
												--	서점별 책 보유 데이터
	CR_CODE		CHAR(4)				NOT NULL,	--	구매고객
	SB_CNT		NUMBER(3)			NOT NULL,	--	판매된 수량
	SB_OUTDATE	DATE				NOT NULL,	--	판매일
	SB_IDX		NUMBER(3)			NOT NULL,	--	키
	BK_PRICE	NUMBER(5)	DEFAULT 0	NULL,	--	판매가 역 정규화 // 얘도 나중에 입력합시다
	CONSTRAINT	SELL_BOOK_PK	PRIMARY KEY(SB_IDX,HB_IDX,BS_CODE,BK_CODE,CR_CODE)
);

--20210101
	--BS01
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK01','CR01',3,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS01','BK01','CR02',7,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS01','BK03','CR04',2,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS01','BK04','CR02',5,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS01','BK04','CR04',2,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS01','BK08','CR07',2,'20210101',1);

	--BS02
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS02','BK01','CR01',3,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS02','BK02','CR05',8,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS02','BK05','CR02',3,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS02','BK09','CR03',3,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS02','BK10','CR06',10,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS02','BK10','CR08',1,'20210101',1);

	--BS03
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS03','BK08','CR01',3,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS03','BK08','CR02',5,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS03','BK08','CR03',10,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS03','BK08','CR04',8,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS03','BK08','CR05',2,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS03','BK08','CR06',20,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS03','BK08','CR07',5,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS03','BK08','CR08',1,'20210101',1);

	--BS04
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS04','BK01','CR01',3,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS04','BK02','CR03',5,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS04','BK03','CR07',20,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS04','BK04','CR04',4,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS04','BK05','CR05',5,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS04','BK06','CR06',2,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS04','BK07','CR08',1,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS04','BK08','CR08',1,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS04','BK09','CR08',1,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS04','BK10','CR07',3,'20210101',1);

	--BS05
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS05','BK04','CR02',2,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS05','BK04','CR05',5,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS05','BK06','CR07',1,'20210101',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX)
VALUES (1,'BS05','BK07','CR07',3,'20210101',1);

--20210107
	--BS01
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK02','CR03',2,'20210107',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK04','CR03',1,'20210107',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK09','CR03',2,'20210107',1);

--20210108
	--BS03
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK01','CR02',5,'20210108',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK02','CR02',5,'20210108',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK03','CR02',5,'20210108',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK10','CR02',5,'20210108',1);

--20210115
	--BS05
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS05','BK02','CR07',5,'20210115',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS05','BK05','CR07',7,'20210115',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS05','BK08','CR07',10,'20210115',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS05','BK08','CR08',11,'20210115',1);

--20210202
	--BS02
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK01','CR02',15,'20210202',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK01','CR07',20,'20210202',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK03','CR02',15,'20210202',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK04','CR07',20,'20210202',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK06','CR02',15,'20210202',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK07','CR02',15,'20210202',1);

	--BS05
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS05','BK01','CR02',15,'20210202',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS05','BK01','CR07',20,'20210202',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS05','BK02','CR07',10,'20210202',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS05','BK05','CR07',8,'20210202',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS05','BK08','CR07',5,'20210202',2);

--20210211
	--BS01
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK01','CR05',50,'20210211',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK04','CR05',50,'20210211',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK06','CR05',50,'20210211',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK09','CR05',50,'20210211',1);

--20210225
	--BS04
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR07',10,'20210225',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR08',20,'20210225',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK04','CR04',20,'20210225',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK04','CR08',14,'20210225',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK10','CR07',50,'20210225',2);

--20210307
	--BS01
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK01','CR01',100,'20210307',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK04','CR01',30,'20210307',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK04','CR04',10,'20210307',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK04','CR05',30,'20210307',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR01',1,'20210307',1);

--20210308
	--BS01
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR01',10,'20210308',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR02',10,'20210308',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR03',10,'20210308',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR04',10,'20210308',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR05',10,'20210308',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR06',10,'20210308',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR07',10,'20210308',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR08',10,'20210308',1);

--20210315
	--BS02
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK02','CR01',15,'20210315',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK02','CR07',22,'20210315',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK03','CR01',11,'20210315',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK03','CR02',25,'20210315',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK06','CR02',100,'20210315',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK10','CR06',50,'20210315',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK10','CR08',50,'20210315',2);

	--BS03
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK03','CR02',25,'20210315',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK03','CR08',45,'20210315',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK04','CR02',30,'20210315',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK04','CR08',25,'20210315',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK05','CR02',50,'20210315',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK05','CR08',25,'20210315',1);

--20210330
	--BS02
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK04','CR01',25,'20210330',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK04','CR07',55,'20210330',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK07','CR01',5,'20210330',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK07','CR02',15,'20210330',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK07','CR07',55,'20210330',1);

--20210404
	--BS01
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK03','CR01',20,'20210404',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK03','CR04',25,'20210404',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK04','CR04',25,'20210404',3);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK04','CR07',50,'20210404',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR01',20,'20210404',3);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR04',25,'20210404',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS01','BK10','CR07',50,'20210404',2);

--20210413
	--BS02
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK03','CR06',50,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK09','CR06',50,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS02','BK10','CR06',50,'20210413',3);

	--BS04
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR01',30,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR02',30,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR03',30,'20210413',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR04',30,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR05',30,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR06',30,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR07',30,'20210413',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR08',25,'20210413',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK04','CR01',30,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK04','CR07',30,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK04','CR08',30,'20210413',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK06','CR02',30,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK06','CR03',30,'20210413',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK06','CR04',30,'20210413',1);

--20210414
	--BS04
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK02','CR08',5,'20210414',3);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK09','CR08',50,'20210414',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS04','BK10','CR08',50,'20210414',3);

--20210420
	--BS03
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK01','CR01',7,'20210420',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK01','CR02',13,'20210420',2);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK01','CR06',55,'20210420',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK01','CR08',27,'20210420',1);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK03','CR02',15,'20210420',3);
INSERT INTO SELL_BOOK (HB_IDX,BS_CODE,BK_CODE,CR_CODE,SB_CNT,SB_OUTDATE,SB_IDX) 
VALUES (1,'BS03','BK03','CR08',50,'20210420',2);

SELECT * FROM SELL_BOOK;
SELECT COUNT(*) FROM SELL_BOOK; 	--129

--COMMIT;
/******************************************************************************/

SELECT COUNT(*) FROM BSTORES;		--5
SELECT COUNT(*) FROM GENRES;		--4
SELECT COUNT(*) FROM BOOKS;			--10
SELECT COUNT(*) FROM CUSTOMERS;		--8
SELECT COUNT(*) FROM HOLD_BOOK;		--50
SELECT COUNT(*) FROM BUY_BOOK;		--129
SELECT COUNT(*) FROM PRICE_BOOK;	--50
SELECT COUNT(*) FROM SELL_BOOK; 	--129

--COMMIT;
/******************************************************************************/


SELECT * FROM BSTORES; --BS 서점코드
SELECT * FROM GENRES; --GR 장르
SELECT * FROM BOOKS; --BK 책 코드
SELECT * FROM CUSTOMERS;
SELECT * FROM HOLD_BOOK;
SELECT * FROM BUY_BOOK;
SELECT * FROM PRICE_BOOK;
SELECT * FROM SELL_BOOK;