select to_char(to_date('2015.01.10.10','YYYY.MM.DD HH24')
    +1/24/(60/10),'YYYY.MM.DD HH24:MI:SS') FROM DUAL;
    
SELECT LOC,
    CASE WHEN LOC = 'NEW YORK' THEN 'EAST'
     ELSE 'ETC'
    END as AREA
FROM DEPT;


CREATE TABLE TAB1
( COL1 VARCHAR2(10) NOT NULL
 ,COL2 VARCHAR2(10) );
 
SELECT * FROM TAB1

INSERT INTO TAB1
    VALUES ('a',NULL);
INSERT INTO TAB1
    VALUES ('b','');
INSERT INTO TAB1
    VALUES ('c',3);
INSERT INTO TAB1
    VALUES ('d',4);
INSERT INTO TAB1
    VALUES ('e',5);
    
SELECT COUNT(COL1) FROM TAB1 WHERE COL2=NULL;

CREATE TABLE COM
( NNAME VARCHAR2(10) NOT NULL,
  GRADE VARCHAR2(10) );
  
INSERT INTO COM
    VALUES ('�褷��','���');
INSERT INTO COM
    VALUES ('�褡��','���');
INSERT INTO COM
    VALUES ('�褤��','���');
INSERT INTO COM
    VALUES ('�褧��','���');
INSERT INTO COM
    VALUES ('�褩��','���');
INSERT INTO COM
    VALUES ('�褱��','���');
INSERT INTO COM
    VALUES ('�̤���','�븮');
INSERT INTO COM
    VALUES ('�̤���','�븮');
INSERT INTO COM
    VALUES ('�̤���','�븮');
INSERT INTO COM
    VALUES ('�̤���','�븮');
INSERT INTO COM
    VALUES ('�̤���','�븮');
INSERT INTO COM
    VALUES ('�ڤ���','����');
INSERT INTO COM
    VALUES ('�ڤ���','����');
INSERT INTO COM
    VALUES ('�ڤ���','����');
INSERT INTO COM
    VALUES ('�ڤ���','����');
INSERT INTO COM
    VALUES ('�֤���','����');
INSERT INTO COM
    VALUES ('�֤���','����');
INSERT INTO COM
    VALUES ('������','����');
INSERT INTO COM
    VALUES ('ȫ����',NULL);
INSERT INTO COM
    VALUES ('ȫ����',NULL);
INSERT INTO COM
    VALUES ('ȫ����',NULL);
    
SELECT * FROM COM

SELECT COUNT(GRADE) FROM COM;

SELECT GRADE, COUNT(*) FROM COM GROUP BY GRADE;

SELECT ȸ��ID, SUM(�ֹ��ݾ�) AS �հ�
FROM �ֹ�
GROUP BY ȸ��ID
HAVING COUNT(*) > 1;

SELECT SUM(�ֹ��ݾ�) AS �հ�
FROM �ֹ�
HAVING AVG(�ֹ��ݾ�) > 100;

CREATE TABLE �ֹ�
( ȸ��ID VARCHAR2(10),
  �ֹ��ݾ� NUMBER );
  
CREATE TABLE �ý��ۻ���̷�
( �޴�ID VARCHAR2(10),
  ����Ͻ� DATE,
  ��������ڵ� VARCHAR2(10) );
  
SELECT �޴�ID, ��������ڵ�, COUNT(*) AS CNT
FROM �ý��ۻ���̷�
WHERE ����Ͻ� BETWEEN SYSDATE-1 AND SYSDATE
GROUP BY �޴�ID, ��������ڵ�
HAVING �޴�ID=3 AND ��������ڵ�=100;

SELECT AVG(COUNT(*)) AS AVGCNT
FROM �ý��ۻ���̷�
GROUP BY �޴�ID, ��������ڵ�;