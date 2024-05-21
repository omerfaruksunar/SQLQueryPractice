USE Northwind

SELECT (E.FirstName+' '+E.LastName) AdiSoyadi
FROM Northwind.dbo.Employees E


SELECT TOP 1000 [CategoryID]
	,[CategoryName]
	,[Description]
	,[Picture]
FROM [Northwind].[dbo].[Categories]


Select * From Categories


SELECT 
ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock
FROM Products
Where UnitPrice > 18


SELECT ProductID, ProductName, CategoryID, UnitPrice, UnitsInStock 
FROM Products 
Where CategoryID Between 1 And 4


Select E.FirstName + ' ' + E.LastName as AdiSoyadi, E.BirthDate,
Year(GETDATE()) - YEAR(E.BirthDate) AS Yasi, E.Country
From Employees E
Where Year(GETDATE()) - YEAR(E.BirthDate) > 50

select City From Employees

select Distinct City From Employees

select E.FirstName+ ' ' +E.LastName AdSoyad,
Year (E.BirthDate) DTarihi, E.Country Ulke From Employees E
Where Year(E.BirthDate) Between 1930 And 1960 
AND E.Country = 'USA'

Select P.ProductName, P.UnitPrice
From Products P 
Where P.UnitPrice = 18 OR P.UnitPrice = 19 OR P.UnitPrice =25
Order By P.UnitPrice Asc, P.ProductName Desc

Select P.ProductName, P.UnitPrice 
From Products P
Where P.UnitPrice IN(18,19,25,97,40,30)
Order By P.UnitPrice Asc, P.ProductName Desc

Select P.ProductName, P.QuantityPerUnit
From Products P
Where P.QuantityPerUnit Like '%box%'

Select P.ProductName, P.QuantityPerUnit
From Products P
Where P.QuantityPerUnit Not Like '%box%'

Select C.CompanyName, C.Address,
C.Country, C.City From Customers C
Where C.CompanyName like '%Rest%'
And C.Country != 'Mexico'

Select E.FirstName, E.LastName
From Employees E Where E.FirstName Like '[A-P]%'
Order By E.FirstName

Select E.FirstName+Space(1)+E.LastName
From Employees E

Select C.CompanyName, C.Region
From Customers C
Where C.Region Is Null

Select C.CompanyName, IsNull(C.Region, 'Bölge Yok') Bolge
From Customers C
Where C.Region Is Null

Select E.FirstName+' '+E.LastName AdSoyad, 
Convert(varchar(10), E.BirthDate,104) DogumTarihi
From Employees E
Order By E.FirstName Asc, E. LastName Asc

Select Top 4 P.ProductName, P.UnitPrice 
From Products P
Order By P.UnitPrice Desc

Select Top 12 WITH TIES P.ProductName, P.UnitPrice 
From Products P
Order By P.UnitPrice Asc

Declare @Metin NvarChar(50)
Set @Metin = '    Bu metinde sonda ve baþta boþluk vardý     '
Select Rtrim(Ltrim(@Metin)) TrimSample;

Select Convert(varchar(1), C.CategoryID) +
+ Space(1) + C.CategoryName From 
Categories C

Select 
Right(Replicate(0,2)+Convert(varchar(2), C.ProductID),2)
+':'+Space(1)+C.ProductName SnoName From 
Products C
Order By C.ProductID

Select E.FirstName + ' ' + E.LastName AdSoyad,
CONVERT(varchar(10),E.BirthDate,104) DogumTarihi
From Employees E

Select 
CONVERT(VARCHAR, GETDATE(),103) F103,
CONVERT(VARCHAR, GETDATE(),104) F104,
CONVERT(VARCHAR, GETDATE(),105) F105

SET DATEFORMAT dmy;
SELECT TRY_CONVERT(Date, '25/05/2014') AS Result;

SELECT TRY_CONVERT(Date, '25/05/2014 Pazar') AS Result;

Select E.FirstName+' '+E.LastName+' ' +
Cast(Year(E.BirthDate) as NvarChar(4))+' doðumludur'
AS CalisanDogumTarihleri
From Employees E 
Order By E.BirthDate

SELECT hierarchyid::Parse('/1/1/3/')

SELECT TRY_PARSE('2014.05.25' as Date USING 'en-US') AS Result

Select E.FirstName + ' ' + E.LastName AdiSoyadi,
DATEDIFF(YY, E.BirthDate, GetDate()) Yýl,
DATEDIFF(MM, E.BirthDate, GetDate()) Ay,
DATEDIFF(DD, E.BirthDate, GetDate()) Gun
From Employees E

SELECT O.CustomerID, O.EmployeeID, O.OrderDate,
DATEPART(YYYY, O.OrderDate) AS Siparis,
DATEPART(MM, O.OrderDate) AS SiparisAy,
DATEPART(DD, O.OrderDate) AS SiparisGun,
DATEPART(QQ, O.OrderDate) AS Quarters
FROM Orders O Order By O.EmployeeID


SELECT O.OrderID, OrderDate,
DATEADD(YY,17,OrderDate) AS XYilsonra
FROM Orders O

/*_______________________________________________________*/
Declare @Gun int, @Yas as Date
Set @Gun = DATEDIFF(DD, '2001.05.27', '1900.01.01')
Select @Gun
Set @Yas = DATEADD(DY, @Gun, GetDate())
Select @Yas
Select 
DatePart(YY,@Yas)-1900 as Yil,
DatePart(MM,@Yas)-1 as Ay,
DatePart(DD,@Yas)-1 as Gun


Select DATENAME(YY, GetDate()) Yil
    ,DATENAME(MM, GetDate()) Ay
    ,DATENAME(DD, GetDate()) Gun
    ,DATENAME(W, GetDate()) GunAdi;

Print Day(GetDate())

Print Month(GetDate())

Print Year(GetDate())

Select DateFromParts(2014, 5, 21)

Select DateTimeFromParts(2014, 5, 21, 20, 21, 20, 0)

Select SmallDateTimeFromParts(2014, 5, 21, 20, 23)

Select TimeFromParts( 20, 32, 44, 500, 3) 

Select SysDateTime() SysDateTimes , GetDate() GetDates;

Select GetUTCDate() GetUTCDates, GetDate() GetDates;

SET LANGUAGE Turkish;
SELECT @@DATEFIRST As 'Ýlk Gün'
,DATEPART(dw, GetDate()) AS 'Bugün';

Select SysDateTime(), Current_TimeStamp, GetDate()

Select EOMONTH('20160201')    --Sonuç: 2016-02-29, 2016 yýlýnda þubat 29 çekiyor'

Set DateFormat DMY
Select EOMONTH('21.05.2014'); --Sonuç: 2014-05-31

SELECT SysDateTimeOffset() UTC, 
SwitchOffset(SysDateTimeOffset(), '+00:00') GMT,
GetDate() Tarih, GetUTCDate() Universal

Select IsDate('21.05.2014 15,35') --Sonuç:0
,IsDate('21.05.2014 15.35') --Sonuç:0
,IsDate('21.05.2014 15:35') --Sonuç:1

Select AVG(DATEDIFF(Year, E.BirthDate, GetDate())) YasOrtalamasi 
From Employees E

Select Count(O.OrderID) SiparisAdedi, O.EmployeeID  
From Orders O
Group By O.EmployeeID

Select Count(OrderID) From Orders

Select Count(O.OrderID) SiparisAdedi, O.EmployeeID  
From Orders O
Group By O.EmployeeID
Union All
Select Null , Count(OrderID) From Orders

Select Sum(OD.UnitPrice * OD.Quantity) SiparisToplami 
From [Order Details] OD

