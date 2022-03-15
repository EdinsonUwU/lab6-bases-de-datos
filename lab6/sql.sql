DROP TABLE IF EXISTS Sub_contractor
CASCADE;
CREATE table Sub_contractor
(
    SID serial
        primary key,
    S_Lname varchar (20),
    S_Fname varchar(20),
    Salary int
);



DROP TABLE IF EXISTS Builder
CASCADE;
CREATE TABLE Builder
(
    BID serial,
    B_lname varchar(20),
    B_fname varchar(20),
    License varchar(50),
    PRIMARY KEY (BID)
);




DROP TABLE IF EXISTS Neighborhood
CASCADE;
CREATE TABLE Neighborhood
(
    NID serial,
    N_Name varchar(30),
    City varchar(30),
    PRIMARY KEY (NID)
);


--voy a hacer esta tabla
DROP TABLE IF EXISTS Hire_info
CASCADE;
CREATE TABLE Hire_info
(
    BID int,
    SID int,
    HireDate date,
    PRIMARY KEY(BID,SID),
    FOREIGN KEY(SID) 
        REFERENCES Sub_contractor(SID),
    FOREIGN KEY(BID) 
        REFERENCES Builder(BID)
);



DROP TABLE IF EXISTS House
CASCADE;
CREATE TABLE House
(
    HID serial,
    H_Name varchar (30),
    FinishDate date,
    Price int,
    BID int,
    NID int,
    PRIMARY KEY (HID),
    FOREIGN KEY(BID) 
        REFERENCES Builder(BID),
    FOREIGN KEY(NID) 
        REFERENCES Neighborhood(NID)
);


INSERT INTO Sub_contractor
    (S_Fname,Salary,S_Lname)
VALUES
    ('Shafira', 3528161, 'Bullock'),
    ('Wyoming', 1199443, 'Rosario'),
    ('Forrest', 6153955, 'Meadows'),
    ('Rafael', 9465327, 'Valencia'),
    ('Felicia', 6146410, 'Beasley'),
    ('Orli', 6756625, 'Sears'),
    ('Montana', 7613792, 'Ratliff'),
    ('Mariam', 552266, 'William'),
    ('Ralph', 6910483, 'Bailey'),
    ('Reagan', 401269, 'Kelley');


INSERT INTO Builder
    (B_fname,B_lname,License)
VALUES
    ('Hu', 'Trujillo', '7363407288'),
    ('Channing', 'Levine', '0117785353'),
    ('Zephania', 'Stanley', '5172211683'),
    ('Drew', 'Hensley', '0970737036'),
    ('Nolan', 'Stanley', '3472992670'),
    ('Kameko', 'Atkinson', '4103678487'),
    ('Malcolm', 'Harmon', '1518172550'),
    ('Jarrod', 'Santana', '2511612463'),
    ('Ishmael', 'Gaines', '5334861868'),
    ('Freya', 'Singleton', '4073276813');

INSERT INTO Neighborhood
    (N_Name,City)
VALUES
    ('Jena', 'Hexham'),
    ('Stewart', 'Vĩnh
Long'),
    ('Maggy', 'Buôn
Ma
Thuột'),
    ('Christen', 'Thanh
Hóa'),
    ('Dean', 'Ibagué'),
    ('Emi', 'Perquenco'),
    ('Ferris', 'Funtua'),
    ('Carter', 'Lim
Chu
Kang'),
    ('Jakeem', 'Zoetermeer'),
    ('Micah', 'Hong
Kong');


INSERT INTO Hire_info
    (BID,SID,HireDate)
VALUES
    (1, 1, '2024-02-03'),
    (2, 2, '2023-06-26'),
    (3, 3, '2032-08-01'),
    (4, 4, '2026-03-23'),
    (5, 5, '2019-09-20'),
    (6, 6, '2019-11-03'),
    (7, 7, '2033-07-14'),
    (8, 8, '2042-04-18'),
    (9, 9, '2019-03-21'),
    (10, 10, '2038-04-24');

INSERT INTO House
    (H_Name,Price,FinishDate,BID,NID)
VALUES
    ('Tyrol', '5770497', '2043-02-15', 2, 2),
    ('Carinthia', '2554908', '2030-07-14', 6, 9),
    ('Upper
Austria', '9954212', '2099-06-13', 6, 7),
    ('Upper
Austria', '7009181', '2020-06-07', 6, 9),
    ('Vienna', '4966237', '2007-12-19', 5, 9),
    ('Carinthia', '6486151', '2014-03-05', 9, 3),
    ('Vienna', '6209604', '
2017-04-26', 9, 5),
    ('Burgenland', '3605733', '2022-02-15', 8, 7),
    ('Lower Austria', '2203369', '2022-01-28', 9, 9),
    ('Carinthia', '4838037', '2023-11-29', 2, 10),
    ('Romos', '4838437', '2044-11-29', 2, 10),
    ('Basilia', '5838037', '2045-11-29', 2, 10);




--PUNTO 1
SELECT CONCAT  (S_Fname, ' ', S_Lname) AS "Full name"
FROM Sub_contractor
WHERE Salary>3000000;




--PUNTO 2

SELECT b.B_fname AS "Nombre Constructor", s.S_Fname AS "Nombre SubContratista"
FROM hire_info h
    INNER JOIN Sub_contractor s
    ON s.SID=h.SID
    INNER JOIN Builder b
    ON b.BID=h.BID
WHERE EXTRACT
(YEAR  FROM h.HireDate) ='2019'
;

--PUNTO 3

SELECT CONCAT (b.B_fname ,' ',b.B_lname )
AS "Full name"
FROM House h
    JOIN Builder b ON b.BID=h.BID
WHERE h.FinishDate > current_date
ORDER BY b.B_lname ASC;


--PUNTO 4