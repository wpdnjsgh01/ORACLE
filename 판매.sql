DROP TABLE CTM_TBL;

CREATE TABLE PRODUCTS_TBL
(
    PRO_ID	CHAR(6) NOT NULL PRIMARY KEY,
    PRO_NAME	VARCHAR2(100) NOT NULL,
    PRO_COMPANY	VARCHAR2(100) NOT NULL,
    PRO_VOL	NUMBER(6,2) NOT NULL,
    PRO_INDATE	DATE  NOT NULL

);

SELECT * FROM PRODUCTS_TBL;

INSERT INTO PRODUCTS_TBL VALUES('P00001','라면','농심', 10, '2021-02-05');
INSERT INTO PRODUCTS_TBL VALUES('P00002','아이스크림','빙그레', 20, '2021-02-08');
INSERT INTO PRODUCTS_TBL VALUES('P00003','콜라','코카콜라', 20, '2021-03-03');
INSERT INTO PRODUCTS_TBL VALUES('P00004','사이다','칠성', 20, '2021-03-08');
INSERT INTO PRODUCTS_TBL VALUES('P00005','콜라','펩시', 20, '2021-03-15');
INSERT INTO PRODUCTS_TBL VALUES('P00006','과자','크라운', 20, '2021-03-22');
INSERT INTO PRODUCTS_TBL VALUES('P00007','샴푸','LG생활건강', 30, '2021-04-11');
INSERT INTO PRODUCTS_TBL VALUES('P00008','비누','LG생활건강', 20, '2021-04-21');
INSERT INTO PRODUCTS_TBL VALUES('P00009','화장품','LG생활건강', 30, '2021-04-27');
INSERT INTO PRODUCTS_TBL VALUES('P00010','젤리','하리보', 40, '2021-04-27');

--COMMIT;

--2.도매상 테이블
CREATE TABLE WHOLESALE_TBL
(
    W_ID	CHAR(6)   NOT NULL PRIMARY KEY,
    W_NAME	VARCHAR2(100)   NOT NULL,
    W_REGION	CHAR(6)     NOT NULL,
    W_YEAR	VARCHAR2(4)     NOT NULL
);

SELECT * FROM WHOLESALE_TBL;

INSERT INTO WHOLESALE_TBL VALUES('W00001', '도매상1', 'R00001', '1982');
INSERT INTO WHOLESALE_TBL VALUES('W00002', '도매상2', 'R00002', '2001');
INSERT INTO WHOLESALE_TBL VALUES('W00003', '도매상3', 'R00001', '1994');
INSERT INTO WHOLESALE_TBL VALUES('W00004', '도매상4', 'R00003', '2011');
INSERT INTO WHOLESALE_TBL VALUES('W00005', '도매상5', 'R00002', '2005');

--COMMIT;


--3. 구매내역
CREATE TABLE BUY_TBL
(
    PRO_ID	CHAR(6)             NOT NULL,
    W_ID	CHAR(6)             NOT NULL,
    B_IDX	NUMBER(4)           NOT NULL,
    B_PRICE	NUMBER(10,2)        NOT NULL,
    B_QTY	NUMBER(4)           NOT NULL,
    B_INDATE	DATE            NOT NULL,
    B_CONTENT	VARCHAR2(1000)  NULL,
    CONSTRAINT "BUY_TBL_PK" PRIMARY KEY ("PRO_ID", "W_ID", "B_IDX")
);

SELECT * FROM BUY_TBL;

INSERT INTO BUY_TBL VALUES('P00001', 'W00001', 1, 800, 5, '2021-01-15', NULL);
INSERT INTO BUY_TBL VALUES('P00001', 'W00001', 2, 800, 14, '2021-02-11', NULL);
INSERT INTO BUY_TBL VALUES('P00001', 'W00001', 3, 850, 7, '2021-02-12', NULL);
INSERT INTO BUY_TBL VALUES('P00001', 'W00001', 4, 780, 22, '2021-03-09', NULL);
INSERT INTO BUY_TBL VALUES('P00001', 'W00001', 5, 750, 24, '2021-03-22', NULL);
INSERT INTO BUY_TBL VALUES('P00001', 'W00005', 1, 900, 8, '2021-04-02', NULL);
INSERT INTO BUY_TBL VALUES('P00001', 'W00005', 2, 920, 9, '2021-04-23', NULL);