SELECT MAX(DATEDIFF(YEAR, BirthDate, GETDATE())) as BuyukYas,
MIN(DATEDIFF(YEAR, BirthDate, GETDATE())) as KucukYas
FROM Employees

Select FirstName, UPPER(LastName) LastName From Employees

SELECT SubString('Ömer Faruk SUNAR', 12,5) 

Select S.CompanyName,S.Phone, 
SubString(S.Phone,1,5) AlanKodu,  SubString(S.Phone,6,8) TelefonNo
FROM Shippers S

Declare @AlanKodLen int = 5
Select S.CompanyName, S.Phone, 
SubString(S.Phone,1,@AlanKodLen) AlanKodu,
SubString(S.Phone,@AlanKodLen+1,Len(S.Phone) - @AlanKodLen) TelefonNo
FROM Shippers S

SELECT Len('Ömer Faruk SUNAR') MetinUzunluk

Select Round(18.257,1) 

Select Ascii('Ü'), UNICODE('Ü') 

Select Char(220) 

SELECT CHARINDEX('SUN', 'Ömer Faruk SUNAR', 1)

SELECT LEFT('Ömer Faruk SUNAR', 4), 
RIGHT('Ömer Faruk SUNAR', 5) 

Select distinct(Replace(Country, 'USA', 'Amerika')) Country 
From Employees
Order By Country

Select Reverse('Tersten Oku')

Select Format( GetDate(), 'dd.mm.yyyy', 'tr-TR' ) TarihFormat
,Format(123456789,'###,##') RakamFormat
,Format(123456789,'N') NumberFormat

Select Concat 
('Verileri ', 'Birleþtir ', ' bu rakamý da ekle ', 100 ) ConcatOrn;

Select Concat(FirstName, Space(1), LastName) From Employees

declare @boslukSay as int 
declare @isim NvarChar(20)
declare @soyisim NvarChar(20)
Set @boslukSay=1
Set @isim ='Ömer Faruk'
Set @soyisim='SUNAR'
Select @isim + Space(@boslukSay) + @soyisim [Adý Soyadý]

CREATE OR ALTER FUNCTION CombineName(
    @firstName NVARCHAR(20),
    @lastName NVARCHAR(20), @spaceCount INT = 1
)
RETURNS NVARCHAR(100)  -- Return type size is 20 + 1 (space) + 20
AS
BEGIN    
    RETURN @firstName + SPACE(@spaceCount) + @lastName;
END
GO

Select dbo.CombineName('Ali', 'Koþ', 10)

Create or Alter function VergiHesapla (@sayi decimal, @oran decimal)
RETURNS DECIMAL(18,2)
as
begin
	return (@sayi * 100) / @oran
end
go

  select p.UnitPrice as ÜrünFiyat,
  p.UnitsInStock as ÜrünStok,
  (p.UnitPrice * p.UnitsInStock) as FiyatToplam ,
  dbo.VergiHesapla(p.UnitPrice, 17.5) as ÜrünVergi,
  dbo.VergiHesapla((p.UnitPrice * p.UnitsInStock), 17.5) as VergiToplam
  from Products p

  Select Concat(FirstName, Space(1), LastName) From Employees

  SELECT ProductName, REPLICATE('-.-.', 4) + ProductName AS UrunAdi
FROM Products

Select FirstName, Patindex('%an%', FirstName) kacinci From Employees

Select O.CustomerID, Sum(O.Freight) Freight From Orders O
Group By O.CustomerID 
Order By Sum(O.Freight) Desc

SELECT OD.OrderID, 
Round(SUM((1- OD.Discount) * OD.Quantity * OD.UnitPrice),2) Indirimli
FROM [Order Details] OD     
GROUP BY OD.OrderID ORDER BY Indirimli DESC

SELECT OD.OrderID, 
Round(SUM((1- OD.Discount) * OD.Quantity * OD.UnitPrice),2) 
Indirimli
FROM [Order Details] OD
GROUP BY OD.OrderID
Having Round(SUM((1- OD.Discount) * OD.Quantity * OD.UnitPrice),2)>12000 
ORDER BY Indirimli DESC

SELECT OD.OrderID ID, 
Round(SUM((1- OD.Discount) * OD.Quantity * OD.UnitPrice),2) 
Indirimli
FROM [Order Details] OD
GROUP BY OD.OrderID
having OD.OrderID >=11070
ORDER BY ID DESC

/*Bir sorguda Group By kullanýldý ise Filtreleme yapmak için where ifadesi yerine having kullanýlýr.*/

Select OD.OrderID, Sum(OD.Quantity) Toplam
From [Order Details] OD
Group By OD.OrderID
Having Sum(OD.Quantity) > 260
ORDER BY Toplam DESC

Select OD.OrderID--, Sum(OD.Quantity) Toplam
From [Order Details] OD
Group By OD.OrderID
having OD.OrderID>5
--Having Sum(OD.Quantity) > 260*/
--ORDER BY Toplam DESC

/*Sayýsal verilerden dönüþtürülen karakter verilerini döndürür. 
Karakter verileri, belirtilen uzunluk ve ondalýk hassasiyetle saða dayalýdýr.
STR => Ondalýklý bir sayýdan, rakamýn kendisi ile birlikte bildirdiðimiz adette ondalýk deðer alýr.*/
Declare @Rakam as Float
Set @Rakam = 155.123456789012
SELECT STR(@Rakam, 16, 8)

SELECT STUFF('Ömöm', 3, 4, 'er faruk')

Set DateFirst 7

Set RowCount 4
Select * From Products
Set RowCount 0

Set DateFormat DMY --Gün, Ay, Yýl
GO
DECLARE @Tarih Date 
Set @Tarih= '24.05.2014'
Select DateAdd(D, 7,@Tarih)

Set Concat_Null_Yields_Null Off
Select Null+'string birleþtir' --Sonuç: string birleþtir
Set Concat_Null_Yields_Null On

Set Language Turkish
SELECT @@LANGID, @@LANGUAGE

Select @@MAX_CONNECTIONS

SELECT @@SERVERNAME

Select @@SERVICENAME ServisAdi 

 Declare @Oran float=0.18
SELECT OD.OrderID, 
UnitPrice, UnitPrice * @Oran KDV
FROM [Order Details] OD
GO

Create Function fn_KDVHesabi
(@Rakam Money, @Oran Money)
Returns Money
Begin
 Return @Rakam * @Oran
End

SELECT OD.OrderID, 
UnitPrice, dbo.fn_KDVHesabi(UnitPrice, 0.18) KDV
FROM [Order Details] OD

Create Function fn_DMY
(@Tarih Date)
Returns varchar(10)
Begin
 Return Convert(varchar(10), @Tarih, 104)
End

Select FirstName, LastName, 
dbo.fn_DMY(BirthDate) DogumTarihi
From Employees

CREATE FUNCTION FN_AYADI (@AYRAKAMI AS INT)
RETURNS VARCHAR(7)
BEGIN
	RETURN (CASE @AYRAKAMI
		WHEN 1 THEN 'OCAK'
		WHEN 2 THEN 'ÞUBAT'
		WHEN 3 THEN 'MART'
		WHEN 4 THEN 'NÝSAN'
		WHEN 5 THEN 'MAYIS'
		WHEN 6 THEN 'HAZÝRAN'
		WHEN 7 THEN 'TEMMUZ'
		WHEN 8 THEN 'AÐUSTOS'
		WHEN 9 THEN 'EYLÜL'
		WHEN 10 THEN 'EKÝM'
		WHEN 11 THEN 'KASIM'
		WHEN 12 THEN 'ARALIK'
END)
END

Select dbo.FN_AYADI(7)

