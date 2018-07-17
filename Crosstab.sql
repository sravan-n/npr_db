USE nprsamples
GO

CREATE TABLE Crosstab 
(
Year int,
Quarter int,
Amount int
)
GO
INSERT INTO Crosstab VALUES (2015, 1, 125)
INSERT INTO Crosstab VALUES (2015, 2, 32)
INSERT INTO Crosstab VALUES (2015, 3, 130)
INSERT INTO Crosstab VALUES (2015, 4, 100)
INSERT INTO Crosstab VALUES (2016, 1, 98)
INSERT INTO Crosstab VALUES (2016, 2, 110)
INSERT INTO Crosstab VALUES (2016, 3, 100)
GO

SELECT Year, 
    SUM(CASE Quarter WHEN 1 THEN Amount ELSE 0 END) AS Q1,
    SUM(CASE Quarter WHEN 2 THEN Amount ELSE 0 END) AS Q2,
    SUM(CASE Quarter WHEN 3 THEN Amount ELSE 0 END) AS Q3,
    SUM(CASE Quarter WHEN 4 THEN Amount ELSE 0 END) AS Q4

FROM nprsamples.dbo.Crosstab
GROUP BY Year
GO



