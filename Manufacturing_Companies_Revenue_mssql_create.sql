CREATE TABLE [Products_Line] (
	ProductCategoryID bigint NOT NULL,
  CONSTRAINT [PK_PRODUCTS_LINE] PRIMARY KEY CLUSTERED
  (
  [ProductCategoryID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Category] (
	CatID varchar(255) NOT NULL,
	ProductCategoryID bigint NOT NULL UNIQUE,
	CategoryName varchar(255) NOT NULL UNIQUE,
	Type varchar(255) NOT NULL,
	TypeID varchar(255) NOT NULL,
  CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED
  (
  [CatID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Product_Type] (
	TypeID bigint NOT NULL,
	Manufacturer varchar(255) NOT NULL,
	ManufacturerID bigint(255) NOT NULL UNIQUE,
	Brand bigint NOT NULL,
	Model varchar(255) NOT NULL,
	Manufacture_Date varchar(255) NOT NULL,
	Version varchar(255) NOT NULL,
	VersionID varchar(255) NOT NULL
)
GO
CREATE TABLE [Manufacturer] (
	ManufacturerID bigint NOT NULL,
	ManuAddressID varchar(255) NOT NULL UNIQUE,
	ManuContactID varchar(255) NOT NULL,
	BillingID varchar(255) NOT NULL UNIQUE,
	ElectronicMaterialID nvarchar NOT NULL,
  CONSTRAINT [PK_MANUFACTURER] PRIMARY KEY CLUSTERED
  (
  [ManufacturerID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Manufacturer_Address] (
	AddressID bigint NOT NULL,
	FirstLine varchar(255) NOT NULL,
	SecondLine varchar(255) NOT NULL,
	UnitHouseNo varchar(255) NOT NULL,
	City varchar(255) NOT NULL,
	State varchar(255) NOT NULL,
	County varchar(255) NOT NULL,
	Landmark varchar(255) NOT NULL,
	Country varchar(255) NOT NULL,
	ManufacturerID varchar(255) NOT NULL,
	ManufacturerOldID varchar(255) NOT NULL,
	M_StartDate date NOT NULL,
	M_EndDate date NOT NULL,
  CONSTRAINT [PK_MANUFACTURER_ADDRESS] PRIMARY KEY CLUSTERED
  (
  [AddressID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Manufacturer_Old_Address] (
	ManufacturerOldAddID varchar(255) NOT NULL,
	MO_StartDate date NOT NULL,
	MO_EndDate date NOT NULL,
	FirstLine varchar(255) NOT NULL,
	SecondLine varchar(255) NOT NULL,
	UnitHouseNo varchar(255) NOT NULL,
	City varchar(255) NOT NULL,
	State varchar(255) NOT NULL,
	County varchar(255) NOT NULL,
	Landmark varchar(255) NOT NULL,
	Country varchar(255) NOT NULL,
  CONSTRAINT [PK_MANUFACTURER_OLD_ADDRESS] PRIMARY KEY CLUSTERED
  (
  [ManufacturerOldAddID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Product] (
	PID bigint NOT NULL,
	CatID bigint NOT NULL,
	ManufacturerID bigint NOT NULL,
  CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED
  (
  [PID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Electronics] (
	ET_ID bigint NOT NULL,
	CatID bigint NOT NULL,
  CONSTRAINT [PK_ELECTRONICS] PRIMARY KEY CLUSTERED
  (
  [ET_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Laptop] (
	PLID bigint NOT NULL,
	PID bigint NOT NULL,
	LapF_ID nvarchar NOT NULL,
  CONSTRAINT [PK_LAPTOP] PRIMARY KEY CLUSTERED
  (
  [PLID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [LaptopFeatures] (
	LapF_ID nvarchar NOT NULL,
	Brand nvarchar NOT NULL,
	PName nvarchar(255) NOT NULL UNIQUE,
	MaterialID nvarchar NOT NULL,
	Display decimal NOT NULL,
	Performance nvarchar NOT NULL,
	Memory nvarchar NOT NULL,
	Graphics nvarchar NOT NULL,
	Software nvarchar NOT NULL,
	FingerPrintReader boolean NOT NULL DEFAULT 'Yes',
	EyeRecognition boolean NOT NULL DEFAULT 'Yes',
	SupportID nvarchar NOT NULL DEFAULT 'Yes',
  CONSTRAINT [PK_LAPTOPFEATURES] PRIMARY KEY CLUSTERED
  (
  [LapF_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

ALTER TABLE [Category] WITH CHECK ADD CONSTRAINT [Category_fk0] FOREIGN KEY ([ProductCategoryID]) REFERENCES [Products_Line]([ProductCategoryID])
ON UPDATE CASCADE
GO
ALTER TABLE [Category] CHECK CONSTRAINT [Category_fk0]
GO
ALTER TABLE [Category] WITH CHECK ADD CONSTRAINT [Category_fk1] FOREIGN KEY ([TypeID]) REFERENCES [Product_Type]([TypeID])
ON UPDATE CASCADE
GO
ALTER TABLE [Category] CHECK CONSTRAINT [Category_fk1]
GO

ALTER TABLE [Product_Type] WITH CHECK ADD CONSTRAINT [Product_Type_fk0] FOREIGN KEY ([ManufacturerID]) REFERENCES [Manufacturer]([ManufacturerID])
ON UPDATE CASCADE
GO
ALTER TABLE [Product_Type] CHECK CONSTRAINT [Product_Type_fk0]
GO

ALTER TABLE [Manufacturer] WITH CHECK ADD CONSTRAINT [Manufacturer_fk0] FOREIGN KEY ([ManuAddressID]) REFERENCES [Manufacturer_Address]([AddressID])
ON UPDATE CASCADE
GO
ALTER TABLE [Manufacturer] CHECK CONSTRAINT [Manufacturer_fk0]
GO
ALTER TABLE [Manufacturer] WITH CHECK ADD CONSTRAINT [Manufacturer_fk1] FOREIGN KEY ([ElectronicMaterialID]) REFERENCES [ElectronicMaterials]([MaterialID])
ON UPDATE CASCADE
GO
ALTER TABLE [Manufacturer] CHECK CONSTRAINT [Manufacturer_fk1]
GO

ALTER TABLE [Manufacturer_Address] WITH CHECK ADD CONSTRAINT [Manufacturer_Address_fk0] FOREIGN KEY ([ManufacturerID]) REFERENCES [Manufacturer]([ManufacturerID])
ON UPDATE CASCADE
GO
ALTER TABLE [Manufacturer_Address] CHECK CONSTRAINT [Manufacturer_Address_fk0]
GO
ALTER TABLE [Manufacturer_Address] WITH CHECK ADD CONSTRAINT [Manufacturer_Address_fk1] FOREIGN KEY ([ManufacturerOldID]) REFERENCES [Manufacturer_Old_Address]([ManufacturerOldAddID])
ON UPDATE CASCADE
GO
ALTER TABLE [Manufacturer_Address] CHECK CONSTRAINT [Manufacturer_Address_fk1]
GO


ALTER TABLE [Product] WITH CHECK ADD CONSTRAINT [Product_fk0] FOREIGN KEY ([CatID]) REFERENCES [Category]([CatID])
ON UPDATE CASCADE
GO
ALTER TABLE [Product] CHECK CONSTRAINT [Product_fk0]
GO
ALTER TABLE [Product] WITH CHECK ADD CONSTRAINT [Product_fk1] FOREIGN KEY ([ManufacturerID]) REFERENCES [Manufacturer]([ManufacturerID])
ON UPDATE CASCADE
GO
ALTER TABLE [Product] CHECK CONSTRAINT [Product_fk1]
GO

ALTER TABLE [Electronics] WITH CHECK ADD CONSTRAINT [Electronics_fk0] FOREIGN KEY ([CatID]) REFERENCES [Product]([CatID])
ON UPDATE CASCADE
GO
ALTER TABLE [Electronics] CHECK CONSTRAINT [Electronics_fk0]
GO

ALTER TABLE [Laptop] WITH CHECK ADD CONSTRAINT [Laptop_fk0] FOREIGN KEY ([PID]) REFERENCES [Product]([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [Laptop] CHECK CONSTRAINT [Laptop_fk0]
GO
ALTER TABLE [Laptop] WITH CHECK ADD CONSTRAINT [Laptop_fk1] FOREIGN KEY ([LapF_ID]) REFERENCES [LaptopFeatures]([LapF_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Laptop] CHECK CONSTRAINT [Laptop_fk1]
GO

ALTER TABLE [LaptopFeatures] WITH CHECK ADD CONSTRAINT [LaptopFeatures_fk0] FOREIGN KEY ([MaterialID]) REFERENCES [Manufacturer]([ManufacturerID])
ON UPDATE CASCADE
GO
ALTER TABLE [LaptopFeatures] CHECK CONSTRAINT [LaptopFeatures_fk0]
GO
ALTER TABLE [LaptopFeatures] WITH CHECK ADD CONSTRAINT [LaptopFeatures_fk1] FOREIGN KEY ([SupportID]) REFERENCES [BrandXSupport]([BrandXSupportID])
ON UPDATE CASCADE
GO
ALTER TABLE [LaptopFeatures] CHECK CONSTRAINT [LaptopFeatures_fk1]
GO

