
--??ü???̺????? (?????? ????)
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

CREATE TABLE T
(C INTEGER PRIMARY KEY,
 D INTEGER);
 
CREATE TABLE S
(B INTEGER PRIMARY KEY,
 C INTEGER REFERENCES T(C) ON DELETE CASCADE);

INSERT INTO T
    VALUES(1,1);
INSERT INTO T
    VALUES(2,1);
    
INSERT INTO S
    VALUES(1,1);
INSERT INTO S
    VALUES(2,1);
INSERT INTO S
    VALUES(3,2);
    

DELETE FROM T WHERE C = 2;

DROP TABLE S CASCADE CONSTRAINTS;

CREATE TABLE ????????
(???? VARCHAR(10),
 ?¸??Ǽ? NUMBER,
 ?й??Ǽ? NUMBER );
 
INSERT INTO ????????
    VALUES('A??',120,80);
INSERT INTO ????????
    VALUES('B??',20,180);
INSERT INTO ????????
    VALUES('C??',10,190);
INSERT INTO ????????
    VALUES('D??',100,100);
INSERT INTO ????????
    VALUES('E??',110,90);
INSERT INTO ????????
    VALUES('F??',100,100);
INSERT INTO ????????
    VALUES('G??',70,130);
 
SELECT * FROM ????????


SELECT TOP(3) WITH TIES ????, ?¸??Ǽ? FROM ????????
ORDER BY ?¸??Ǽ? DESC;

SELECT TOP(3) WITH TIES ????, ?¸??Ǽ? 
FROM ????????
ORDER BY ?¸??Ǽ? DESC;

SELECT ????, ?¸??Ǽ?
FROM ????????
WHERE ROWNUM<=3
ORDER BY ?¸??Ǽ? DESC;

(SELECT AGE FROM CUSTOMER_TB ORDER BY AGE) 



SELECT ????, ?¸??Ǽ?
FROM (SELECT ????, ?¸??Ǽ?
        FROM ????????
        ORDER BY ?¸??Ǽ? DESC)
WHERE ROWNUM<=3;


CREATE TABLE ????
( ????ID VARCHAR2(10) PRIMARY KEY,
  ?????? VARCHAR2(100),
  ???? NUMBER );
  

CREATE TABLE ??õ??????
( ????ID VARCHAR2(10) REFERENCES ????(????ID),
  ??????ID VARCHAR2(100) REFERENCES ??????(??????ID),
  ??õ???????? DATE );

DROP TABLE ??õ?????? CASCADE CONSTRAINTS;

CREATE TABLE ????ȣ??????
( ????ID VARCHAR2(10) REFERENCES ????(????ID),
  ??????ID VARCHAR2(100) REFERENCES ??????(??????ID),
  ?????Ͻ? DATE );
  

CREATE TABLE ??????
( ??????ID VARCHAR2(100) PRIMARY KEY,
  ???????? VARCHAR2(100) );
  
INSERT INTO ????
    VALUES ('A1','ȫ????',28);
INSERT INTO ????
    VALUES ('A2','??????',28);
INSERT INTO ????
    VALUES ('A3','?ֽ?ö',28);
INSERT INTO ????
    VALUES ('B1','??????',27);
INSERT INTO ????
    VALUES ('B2','?Ǽ???',27);
INSERT INTO ????
    VALUES ('B3','??????',27);
INSERT INTO ????
    VALUES ('B4','??????',27);
INSERT INTO ????
    VALUES ('C1','?̼???',26);
INSERT INTO ????
    VALUES ('C2','???α?',26);
    
SELECT * FROM ????

INSERT INTO ??????
    VALUES ('X','???;?');
INSERT INTO ??????
    VALUES ('Y','???ֳ??̽?');
INSERT INTO ??????
    VALUES ('Z','?ڼ?');
INSERT INTO ??????
    VALUES ('I','????');
INSERT INTO ??????
    VALUES ('J','????');
INSERT INTO ??????
    VALUES ('K','??????');
SELECT * FROM ??????

INSERT INTO ??õ??????
    VALUES ('A3','Z','2022-02-24');
INSERT INTO ??õ??????
    VALUES ('A1','J','2022-02-24');
INSERT INTO ??õ??????
    VALUES ('C2','I','2022-02-24');
INSERT INTO ??õ??????
    VALUES ('A2','X','2022-02-24');