Create Function fn_MusteriListele
(@CompanyName NvarChar(40))
Returns Table
Return SELECT 
CustomerID, CompanyName,
ContactName, City, 
Country, Phone
FROM Customers
Where
CompanyName = @CompanyName

Select * From dbo.fn_MusteriListele('Alfreds Futterkiste')

Alter Function fn_MusteriListele
(@CustomerName NvarChar(40))
Returns Table
 Return SELECT 
 CustomerID, CompanyName,
 ContactName, City, 
 Country, Phone
 FROM Customers
 Where
 CompanyName Like '%'+@CustomerName+'%'

 Select * From dbo.fn_MusteriListele('AN')

 Select P.ProductName, P.UnitPrice, 
Case
 When P.UnitPrice <=30 Then 'Kritik Stok Seviyesi'
 When P.UnitPrice Between 30 AND 90 Then 'Ýdeal Stok Seviyesi'
 Else 'Kampanyasý Yapýlmalý'
End StokDurumu
From Products P

/*IF EXIST: Bir tabloda istediðimiz koþulu saðlayan kayýtlarýn var olup olmadýðýný kontrol eder.
  Tabloda koþulu saðlayan deðer varsa true döner.*/

if Exists(Select ProductName From Products Where ProductName= 'Chai')
Begin
 Print 'Kayýt bulundu'
End


If Exists(Select C.Country From Customers C
Where C.Country = 'Germany')
Begin
Select C.CompanyName, C.Country, C.Phone 
From Customers C
Where C.Country = 'Germany'
End

/*IIF: Boolean ifadesinin SQL Server'da doðru veya yanlýþ olarak deðerlendirilmesine 
baðlý olarak iki deðerden birini döndürür.*/
Select CategoryName, Description, 
IIF(CategoryName='Beverages','Ýçecekler','Ýçecek Deðil')
From Categories

/*Inner Join join ifadesi kullanýlan tablolarda, sadece eþleþen kayýtlar listelenir.*/
Select C.CategoryName, P.ProductName From	
Products P
Inner Join
Categories C
ON P.CategoryID = C.CategoryID

Select P.ProductName, C.CategoryName From	
Products P --SOL
Left Join
Categories C --SAÐ
ON P.CategoryID = C.CategoryID

Select P.ProductName, C.CategoryName From	
Products P  --SAÐ
Right Join
Categories C --SOL
ON P.CategoryID = C.CategoryID

Select P.ProductName, C.CategoryName From	
Products P
full join
Categories C
ON P.CategoryID = C.CategoryID

Select * From Categories C
Select * From Products P

Select * From Categories C
Inner Join Products P
ON C.CategoryID = P.CategoryID

Select C.CategoryName, P.UnitsInStock 
From Categories C
Inner Join Products P
ON C.CategoryID = P.CategoryID
Order By C.CategoryName

Select C.CategoryName, Sum(P.UnitsInStock) StokToplami
From Categories C
Inner Join 
Products P
ON C.CategoryID = P.CategoryID
Group By C.CategoryName
Order By C.CategoryName

Select Concat(E.FirstName,Space(1) ,E.LastName) CalisanAdSoyad,
O.OrderID Siparis, C.CompanyName MusteriUnvan
From Orders O
Join Customers C
ON O.CustomerID = C.CustomerID
Join Employees E
ON E.EmployeeID = O.EmployeeID


/*round yuvarlama*/
SELECT OD.ProductID, 
Round(SUM((1 - OD.Discount) * (OD.UnitPrice * OD.Quantity)),2) 
AS ToplamFiyat
FROM [Order Details] AS OD
GROUP BY OD.ProductID
ORDER BY OD.ProductID


/*Belirtilen biçim ve isteðe baðlý kültürle biçimlendirilmiþ bir deðer döndürür.
  Tarih/saat ve sayý deðerlerinin dize olarak yerel ayarlara uygun biçimlendirilmesi için FORMAT iþlevini kullanýn. 
  Genel veri türü dönüþümleri için CAST veya CONVERT kullanýn.*/
SELECT OD.ProductID, 
P.ProductName,			
Format(
Round(SUM((1 - OD.Discount) * (OD.UnitPrice * OD.Quantity)),2), 
'C', 'tr-TR') 
AS ToplamFiyat
FROM [Order Details] AS OD
JOIN Products P			
ON OD.ProductID = P.ProductID     
GROUP BY OD.ProductID,P.ProductName
ORDER BY OD.ProductID

Select * From Northwind.INFORMATION_SCHEMA.TABLES 
Order By TABLE_TYPE

Select TABLE_CATALOG, TABLE_NAME, 
COLUMN_NAME, DATA_TYPE, 
COLLATION_NAME 
From Northwind.INFORMATION_SCHEMA.COLUMNS

Select * From Northwind.INFORMATION_SCHEMA.CHECK_CONSTRAINTS


Select TABLE_CATALOG, TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME
From Northwind.INFORMATION_SCHEMA.TABLE_CONSTRAINTS

Select * From Northwind.INFORMATION_SCHEMA.PARAMETERS

Select ROUTINE_DEFINITION, ROUTINE_NAME From 
Northwind.INFORMATION_SCHEMA.ROUTINES

Select * From Northwind.INFORMATION_SCHEMA.VIEWS

Select U.TABLE_CATALOG, U.TABLE_NAME, U.VIEW_NAME
From Northwind.INFORMATION_SCHEMA.VIEW_TABLE_USAGE U

Select * From 
Northwind.INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE

Select TABLE_CATALOG, TABLE_NAME, TABLE_SCHEMA, CONSTRAINT_TYPE From 
Northwind.INFORMATION_SCHEMA.TABLE_CONSTRAINTS

Select TABLE_CATALOG, TABLE_NAME, TABLE_SCHEMA,
CONSTRAINT_NAME From 
Northwind.INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
Where CONSTRAINT_NAME Not Like ('PK_%') And
CONSTRAINT_NAME Not Like ('FK_%')
Order By TABLE_NAME

SELECT SERVERPROPERTY('Collation') 

Select SUSER_NAME(1) Kullanici1, --sa
SUSER_NAME(2) Kullanici2, --public
SUSER_NAME(259) Kullanici3 --public

Select Name, principal_id, default_language_name
From Northwind.sys.server_principals
Where type_desc IN( 'SQL_LOGIN','WINDOWS_LOGIN') 
And Name Not Like 'NT%'


Select * From sysdiagrams

Select type_desc, physical_name From sys.database_files

Use Northwind
DBCC SHOWFILESTATS

Select * From sys.databases 

Select * From sys.databases
Where Name Not In('master', 'tempdb', 'model', 'msdb')


Use Northwind
Select * From sys.tables

USE Northwind
DBCC CHECKDB

Use Northwind
DBCC CHECKIDENT (Categories, RESEED,10)

Use Northwind
DBCC CHECKIDENT (Categories, RESEED)

Select @@Identity

SELECT SCOPE_IDENTITY()

Use Northwind
Select IDENT_CURRENT('Categories') SonID

Select ROW_NUMBER() OVER (ORDER BY CategoryID) AS SiraNO, 
CategoryID, CategoryName
From Categories

/*Bu iþlev, sýralama deðerlerinde boþluk olmadan, bir sonuç kümesi bölümündeki
her satýrýn sýralamasýný döndürür. Belirli bir satýrýn sýralamasý, 
bir artý o belirli satýrdan önce gelen farklý sýralama deðerlerinin sayýsýdýr.*/
Select DENSE_RANK() Over (Order By E.Country) As Grupno,
E.Country, E.FirstName+Space(1)+E.LastName AS AdiSoyadi
From Employees E

