CREATE TABLE 사원
( 사원번호 VARCHAR2(10) PRIMARY KEY
 ,사원명 VARCHAR2(100) NOT NULL
 ,입사일자 DATE NOT NULL
 ,매니저사원번호 VARCHAR2(10));
 
DROP TABLE 사원
 
 INSERT INTO 사원
    VALUES ('001','홍길동','2012-01-01',NULL);
 INSERT INTO 사원
    VALUES ('002','강감찬','2012-01-01','001');
 INSERT INTO 사원
    VALUES ('003','이순신','2013-01-01','001');
 INSERT INTO 사원
    VALUES ('004','이민정','2013-01-01','001');
 INSERT INTO 사원
    VALUES ('005','이병헌','2013-01-01',NULL);
 INSERT INTO 사원
    VALUES ('006','안성기','2014-01-01','005');
 INSERT INTO 사원
    VALUES ('007','이수근','2014-01-01','005');
     INSERT INTO 사원
    VALUES ('008','김병만','2014-01-01','005');



SELECT * FROM 사원

SELECT 사원번호, 사원명, 입사일자, 매니저사원번호, LEVEL AS LVL
FROM 사원
START WITH 매니저사원번호 IS NULL
CONNECT BY PRIOR 사원번호 = 매니저사원번호
AND 입사일자 BETWEEN '2013-01-01' AND '2013-12-31'
ORDER SIBLINGS BY 사원번호;

-- SELECT ALL