INSERT INTO BUY_TBL VALUES('P00002', 'W00002', 1, 500, 30, '2021-01-16', NULL);
INSERT INTO BUY_TBL VALUES('P00002', 'W00002', 2, 550, 30, '2021-01-25', NULL);
INSERT INTO BUY_TBL VALUES('P00002', 'W00003', 1, 670, 11, '2021-02-14', NULL);
INSERT INTO BUY_TBL VALUES('P00002', 'W00003', 2, 660, 12, '2021-03-17', NULL);
INSERT INTO BUY_TBL VALUES('P00002', 'W00003', 3, 680, 14, '2021-04-23', NULL);

INSERT INTO BUY_TBL VALUES('P00003', 'W00001', 1, 570, 10, '2021-01-23', NULL);
INSERT INTO BUY_TBL VALUES('P00003', 'W00001', 2, 580, 20, '2021-01-25', NULL);
INSERT INTO BUY_TBL VALUES('P00003', 'W00001', 3, 610, 35, '2021-02-21', NULL);
INSERT INTO BUY_TBL VALUES('P00003', 'W00001', 4, 750, 11, '2021-02-23', NULL);
INSERT INTO BUY_TBL VALUES('P00003', 'W00001', 5, 690, 22, '2021-04-05', NULL);
INSERT INTO BUY_TBL VALUES('P00003', 'W00001', 6, 630, 17, '2021-04-23', NULL);

INSERT INTO BUY_TBL VALUES('P00004', 'W00005', 1, 574, 8, '2021-03-11', NULL);
INSERT INTO BUY_TBL VALUES('P00004', 'W00005', 2, 611, 88, '2021-03-19', NULL);
INSERT INTO BUY_TBL VALUES('P00004', 'W00002', 1, 625, 77, '2021-04-05', NULL);

INSERT INTO BUY_TBL VALUES('P00006', 'W00002', 1, 1200, 50, '2021-02-08', NULL);
INSERT INTO BUY_TBL VALUES('P00006', 'W00002', 2, 1200, 40, '2021-03-19', NULL);
INSERT INTO BUY_TBL VALUES('P00006', 'W00003', 1, 1300, 60, '2021-03-20', NULL);
INSERT INTO BUY_TBL VALUES('P00006', 'W00003', 2, 1270, 33, '2021-04-19', NULL);

INSERT INTO BUY_TBL VALUES('P00007', 'W00005', 1, 15000, 30, '2021-01-19', NULL);
INSERT INTO BUY_TBL VALUES('P00007', 'W00005', 2, 15500, 40, '2021-03-11', NULL);
INSERT INTO BUY_TBL VALUES('P00007', 'W00005', 3, 14600, 50, '2021-04-21', NULL);

INSERT INTO BUY_TBL VALUES('P00009', 'W00002', 1, 78000, 10, '2021-01-11', NULL);
INSERT INTO BUY_TBL VALUES('P00009', 'W00001', 1, 81000, 15, '2021-03-21', NULL);

INSERT INTO BUY_TBL VALUES('P00010', 'W00001', 1, 1350, 55, '2021-01-07', NULL);
INSERT INTO BUY_TBL VALUES('P00010', 'W00001', 2, 1340, 45, '2021-02-07', NULL);
INSERT INTO BUY_TBL VALUES('P00010', 'W00001', 3, 1300, 85, '2021-03-09', NULL);
INSERT INTO BUY_TBL VALUES('P00010', 'W00003', 1, 1510, 10, '2021-03-11', NULL);
INSERT INTO BUY_TBL VALUES('P00010', 'W00005', 1, 1510, 33, '2021-03-19', NULL);
INSERT INTO BUY_TBL VALUES('P00010', 'W00003', 2, 1530, 8, '2021-04-09', NULL);
INSERT INTO BUY_TBL VALUES('P00010', 'W00005', 2, 1570, 11, '2021-04-12', NULL);


