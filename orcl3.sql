
--ÀüÃ¼Å×ÀÌºíÃâ·Â (»èÁ¦¸¦ À§ÇÔ)
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

CREATE TABLE ÆÀº°¼ºÀû
(ÆÀ¸í VARCHAR(10),
 ½Â¸®°Ç¼ö NUMBER,
 ÆÐ¹è°Ç¼ö NUMBER );
 
INSERT INTO ÆÀº°¼ºÀû
    VALUES('AÆÀ',120,80);
INSERT INTO ÆÀº°¼ºÀû
    VALUES('BÆÀ',20,180);
INSERT INTO ÆÀº°¼ºÀû
    VALUES('CÆÀ',10,190);
INSERT INTO ÆÀº°¼ºÀû
    VALUES('DÆÀ',100,100);
INSERT INTO ÆÀº°¼ºÀû
    VALUES('EÆÀ',110,90);
INSERT INTO ÆÀº°¼ºÀû
    VALUES('FÆÀ',100,100);
INSERT INTO ÆÀº°¼ºÀû
    VALUES('GÆÀ',70,130);
 
SELECT * FROM ÆÀº°¼ºÀû


SELECT TOP(3) WITH TIES ÆÀ¸í, ½Â¸®°Ç¼ö FROM ÆÀº°¼ºÀû
ORDER BY ½Â¸®°Ç¼ö DESC;

SELECT TOP(3) WITH TIES ÆÀ¸í, ½Â¸®°Ç¼ö 
FROM ÆÀº°¼ºÀû
ORDER BY ½Â¸®°Ç¼ö DESC;

SELECT ÆÀ¸í, ½Â¸®°Ç¼ö
FROM ÆÀº°¼ºÀû
WHERE ROWNUM<=3
ORDER BY ½Â¸®°Ç¼ö DESC;

(SELECT AGE FROM CUSTOMER_TB ORDER BY AGE) 



SELECT ÆÀ¸í, ½Â¸®°Ç¼ö
FROM (SELECT ÆÀ¸í, ½Â¸®°Ç¼ö
        FROM ÆÀº°¼ºÀû
        ORDER BY ½Â¸®°Ç¼ö DESC)
WHERE ROWNUM<=3;


CREATE TABLE °í°´
( °í°´ID VARCHAR2(10) PRIMARY KEY,
  °í°´¸í VARCHAR2(100),
  ³ªÀÌ NUMBER );
  

CREATE TABLE ÃßÃµÄÁÅÙÃ÷
( °í°´ID VARCHAR2(10) REFERENCES °í°´(°í°´ID),
  ÄÁÅÙÃ÷ID VARCHAR2(100) REFERENCES ÄÁÅÙÃ÷(ÄÁÅÙÃ÷ID),
  ÃßÃµ´ë»óÀÏÀÚ DATE );

DROP TABLE ÃßÃµÄÁÅÙÃ÷ CASCADE CONSTRAINTS;

CREATE TABLE ºñ¼±È£ÄÁÅÙÃ÷
( °í°´ID VARCHAR2(10) REFERENCES °í°´(°í°´ID),
  ÄÁÅÙÃ÷ID VARCHAR2(100) REFERENCES ÄÁÅÙÃ÷(ÄÁÅÙÃ÷ID),
  µî·ÏÀÏ½Ã DATE );
  

CREATE TABLE ÄÁÅÙÃ÷
( ÄÁÅÙÃ÷ID VARCHAR2(100) PRIMARY KEY,
  ÄÁÅÙÃ÷¸í VARCHAR2(100) );
  
INSERT INTO °í°´
    VALUES ('A1','È«Áö¼ö',28);
INSERT INTO °í°´
    VALUES ('A2','À±Á¤ÇÑ',28);
INSERT INTO °í°´
    VALUES ('A3','ÃÖ½ÂÃ¶',28);
INSERT INTO °í°´
    VALUES ('B1','¹®ÁØÈÖ',27);
INSERT INTO °í°´
    VALUES ('B2','±Ç¼ø¿µ',27);
INSERT INTO °í°´
    VALUES ('B3','Àü¿ø¿ì',27);
