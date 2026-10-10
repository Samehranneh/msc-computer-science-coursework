

CREATE DATABASE SERVICECARD_DB_SVU;
USE SERVICECARD_DB_SVU;



CREATE TABLE Personal
(
NationalID varchar(15)  PRIMARY KEY,
FirstName varchar(25) NOT NULL UNIQUE,
LastName varchar(25) NOT NULL,
FatherName varchar(50) NOT NULL,
BirthDate date  NULL,
pAddress varchar(25) NULL,
Phone varchar(25) NULL,
Email varchar(25) NULL,
ptype varchar(10) NOT NULL,
PFunction varchar(25) NOT NULL,
)
GO

CREATE TABLE Car
(
CarId int  PRIMARY KEY,
CNumber int NOT NULL UNIQUE,
Category varchar(2) NOT NULL,
CType varchar(25) NOT NULL,
Color varchar(25)  NULL,
MotorNo varchar(25) NULL,
Cowner varchar(15) NOT NULL FOREIGN KEY REFERENCES Personal (NationalID),

)
GO

CREATE TABLE CarCard
(
CardId int  PRIMARY KEY,
CardDate date NOT NULL ,
CStatus varchar(10) NOT NULL,
CarId int NOT NULL FOREIGN KEY REFERENCES Car (CarId),

)
GO

CREATE TABLE Service_Card
(
ID int  PRIMARY KEY,
CDate date NOT NULL ,
CarId int NOT NULL FOREIGN KEY REFERENCES CarCard (CardId),
)
GO

CREATE TABLE Servicee
(
CName varchar(25)  PRIMARY KEY,
Price int NOT NULL ,
)
GO

CREATE TABLE Serve
(
ID int  PRIMARY KEY,
InTime date NOT NULL ,
OutTime date NOT NULL ,
SName varchar(25) NOT NULL FOREIGN KEY REFERENCES Servicee (CName),
CID int NOT NULL FOREIGN KEY REFERENCES Service_Card (ID),
MasterNo varchar(15) NOT NULL FOREIGN KEY REFERENCES Personal (NationalID),
)
GO


CREATE TABLE Fill_Bill
(
ID int  PRIMARY KEY,
FDate date NOT NULL ,
FType varchar(10) NOT NULL ,
FCount int NOT NULL ,
Price int NOT NULL ,
WorkerNo varchar(15) NOT NULL FOREIGN KEY REFERENCES Personal (NationalID),
)
GO

CREATE TABLE Product
(
ID int  PRIMARY KEY,
Cost int NOT NULL ,
Price int NOT NULL ,
)
GO

CREATE TABLE Cart
(
ID int  PRIMARY KEY,
CDate date NOT NULL ,
Price int NOT NULL ,
MasterSales varchar(15) NOT NULL FOREIGN KEY REFERENCES Personal (NationalID),
CarId int NOT NULL FOREIGN KEY REFERENCES CarCard (CardId),
)
GO

CREATE TABLE Service_Cart
(
ID int  PRIMARY KEY,
SName varchar(25) NOT NULL FOREIGN KEY REFERENCES Servicee (CName),
CartId int NOT NULL FOREIGN KEY REFERENCES Cart (ID),
)
GO

CREATE TABLE Service_Product
(
ID int  PRIMARY KEY,
CartId int NOT NULL FOREIGN KEY REFERENCES Cart (ID),
ProductId int NOT NULL FOREIGN KEY REFERENCES Product (ID),
)
GO

CREATE TABLE Service_Fill
(
ID int  PRIMARY KEY,
CartId int NOT NULL FOREIGN KEY REFERENCES Cart (ID),
FillId int NOT NULL FOREIGN KEY REFERENCES Fill_Bill (ID),
)
GO

CREATE TABLE COrder
(
ID int  PRIMARY KEY,
OStatus varchar(10) NOT NULL ,
PayType varchar(10) NOT NULL ,
CartId int NOT NULL FOREIGN KEY REFERENCES Cart (ID),
)
GO

USE SERVICECARD_DB_SVU;
INSERT INTO Personal (NationalID, FirstName, LastName,FatherName,ptype,PFunction)
VALUES ('123435457813463', 'Smith', 'John','Jack','Employee','MasterSales')
INSERT INTO Personal (NationalID, FirstName, LastName,FatherName,ptype,PFunction)
VALUES ('123435457343463', 'Sameh', 'Ali','Hasan','Client','')
INSERT INTO Personal (NationalID, FirstName, LastName,FatherName,ptype,PFunction)
VALUES ('123435457813223', 'Ali', 'Nour','Mohamad','Employee','Worker')
INSERT INTO Personal (NationalID, FirstName, LastName,FatherName,ptype,PFunction)
VALUES ('786435457343463', 'Mohamad', 'Habib','Nadim','Client','')
INSERT INTO Personal (NationalID, FirstName, LastName,FatherName,ptype,PFunction)
VALUES ('111222333444555', 'Saeed', 'Mohamad','Ganem','Client','')

