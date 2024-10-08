CREATE DATABASE lab4;
CREATE TABLE Warehouses(
   code INTEGER,
   location VARCHAR(255),
   capacity INTEGER );
CREATE TABLE Boxes (
    code CHAR(4),
    contents VARCHAR(255),
    value REAL,
    warehouse INTEGER);
INSERT INTO Warehouses (code,location,capacity) VALUES
    (1,'Chicago',3),
    (2,'Chicago',4),
    (3,'New York',7),
    (4,'Los Angeles',2),
    (5,'San Francisco',8);
INSERT INTO Boxes (Code,Contents,Value,Warehouse) VALUES
    ('0MN7','Rocks',180,3),
    ('4H8P','Rocks',250,1),
    ('4RT3','Scissors',190,4),
    ('7G3H','Rocks',200,1),
    ('8JN6','Papers',75,1),
    ('8Y6U','Papers',50,3),
    ('9J6F','Papers',175,2),
    ('LL08','Rocks',140,4),
    ('P0H6','Scissors',125,1),
    ('P2T6','Scissors',150,2),
    ('TU55','Papers',90,5);

--4
SELECT * FROM Warehouses;

--5
SELECT * FROM Boxes WHERE value > 150;

--6
SELECT DISTINCT contents from Boxes;

--7
SELECT warehouse , COUNT(*) AS BoxCount FROM Boxes GROUP BY warehouse ;

--8
SELECT warehouse , COUNT(*) AS BoxCount FROM Boxes GROUP BY warehouse HAVING COUNT(*) > 2;

--9
INSERT INTO Warehouses (code, location, capacity) VALUES (5 , 'New York' , 3);

--10
INSERT INTO Boxes (code, contents, value, warehouse) VALUES ('H5RT', 'Papers', 200 , 2);

--11
UPDATE Boxes SET value = value * 0.85 WHERE code = (SELECT code FROM Boxes ORDER BY value DESC LIMIT 1 OFFSET 2);

--12
DELETE FROM Boxes WHERE value < 150;

--13
DELETE FROM Boxes WHERE warehouse = 3 RETURNING *;