/*Belirtilen bir dize deðerinin tüm oluþumlarýný baþka bir dize deðeriyle deðiþtirir.*/
Select Replace(P.UnitPrice, ',', '.') UnitPrice From Products P

Select E.FirstName, E.LastName, E.TitleOfCourtesy,
Replace(E.TitleOfCourtesy, 'Mrs.', 'Bay') Cinsiyet
From Employees E

Select E.FirstName, E.LastName, E.TitleOfCourtesy,
Case (E.TitleOfCourtesy)
 When 'Mr.' Then 'Bay'
 When 'Ms.' Then 'Bayan'
 When 'Mrs.' Then 'Bayan'
End Unvan
From Employees E

Select E.FirstName, E.LastName, E.TitleOfCourtesy Unvan,
Case 
 When E.TitleOfCourtesy = 'Ms.' OR E.TitleOfCourtesy = 'Mrs.' Then 'Bayan'
 When E.TitleOfCourtesy = 'Mr.' Then 'Erkek'
End Unvan
From Employees E

Declare @CatName NvarChar(15)
Set @CatName= 'Yeni Kategori'
if Not Exists 
	(Select CategoryName From Categories
	Where CategoryName = @CatName) 
	Insert Into Categories
	(CategoryName) Values (@CatName)
Else
	Select CategoryID, CategoryName, Description
	From Categories Where CategoryName = @CatName

Select S.CompanyName, S.Phone From Shippers S

Insert Into Shippers		
Values							
('Bizim Kargomuz', '05542855055')		
Select S.CompanyName, S.Phone From Shippers S

/* Verinin tekrar edilmemesi için kontrol mekanizmasý.(Bir önceki sorgu) */
ALTER TABLE Shippers
ADD CONSTRAINT UniqueCompany UNIQUE (CompanyName)

Insert Into Employees
(FirstName, LastName)
Values
('Ömer', 'SUNAR'),
('Mahmut', 'GÜNDÜR'),
('Mustafa', 'Þahin'),
('Barýþ', 'Elitoð'), 
('Can', 'ÜSTÜNEL'),
('Muharrem', 'ARAS')
GO
Select FirstName, LastName
From Employees


Select * INTO Urunler From Products


Select * INTO Nakliyeciler From Shippers
GO
Insert Into Nakliyeciler
(CompanyName, Phone)
(
 Select CompanyName, Phone From Shippers
)
GO
Select CompanyName, Phone From Nakliyeciler


Select FirstName, LastName, BirthDate
From Employees Where BirthDate Is Null


Declare @Tarih As Date, @ID As Int
Set @Tarih = '19761117' Set @ID=10
Update Employees
Set BirthDate = @Tarih
Where EmployeeID = @ID


Select * Into Personel From Employees

Insert Into Personel
Select 
LastName, FirstName, Title, TitleOfCourtesy, BirthDate, 
HireDate, Address, City, Region, PostalCode, Country, 
HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath 
From Employees

Select EmployeeID, FirstName, LastName, BirthDate 
From Personel Where Not EmployeeID In
(Select Min(EmployeeID) MinID From Personel
Group By FirstName, LastName) Order By FirstName

Select EmployeeID, FirstName, LastName, 
Cast(BirthDate As Date) BirthDate
From Personel Where Not EmployeeID In
(Select Min(EmployeeID) MinID From Personel
Group By FirstName, LastName) Order By FirstName

Set DateFormat DMY
GO
Select EmployeeID, FirstName, LastName, 
Convert(NvarChar(11), BirthDate, 104) BirthDate
From Personel Where Not EmployeeID In
(Select Min(EmployeeID) MinID From Personel
Group By FirstName, LastName) Order By FirstName


Select Min(EmployeeID) MinID
From Personel
Group By FirstName, LastName

Delete From Personel Where Not EmployeeID In
(
Select Min(EmployeeID) MinID
From Personel
Group By FirstName, LastName
)
GO
Select * From Personel


Select * From Personel Where Not EmployeeID In
(
Select Min(EmployeeID) MinID
From Personel
Group By FirstName, LastName
)

Use Northwind
Declare @EndID int
Select @EndID = Max(EmployeeID) From Personel
Print @EndID
DBCC CHECKIDENT (Personel, RESEED, @EndID)


/* Bundan sonraki 7 sorgu birbiriyle baðlantýlý.*/

Create View Urunlerim AS
Select P.ProductID, P.ProductName From Products P
GO
Select * From Urunlerim

Set Language Turkish
GO
Alter View Urunlerim AS
Select P.ProductID, P.ProductName From Products P
Order By ProductID


Alter View Urunlerim AS
Select Top 100 P.ProductID, P.ProductName From Products P
Order By ProductID
GO
Select * From Urunlerim


Declare @UrunSayisi int
Select @UrunSayisi = Count(*) From Products
Alter View Urunlerim AS
Select Top @UrunSayisi P.ProductID, P.ProductName From Products P
Order By ProductID


Alter View Urunlerim AS
Select Top (Select Count(*) From Products)
P.ProductID, P.ProductName 
From Products P
Order By ProductID
GO
Select * From Urunlerim


Create View vw_SipDetALFKI AS
Select OrderID, CustomerID, EmployeeID, 
OrderDate, RequiredDate, ShippedDate, 
ShipVia, Freight, ShipName, ShipAddress, 
ShipCity, ShipRegion, ShipPostalCode, ShipCountry
From [Orders]
Where CustomerID = 'ALFKI'
With Check Option
GO
Select * From vw_SipDetALFKI



SET DateFormat DMY
Insert Into vw_SipDetALFKI
(CustomerID, EmployeeID, 
OrderDate, RequiredDate, ShippedDate, 
ShipVia, Freight, ShipName, ShipAddress, 
ShipCity, ShipRegion, ShipPostalCode, 
ShipCountry)
Values
('ALFKI','6',	'25.08.2013',
'22.09.2013',	'02.09.2013',	'1','50',	
'Alfreds Futterkiste', 'Obere Str. 57',	
'Berlin', 'NULL', '12209',	'Germany')
GO
Select * From vw_SipDetALFKI


Delete From vw_SipDetALFKI

/*___________________________________________________________________*/

Alter View vw_SipDetALFKI 
WITH ENCRYPTION AS
Select OrderID, CustomerID, EmployeeID, 
OrderDate, RequiredDate, ShippedDate, 
ShipVia, Freight, ShipName, ShipAddress, 
ShipCity, ShipRegion, ShipPostalCode, ShipCountry
From Orders
Where CustomerID = 'ALFKI'
With Check Option


Alter View vw_SipDetALFKI 
WITH SCHEMABINDING AS
Select OrderID, CustomerID, EmployeeID, 
OrderDate, RequiredDate, ShippedDate, 
ShipVia, Freight, ShipName, ShipAddress, 
ShipCity, ShipRegion, ShipPostalCode, ShipCountry
From dbo.Orders
Where CustomerID = 'ALFKI'
With Check Option


Create View vw_SiparislerDetaylar AS
Select  
OD.ProductID, OD.OrderID,
Round((1-OD.Discount) * 
OD.UnitPrice * OD.Quantity,2)
NetPrice,
O.ShipCountry,
S.CompanyName
From Orders O
Join [Order Details] OD
ON O.OrderID = OD.OrderID
Join Shippers S
ON S.ShipperID = O.ShipVia
GO
Select * From vw_SiparislerDetaylar


Create View vw_UrunKategorileri AS
Select
P.ProductID, P.ProductName,
P.UnitPrice, P.UnitsInStock,
C.CategoryName
From Products P
Join Categories C
ON P.CategoryID = C.CategoryID
GO
Select * From vw_UrunKategorileri Order By CategoryName