--COMMIT;

CREATE TABLE CUSTOMER_TBL
(
    C_ID	CHAR(6)         NOT NULL  PRIMARY KEY,
    C_NAME	VARCHAR2(30)    NOT NULL,
    C_BIRTH	DATE            NOT NULL,
    C_REGION	CHAR(6)     NOT NULL,
    C_GENDER	CHAR(1)     NOT NULL
);

SELECT * FROM CUSTOMER_TBL;
--COMMIT;

INSERT INTO CUSTOMER_TBL VALUES('C00001', '홍길동', '1978-05-04', 'R0001', 'M');
INSERT INTO CUSTOMER_TBL VALUES('C00002', '전우치', '1981-01-17', 'R0002', 'M');
INSERT INTO CUSTOMER_TBL VALUES('C00003', '김갑돌', '1974-03-12', 'R0003', 'M');
INSERT INTO CUSTOMER_TBL VALUES('C00004', '김갑순', '1985-07-22', 'R0004', 'F');
INSERT INTO CUSTOMER_TBL VALUES('C00005', '박선희', '1978-08-11', 'R0001', 'F');
INSERT INTO CUSTOMER_TBL VALUES('C00006', '최도우', '1972-04-19', 'R0001', 'M');
INSERT INTO CUSTOMER_TBL VALUES('C00007', '경승일', '1985-12-07', 'R0002', 'M');
INSERT INTO CUSTOMER_TBL VALUES('C00008', '김지연', '1982-11-23', 'R0003', 'F');


--5. 판매
CREATE TABLE SALES_TBL
(
    C_ID	CHAR(6)   NOT NULL,  
    PRO_ID	CHAR(6)      NOT NULL,
    S_IDX	NUMBER(4)   NOT NULL,
    S_PRICE	NUMBER(10,2)    NOT NULL,
    S_QTY	NUMBER(4)       NOT NULL,
    S_OUTDATE	DATE        NOT NULL,
    CONSTRAINT SALES_TBL_PK PRIMARY KEY(C_ID, PRO_ID, S_IDX)
);

--P00005, P00008 구매하면 안되요.

SELECT * FROM BUY_TBL;

SELECT * FROM SALES_TBL;

INSERT INTO SALES_TBL VALUES('C00001', 'P00001', 1, 1000, 3, '2021-02-04');
INSERT INTO SALES_TBL VALUES('C00001', 'P00004', 1, 800, 2, '2021-02-04');
INSERT INTO SALES_TBL VALUES('C00001', 'P00006', 1, 1450, 1, '2021-02-04');
INSERT INTO SALES_TBL VALUES('C00001', 'P00001', 2, 1000, 2, '2021-03-05');
INSERT INTO SALES_TBL VALUES('C00001', 'P00002', 1, 750, 2, '2021-03-05');
INSERT INTO SALES_TBL VALUES('C00001', 'P00007', 1, 20000, 2, '2021-03-05');
INSERT INTO SALES_TBL VALUES('C00001', 'P00002', 2, 750, 4, '2021-04-11');
INSERT INTO SALES_TBL VALUES('C00001', 'P00003', 1, 900, 8, '2021-04-12');
INSERT INTO SALES_TBL VALUES('C00001', 'P00006', 2, 1400, 5, '2021-04-13');


