--회원정보
INSERT INTO `P0_MEMB`(`MNO`, `MID`, `NAME`, `PWD`, `SDT`) VALUES (1, 'user01', '고길동', PASSWORD('1111'), '2018-08-23');
INSERT INTO `P0_MEMB`(`MNO`, `MID`, `NAME`, `PWD`, `SDT`) VALUES (2, 'user02', '고희동', PASSWORD('1111'), '2018-08-23');
INSERT INTO `P0_MEMB`(`MNO`, `MID`, `NAME`, `PWD`, `SDT`) VALUES (3, 'user03', '김또치', PASSWORD('1111'), '2018-08-23');



--공항정보
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (1,'서울/인천(IDN)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (2,'서울/김포(GMP)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (3,'부산/김해(PUS)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (4,'제주(CJU)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (5,'광주(KWJ)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (6,'군산(KUV)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (7,'대구(TAE)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (8,'무안(MWX)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (9,'여수/순천(RSU)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (10,'울산(USN)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (11,'원주(WJU)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (12,'진주/사천(HIN)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (13,'청주(CJJ)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (14,'포항(KPO)','2018-01-07');
INSERT INTO `P0_AP`(`ANO`, `NAME`, `SDT`) VALUES (15,'홍콩(HNK)','2018-07-07');




--운항정보
INSERT INTO `P0_TRVL`(`TNO`, `SAP`, `AAP`, `SDT`, `ADT`, `CLS`, `PRC`, `IDT`, `MDT`, `SNO`) VALUES (1, 1, 15, '2018-08-25 08:00', '2018-08-25 11:00', 1, 1000000, '2018-08-23', '2018-08-24', 20);
INSERT INTO `P0_TRVL`(`TNO`, `SAP`, `AAP`, `SDT`, `ADT`, `CLS`, `PRC`, `IDT`, `MDT`, `SNO`) VALUES (2, 1, 15, '2018-08-25 08:00', '2018-08-25 11:00', 2, 700000, '2018-08-23', '2018-08-24', 40);
INSERT INTO `P0_TRVL`(`TNO`, `SAP`, `AAP`, `SDT`, `ADT`, `CLS`, `PRC`, `IDT`, `MDT`, `SNO`) VALUES (3, 1, 15, '2018-08-25 08:00', '2018-08-25 11:00', 3, 300000, '2018-08-23', '2018-08-24', 80);

INSERT INTO `P0_TRVL`(`TNO`, `SAP`, `AAP`, `SDT`, `ADT`, `CLS`, `PRC`, `IDT`, `MDT`, `SNO`) VALUES (4, 1, 15, '2018-08-25 13:00', '2018-08-25 14:00', 1, 1000000, '2018-08-23', '2018-08-24', 20);
INSERT INTO `P0_TRVL`(`TNO`, `SAP`, `AAP`, `SDT`, `ADT`, `CLS`, `PRC`, `IDT`, `MDT`, `SNO`) VALUES (5, 1, 15, '2018-08-25 13:00', '2018-08-25 14:00', 2, 700000, '2018-08-23', '2018-08-24', 40);
INSERT INTO `P0_TRVL`(`TNO`, `SAP`, `AAP`, `SDT`, `ADT`, `CLS`, `PRC`, `IDT`, `MDT`, `SNO`) VALUES (6, 1, 15, '2018-08-25 13:00', '2018-08-25 14:00', 3, 300000, '2018-08-23', '2018-08-24', 80);

INSERT INTO `P0_TRVL`(`TNO`, `SAP`, `AAP`, `SDT`, `ADT`, `CLS`, `PRC`, `IDT`, `MDT`, `SNO`) VALUES (7, 1, 15, '2018-08-25 17:00', '2018-08-25 20:00', 1, 1000000, '2018-08-23', '2018-08-24', 20);
INSERT INTO `P0_TRVL`(`TNO`, `SAP`, `AAP`, `SDT`, `ADT`, `CLS`, `PRC`, `IDT`, `MDT`, `SNO`) VALUES (8, 1, 15, '2018-08-25 17:00', '2018-08-25 20:00', 2, 700000, '2018-08-23', '2018-08-24', 40);
INSERT INTO `P0_TRVL`(`TNO`, `SAP`, `AAP`, `SDT`, `ADT`, `CLS`, `PRC`, `IDT`, `MDT`, `SNO`) VALUES (9, 1, 15, '2018-08-25 17:00', '2018-08-25 20:00', 3, 300000, '2018-08-23', '2018-08-24', 80);



SELECT TNO, ( SELECT NAME FROM P0_AP WHERE ANO = 1) AS SAPNAME, (SELECT NAME FROM P0_AP WHERE ANO = 15) AS AAPNAME, SDT, ADT, CLS, PRC, SNO
FROM P0_TRVL 
WHERE DATE(SDT) = '2018-08-25'


SELECT 
    TR.TNO, 
    TR.SAP, 
    TR.AAP, 
    TR.SDT, 
    TR.ADT, 
    TR.CLS, 
    TR.PRC,
    SA.NAME SAP_NAME,
    AA.NAME AAP_NAME
FROM P0_TRVL TR 
  JOIN P0_AP SA ON TR.SAP = SA.ANO 
  JOIN P0_AP AA ON TR.AAP = AA.ANO
WHERE DATE(TR.SDT) = '2018-08-25'