Create View vw_MusteriPersonelSiparis AS
Select 
O.OrderID,
E.FirstName +' '+ E.LastName EmplName, 
Year(E.BirthDate) AS BirthDate,
C.CompanyName, C.Phone,
Convert(NvarChar(10), O.OrderDate, 104) OrderDate,
O.Freight
From Employees E
Join Orders O
ON O.EmployeeID = O.EmployeeID
Join Customers C
ON O.CustomerID = C.CustomerID
GO
Select Top 10 * From vw_MusteriPersonelSiparis


Select * From vw_SiparislerDetaylar SD
Join vw_UrunKategorileri UK
ON SD.ProductID = UK.ProductID
Join vw_MusteriPersonelSiparis MPS
ON MPS.OrderID = SD.OrderID

Create Table Kimlikler
(
	KimlikID int Not Null Primary Key Identity(1,1),
	Ad NvarChar(20) Not Null,
	Soyad NvarChar(40) Not Null,
	DogumTarihi Date Null Default(GetDate()),
	TcKimlik Varchar(11) Not Null Unique,
	Cinsiyet Bit Not Null,
	Constraint chk_DgmTar Check (DogumTarihi <= GetDate()),
	Constraint chk_TcKimlik Check (TCKimlik Like 
'[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][02468]')
)



Use Northwind
GO
Create Table UlasimBilgileri
(
	UlasimID int Not Null Primary Key Identity,
	KimlikID int Not Null Foreign Key 
	References Kimlikler(KimlikID),
	Mail NvarChar(50) Not Null,
	CepTel NvarChar(10) Not Null
)
Alter Table UlasimBilgileri Add 
Constraint chk_Mail Check (Mail Like '%_@_%_.__%'),
Constraint chk_CepTel Check (CepTel Like 
'[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')


Set DateFormat DMY
Insert Into Kimlikler
Values
('Ömer Faruk', 'Sunar','27.05.2001','53206098054',1),
('Mehmet', 'Gündür','15.01.1990','53207898056',1),
('Muammer', 'Çetinkaya','11.01.1975','53204998058',1)
Select * From Kimlikler


Delete From Kimlikler
Select * From Kimlikler


Insert Into Kimlikler
Values
('Ömer Faruk', 'Sunar','17.11.1976','53206098054',1),
('Mehmet', 'Gündür','15.01.1990','53207898056',1),
('Muammer', 'Çetinkaya','11.01.1975','53204998058',1)
Select * From Kimlikler



Delete From Kimlikler
Select * From Kimlikler



Use Northwind
Declare @SonIDNo int
Select @SonIDNo = Max(KimlikID) From Kimlikler
if (@SonIDNo Is Null) Set @SonIDNo = 0
DBCC CHECKIDENT (Kimlikler, RESEED, @SonIDNo)



Insert Into Kimlikler
Values
('Ömer Faruk', 'SUNAR','17.11.1976','53206098054',1),
('Mehmet', 'Gündür','15.01.1990','53207898054',1),
('Muammer', 'Çetinkaya','11.01.1975','53204998054',1)
Select * From Kimlikler


Insert Into UlasimBilgileri
(KimlikID, Mail, CepTel)
Values
(1,'ofs@yandex.com','5542855055'),
(2,'m-gundur@yandex.com','1234567890')

Select * From UlasimBilgileri


Select Km.Ad, Km.Soyad, Km.DogumTarihi, 
Km.Cinsiyet, U.Mail, U.CepTel
From Kimlikler Km
Join UlasimBilgileri U
On Km.KimlikID = U.KimlikID


Select Km.Ad, Km.Soyad, Km.DogumTarihi, 
Km.Cinsiyet, U.Mail, U.CepTel
From Kimlikler Km
Full Join UlasimBilgileri U
On Km.KimlikID = U.KimlikID



Set Language Turkish
Delete From Kimlikler


Delete From UlasimBilgileri 
Select * From UlasimBilgileri 


Delete From Kimlikler
Select * From Kimlikler


/*SQL Server'da belirtilen tablonun geçerli kimlik deðerini kontrol eder ve
gerekirse kimlik deðerini deðiþtirir. DBCC CHECKIDENTKimlik sütunu için 
yeni bir geçerli kimlik deðerini manuel olarak ayarlamak için de kullanabilirsiniz .*/
Use Northwind
Declare @SonIDNo int
Select @SonIDNo = Max(UlasimID) From UlasimBilgileri
if (@SonIDNo Is Null) Set @SonIDNo = 0
DBCC CHECKIDENT (UlasimBilgileri, RESEED,@SonIDNo)
GO
Use Northwind
Declare @SonIDNo int
Select @SonIDNo = Max(KimlikID) From Kimlikler
if (@SonIDNo Is Null) Set @SonIDNo = 0
DBCC CHECKIDENT (Kimlikler, RESEED,@SonIDNo)



Insert Into Kimlikler
Values
('Ömer Faruk', 'Sunar','17.11.1976','53206098054',1),
('Mehmet', 'Gündür','15.01.1990','53207898056',1),
('Muammer', 'Çetinkaya','11.01.1975','53204998058',1),
('Amine', 'Uzunköprü', '15.01.1980', '52365691952',0)

Select * From Kimlikler



Insert Into UlasimBilgileri
(KimlikID, Mail, CepTel)
Values
(1,'ofs@yandex.com','5542855055'),
(2,'m-gundur@yandex.com','1234567890')

Select * From UlasimBilgileri


Select Km.Ad, Km.Soyad, U.Mail, U.CepTel,
Convert(NvarChar(10) ,Km.DogumTarihi,104) DogumTarihi, 
Case
When (Cinsiyet=1) Then 'Erkek'
When (Cinsiyet=0) Then 'Bayan' 
End AS Cinsiyet
From Kimlikler Km
Full Join UlasimBilgileri U
On Km.KimlikID = U.KimlikID




Select * From UlasimBilgileri
GO
Declare @ID int
Declare @Mail NvarChar(50) ='m-cetinkaya@yandex.com'
Declare @Cep NvarChar(50)='1234567891'

Select  @ID = KimlikID From Kimlikler K
Where Ad = 'Muammer'

if Not Exists(Select KimlikID From UlasimBilgileri Where Mail=@Mail)
Insert Into UlasimBilgileri
(KimlikID, Mail, CepTel)
Values
(@ID, @Mail, @Cep)



GO
Declare @ID int
Declare @Mail NvarChar(50)
Declare @Cep NvarChar(50)

Set @Mail ='a-kopru@yandex.com'
Set @Cep ='1234567892'

Select  @ID = KimlikID From Kimlikler K
Where Ad = 'Amine'

--Eðer mail daha önce yok ise ekle.
if Not Exists(Select KimlikID From UlasimBilgileri Where  Mail=@Mail)
Insert Into UlasimBilgileri
(KimlikID, Mail, CepTel)
Values
(@ID, @Mail, @Cep)



Select Km.Ad, Km.Soyad, U.Mail, U.CepTel,
Convert(NvarChar(10) ,Km.DogumTarihi,104) DogumTarihi, 
Case
When (Cinsiyet=1) Then 'Erkek'
When (Cinsiyet=0) Then 'Bayan' 
End AS Cinsiyet
From Kimlikler Km
Full Join UlasimBilgileri U
On Km.KimlikID = U.KimlikID


Create Procedure pr_OrderDisc AS
SELECT OD.OrderID, 
Round(SUM((1- OD.Discount) * OD.Quantity * OD.UnitPrice),2) 
Indirimli
FROM [Order Details] OD
GROUP BY OD.OrderID
ORDER BY Indirimli DESC
GO
Exec pr_OrderDisc



