SELECT * FROM buy_tbl;
SELECT * FROM customer_tbl;
SELECT * FROM products_tbl;
SELECT * FROM region_tbl;
SELECT * FROM sales_tbl;
SELECT * FROM wholesale_tbl;

--1.월별 판매 금액
SELECT TO_CHAR(S_OUTDATE, 'YYYY-MM')AS MON, SUM(S_PRICE)
FROM SALES_TBL
GROUP BY TO_CHAR(S_OUTDATE, 'YYYY-MM')
ORDER BY MON ASC
;

--2.3월 2주차에서 가장 구매를 많이한 요일
SELECT *
FROM
(
SELECT TO_CHAR(B_INDATE, 'DAY'), PRO_ID, W_ID, B_IDX, B_PRICE, B_QTY, B_PRICE * B_QTY,
    RANK() OVER(ORDER BY B_PRICE * B_QTY DESC)AS 순위
FROM BUY_TBL
WHERE TO_CHAR(B_INDATE, 'MM') = 3
AND TO_CHAR(B_INDATE, 'W') = 2
)
WHERE 순위 = 1
;

--3.2021년 월별 총 구매금액
SELECT TO_CHAR(B_INDATE, 'YY/MM'), SUM(B_QTY * B_PRICE)
FROM BUY_TBL
GROUP BY TO_CHAR(B_INDATE, 'YY/MM')
;

--4.주차 총 구매금액
SELECT TO_CHAR(B_INDATE, 'MM') || '월 ' || TO_CHAR(B_INDATE, 'W') || '주차', SUM(B_QTY * B_PRICE)
FROM BUY_TBL
GROUP BY TO_CHAR(B_INDATE, 'MM') || '월 ' || TO_CHAR(B_INDATE, 'W') || '주차'
ORDER BY TO_CHAR(B_INDATE, 'MM') || '월 ' || TO_CHAR(B_INDATE, 'W') || '주차'
;

--5.분기별 총 구매금액
SELECT T2.분기2, NVL(합계, 0) || '원'
FROM
(
SELECT (TO_CHAR(B_INDATE, 'YYYY') || '년 ' || TO_CHAR(B_INDATE, 'Q') || '분기') AS 분기1, SUM(B_QTY * B_PRICE)AS 합계
FROM buy_tbl
GROUP BY (TO_CHAR(B_INDATE, 'YYYY') || '년 ' || TO_CHAR(B_INDATE, 'Q') || '분기')
)T1,
(
SELECT TO_CHAR(SYSDATE, 'YYYY') || '년 ' || TO_CHAR(TO_NUMBER(TO_CHAR(SYSDATE, 'Q'), '0') + (LEVEL - 2) || '분기') AS 분기2
FROM DUAL
CONNECT BY LEVEL <= 4
)T2
WHERE T1.분기1(+) = T2.분기2
ORDER BY T2.분기2
;

--CONCAT 문자열을 합치는 함수 문자 연결자
SELECT CONCAT('AA', 'BB') FROM DUAL;
SELECT * FROM PRODUCTS_TBL;
SELECT CONCAT(PRO_COMPANY || ' ', PRO_NAME) FROM products_tbl;

--INITCAP 첫글자를 대문자로 바꾸고 나머지는 다 소문자로 변환
SELECT INITCAP('aaAaAA') FROM DUAL;

--UPPER 다 대문자
SELECT UPPER('ASDFSDFWAEFAWEFasdfasdfasdf') FROM DUAL;

--LOWER 전체영문을 다 소문자로 바꾼다.
SELECT LOWER('ASDFASDF') FROM DUAL;

--LPAD 문자열에 특정문자 추가
SELECT LPAD('ABCDEF', 82, ' ') FROM DUAL;
SELECT LPAD('ABCDEF', 12, '@') FROM DUAL;
SELECT LPAD('ABCDEF', 82, ' ') FROM DUAL;
SELECT LPAD('ABCDEF', 82, ' ') FROM DUAL;

--RPAD 오른쪽에 특정문자 추가
SELECT RPAD('ABCDEF', 82, ' 123 ') FROM DUAL;

--LTRIM, RTRIM 공백제거
SELECT LTRIM('           AB   CD E F') FROM DUAL;
SELECT LTRIM('AA A          AB DABCE  CD E F', 'A') FROM DUAL;

--REPLACE 특정 문자를 대체하는 함수
SELECT REPLACE ('ASDBSDA@#!@4', 'A', '-')FROM DUAL;

--SUBSTR
SELECT SUBSTR('123123456', -4, -12) FROM DUAL;

--LEGNTH, LENGTHB 특정문자열의 길이, BYTE
SELECT LENGTH('12 345678  9000') FROM DUAL;
SELECT LENGTHB('홍길동아리가또') FROM DUAL; --바이트 개수를 센다
SELECT LENGTH('홍길동아리가또') FROM DUAL; --문자 갯수

--INSTR 자바스크립트에서 INDEXOF 특정문자열에 특정 문자가 포함되어 있는지를 확인한다. 맨 앞에 있는것만
SELECT INSTR('가나다라마바사아자차카타파하가나다라마바사아자차카타파하', '마', -1) FROM DUAL;

--TRIM LTRIM,RTRIM과 좀 다름           양쪽 공백 모두 제거
SELECT TRIM('   AAABBBCCC   ') FROM DUAL;
SELECT TRIM('ABD', 'A') FROM DUAL;