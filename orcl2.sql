CREATE TABLE ���
( �����ȣ VARCHAR2(10) PRIMARY KEY
 ,����� VARCHAR2(100) NOT NULL
 ,�Ի����� DATE NOT NULL
 ,�Ŵ��������ȣ VARCHAR2(10));
 
DROP TABLE ���
 
 INSERT INTO ���
    VALUES ('001','ȫ�浿','2012-01-01',NULL);
 INSERT INTO ���
    VALUES ('002','������','2012-01-01','001');
 INSERT INTO ���
    VALUES ('003','�̼���','2013-01-01','001');
 INSERT INTO ���
    VALUES ('004','�̹���','2013-01-01','001');
 INSERT INTO ���
    VALUES ('005','�̺���','2013-01-01',NULL);
 INSERT INTO ���
    VALUES ('006','�ȼ���','2014-01-01','005');
 INSERT INTO ���
    VALUES ('007','�̼���','2014-01-01','005');
     INSERT INTO ���
    VALUES ('008','�躴��','2014-01-01','005');



SELECT * FROM ���

SELECT �����ȣ, �����, �Ի�����, �Ŵ��������ȣ, LEVEL AS LVL
FROM ���
START WITH �Ŵ��������ȣ IS NULL
CONNECT BY PRIOR �����ȣ = �Ŵ��������ȣ
AND �Ի����� BETWEEN '2013-01-01' AND '2013-12-31'
ORDER SIBLINGS BY �����ȣ;

-- SELECT ALL