Create Proc pr_CatProd 
@CatName NvarChar(50)
AS
Select C.CategoryName, P.ProductName
From Categories C
Join Products P
ON C.CategoryID=P.CategoryID
Where C.CategoryName = @CatName
Order By C.CategoryID, P.CategoryID
GO
Exec pr_CatProd @CatName='Beverages'




Alter Proc pr_CatProd 
@CatName NvarChar(50)
AS
Select C.CategoryName, P.ProductName
From Categories C
Join Products P
ON C.CategoryID=P.CategoryID
Where C.CategoryName Like '%'+ @CatName +'%'
Order By C.CategoryID, P.CategoryID

GO
Exec pr_CatProd @CatName='' 



Create Proc pr_Topla
@Sayi1 int, @Sayi2 int, @Sayi3 int
AS
Return @Sayi1+@Sayi2+@Sayi3
GO


Declare @Sonuc int 
Exec @Sonuc=pr_Topla '10','20','30'
Select @Sonuc Toplam




GO
Declare @MySonuc int
Exec @MySonuc=pr_Topla @Sayi3='11',@Sayi2='22',@Sayi1='43'
Select @MySonuc Toplam


Create Proc pr_EmpInsert
@EmpName NvarChar(50),
@EmpLastName NvarChar(50),
@EmpBirtDate DateTime
AS
if Not Exists
(Select E.FirstName, E.LastName, E.BirthDate From Employees E
Where E.FirstName=@EmpName AND 
E.LastName=@EmpLastName AND
E.BirthDate=@EmpBirtDate) 
Insert Into Employees
(FirstName, LastName, BirthDate)
Values
(@EmpName, @EmpLastName, @EmpBirtDate)
Else
 Print 'Bu Personel zaten kayýtlý'
Select E.FirstName, E.LastName, E.BirthDate
From Employees E
Where E.FirstName=@EmpName AND 
E.LastName=@EmpLastName AND 
E.BirthDate=@EmpBirtDate
GO 

Exec pr_EmpInsert 'Nancy', 'Davolio', '19481208'



Create Proc pr_CatInsert
@CatName NvarChar(20) AS
Declare @CatID int
if Not Exists(Select C.CategoryName From Categories C 
Where C.CategoryName = @CatName)
	Begin
	 Insert Into Categories
	 (CategoryName)
	 Values
	 (@CatName)
	 Set @CatID = SCOPE_IDENTITY()
	End
Else
	Begin
		Select @CatID=CategoryID From Categories
		Print 'Bu kategori var'
	End

 Select C.CategoryID, C.CategoryName 
 From Categories C 
 Where C.CategoryName = @CatName

 Return @CatID




 Declare @CatID int
EXEC @CatID = pr_CatInsert 'Beverages'
Print @CatID


Declare @MyCatID int
EXEC @MyCatID = pr_CatInsert @CatName='Tekstil'
Print @MyCatID
GO
Declare @SetCatID int
EXEC @SetCatID = pr_CatInsert @CatName='Elektronik'
Print @SetCatID


Select P.ProductID, P.ProductName, P.CategoryID,
P.UnitPrice, P.UnitsInStock
From Products P



/* Insert Into Products
(P.ProductName, P.CategoryID,
P.UnitPrice, P.UnitsInStock)
Values
('Ürün Adý', 'Kullanýcý Kategori Adý verecek Biz ID deðerini bulacaðýz',
'Fiyatý kullanýcý girecek', 'Adedi kullanýcý verecek')   */



Create Proc pr_ProductAndCategoryAdd
@ProductName NvarChar(40),	
@CategoryName NvarChar(15),
@UnitPrice Money,
@UnitsInStock SmallInt,
@ProdID int OutPut
AS

Declare @CatId int
Exec @CatId = pr_CatInsert @CatName=@CategoryName

If Not Exists
(Select P.ProductName From Products P Where P.ProductName = @ProductName)
Begin
 Insert Into Products
 (ProductName, CategoryID, UnitPrice, UnitsInStock)
 Values
 (@ProductName, @CatId, @CatId, @UnitsInStock)
 Set @ProdID=SCOPE_IDENTITY()
End
Else
Begin
 Print 'Bu ürün zaten var'
 Select @ProdID=	P.ProductID From Products P Where P.ProductName = @ProductName
End

Select P.ProductID, P.ProductName From Products P Where P.ProductID = @ProdID






Declare @ProdID int
exec @ProdID = pr_ProductAndCategoryAdd 
@ProductName='Kazak',
@CategoryName='Tekstil',
@UnitPrice = 25.75,
@UnitsInStock= 30,
@ProdID= @ProdID OutPut




Declare
@SonIDNo int, 					
@TableName sysname='Categories',
@IdentityColumnName sysname = 'CategoryID',
@SQL NvarChar(100)
DECLARE @Deger TABLE (i BIGINT); 
SET @SQL = 'SELECT MAX('+@IdentityColumnName+') FROM '+@TableName+'';
Insert @Deger
Exec sp_executeSQL @SQL
SELECT @SonIDNo = i FROM @Deger;
if (@SonIDNo Is Null) Set @SonIDNo = 0
DBCC CHECKIDENT (@TableName, RESEED, @SonIDNo)



Create Or Alter Proc pr_IdentityResetle
@TableName nvarchar(50),
@IdentityColumnName nvarchar(50)
AS
Declare @Deger TABLE (i BIGINT)
Declare @SonIDNo int
Declare @SQL NvarChar(100) SET @SQL = 'SELECT MAX('+@IdentityColumnName+') FROM '+@TableName+'';
Insert @Deger
Exec sp_executeSQL @SQL
SELECT @SonIDNo = i FROM @Deger;
if (@SonIDNo Is Null) Set @SonIDNo = 0
DBCC CHECKIDENT (@TableName, RESEED, @SonIDNo)
GO
Exec pr_IdentityResetle 'Categories', 'CategoryID'


Create Proc pr_IdentityBulResetle
@TableName nvarchar(50)
AS
Declare @Deger TABLE (i BIGINT)
Declare @SonIDNo int
Declare @SQL NvarChar(100)
Declare @IdentityColumnName sysname

SELECT @IdentityColumnName = Name
FROM sys.columns 
WHERE is_identity = 1
AND object_id = OBJECT_ID(@TableName) 
Print OBJECT_ID(@TableName) 

if (@IdentityColumnName Is Not Null)
Begin
	SET @SQL = 
 'SELECT MAX('+ @IdentityColumnName +') FROM '+@TableName+'';
 Insert @Deger

 Exec sp_executeSQL @SQL

 SELECT @SonIDNo = i FROM @Deger;

 if (@SonIDNo Is Null) Set @SonIDNo = 0
	DBCC CHECKIDENT (@TableName, RESEED, @SonIDNo)
End
GO
Exec pr_IdentityBulResetle 'Categories'



SELECT OBJECT_ID, Name, is_identity
FROM sys.columns 
WHERE is_identity = 1



SELECT OBJECT_ID, Name, is_identity
FROM sys.columns 
WHERE is_identity = 1
AND object_id = OBJECT_ID('Categories') 
Print OBJECT_ID('Categories')




SELECT OBJECT_ID, Name, is_identity
FROM sys.columns 
WHERE object_id = 2057058364 --Tablonun rakamsal karþýlýðý



Select P.ProductName From Products P
Select C.CategoryID, C.CategoryName From Categories C



Declare @ProdName NvarChar(40)
if Exists
(Select ProductName From Products Where ProductName = @ProdName)
Begin
 Delete From Products Where ProductName = @ProdName
End



Declare @ProdName NvarChar(40)
Declare @CatID int

