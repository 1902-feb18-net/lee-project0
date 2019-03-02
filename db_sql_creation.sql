CREATE SCHEMA OrdSys;
GO

CREATE TABLE OrdSys.ProdHist(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL,
Price DECIMAL(8,2));

CREATE TABLE OrdSys.Product(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL,
Price DECIMAL(8,2));

CREATE TABLE OrdSys.Location(
Id INT PRIMARY KEY IDENTITY,
Street NVARCHAR(50) NOT NULL,
City NVARCHAR(50) NOT NULL,
State NVARCHAR (2) NOT NULL,
Zip INT NOT NULL);

CREATE TABLE OrdSys.Inventory(
Id INT NOT NULL,
ProdId INT NOT NULL FOREIGN KEY REFERENCES OrdSys.Product(Id),
Quant INT NOT NULL,
LocationId INT NOT NULL FOREIGN KEY REFERENCES OrdSys.Location (Id));

CREATE TABLE OrdSys.Bundle(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL,
Price DECIMAL(10,2) NOT NULL);

CREATE TABLE OrdSys.BundleProds(
BundleId INT NOT NULL FOREIGN KEY REFERENCES OrdSys.Bundle (Id),
ProdId INT NOT NULL FOREIGN KEY REFERENCES OrdSys.Product (Id));

CREATE TABLE OrdSys.Customer(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR NOT NULL,
LastName NVARCHAR NOT NULL,
DateOfBirth DATETIME2 NOT NULL,
PrefLoc INT FOREIGN KEY REFERENCES OrdSys.Location (Id));

CREATE TABLE OrdSys.Cart(
Id INT NOT NULL,
CustId INT NOT NULL FOREIGN KEY REFERENCES OrdSys.Customer (Id),
LocId INT NOT NULL FOREIGN KEY REFERENCES OrdSys.Location (Id),
ProdId INT NOT NULL FOREIGN KEY REFERENCES OrdSys.ProdHist (Id),
Quant INT NOT NULL,
Time DATETIME2);
ALTER TABLE OrdSys.BundleProds ADD
	CONSTRAINT PK_Bund PRIMARY KEY (BundleId, ProdId)