INSERT INTO °í°´
    VALUES ('B4','ÀÌÁöÈÆ',27);
INSERT INTO °í°´
    VALUES ('C1','ÀÌ¼®¹Î',26);
INSERT INTO °í°´
    VALUES ('C2','±è¹Î±Ô',26);
    
SELECT * FROM °í°´

INSERT INTO ÄÁÅÙÃ÷
    VALUES ('X','¿ï½Í¾Ê');
INSERT INTO ÄÁÅÙÃ÷
    VALUES ('Y','¾ÆÁÖ³ªÀÌ½º');
INSERT INTO ÄÁÅÙÃ÷
    VALUES ('Z','¹Ú¼ö');
INSERT INTO ÄÁÅÙÃ÷
    VALUES ('I','¸¸¼¼');
INSERT INTO ÄÁÅÙÃ÷
    VALUES ('J','·¦¶ó');
INSERT INTO ÄÁÅÙÃ÷
    VALUES ('K','°í¸¿´Ù');
SELECT * FROM ÄÁÅÙÃ÷

INSERT INTO ÃßÃµÄÁÅÙÃ÷
    VALUES ('A3','Z','2022-02-24');
INSERT INTO ÃßÃµÄÁÅÙÃ÷
    VALUES ('A1','J','2022-02-24');
INSERT INTO ÃßÃµÄÁÅÙÃ÷
    VALUES ('C2','I','2022-02-24');
INSERT INTO ÃßÃµÄÁÅÙÃ÷
    VALUES ('A2','X','2022-02-24');
INSERT INTO ÃßÃµÄÁÅÙÃ÷
    VALUES ('B2','Y','2022-02-24');
SELECT * FROM ÃßÃµÄÁÅÙÃ÷

INSERT INTO ºñ¼±È£ÄÁÅÙÃ÷
    VALUES ('B2','Y','2022-02-20');
INSERT INTO ºñ¼±È£ÄÁÅÙÃ÷
    VALUES ('A2','Y','2022-02-20');
INSERT INTO ºñ¼±È£ÄÁÅÙÃ÷
    VALUES ('A1','I','2022-02-21');

SELECT * FROM ºñ¼±È£ÄÁÅÙÃ÷

--1
SELECT C.ÄÁÅÙÃ÷ID, C.ÄÁÅÙÃ÷¸í
FROM °í°´ A INNER JOIN ÃßÃµÄÁÅÙÃ÷ B
ON (A.°í°´ID = B.°í°´ID) INNER JOIN ÄÁÅÙÃ÷ C
ON (B.ÄÁÅÙÃ÷ID = C.ÄÁÅÙÃ÷ID) 
--LEFT OUTER JOIN ºñ¼±È£ÄÁÅÙÃ÷ D
--ON (B.°í°´ID = D.°í°´ID AND B.ÄÁÅÙÃ÷ID = D.ÄÁÅÙÃ÷ID)
WHERE A.°í°´ID = 'C2'
AND B.ÃßÃµ´ë»óÀÏÀÚ = TO_CHAR(SYSDATE,'YYYY.MM.DD')
AND NOT EXISTS (SELECT X.ÄÁÅÙÃ÷ID
                FROM ºñ¼±È£ÄÁÅÙÃ÷ X
                    WHERE X.°í°´ID=B.°í°´ID);
                    --ºñ¼±È£ÄÁÅÙÃ÷¿¡ µî·ÏµÈ ¸ðµç»ç¶÷À» Á¦¿ÜÇÏ°í(NOT EXISTS) Ãâ·ÂµÊ