USE SERVICECARD_DB_SVU;
INSERT INTO Car (CarId, CNumber, Category,CType,Cowner)
VALUES (1, 123456, 'PR','Toyota','123435457343463')
INSERT INTO Car (CarId, CNumber, Category,CType,Cowner)
VALUES (2, 235634, 'PB','Nissan','786435457343463')
INSERT INTO Car (CarId, CNumber, Category,CType,Cowner)
VALUES (3, 56834, 'T','Honda','111222333444555')


USE SERVICECARD_DB_SVU;
INSERT INTO CarCard (CardId, CardDate, CStatus,CarId)
VALUES (1, '1/1/2023', 'Suppported',1)
INSERT INTO CarCard (CardId, CardDate, CStatus,CarId)
VALUES (2, '12/2/2023', 'Suppported',2)
INSERT INTO CarCard (CardId, CardDate, CStatus,CarId)
VALUES (3, '3/2/2023', 'Not Sup',3)

USE SERVICECARD_DB_SVU;
INSERT INTO Service_Card (ID, CDate,CarId)
VALUES (1, '7/1/2023',1)
INSERT INTO Service_Card (ID, CDate,CarId)
VALUES (2, '2/2/2023',2)
INSERT INTO Service_Card (ID, CDate,CarId)
VALUES (3, '9/3/2023',3)

USE SERVICECARD_DB_SVU;
INSERT INTO Servicee (CName, Price)
VALUES ('Change oil',100000)
INSERT INTO Servicee  (CName, Price)
VALUES ('Fix Motor',300000)
INSERT INTO Servicee (CName, Price)
VALUES ('fix vitess',1000000)

USE SERVICECARD_DB_SVU;
INSERT INTO Serve (ID, InTime,OutTime, SName,CID,MasterNo )
VALUES (1, '3/6/2023','3/6/2023','Change oil',1,'123435457813463')
INSERT INTO Serve (ID, InTime,OutTime, SName,CID,MasterNo )
VALUES (2, '5/7/2023','10/7/2023','Fix Motor',2,'123435457813463')
INSERT INTO Serve (ID, InTime,OutTime, SName,CID,MasterNo )
VALUES (3, '1/4/2023','6/4/2023','fix vitess',3,'123435457813463')

USE SERVICECARD_DB_SVU;
INSERT INTO Fill_Bill (ID, FDate,FType, FCount,Price,WorkerNo )
VALUES (1, '3/6/2023','benzin',20,25000,'123435457813223')
INSERT INTO Fill_Bill (ID, FDate,FType, FCount,Price,WorkerNo )
VALUES (2, '5/7/2023','mazoot',25,120000,'123435457813223')
INSERT INTO Fill_Bill (ID, FDate,FType, FCount,Price,WorkerNo )
VALUES (3, '1/4/2023','benzin',20,15000,'123435457813223')

USE SERVICECARD_DB_SVU;
INSERT INTO Product (ID,Cost, Price)
VALUES (1,75000,100000)
INSERT INTO Product (ID,Cost, Price)
VALUES (2,12000,15000)
INSERT INTO Product (ID,Cost, Price)
VALUES (3,7000,10000)

USE SERVICECARD_DB_SVU;
INSERT INTO Cart (ID, CDate,Price, MasterSales,CarId )
VALUES (1, '3/6/2023',989000,'123435457813463',1)
INSERT INTO Cart (ID, CDate,Price, MasterSales,CarId )
VALUES (2, '5/7/2023',8330000,'123435457813463',2)
INSERT INTO Cart (ID, CDate,Price, MasterSales,CarId )
VALUES (3, '1/4/2023',9047777,'123435457813463',3)

USE SERVICECARD_DB_SVU;
INSERT INTO Service_Cart (ID,SName, CartId)
VALUES (1,'Fix Motor',1)
INSERT INTO Product (ID,Cost, Price)
VALUES (2,'Change oil',2)
INSERT INTO Product (ID,Cost, Price)
VALUES (3,'fix vitess',3)

USE SERVICECARD_DB_SVU;
INSERT INTO Service_Product (ID,ProductId, CartId)
VALUES (1,1,1)
INSERT INTO Service_Product (ID,ProductId, CartId)
VALUES (2,2,2)
INSERT INTO Service_Product (ID,ProductId, CartId)
VALUES (3,3,3)