INSERT INTO ??õ??????
    VALUES ('B2','Y','2022-02-24');
SELECT * FROM ??õ??????

INSERT INTO ????ȣ??????
    VALUES ('B2','Y','2022-02-20');
INSERT INTO ????ȣ??????
    VALUES ('A2','Y','2022-02-20');
INSERT INTO ????ȣ??????
    VALUES ('A1','I','2022-02-21');

SELECT * FROM ????ȣ??????

--1
SELECT C.??????ID, C.????????
FROM ???? A INNER JOIN ??õ?????? B
ON (A.????ID = B.????ID) INNER JOIN ?????? C
ON (B.??????ID = C.??????ID) 
--LEFT OUTER JOIN ????ȣ?????? D
--ON (B.????ID = D.????ID AND B.??????ID = D.??????ID)
WHERE A.????ID = 'C2'
AND B.??õ???????? = TO_CHAR(SYSDATE,'YYYY.MM.DD')
AND NOT EXISTS (SELECT X.??????ID
                FROM ????ȣ?????? X
                    WHERE X.????ID=B.????ID);
                    --????ȣ???????? ???ϵ? ?????????? ?????ϰ?(NOT EXISTS) ???µ?

--2
SELECT C.??????ID, C.????????
FROM ???? A INNER JOIN ??õ?????? B
ON (A.????ID = B.????ID) INNER JOIN ?????? C
ON (B.??????ID = C.??????ID) RIGHT OUTER JOIN ????ȣ?????? D 
--????ȣ???????? ?????? ?????? ???????? ?????? ?ִ? ȣ?ø? MERGE??, ???????? NULL)
ON (B.????ID = D.????ID AND B.??????ID = D.??????ID)
WHERE B.??õ???????? = TO_CHAR(SYSDATE,'YYYY.MM.DD')
AND D.??????ID IS NOT NULL;

--3
SELECT C.??????ID, C.????????
FROM ???? A INNER JOIN ??õ?????? B
ON (A.????ID = B.????ID) INNER JOIN ?????? C
ON (B.??????ID = C.??????ID) LEFT OUTER JOIN ????ȣ?????? D
ON (B.????ID = D.????ID AND B.??????ID = D.??????ID)
--WHERE A.????ID = 'C2'
AND B.??õ???????? = TO_CHAR(SYSDATE,'YYYY.MM.DD')
AND D.??????ID IS NULL;

--4
SELECT C.??????ID, C.????????
FROM ???? A INNER JOIN ??õ?????? B
--A.????ID = 'A1' AND 
ON (A.????ID = B.????ID) INNER JOIN ?????? C
ON (B.??????ID = C.??????ID) 
--LEFT OUTER JOIN ????ȣ?????? D
--ON (B.????ID = D.????ID AND B.??????ID = D.??????ID)
--WHERE A.????ID = 'C2'
WHERE B.??õ???????? = TO_CHAR(SYSDATE,'YYYY.MM.DD')
AND NOT EXISTS (SELECT X.??????ID
                FROM ????ȣ?????? X
                    WHERE X.????ID=B.????ID
                    AND X.??????ID=B.??????ID);


CREATE TABLE ???ں?????
( ???? DATE,
  ?????? NUMBER);
  
INSERT INTO ???ں?????
    VALUES ('2015-11-01',1000);
INSERT INTO ???ں?????
    VALUES ('2015-11-02',1000);
INSERT INTO ???ں?????
    VALUES ('2015-11-03',1000);
INSERT INTO ???ں?????
    VALUES ('2015-11-04',1000);
INSERT INTO ???ں?????
    VALUES ('2015-11-05',1000);
INSERT INTO ???ں?????
    VALUES ('2015-11-06',1000);
INSERT INTO ???ں?????
    VALUES ('2015-11-07',1000);
INSERT INTO ???ں?????
    VALUES ('2015-11-08',1000);
INSERT INTO ???ں?????
    VALUES ('2015-11-09',1000);
INSERT INTO ???ں?????
    VALUES ('2015-11-10',1000);

SELECT * FROM ???ں?????

DROP TABLE ???ں????? CASCADE CONSTRAINTS;

SELECT A.????
FROM ???ں? ???? A ;

SELECT A.???? SUM(B.??????) AS ??????????
FROM ???ں????? A JOIN ???ں????? B 
ON (A.???? >= B.????)
GROUP BY A.????
ORDER BY A.???? 