if Exists
(Select ProductName From Products 
Where ProductName = @ProdName)

Select @CatID=CategoryID From Products 
Where ProductName = @ProdName

Begin
 Delete From Products Where ProductName = @ProdName
End

if (@CatID is not Null) 
Begin
 Delete From Categories Where CategoryID = @CatID
End




Create Proc pr_CatProdDelete
@ProdName NvarChar(40)
AS

Declare @CatID int
Select @CatID=CategoryID From Products 
Where ProductName = @ProdName
if Exists
 (Select ProductName From Products 
 Where ProductName = @ProdName)

Begin
 Delete From Products Where ProductName = @ProdName
End

if (@CatID is not Null) 
Begin
 Delete From Categories Where CategoryID = @CatID

 Select C.CategoryName, P.ProductName From Categories C
 Join Products P
 On C.CategoryID = P.CategoryID
 Order By C.CategoryID, P.ProductID
End



Declare @ProdID int
Exec @ProdID = pr_ProductAndCategoryAdd 
@ProductName='Kazak',
@CategoryName='Tekstil',
@UnitPrice = 25.75,
@UnitsInStock= 30,
@ProdID= @ProdID OutPut




Exec pr_CatProdDelete 'Kazak'



Exec pr_IdentityBulResetle 'Categories'
Exec pr_IdentityBulResetle 'Products'


/*ir DML, DDL veya oturum açma tetikleyicisi oluþturur. 
Tetikleyici, veritabaný sunucusunda bir olay meydana geldiðinde 
otomatik olarak çalýþan özel bir tür saklý prosedürdür. 
DML tetikleyicileri, bir kullanýcý bir veri iþleme dili (DML) olayý 
aracýlýðýyla verileri deðiþtirmeye çalýþtýðýnda çalýþýr. 
DML olaylarý, bir tablo veya görünümdeki INSERT, UPDATE veya DELETE 
ifadeleridir. Bu tetikleyiciler, tablo satýrlarý etkilense de 
etkilenmese de herhangi bir geçerli olay tetiklendiðinde etkinleþir.*/
Create Trigger tr_CatNoDelete
ON Categories
/*INSTEAD OF Tetikleyici SQL ifadesi yerine
DML tetikleyicisinin baþlatýldýðýný ve böylece tetikleyici ifadelerin eylemlerinin geçersiz kýlýndýðýný belirtir. DDL veya oturum açma tetikleyicileri için INSTEAD OF belirtemezsiniz.

Bir tablo veya görünümdeki INSERT, UPDATE veya DELETE ifadesi baþýna 
en fazla bir INSTEAD OF tetikleyicisi tanýmlayabilirsiniz. 
Ayrýca, her görünümün kendi INSTEAD OF tetikleyicisine 
sahip olduðu görünümlerde görünümler de tanýmlayabilirsiniz.*/
Instead Of Delete
AS
/*Tetikleyiciler iþlemlerde (örtük veya baþka þekilde) çalýþýr ve 
açýk olduklarýnda kaynaklarý kilitlerler. Kilit, iþlem onaylanana 
(COMMIT ile) veya reddedilene (ROLLBACK ile) kadar yerinde kalýr.*/
RollBack Tran
GO
Delete From Categories





Create Trigger tr_CatNoUpdate --(Sorgu:246)
ON Categories
Instead Of Update  
AS
RollBack Tran  	
GO
Update Categories Set CategoryName= 'Yeni Kategori'
GO
Select * From Categories




Create Trigger tr_CatNoInsert 
ON Categories
Instead Of Insert		
AS
RollBack Tran		
GO
Insert Into Categories
(CategoryName)
Values
('Ekle')



--Tetikleyiciyi devre dýþý býrakýr.
Disable Trigger tr_CatInsHaberi ON Categories


Create Trigger tr_CatInsHaberi
ON Categories			
After Insert			
AS
Select C.CategoryName, C.Description
From Categories C
Order By C.CategoryID Desc
GO
Insert Into Categories
(CategoryName)
Values
('Beyaz Eþya')



Select * Into ShippersKopyasi From Shippers



Use Northwind
CREATE TABLE ShippersYedek
(
	ShipperID int,
	CompanyName NvarChar(40),
	Phone NvarChar(24),
	DeleteTime DateTime
)




Create Trigger tr_ShippersBackup
ON ShippersKopyasi
After Delete
AS
Insert Into ShippersYedek
(ShipperID, CompanyName, Phone)
(Select ShipperID, CompanyName, Phone From Deleted)
Update ShippersYedek 
Set DeleteTime=GetDate()
Where DeleteTime is null
Select ShipperID, CompanyName, Phone From ShippersKopyasi
Select ShipperID, CompanyName, Phone, DeleteTime From ShippersYedek
GO
Delete From ShippersKopyasi Where Phone = '(503) 555-9931'



Create Trigger tr_EmpNoDelete_1_9
ON Employees
After Delete
AS
Declare @EmpID int
Select @EmpID =EmployeeID From Deleted 
if (@EmpID<= 9)
Begin 
 RollBack Tran
End
GO




Insert Into Employees
(FirstName, LastName)
Values
('Ömer Faruk', 'SUNAR'),
('Mahmut', 'GÜNDÜR'),
('Mustafa', 'Þahin'),
('Barýþ', 'Elitoð'), 
('Can', 'ÜSTÜNEL'),
('Muharrem', 'ARAS')



GO
Select FirstName, LastName
From Employees

GO
Delete From Employees Where EmployeeID>=10 
Exec pr_IdentityBulResetle 'Employees'
Select * From Employees




Begin Transaction
Update Employees 
Set FirstName = 'suzunkopru'
Select * From Employees


/*Bu ifade, açýk veya örtülü bir iþlemi, iþlemin baþlangýcýna veya iþlem içindeki bir kayýt
noktasýna geri döndürür. ROLLBACK TRANSACTIONÝþlemin baþlangýcýndan itibaren veya bir kayýt
noktasýna yapýlan tüm veri deðiþikliklerini silmek için tuþunu kullanabilirsiniz .
Ayrýca iþlem tarafýndan tutulan kaynaklarý da serbest býrakýr.
Bir iþlemin geri alýnmasý, yerel deðiþkenlerde veya tablo deðiþkenlerinde yapýlan
deðiþiklikleri içermez.
Bu deðiþiklikler bu bildirimle silinmez.*/
RollBack Tran
Select * From Employees




Commit Tran
Select * From Employees



Select * Into YdkEmp From Employees  
GO
Begin Tran 
Truncate Table YdkEmp
GO
Drop Table YdkEmp
GO
Select * From YdkEmp



RollBack Tran
GO
Select * From YdkEmp




Create Database TransactionSample
GO
Use TransactionSample
GO
CREATE TABLE BankaMusterisi
(
	MusteriID int not null PRIMARY KEY IDENTITY,
	Adi NvarChar(10) not null,
	Soyadi NvarChar(30) not null,
	TCKimlik char(11) null UNIQUE
	
	Constraint chk_Kimlik Check (Tckimlik Like 
'[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][02468]')
)
GO

CREATE TABLE Hesap
(
	HesapID int not null PRIMARY KEY IDENTITY,
	HesapNo NvarChar(10) not null,
	MusteriID int not null FOREIGN KEY 
	REFERENCES BankaMusterisi(MusteriID),
	Bakiye Money null
)
GO

INSERT INTO BankaMusterisi
VALUES
('Ömer', 'Para Yatýran', '53206408556'),
('Mustafa', 'Havaleyi Alacak Olan', '43208580860')
GO

INSERT INTO Hesap
VALUES
('6970', 1, 1000),
('8990', 2, 10)

