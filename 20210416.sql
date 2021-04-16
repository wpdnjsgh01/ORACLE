SELECT * FROM buy_tbl;
SELECT * FROM customer_tbl;
SELECT * FROM products_tbl;
SELECT * FROM region_tbl;
SELECT * FROM sales_tbl;
SELECT * FROM wholesale_tbl;

--1.���� �Ǹ� �ݾ�
SELECT TO_CHAR(S_OUTDATE, 'YYYY-MM')AS MON, SUM(S_PRICE)
FROM SALES_TBL
GROUP BY TO_CHAR(S_OUTDATE, 'YYYY-MM')
ORDER BY MON ASC
;

--2.3�� 2�������� ���� ���Ÿ� ������ ����
SELECT *
FROM
(
SELECT TO_CHAR(B_INDATE, 'DAY'), PRO_ID, W_ID, B_IDX, B_PRICE, B_QTY, B_PRICE * B_QTY,
    RANK() OVER(ORDER BY B_PRICE * B_QTY DESC)AS ����
FROM BUY_TBL
WHERE TO_CHAR(B_INDATE, 'MM') = 3
AND TO_CHAR(B_INDATE, 'W') = 2
)
WHERE ���� = 1
;

--3.2021�� ���� �� ���űݾ�
SELECT TO_CHAR(B_INDATE, 'YY/MM'), SUM(B_QTY * B_PRICE)
FROM BUY_TBL
GROUP BY TO_CHAR(B_INDATE, 'YY/MM')
;

--4.���� �� ���űݾ�
SELECT TO_CHAR(B_INDATE, 'MM') || '�� ' || TO_CHAR(B_INDATE, 'W') || '����', SUM(B_QTY * B_PRICE)
FROM BUY_TBL
GROUP BY TO_CHAR(B_INDATE, 'MM') || '�� ' || TO_CHAR(B_INDATE, 'W') || '����'
ORDER BY TO_CHAR(B_INDATE, 'MM') || '�� ' || TO_CHAR(B_INDATE, 'W') || '����'
;

--5.�б⺰ �� ���űݾ�
SELECT T2.�б�2, NVL(�հ�, 0) || '��'
FROM
(
SELECT (TO_CHAR(B_INDATE, 'YYYY') || '�� ' || TO_CHAR(B_INDATE, 'Q') || '�б�') AS �б�1, SUM(B_QTY * B_PRICE)AS �հ�
FROM buy_tbl
GROUP BY (TO_CHAR(B_INDATE, 'YYYY') || '�� ' || TO_CHAR(B_INDATE, 'Q') || '�б�')
)T1,
(
SELECT TO_CHAR(SYSDATE, 'YYYY') || '�� ' || TO_CHAR(TO_NUMBER(TO_CHAR(SYSDATE, 'Q'), '0') + (LEVEL - 2) || '�б�') AS �б�2
FROM DUAL
CONNECT BY LEVEL <= 4
)T2
WHERE T1.�б�1(+) = T2.�б�2
ORDER BY T2.�б�2
;

--CONCAT ���ڿ��� ��ġ�� �Լ� ���� ������
SELECT CONCAT('AA', 'BB') FROM DUAL;
SELECT * FROM PRODUCTS_TBL;
SELECT CONCAT(PRO_COMPANY || ' ', PRO_NAME) FROM products_tbl;

--INITCAP ù���ڸ� �빮�ڷ� �ٲٰ� �������� �� �ҹ��ڷ� ��ȯ
SELECT INITCAP('aaAaAA') FROM DUAL;

--UPPER �� �빮��
SELECT UPPER('ASDFSDFWAEFAWEFasdfasdfasdf') FROM DUAL;

--LOWER ��ü������ �� �ҹ��ڷ� �ٲ۴�.
SELECT LOWER('ASDFASDF') FROM DUAL;

--LPAD ���ڿ��� Ư������ �߰�
SELECT LPAD('ABCDEF', 82, ' ') FROM DUAL;
SELECT LPAD('ABCDEF', 12, '@') FROM DUAL;
SELECT LPAD('ABCDEF', 82, ' ') FROM DUAL;
SELECT LPAD('ABCDEF', 82, ' ') FROM DUAL;

--RPAD �����ʿ� Ư������ �߰�
SELECT RPAD('ABCDEF', 82, ' 123 ') FROM DUAL;

--LTRIM, RTRIM ��������
SELECT LTRIM('           AB   CD E F') FROM DUAL;
SELECT LTRIM('AA A          AB DABCE  CD E F', 'A') FROM DUAL;

--REPLACE Ư�� ���ڸ� ��ü�ϴ� �Լ�
SELECT REPLACE ('ASDBSDA@#!@4', 'A', '-')FROM DUAL;

--SUBSTR
SELECT SUBSTR('123123456', -4, -12) FROM DUAL;

--LEGNTH, LENGTHB Ư�����ڿ��� ����, BYTE
SELECT LENGTH('12 345678  9000') FROM DUAL;
SELECT LENGTHB('ȫ�浿�Ƹ�����') FROM DUAL; --����Ʈ ������ ����
SELECT LENGTH('ȫ�浿�Ƹ�����') FROM DUAL; --���� ����

--INSTR �ڹٽ�ũ��Ʈ���� INDEXOF Ư�����ڿ��� Ư�� ���ڰ� ���ԵǾ� �ִ����� Ȯ���Ѵ�. �� �տ� �ִ°͸�
SELECT INSTR('�����ٶ󸶹ٻ������īŸ���ϰ����ٶ󸶹ٻ������īŸ����', '��', -1) FROM DUAL;

--TRIM LTRIM,RTRIM�� �� �ٸ�           ���� ���� ��� ����
SELECT TRIM('   AAABBBCCC   ') FROM DUAL;
SELECT TRIM('ABD', 'A') FROM DUAL;