CREATE TABLE TBL1
( EID VARCHAR2(10),
  EPASSWORD VARCHAR2(10) );

INSERT INTO TBL1
    VALUES ('AAA','ȫ????');
INSERT INTO TBL1
    VALUES ('BBB','??????');


CREATE TABLE TBL2
( EID VARCHAR2(10),
  EPASSWORD VARCHAR2(10) );

INSERT INTO TBL2
    VALUES ('AAA','ȫ????');
INSERT INTO TBL2
    VALUES ('CCC','?ֽ?ö');
    
SELECT * FROM TBL2

DROP TABLE TBL1 CASCADE CONSTRAINTS;

SELECT A.EID, B.EID
FROM TBL1 A FULL OUTER JOIN TBL2 B
ON A.EID = B.EID

SELECT A.EID, B.EID
FROM TBL1 A, TBL2 B
WHERE A.EID = B.EID
UNION ALL
SELECT A.EID, NULL
FROM TBL1 A
WHERE NOT EXISTS (SELECT 1 FROM TBL2 B WHERE A.EID = B.EID) --AAAȫ?????? ???????? ???? ??
UNION ALL
SELECT NULL, B.EID
FROM TBL2 B
WHERE NOT EXISTS (SELECT 1 FROM TBL1 A WHERE B.EID = A.EID)

SELECT NULL
FROM TBL2


CREATE TABLE ????
( ??????ȣ VARCHAR2(10) PRIMARY KEY,
  ?????? VARCHAR2(10),
  ?Ի????? DATE,
  ?Ŵ?????????ȣ VARCHAR2(10) REFERENCES ????(??????ȣ) );
  
INSERT INTO ????
    VALUES ('001','ȫ?浿','2012-01-01',NULL);
INSERT INTO ????
    VALUES ('002','??????','2012-01-01','001');
INSERT INTO ????
    VALUES ('003','?̼???','2013-01-01','001');
INSERT INTO ????
    VALUES ('004','?̹???','2013-01-01','001');
INSERT INTO ????
    VALUES ('005','?̺???','2013-01-01',NULL);
INSERT INTO ????
    VALUES ('006','?ȼ???','2014-01-01','005');
INSERT INTO ????
    VALUES ('007','?̼???','2014-01-01','005');
INSERT INTO ????
    VALUES ('008','?躴??','2014-01-01','005');
SELECT * FROM ????

SELECT ??????ȣ, ??????, ?Ի?????, ?Ŵ?????????ȣ
FROM ????
START WITH ?Ŵ?????????ȣ IS NULL
CONNECT BY PRIOR ??????ȣ = ?Ŵ?????????ȣ
AND ?Ի????? BETWEEN '2013-01-01' AND '2013-12-31'
ORDER SIBLINGS BY ??????ȣ;


CREATE TABLE SQLD_2101
( N1 VARCHAR2(10),
  V1 VARCHAR2(10));

INSERT INTO SQLD_2101
    VALUES (1,'A');
INSERT INTO SQLD_2101
    VALUES (2,NULL);
INSERT INTO SQLD_2101
    VALUES (3,'B');
INSERT INTO SQLD_2101
    VALUES (4,'C');
    
SELECT * FROM SQLD_2101

CREATE TABLE SQLD_2102
( N1 VARCHAR2(10),
  V1 VARCHAR2(10));
  
INSERT INTO SQLD_2102
    VALUES (1,'A');
INSERT INTO SQLD_2102
    VALUES (2,NULL);
INSERT INTO SQLD_2102
    VALUES (3,'B');
SELECT * FROM SQLD_2102

SELECT * FROM SQLD_2101
WHERE V1 NOT IN (SELECT V1 FROM SQLD_2102);

SELECT * FROM SQLD_2101 A
WHERE EXISTS (SELECT 'X' FROM SQLD_2102 B
                WHERE A.V1 = B.V1);
                
SELECT * FROM SQLD_2101 A
WHERE NOT EXISTS (SELECT 'X' FROM SQLD_2102 B
                    WHERE A.V1 = B.V1);
                    
