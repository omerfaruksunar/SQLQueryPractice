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

SELECT LEFT('Süleyman UZUNKÖPRÜ', 8), --'Süleyman' Döner
RIGHT('Süleyman UZUNKÖPRÜ', 10) 

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