Select B.MusteriID, Adi, Soyadi, TCKimlik, 
HesapID, HesapNo, Bakiye From Hesap H 
Join BankaMusterisi B
ON B.MusteriID = H.MusteriID





Create Function fn_Varmi
(@HesapNo NvarChar(10))

Returns bit
Begin
	Declare @Durum bit = 0
  
	if Exists(SELECT HesapNo FROM Hesap 
	WHERE HesapNo = @HesapNo)
	Begin 
	 Set @Durum = 1 
	End
	Return @Durum
End





Create Function fn_BakiyeyeBak
(@HesapNo int, @Tutar Money)
Returns bit
Begin
 Declare @Durum bit = 0
 if (SELECT Bakiye FROM Hesap WHERE HesapNo = @HesapNo) >= @Tutar
 Begin Set @Durum=1 End
 Return @Durum
End











Create PROC pr_HesaplararasiHavale
@AliciHesapNo NvarChar(10),
@GonderenHesapNo NvarChar(10),
@Tutar Money
AS
if dbo.fn_varmi(@AliciHesapNo) = 1 AND 
dbo.fn_varmi(@GonderenHesapNo) = 1
Begin
 if dbo.fn_BakiyeyeBak(@GonderenHesapNo, @Tutar)=1
 Begin
		Begin Try
			Begin Transaction 
				Update Hesap Set Bakiye += @Tutar
				WHERE HesapNo = @AliciHesapNo 
				--Select 10/0
				Update Hesap Set Bakiye -= @Tutar
				WHERE HesapNo = @GonderenHesapNo
			Commit Transaction 
		End Try
		Begin Catch
			PRINT ('Para gönderilemedi') 
		Rollback Transaction
		End Catch
 End
	Else
		PRINT ('Paranýz, göndermek istediðiniz tutara yetmiyor.')
End
		ELSE
			PRINT ('Belirttiðiniz hesap no yanlýþ')

Select B.MusteriID, Adi, Soyadi, TCKimlik, 
HesapID, HesapNo, Bakiye From Hesap H 
Join BankaMusterisi B
ON B.MusteriID = H.MusteriID






EXEC pr_HesaplararasiHavale '8990', '6970', 100




Create or Alter PROC pr_HesaplararasiHavale
@AliciHesapNo NvarChar(10),
@GonderenHesapNo NvarChar(10),
@Tutar Money
AS
if dbo.fn_varmi(@AliciHesapNo) = 1 AND 
dbo.fn_varmi(@GonderenHesapNo) = 1
Begin
 if dbo.fn_BakiyeyeBak(@GonderenHesapNo, @Tutar)=1
 Begin
  Begin Try
   Begin Transaction 
   Exec pr_BakiyeGuncelle @Tutar, 1, 8990,6970
   --Select 10/0
   Exec pr_BakiyeGuncelle @Tutar, 0, 8990,6970
   Commit Transaction 
  End Try
  Begin Catch
   PRINT ('Para gönderilemedi') 
   Rollback Transaction
  End Catch
 End
 Else
 PRINT ('Paranýz, göndermek istediðiniz tutara yetmiyor.')
End
Else
PRINT ('Belirttiðiniz hesap no yanlýþ')
Select B.MusteriID, Adi, Soyadi, TCKimlik, 
HesapID, HesapNo, Bakiye From Hesap H 
Join BankaMusterisi B
ON B.MusteriID = H.MusteriID





Create Procedure pr_BakiyeGuncelle
@ParaTutari Money, 
@BakiyeEklenecekmi bit,
@AliciHesapNo int,
@GönderenHesapNo int
As
if @BakiyeEklenecekmi =1
Update Hesap Set Bakiye += @ParaTutari
WHERE HesapNo = @AliciHesapNo
Else
Update Hesap Set Bakiye -= @ParaTutari
WHERE HesapNo = @GönderenHesapNo
GO
EXEC pr_HesaplararasiHavale '8990', '6970', 100






Create Trigger tr_UpdateGoruntule
ON Hesap
After Update 
AS
if (Select Count(*) From deleted) > 0 
Begin
Select * From Deleted
End




DBCC OPENTRAN

Select @@TRANCOUNT

Exec sp_who 52



Begin Tran
Update Employees Set FirstName = 'Ömer Faruk'
Save Tran Kayit1
Update Employees Set LastName = 'SUNAR'
Save Tran Kayit2 
Select * From Employees

RollBack Tran kayit2
RollBack Tran kayit1
RollBack Tran
Select * From Employees





sp_who




SELECT session_id, connect_time, client_net_address
FROM sys.dm_exec_connections





SELECT session_id, login_name, original_login_name, login_time,
status, language, date_format FROM sys.dm_exec_sessions





Create Database YedekSample --(Sorgu:274)
GO
Use YedekSample
GO

CREATE TABLE Kisiler
(
	KisiID int not null PRIMARY KEY IDENTITY,
	Adi NvarChar(10) not null,
	Soyadi NvarChar(30) not null,
)

GO

INSERT INTO Kisiler
VALUES
('Ömer Faruk', 'SUNAR'),
('Mustafa', 'KARAKAÞ'),
('Mehmet', 'GÜNDÜR')
GO

Select Adi, Soyadi From Kisiler


INSERT INTO Kisiler
VALUES
('Ahmet', 'SUNAR'),
('Yusuf Taha', 'SUNAR')
Select Adi, Soyadi From Kisiler

Backup Database YedekSample
To Disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak'
With Name ='Full Backup', Description ='Ýlk yedeðim'





INSERT INTO Kisiler
VALUES
('Muammer', 'ÇETÝNKAYA'),
('Erdal', 'ÇATAL')
Select Adi, Soyadi From Kisiler


Backup Database YedekSample
To Disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak '
With Name = 'Fark Backup', Description='Fark Yedeðim',
Differential




Restore
HeaderOnly
From Disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak'




INSERT INTO Kisiler
VALUES
('Fatih', 'UZUNKÖPRÜ'),
('Yasin', 'UZUNKÖPRÜ')
Select Adi, Soyadi From Kisiler




Backup Database YedekSample
To Disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak'
With Name = 'Fark Backup1', Description='Fark Yedeðim1',
Differential 



Restore
HeaderOnly
From Disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak'




Delete Kisiler

Use master
Drop Database YedekSample





Use master
GO
Restore Database YedekSample 
From disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak' 
with file = 1,  
Recovery,  Nounload,  Replace,  Stats = 5

Use YedekSample
GO
Select Adi, Soyadi From Kisiler




Use master
GO
Restore Database YedekSample 
From disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak' 
with file = 1,  
NoRecovery,  Nounload,  Replace,  Stats = 5





Set Language Turkish
Use YedekSample
GO
Select Adi, Soyadi From Kisiler




Use master
GO
Restore Database YedekSample 
From disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak' 
WITH FILE = 3,  
Recovery, NoUnload,  STATS = 5
GO
Use YedekSample
Select Adi, Soyadi From Kisiler




Restore
HeaderOnly
From Disk = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak'





Use master
RESTORE DATABASE YedekSample 
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak' 
WITH FILE = 1,  Replace, NORECOVERY,  NOUNLOAD,  STATS = 5
GO
Use master
RESTORE DATABASE YedekSample
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\deneme.bak' 
WITH FILE = 2,  RECOVERY, NOUNLOAD,  STATS = 5




Create Database LogSample
GO
/*Log Backup kullanabilmek için recovery model 
Full veya Bulk-Logged olmalý.*/
Alter Database LogSample Set Recovery Full
GO
Use LogSample
GO
Create Table OrnekTablom
(
	InsertZamani DateTime, 
	Numarasý int
)
GO