WITH emp AS (
    SELECT '7698' empno, 'BLAKE'  ename, 'MANAGER'  job, '7839' mgr, '30' deptno FROM dual UNION ALL
    SELECT '7782' empno, 'CLARK'  ename, 'MANAGER'  job, '7839' mgr, '10' deptno FROM dual UNION ALL
    SELECT '7566' empno, 'JONES'  ename, 'MANAGER'  job, '7839' mgr, '20' deptno FROM dual UNION ALL
    SELECT '7788' empno, 'SCOTT'  ename, 'ANALYST'  job, '7566' mgr, '20' deptno FROM dual UNION ALL
    SELECT '7902' empno, 'FORD'   ename, 'ANALYST'  job, '7566' mgr, '20' deptno FROM dual UNION ALL
    SELECT '7499' empno, 'ALLEN'  ename, 'SALESMAN' job, '7698' mgr, '10' deptno FROM dual UNION ALL
    SELECT '7521' empno, 'WARD'   ename, 'SALESMAN' job, '7698' mgr, '20' deptno FROM dual UNION ALL
    SELECT '7654' empno, 'MARTIN' ename, 'SALESMAN' job, '7698' mgr, '30' deptno FROM dual UNION ALL
    SELECT '7844' empno, 'TURNER' ename, 'SALESMAN' job, '7698' mgr, '30' deptno FROM dual
)
SELECT DECODE(GROUPING(job), 1, '?Ѱ?', job) job
     , DECODE(GROUPING_ID(job, deptno), 1, '?հ?', deptno) deptno
     , COUNT(*) cnt
  FROM emp
 GROUP BY GROUPING SETS(job, (job, deptno), ())
 ;
 
SELECT * FROM EMP



CREATE TABLE SQL30_1
( COL1 VARCHAR2(30),
  COL2 NUMBER);
INSERT INTO SQL30_1
    VALUES (1,20);
INSERT INTO SQL30_1
    VALUES (2,30);
INSERT INTO SQL30_1
    VALUES (3,40);
INSERT INTO SQL30_1
    VALUES ('A',50);
SELECT * FROM SQL30_1

CREATE TABLE SQL30_2
( COL1 VARCHAR2(30),
  COL3 VARCHAR2(30),
  COL4 NUMBER);
INSERT INTO SQL30_2
    VALUES (1,'ABC',10);
INSERT INTO SQL30_2
    VALUES (2,'DEF',9);
INSERT INTO SQL30_2
    VALUES (3,'XY',15);
INSERT INTO SQL30_2
    VALUES ('A','1',5);
DROP TABLE SQL30_1 CASCADE CONSTRAINTS;
SELECT* FROM SQL30_2
--1
SELECT A.COL1, A.COL2
FROM SQL30_1 A
WHERE A.COL1 > 0;

--2
SELECT A.COL1, B.COL4
FROM SQL30_1 A INNER JOIN SQL30_2 B
    ON (A.COL1 = B.COL1)
WHERE B.COL3 > 'X';

DROP TABLE SQL30_1 CASCADE CONSTRAINTS;

--3
SELECT COUNT(*)
FROM SQL30_1 A
WHERE EXISTS (SELECT 'X'
        FROM SQL30_2 B
        WHERE A.COL2 = B.COL4);
        
--4
SELECT A.COL2
FROM SQL30_1 A INNER JOIN SQL30_2 B
        ON (A.COL1 = B.COL1)
WHERE B.COL4 > '1';


CREATE TABLE SQLD_3017
( COL1 VARCHAR2(30),
  COL2 NUMBER);
INSERT INTO SQLD_3017
    VALUES ('Y', 20);
INSERT INTO SQLD_3017
    VALUES ('X', 30);
INSERT INTO SQLD_3017
    VALUES ('A', 40);
INSERT INTO SQLD_3017
    VALUES ('A', 50);
INSERT INTO SQLD_3017
    VALUES (NULL, 10);
INSERT INTO SQLD_3017
    VALUES (NULL, 80);
INSERT INTO SQLD_3017
    VALUES (NULL, NULL);
SELECT *FROM SQLD_3017

SELECT NVL(COUNT(*), 9999)
FROM SQLD_3017;
--WHERE 1=2;

SELECT COUNT(*)
FROM SQLD_3017
WHERE 1=2;

SELECT * FROM SQLD_3022;

CREATE TABLE SQLD_3022
( COL1 NUMBER,
  COL2 NUMBER);
INSERT INTO SQLD_3022
    VALUES (100, 100);
INSERT INTO SQLD_3022
    VALUES (NULL, 60);