INSERT INTO SALES_TBL VALUES('C00002', 'P00001', 1, 1000, 3, '2021-02-07');
INSERT INTO SALES_TBL VALUES('C00002', 'P00004', 1, 800, 5, '2021-02-07');
INSERT INTO SALES_TBL VALUES('C00002', 'P00002', 1, 770, 9, '2021-03-09');
INSERT INTO SALES_TBL VALUES('C00002', 'P00007', 1, 21000, 1, '2021-03-09');
INSERT INTO SALES_TBL VALUES('C00002', 'P00004', 2, 800, 2, '2021-04-02');
INSERT INTO SALES_TBL VALUES('C00002', 'P00006', 1, 1400, 5, '2021-04-13');


INSERT INTO SALES_TBL VALUES('C00003', 'P00004', 1, 810, 7, '2021-03-11');
INSERT INTO SALES_TBL VALUES('C00003', 'P00004', 2, 800, 7, '2021-03-19');
INSERT INTO SALES_TBL VALUES('C00003', 'P00007', 1, 20000, 2, '2021-03-22');
INSERT INTO SALES_TBL VALUES('C00003', 'P00009', 1, 90000, 1, '2021-04-11');

INSERT INTO SALES_TBL VALUES('C00004', 'P00003', 1, 900, 15, '2021-02-25');
INSERT INTO SALES_TBL VALUES('C00004', 'P00004', 1, 790, 9, '2021-02-27');
INSERT INTO SALES_TBL VALUES('C00004', 'P00004', 2, 800, 11, '2021-03-11');
INSERT INTO SALES_TBL VALUES('C00004', 'P00009', 1, 91000, 5, '2021-03-19');
INSERT INTO SALES_TBL VALUES('C00004', 'P00007', 1, 19500, 10, '2021-04-02');
INSERT INTO SALES_TBL VALUES('C00004', 'P00003', 2, 870, 40, '2021-04-11');

INSERT INTO SALES_TBL VALUES('C00005', 'P00002', 1, 770, 30, '2021-02-07');
INSERT INTO SALES_TBL VALUES('C00005', 'P00003', 1, 900, 42, '2021-02-07');
INSERT INTO SALES_TBL VALUES('C00005', 'P00004', 1, 800, 55, '2021-02-07');
INSERT INTO SALES_TBL VALUES('C00005', 'P00006', 1, 1420, 78, '2021-02-07');
INSERT INTO SALES_TBL VALUES('C00005', 'P00007', 1, 20000, 7, '2021-02-07');
INSERT INTO SALES_TBL VALUES('C00005', 'P00009', 1, 92000, 8, '2021-02-07');

INSERT INTO SALES_TBL VALUES('C00007', 'P00009', 1, 90500, 1, '2021-03-05');
INSERT INTO SALES_TBL VALUES('C00007', 'P00002', 1, 800, 17, '2021-03-09');
INSERT INTO SALES_TBL VALUES('C00007', 'P00002', 2, 750, 21, '2021-04-05');
INSERT INTO SALES_TBL VALUES('C00007', 'P00003', 1, 770, 44, '2021-02-11');
INSERT INTO SALES_TBL VALUES('C00007', 'P00003', 2, 760, 40, '2021-03-09');
INSERT INTO SALES_TBL VALUES('C00007', 'P00003', 3, 600, 130, '2021-04-02');
INSERT INTO SALES_TBL VALUES('C00007', 'P00007', 1, 21000, 2, '2021-02-05');
INSERT INTO SALES_TBL VALUES('C00007', 'P00007', 2, 20000, 2, '2021-03-09');
INSERT INTO SALES_TBL VALUES('C00007', 'P00007', 3, 19500, 3, '2021-03-12');
INSERT INTO SALES_TBL VALUES('C00007', 'P00007', 4, 19000, 10, '2021-04-05');

--COMMIT;

CREATE TABLE REGION_TBL
(
    R_ID        CHAR(6)     NOT NULL PRIMARY KEY,
    R_NAME      VARCHAR2(30)    NOT NULL
);

