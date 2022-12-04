
--> create database
create database Covid19;

-->create table
 CREATE TABLE CovidStats(
 covidID INT IDENTITY,
 covidDate datetime,
 dailyConfirmCases INT,
 dailyDeaths smallint,
 country varchar(25),
 covidFlag bit,
 totalLoss MONEY
 );
 
 -->UNIQUE can be null
 CREATE TABLE itemHeader(
 itemID INT PRIMARY KEY,
 itemName VARCHAR(50) UNIQUE,
 itemOrderDate datetime NOT NULL,
 itemShipDate datetime NOT NULL,
 itemAmount MONEY
 );

 -->child table of itemheader,
 -->linking by references itemID of header with itemId of detail
 CREATE TABLE itemDetail(
 itemId INT,
 itemDetailID INT,
 itemDueDate datetime NOT NULL,
 itemOrderQty SMALLINT NOT NULL,
 itemReceiveQty SMALLINT NOT NULL,
 itemShipDate datetime,
 itemAmount MONEY,
 CONSTRAINT itemDetailPK PRIMARY KEY(itemId,itemDetailID),
 CONSTRAINT itemDetailFK FOREIGN KEY(itemId) REFERENCES itemHeader(itemID)
 );

 INSERT INTO dbo.CovidStats VALUES ('4/25/2020',1000,10,'USA',1,1000000);
 INSERT INTO dbo.CovidStats(covidDate,country) VALUES('4/25/2020','Tuvalu');
 
 INSERT INTO dbo.CovidStats(covidDate, dailyConfirmCases, dailyDeaths, country, covidFlag, totalLoss)
 VALUES
 ('4/25/2020', 800, 6, 'Brazil', 1, 500000),
 ('4/25/2020', 750, 6, 'Russia', 1, 550000),
 ('4/25/2020', 0, 0, 'Palau', 0, 5000);

 -->both works as default prefix dbo
 select * from dbo.CovidStats;
 select * from CovidStats;

 -->update table
 UPDATE CovidStats SET covidFlag =0, totalLoss= 100
 WHERE covidID =2;

 -->alter table
 ALTER TABLE CovidStats
 ADD continent char(12);

 -->change column data type
 ALTER TABLE CovidStats
 ALTER COLUMN continent varchar(15);

 -->drop column
 ALTER TABLE CovidStats
 DROP COLUMN continent;

 -->REMOVE RECORD
 DELETE FROM CovidStats
 WHERE country ='Brazil' AND covidFlag = 1; 
 select * from CovidStats;

 -->DELETE ALL
 DELETE FROM CovidStats
 -->DELETE TOP(2)
 DELETE TOP(2) FROM CovidStats
 -->DELETE TOP 10 PERCENT
 DELETE TOP(10) PERCENT FROM CovidStats

 -->delete table, DROP function will permanently delete the table
 DROP TABLE CovidStats;