INSERT INTO SQLD_3022
    VALUES (NULL,NULL);
INSERT INTO SQLD_3022
    VALUES (100, 100);
    
SELECT COALESCE(COL1,50) FROM SQLD_3022;


SELECT UPPER('sqldeveloper') FROM DUAL;

CREATE TABLE SQLD_3419
( N1 NUMBER,
  N2 NUMBER,
  C1 VARCHAR2(10),
  C2 VARCHAR2(10) );
  
INSERT INTO SQLD_3419
    VALUES (1,NULL,'A',NULL);
INSERT INTO SQLD_3419
    VALUES (2,1,'B','A');
INSERT INTO SQLD_3419
    VALUES (4,2,'D','B');
INSERT INTO SQLD_3419
    VALUES (5,4,'E','D');
INSERT INTO SQLD_3419
    VALUES (3,1,'C','A');
    
SELECT C1, C2, N1, N2 FROM SQLD_3419 WHERE N1=4 START WITH N2 IS NULL CONNECT BY PRIOR N1=N2 ;
SELECT C1, C2, N1, N2 FROM SQLD_3419 START WITH C2 = 'B' CONNECT BY PRIOR N1=N2 AND C2 <> 'D' ;
SELECT C1, C2, N1, N2 FROM SQLD_3419 START WITH C1 = 'B' CONNECT BY PRIOR N1=N2 AND PRIOR C2 = 'B';
SELECT C1, C2, N1, N2 FROM SQLD_3419 WHERE C1 <> 'B' START WITH N1 = 2 CONNECT BY PRIOR N1=N2 AND PRIOR N1 = 2;

CREATE TABLE T1
( COL1 NUMBER );
CREATE TABLE T2
( COL1 NUMBER );
CREATE TABLE T3
( COL1 NUMBER );
CREATE TABLE T4
( COL1 NUMBER );



INSERT INTO T1 VALUES (1);
INSERT INTO T1 VALUES (2);
INSERT INTO T1 VALUES (3);
INSERT INTO T1 VALUES (4);

INSERT INTO T2 VALUES (1);
INSERT INTO T2 VALUES (2);
INSERT INTO T2 VALUES (3);
INSERT INTO T2 VALUES (NULL);

INSERT INTO T3 VALUES (1);
INSERT INTO T3 VALUES (NULL);
INSERT INTO T3 VALUES (3);
INSERT INTO T3 VALUES (5);

INSERT INTO T4 VALUES (1);
INSERT INTO T4 VALUES (2);
INSERT INTO T4 VALUES (5);
INSERT INTO T4 VALUES (6);

SELECT * FROM T4;

SELECT COUNT(*)
FROM T1, T2, T3, T4
WHERE T1.COL1 = T2.COL1(+)
AND T2.COL1 = T3.COL1(+)
AND T3.COL1 = T4.COL1;

CREATE TABLE EMP3427
( EMP_ID VARCHAR(10),
  DEPT_ID VARCHAR(10),
  SALARY NUMBER );
  
INSERT INTO EMP3427
    VALUES ( 1,10,1000);
INSERT INTO EMP3427
    VALUES ( 2,10,1500);
INSERT INTO EMP3427
    VALUES ( 3,10,1500);
INSERT INTO EMP3427
    VALUES ( 4,20,1200);
INSERT INTO EMP3427
    VALUES ( 5,20,1100);
INSERT INTO EMP3427
    VALUES ( 6,20,100);
INSERT INTO EMP3427
    VALUES ( 7,30,4000);
INSERT INTO EMP3427
    VALUES ( 8,30,5000);
    
SELECT DEPT_ID, SALARY
FROM (
      SELECT ROW_NUMBER() OVER(PARTITION BY DEPT_ID ORDER BY SALARY DESC) RN, DEPT_ID, SALARY
      FROM EMP3427 )
WHERE RN = 1;

SELECT SUM(LENGTH('1')) FROM DUAL

CREATE TABLE TAB26_1
( COL1 CHAR(10),
  COL2 CHAR(10) );
  
INSERT INTO TAB26_1 VALUES ('1','');
INSERT INTO TAB26_1 VALUES ('2','');
INSERT INTO TAB26_1 VALUES ('3','');
SELECT * FROM TAB26_1

SELECT COUNT(NULL)
FROM TAB26_1;