INSERT INTO REGION_TBL VALUES('R00001', '부산');
INSERT INTO REGION_TBL VALUES('R00002', '울산');
INSERT INTO REGION_TBL VALUES('R00003', '창원');
INSERT INTO REGION_TBL VALUES('R00004', '김해');
INSERT INTO REGION_TBL VALUES('R00005', '양산');

--COMMIT;

SELECT * FROM REGION_TBL;


--1.판매할 상품 리스트 -- 상품명, 평균단가, 총개수
SELECT * FROM BUY_TBL;
SELECT * FROM CUSTOMER_TBL;
SELECT * FROM PRODUCTS_TBL;
SELECT * FROM REGION_TBL;
SELECT * FROM SALES_TBL;
SELECT * FROM WHOLESALE_TBL;

--2.도매상별로 구매한 총금액 --도매상, 금액
SELECT * FROM BUY_TBL;
SELECT * FROM CUSTOMER_TBL;
SELECT * FROM PRODUCTS_TBL;
SELECT * FROM REGION_TBL;
SELECT * FROM SALES_TBL;
SELECT * FROM WHOLESALE_TBL;

SELECT T1.W_NAME, SUM(T2.B_PRICE)
FROM WHOLESALE_TBL T1, BUY_TBL T2
WHERE T1.W_ID = T2.W_ID
GROUP BY T1.W_NAME
;

--구매목록 리스트 (상품명, 도매상이름, 구매날짜, 단가 ,수량) -- 정렬 날짜순
SELECT T1.PRO_NAME, T3.W_NAME, T2.B_INDATE, T2.B_PRICE
FROM PRODUCTS_TBL T1, BUY_TBL T2, WHOLESALE_TBL T3
WHERE T1.PRO_ID = T2.PRO_ID
AND T2.W_ID = T3.W_ID
ORDER BY T2.B_INDATE
;

--1.고객별 구매금액 고객,총구매금액
SELECT * FROM BUY_TBL;
SELECT * FROM CUSTOMER_TBL;
SELECT * FROM PRODUCTS_TBL;
SELECT * FROM REGION_TBL;
SELECT * FROM SALES_TBL;
SELECT * FROM WHOLESALE_TBL;

SELECT T1.C_NAME, SUM(T2.S_PRICE)
FROM CUSTOMER_TBL T1, SALES_TBL T2
WHERE T1.C_ID = T2.C_ID
GROUP BY T1.C_NAME
;

--2.가장 많이 팔린 상품(개수)
SELECT * FROM BUY_TBL;
SELECT * FROM CUSTOMER_TBL;
SELECT * FROM PRODUCTS_TBL;
SELECT * FROM REGION_TBL;
SELECT * FROM SALES_TBL;
SELECT * FROM WHOLESALE_TBL;

SELECT PRO_ID, SUM(S_QTY)
FROM SALES_TBL
GROUP BY PRO_ID
ORDER BY SUM(S_QTY)DESC
;

--3.2월에 가장 많은 판매금액을 기록한 상품
SELECT * FROM BUY_TBL;
SELECT * FROM CUSTOMER_TBL;
SELECT * FROM PRODUCTS_TBL;
SELECT * FROM REGION_TBL;
SELECT * FROM SALES_TBL;
SELECT * FROM WHOLESALE_TBL;

SELECT PRO_ID, SUM(S_QTY)
FROM SALES_TBL T1
WHERE S_OUTDATE < '21/03/01'
AND S_OUTDATE >= '21/02/01'
GROUP BY PRO_ID
ORDER BY SUM(S_QTY) DESC
;

--4.월별 구매 목록 1월 2월 3월 4월 금액 개수 평균 구매단가
SELECT * FROM BUY_TBL;
SELECT * FROM CUSTOMER_TBL;
SELECT * FROM PRODUCTS_TBL;
SELECT * FROM REGION_TBL;
SELECT * FROM SALES_TBL;
SELECT * FROM WHOLESALE_TBL;