--2
SELECT C.ÄÁÅÙÃ÷ID, C.ÄÁÅÙÃ÷¸í
FROM °í°´ A INNER JOIN ÃßÃµÄÁÅÙÃ÷ B
ON (A.°í°´ID = B.°í°´ID) INNER JOIN ÄÁÅÙÃ÷ C
ON (B.ÄÁÅÙÃ÷ID = C.ÄÁÅÙÃ÷ID) RIGHT OUTER JOIN ºñ¼±È£ÄÁÅÙÃ÷ D 
--ºñ¼±È£ÄÁÅÙÃ÷¿¡ µ¿ÀÏÇÑ °í°´°ú ÄÁÅÙÃ÷¸¦ °¡Áö°í ÀÖ´Â È£½Ã¸¸ MERGEµÊ, ³ª¸ÓÁö´Â NULL)
ON (B.°í°´ID = D.°í°´ID AND B.ÄÁÅÙÃ÷ID = D.ÄÁÅÙÃ÷ID)
WHERE B.ÃßÃµ´ë»óÀÏÀÚ = TO_CHAR(SYSDATE,'YYYY.MM.DD')
AND D.ÄÁÅÙÃ÷ID IS NOT NULL;

--3
SELECT C.ÄÁÅÙÃ÷ID, C.ÄÁÅÙÃ÷¸í
FROM °í°´ A INNER JOIN ÃßÃµÄÁÅÙÃ÷ B
ON (A.°í°´ID = B.°í°´ID) INNER JOIN ÄÁÅÙÃ÷ C
ON (B.ÄÁÅÙÃ÷ID = C.ÄÁÅÙÃ÷ID) LEFT OUTER JOIN ºñ¼±È£ÄÁÅÙÃ÷ D
ON (B.°í°´ID = D.°í°´ID AND B.ÄÁÅÙÃ÷ID = D.ÄÁÅÙÃ÷ID)
--WHERE A.°í°´ID = 'C2'
AND B.ÃßÃµ´ë»óÀÏÀÚ = TO_CHAR(SYSDATE,'YYYY.MM.DD')
AND D.ÄÁÅÙÃ÷ID IS NULL;

--4
SELECT C.ÄÁÅÙÃ÷ID, C.ÄÁÅÙÃ÷¸í
FROM °í°´ A INNER JOIN ÃßÃµÄÁÅÙÃ÷ B
--A.°í°´ID = 'A1' AND 
ON (A.°í°´ID = B.°í°´ID) INNER JOIN ÄÁÅÙÃ÷ C
ON (B.ÄÁÅÙÃ÷ID = C.ÄÁÅÙÃ÷ID) 
--LEFT OUTER JOIN ºñ¼±È£ÄÁÅÙÃ÷ D
--ON (B.°í°´ID = D.°í°´ID AND B.ÄÁÅÙÃ÷ID = D.ÄÁÅÙÃ÷ID)
--WHERE A.°í°´ID = 'C2'
WHERE B.ÃßÃµ´ë»óÀÏÀÚ = TO_CHAR(SYSDATE,'YYYY.MM.DD')
AND NOT EXISTS (SELECT X.ÄÁÅÙÃ÷ID
                FROM ºñ¼±È£ÄÁÅÙÃ÷ X
                    WHERE X.°í°´ID=B.°í°´ID
                    AND X.ÄÁÅÙÃ÷ID=B.ÄÁÅÙÃ÷ID);


CREATE TABLE ÀÏÀÚº°¸ÅÃâ
( ÀÏÀÚ DATE,
  ¸ÅÃâ¾× NUMBER);
  
INSERT INTO ÀÏÀÚº°¸ÅÃâ
    VALUES ('2015-11-01',1000);
INSERT INTO ÀÏÀÚº°¸ÅÃâ
    VALUES ('2015-11-02',1000);
INSERT INTO ÀÏÀÚº°¸ÅÃâ
    VALUES ('2015-11-03',1000);
INSERT INTO ÀÏÀÚº°¸ÅÃâ
    VALUES ('2015-11-04',1000);
INSERT INTO ÀÏÀÚº°¸ÅÃâ
    VALUES ('2015-11-05',1000);
INSERT INTO ÀÏÀÚº°¸ÅÃâ
    VALUES ('2015-11-06',1000);
INSERT INTO ÀÏÀÚº°¸ÅÃâ
    VALUES ('2015-11-07',1000);
INSERT INTO ÀÏÀÚº°¸ÅÃâ
    VALUES ('2015-11-08',1000);
INSERT INTO ÀÏÀÚº°¸ÅÃâ
    VALUES ('2015-11-09',1000);
