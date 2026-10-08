
DROP TABLE IF EXISTS Månedsplan;
DROP TABLE IF EXISTS Vagter;
DROP Table IF EXISTS Ansatte;
DROP TABLE IF EXISTS Roller;


If Not Exists (Select * From sys.tables Where name='Ansatte')
begin
CREATE TABLE Ansatte (
	AnsatteID INT identity(1,1) PRIMARY KEY,
	Navn VARCHAR(50),
	Tlf int not Null, 
	erRask Bit,
	ErLeder Bit,
);
END



If Not Exists (Select * From sys.tables Where name='Hold')
begin
Create Table Hold (
	HoldID INT PRIMARY KEY,
	HoldNavn VARCHAR(50),
);
End




Create TABLE Vagter
(
VagtID INT PRIMARY KEY,
startTid DATETIME,
slutTid DATETIME,
AntalTimer AS DATEDIFF(HOUR, startTid, slutTid),
HoldID INT,
FOREIGN KEY (HoldID) REFERENCES Hold(HoldID)
);




CREATE TABLE Månedsplan (
	MånedsplanID INT identity(1,1) PRIMARY KEY,
	Dato DATETIME,
	AnsatteID INT,
	VagtID INT
	Constraint FK_Månedsplan_Ansatte
	FOREIGN KEY (AnsatteID) REFERENCES Ansatte(AnsatteID) On Delete Cascade,
	Constraint FK_Månedsplan_Vagter
	FOREIGN KEY (VagtID) REFERENCES Vagter(VagtID) On Delete CASCADE
);

GO



--oprette nye månedsplaner
SET LANGUAGE Danish;
Delete From Månedsplan;
Delete From Vagter;
Delete From Ansatte;
Delete From Hold;



Insert INTO Hold (HoldID, HoldNavn)
Values (1, 'Morgen' ),
	   (2, 'Aften'),
	   (3, 'Morgen og aften');


Insert Into Ansatte (Navn, Tlf, ErLeder, erRask)
Values ('Mads', 12345678, 1, 0),
	   ('Pedro', 23456789, 1, 1),
	   ('Peter', 34567890, 1, 0),
	   ('Jacoby', 45678901, 1, 1),
	   ('sørgen', 56789012, 0, 0);


Insert Into Vagter (VagtID, startTid, slutTid, HoldID)
Values (1, '9:00', '14:00', 1),
	   (2, '14:00', '19:00', 2),
	   (3, '9:00', '14:00', 1),
	   (4, '14:00', '19:00', 2),
	   (5, '9:00', '14:00', 1),
	   (6, '14:00', '19:00', 2),
	   (7, '9:00', '14:00', 1),
	   (8, '14:00', '19:00', 2),
	   (9, '9:00', '14:00', 1),
	   (10, '14:00', '19:00', 2),
	   (11, '9:00', '14:00', 1),
	   (12, '14:00', '19:00', 2),
	   (13, '9:00', '14:00', 1),
	   (14, '14:00', '19:00', 2),
	   (15, '9:00', '14:00', 1),
	   (16, '14:00', '19:00', 2),
	   (17, '9:00', '14:00', 1),
	   (18, '14:00', '19:00', 2),
	   (19, '9:00', '14:00', 1),
	   (20, '14:00', '19:00', 2),
	   (21, '9:00', '14:00', 1),
	   (22, '14:00', '19:00', 2),
	   (23, '9:00', '14:00', 1),
	   (24, '14:00', '19:00', 2),
	   (25, '9:00', '14:00', 1),
	   (26, '14:00', '19:00', 2),
	   (27, '9:00', '14:00', 1),
	   (28, '14:00', '19:00', 2),
	   (29, '9:00', '14:00', 1),
	   (30, '14:00', '19:00', 2),
	   (31, '9:00', '14:00', 1),
	   (32, '14:00', '19:00', 2),
	   (33, '9:00', '14:00', 1),
	   (34, '14:00', '19:00', 2),
	   (35, '9:00', '14:00', 1),
	   (36, '14:00', '19:00', 2),
	   (37, '9:00', '14:00', 1),
	   (38, '14:00', '19:00', 2),
	   (39, '9:00', '14:00', 1),
	   (40, '14:00', '19:00', 2),
	   (41, '9:00', '14:00', 1),
	   (42, '14:00', '19:00', 2),
	   (43, '9:00', '14:00', 1),
	   (44, '14:00', '19:00', 2),
	   (45, '9:00', '14:00', 1),
	   (46, '14:00', '19:00', 2),
	   (47, '9:00', '14:00', 1),
	   (48, '14:00', '19:00', 2),
	   (49, '9:00', '14:00', 1),
	   (50, '14:00', '19:00', 2),
	   (51, '9:00', '14:00', 1),
	   (52, '14:00', '19:00', 2),
	   (53, '9:00', '14:00', 1),
	   (54, '14:00', '19:00', 2),
	   (55, '9:00', '14:00', 1),
	   (56, '14:00', '19:00', 2),
	   (57, '9:00', '14:00', 1),
	   (58, '14:00', '19:00', 2),
	   (59, '9:00', '14:00', 1),
	   (60, '14:00', '19:00', 2);