USE SERVICECARD_DB_SVU;
INSERT INTO Service_Fill (ID,FillId, CartId)
VALUES (1,1,1)
INSERT INTO Service_Fill (ID,FillId, CartId)
VALUES (2,2,2)
INSERT INTO Service_Fill (ID,FillId, CartId)
VALUES (3,3,3)

USE SERVICECARD_DB_SVU;
INSERT INTO COrder (ID,OStatus, PayType,CartId)
VALUES (1,'done','cash',1)
INSERT INTO COrder (ID,OStatus, PayType,CartId)
VALUES (2,'done','card',3)
INSERT INTO COrder (ID,OStatus, PayType,CartId)
VALUES (3,'Cancelled','card',3)

USE SERVICECARD_DB_SVU;
CREATE NONCLUSTERED INDEX NCI_Personal
ON dbo.Personal(NationalID);
CREATE NONCLUSTERED INDEX NCI_Car
ON dbo.Car(CarId);
CREATE NONCLUSTERED INDEX NCI_CarCard
ON dbo.CarCard(CardId);
CREATE NONCLUSTERED INDEX NCI_Service_Card
ON dbo.Service_Card(ID);
CREATE NONCLUSTERED INDEX NCI_Servicee
ON dbo.Servicee(CName);
CREATE NONCLUSTERED INDEX NCI_Serve
ON dbo.Serve(ID);
CREATE NONCLUSTERED INDEX NCI_Fill_Bill
ON dbo.Fill_Bill(ID);
CREATE NONCLUSTERED INDEX NCI_Product
ON dbo.Product(ID);
CREATE NONCLUSTERED INDEX NCI_Cart
ON dbo.Cart(ID);
CREATE NONCLUSTERED INDEX NCI_Service_Cart
ON dbo.Service_Cart(ID);
CREATE NONCLUSTERED INDEX NCI_Service_Product
ON dbo.Service_Product(ID);
CREATE NONCLUSTERED INDEX NCI_Service_Fill
ON dbo.Service_Fill(ID);
CREATE NONCLUSTERED INDEX NCI_COrder
ON dbo.COrder(ID);

USE SERVICECARD_DB_SVU;
SELECT
(Personal.FirstName +' '+ Personal.FatherName +' '+ Personal.LastName) as Total_Name, CarCard.CardId, Car.CNumber,  Car.CType
FROM
Personal
INNER JOIN Car ON Personal.NationalID = Car.Cowner
INNER JOIN CarCard ON Car.CarId = CarCard.CarId
order by Personal.FirstName desc

USE SERVICECARD_DB_SVU;
SELECT
(Personal.FirstName +' '+ Personal.FatherName +' '+ Personal.LastName) as Total_Name, CarCard.CardId, Car.CNumber,  Car.CType, Car.MotorNo
FROM
Personal
INNER JOIN Car ON Personal.NationalID = Car.Cowner
INNER JOIN CarCard ON Car.CarId = CarCard.CarId
Where CarCard.CStatus='Suppported'
order by Personal.FirstName desc

USE SERVICECARD_DB_SVU;
SELECT
Car.Category, SUM ( Fill_Bill.FCount ) AS Total
FROM
Service_Fill
INNER JOIN Cart ON Cart.ID = Service_Fill.CartId
INNER JOIN Fill_Bill ON Fill_Bill.ID = Service_Fill.FillId 
INNER JOIN CarCard ON Car.CarId = CarCard.CardId
GROUP BY Car.Category;

USE SERVICECARD_DB_SVU;
SELECT
Car.Category, SUM ( Fill_Bill.FCount ) AS Total
FROM
Car
INNER JOIN CarCard ON Car.CarId = CarCard.CardId
INNER JOIN Cart ON Cart.CarId = CarCard.CardId
INNER JOIN Service_Fill ON Service_Fill.CartId = Cart.ID 
INNER JOIN Fill_Bill ON Service_Fill.FillID = Fill_Bill.ID 
GROUP BY Car.Category;

USE SERVICECARD_DB_SVU;
GO
CREATE VIEW dbo.ServiceCardView AS
SELECT
(Personal.FirstName +' '+ Personal.FatherName +' '+ Personal.LastName) as Total_Name, CarCard.CardId, CarCard.CStatus
FROM
Personal
INNER JOIN Car ON Personal.NationalID = Car.Cowner
INNER JOIN CarCard ON Car.CarId = CarCard.CarId

SELECT Fill_Bill.ID, Fill_Bill.FDate, Fill_Bill.FType, Fill_Bill.FCount, Fill_Bill.Price
FROM Fill_Bill
GROUP BY Fill_Bill.ID,Fill_Bill.FDate, Fill_Bill.FType, Fill_Bill.FCount, Fill_Bill.Price
HAVING Fill_Bill.FCount > 20;