INSERT INTO ÀÏÀÚº°¸ÅÃâ
    VALUES ('2015-11-10',1000);

SELECT * FROM ÀÏÀÚº°¸ÅÃâ

DROP TABLE ÀÏÀÚº°¸ÅÃâ CASCADE CONSTRAINTS;

SELECT A.ÀÏÀÚ
FROM ÀÏÀÚº° ¸ÅÃâ A ;

SELECT A.ÀÏÀÚ SUM(B.¸ÅÃâ¾×) AS ´©Àû¸ÅÃâ¾×
FROM ÀÏÀÚº°¸ÅÃâ A JOIN ÀÏÀÚº°¸ÅÃâ B 
ON (A.ÀÏÀÚ >= B.ÀÏÀÚ)
GROUP BY A.ÀÏÀÚ
ORDER BY A.ÀÏÀÚ 

CREATE TABLE TBL1
( EID VARCHAR2(10),
  EPASSWORD VARCHAR2(10) );

INSERT INTO TBL1
    VALUES ('AAA','È«Áö¼ö');
INSERT INTO TBL1
    VALUES ('BBB','À±Á¤ÇÑ');


CREATE TABLE TBL2
( EID VARCHAR2(10),
  EPASSWORD VARCHAR2(10) );

INSERT INTO TBL2
    VALUES ('AAA','È«Áö¼ö');
INSERT INTO TBL2
    VALUES ('CCC','ÃÖ½ÂÃ¶');
    
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
WHERE NOT EXISTS (SELECT 1 FROM TBL2 B WHERE A.EID = B.EID) --AAAÈ«Áö¼ö°¡ Á¸ÀçÇÏÁö ¾ÊÀ» ¶§
UNION ALL
SELECT NULL, B.EID
FROM TBL2 B
WHERE NOT EXISTS (SELECT 1 FROM TBL1 A WHERE B.EID = A.EID)

SELECT NULL
FROM TBL2


CREATE TABLE »ç¿ø
( »ç¿ø¹øÈ£ VARCHAR2(10) PRIMARY KEY,
  »ç¿ø¸í VARCHAR2(10),
  ÀÔ»çÀÏÀÚ DATE,
  ¸Å´ÏÀú»ç¿ø¹øÈ£ VARCHAR2(10) REFERENCES »ç¿ø(»ç¿ø¹øÈ£) );
  
INSERT INTO »ç¿ø
    VALUES ('001','È«±æµ¿','2012-01-01',NULL);
INSERT INTO »ç¿ø
    VALUES ('002','°­°¨Âù','2012-01-01','001');
INSERT INTO »ç¿ø
    VALUES ('003','ÀÌ¼ø½Å','2013-01-01','001');
INSERT INTO »ç¿ø
    VALUES ('004','ÀÌ¹ÎÁ¤','2013-01-01','001');
INSERT INTO »ç¿ø
    VALUES ('005','ÀÌº´Çå','2013-01-01',NULL);
INSERT INTO »ç¿ø
    VALUES ('006','¾È¼º±â','2014-01-01','005');
INSERT INTO »ç¿ø
    VALUES ('007','ÀÌ¼ö±Ù','2014-01-01','005');
INSERT INTO »ç¿ø
    VALUES ('008','±èº´¸¸','2014-01-01','005');
SELECT * FROM »ç¿ø

SELECT »ç¿ø¹øÈ£, »ç¿ø¸í, ÀÔ»çÀÏÀÚ, ¸Å´ÏÀú»ç¿ø¹øÈ£
FROM »ç¿ø
START WITH ¸Å´ÏÀú»ç¿ø¹øÈ£ IS NULL
CONNECT BY PRIOR »ç¿ø¹øÈ£ = ¸Å´ÏÀú»ç¿ø¹øÈ£
AND ÀÔ»çÀÏÀÚ BETWEEN '2013-01-01' AND '2013-12-31'
ORDER SIBLINGS BY »ç¿ø¹øÈ£;


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
SELECT DECODE(GROUPING(job), 1, 'ÃÑ°è', job) job
     , DECODE(GROUPING_ID(job, deptno), 1, 'ÇÕ°è', deptno) deptno
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