SELECT T1.MONT, SUM(T1.B_PRICE), COUNT(T1.B_QTY), ROUND(AVG(T1.B_PRICE), 2)
FROM
(
SELECT PRO_ID, W_ID, B_IDX, B_PRICE, B_QTY ,SUBSTR(B_INDATE, 4, 2)AS MONT
FROM BUY_TBL
)T1
GROUP BY T1.MONT
ORDER BY T1.MONT ASC
;

--5.1월 1일부터 4월 30일까지 하루하루 구매금액, 구매개수, 평균단가
SELECT * FROM BUY_TBL;
SELECT * FROM CUSTOMER_TBL;
SELECT * FROM PRODUCTS_TBL;
SELECT * FROM REGION_TBL;
SELECT * FROM SALES_TBL;
SELECT * FROM WHOLESALE_TBL;

SELECT T1.날짜, NVL(T2.S_PRICE, 0)AS 가격, COUNT(S_OUTDATE)AS 갯수, NVL(AVG(S_PRICE), 0)AS 평균단가
FROM
(
    SELECT TO_CHAR(TO_DATE('2021/01/01', 'YYYY/MM/DD') + (LEVEL - 1), 'YY/MM/DD')AS 날짜
    FROM DUAL
    CONNECT BY LEVEL <= 120
)T1, SALES_TBL T2
WHERE T1.날짜 = T2.S_OUTDATE(+)
GROUP BY T1.날짜, T2.S_PRICE
ORDER BY T1.날짜
;

--6.고객별 판매금액
SELECT * FROM BUY_TBL;
SELECT * FROM CUSTOMER_TBL;
SELECT * FROM PRODUCTS_TBL;
SELECT * FROM REGION_TBL;
SELECT * FROM SALES_TBL;
SELECT * FROM WHOLESALE_TBL;

SELECT T1.C_NAME, SUM(T2.S_PRICE)
FROM CUSTOMER_TBL T1, SALES_TBL T2
WHERE T1.C_ID = T2.C_ID
GROUP BY T1.C_NAME
;

--7.가장많은 금액을 구매한 날짜
SELECT * FROM BUY_TBL;
SELECT * FROM CUSTOMER_TBL;
SELECT * FROM PRODUCTS_TBL;
SELECT * FROM REGION_TBL;
SELECT * FROM SALES_TBL;
SELECT * FROM WHOLESALE_TBL;

SELECT *
FROM
(
SELECT B_INDATE, B_PRICE,
       RANK() OVER(ORDER BY B_PRICE DESC)AS RNK
FROM BUY_TBL
)
WHERE RNK = 1
;

--8. 각 상품별로 이윤이 얼마나 나왔는지
SELECT * FROM BUY_TBL;
SELECT * FROM CUSTOMER_TBL;
SELECT * FROM PRODUCTS_TBL;
SELECT * FROM REGION_TBL;
SELECT * FROM SALES_TBL;
SELECT * FROM WHOLESALE_TBL;

SELECT T1.PRO_ID, NVL(SUM((T2.S_PRICE * T2.S_QTY) - (T1.B_PRICE * T1.B_QTY)), 0)
FROM BUY_TBL T1, SALES_TBL T2
WHERE T1.PRO_ID = T2.PRO_ID(+)
GROUP BY T1.PRO_ID
ORDER BY T1.PRO_ID
;

SELECT NVL(T1.PRO_ID, 0) AS 판매아이디, NVL(T1.값1, 0) - T2.값2 
FROM
(
    SELECT PRO_ID, SUM(S_QTY * S_PRICE)AS 값1
    FROM SALES_TBL 
    GROUP BY PRO_ID
)T1,
(
    SELECT PRO_ID, SUM(B_QTY * B_PRICE)AS 값2
    FROM BUY_TBL
    GROUP BY PRO_ID
)T2
WHERE T1.PRO_ID = T2.PRO_ID
ORDER BY 판매아이디 ASC
;