Insert Into Månedsplan (Dato, AnsatteID, VagtID)
Values ('1-06-2026', 1, 1),
	   ('1-06-2026', 2, 1),
	   ('1-06-2026', 3, 1),
	   ('2-06-2026', 2, 2),
	   ('2-06-2026', 4, 2),
	   ('2-06-2026', 5, 2),
	   ('3-06-2026', 3, 3),
	   ('4-06-2026', 4, 4),
	   ('5-06-2026', 5, 5),
	   ('6-06-2026', 1, 6),
	   ('7-06-2026', 2, 7),
	   ('8-06-2026', 3, 8),
	   ('9-06-2026', 4, 9),
	   ('10-06-2026', 5, 10),
	   ('11-06-2026', 1, 11),
	   ('12-06-2026', 2, 12),
	   ('13-06-2026', 3, 13),
	   ('14-06-2026', 1, 14),
	   ('15-06-2026', 2, 15),
	   ('16-06-2026', 1, 16),
	   ('17-06-2026', 4, 17),
	   ('18-06-2026', 3, 18),
	   ('19-06-2026', 3, 19),
	   ('20-06-2026', 4, 20),
	   ('21-06-2026', 3, 21),
	   ('22-06-2026', 1, 22),
	   ('23-06-2026', 2, 23),
	   ('24-06-2026', 3, 24),
	   ('25-06-2026', 1, 25),
	   ('26-06-2026', 3, 26),
	   ('27-06-2026', 4, 27),
	   ('28-06-2026', 2, 28),
	   ('29-06-2026', 3, 29),
	   ('30-06-2026', 1, 30),
	   ('01-07-2026', 2, 31),
	   ('02-07-2026', 3, 32),
	   ('03-07-2026', 4, 33),
	   ('04-07-2026', 5, 34),
	   ('05-07-2026', 1, 35),
	   ('06-07-2026', 2, 36),
	   ('07-07-2026', 3, 37),
	   ('08-07-2026', 4, 38),
	   ('09-07-2026', 5, 39),
	   ('10-07-2026', 1, 40),
	   ('11-07-2026', 2, 41),
	   ('12-07-2026', 3, 42),
	   ('13-07-2026', 4, 43),
	   ('14-07-2026', 5, 44),
	   ('15-07-2026', 1, 45),
	   ('16-07-2026', 2, 46),
	   ('17-07-2026', 3, 47),
	   ('18-07-2026', 4, 48),
	   ('19-07-2026', 5, 49),
	   ('20-07-2026', 1, 50),
	   ('21-07-2026', 2, 51),
	   ('22-07-2026', 3, 52),
	   ('23-07-2026', 4, 53),
	   ('24-07-2026', 5, 54),
	   ('25-07-2026', 1, 55),
	   ('26-07-2026', 2, 56),
	   ('27-07-2026', 3, 57),
	   ('28-07-2026', 4, 58),
	   ('29-07-2026', 5, 59),
	   ('30-07-2026', 1, 60);
	   
	
--Månedsplan

Select
	DATENAME(MONTH, mp.Dato) AS MånedNavn,
	YEAR(mp.Dato) AS År,
	mp.Dato,
	a.Navn AS Medarbejder,
	a.ErRask,
	a.ErLeder,
	v.vagtID,
	v.AntalTimer AS Timer,
	h.HoldNavn AS Hold
	FROM Månedsplan mp
	Join Ansatte a ON mp.AnsatteID = a.AnsatteID
	Join Vagter v ON mp.VagtID = v.VagtID
	Join Hold h ON v.HoldID = h.HoldID
	ORDER by YEAR(mp.Dato),MONTH(mp.Dato), v.VagtID;




	--Belastning pr. måned
SELECT
	a.AnsatteID,
	a.Navn AS Medarbejder,
	Month(mp.Dato) AS Month,
	SUM(v.AntalTimer) AS TimerPrMåned

FROM Månedsplan mp
Join Ansatte a ON mp.AnsatteID = a.AnsatteID
JOIN Vagter v ON mp.VagtID = v.VagtID
WHERE YEAR(mp.Dato) = 2026
GROUP BY a.AnsatteID, a.Navn, Month(mp.Dato)

ORDER BY a.AnsatteID ASC;



--pr.år

SELECT
	a.AnsatteID,
	a.Navn AS Medarbejder,
	YEAR(mp.Dato) AS År,
	
	SUM(v.AntalTimer) AS TimerPrÅr
	From Månedsplan mp
	Join Ansatte a ON mp.AnsatteID = a.AnsatteID
	Join Vagter v ON mp.VagtID = v.VagtID
	WHERE YEAR(mp.Dato) = 2026
	Group BY a.AnsatteID, a.Navn, YEAR(mp.Dato)

	Order BY a.AnsatteID ASC;


-- hvis syg

SELECT
	mp.Dato,
	a.Navn AS Medarbejder,
	a.erRask,
	a.Tlf As MedarbejderTlf,
	v.vagtID,
	h.HoldNavn,

	CASE
		WHEN a.erRask = 1 THEN a.Tlf
		ELSE ( 
			Select TOP 1 Tlf
			From Ansatte AS R
			WHERE R.erRask = 1
			ORDER by R.AnsatteID
		)
	END AS Rask
FROM Månedsplan mp
JOIN Ansatte a ON mp.AnsatteID = a.AnsatteID
JOIN Vagter v ON mp.VagtID = v.VagtID
Join Hold h On v.HoldID = h.HoldID
Order By mp.dato, v.VagtID;
