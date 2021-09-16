CREATE TABLE [Country_Population] (
	CountryID bigint NOT NULL,
	CountryName nvarchar NOT NULL,
	Population nvarchar NOT NULL,
  CONSTRAINT [PK_COUNTRY_POPULATION] PRIMARY KEY CLUSTERED
  (
  [CountryID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Confirmed_Cases_2021] (
	CountryCaseID bigint NOT NULL,
	CountryID bigint NOT NULL UNIQUE,
	ConfirmedCases bigint,
  CONSTRAINT [PK_CONFIRMED_CASES_2021] PRIMARY KEY CLUSTERED
  (
  [CountryCaseID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Fatality_Rate_2021] (
	FatalityID_2021 bigint NOT NULL,
	CountryID bigint NOT NULL UNIQUE,
	CountryCaseID bigint NOT NULL UNIQUE,
	Deaths_2021 bigint NOT NULL,
	FatalityRate_2021 decimal NOT NULL,
	DeathsPer100,000Population_2021 bigint NOT NULL,
  CONSTRAINT [PK_FATALITY_RATE_2021] PRIMARY KEY CLUSTERED
  (
  [FatalityID_2021] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Fully_Vaccinated_Population] (
	FV_ID bigint NOT NULL,
	CountryID bigint NOT NULL,
	Vaccinated bigint NOT NULL,
  CONSTRAINT [PK_FULLY_VACCINATED_POPULATION] PRIMARY KEY CLUSTERED
  (
  [FV_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Fatality_Rate_2020] (
	FatalityID_2020 bigint NOT NULL,
	CountryID bigint NOT NULL UNIQUE,
	CountryCaseID bigint NOT NULL UNIQUE,
	Deaths_2020 bigint NOT NULL,
	FatalityRate_2020 decimal NOT NULL,
	DeathsPer100,000Population_2020 bigint NOT NULL,
  CONSTRAINT [PK_FATALITY_RATE_2020] PRIMARY KEY CLUSTERED
  (
  [FatalityID_2020] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Country_Population] WITH CHECK ADD CONSTRAINT [Country_Population_fk0] FOREIGN KEY ([CountryID]) REFERENCES [Confirmed_Cases_2021]([])
ON UPDATE CASCADE
GO
ALTER TABLE [Country_Population] CHECK CONSTRAINT [Country_Population_fk0]
GO

ALTER TABLE [Confirmed_Cases_2021] WITH CHECK ADD CONSTRAINT [Confirmed_Cases_2021_fk0] FOREIGN KEY ([CountryID]) REFERENCES [Country_Population]([CountryID])
ON UPDATE CASCADE
GO
ALTER TABLE [Confirmed_Cases_2021] CHECK CONSTRAINT [Confirmed_Cases_2021_fk0]
GO

ALTER TABLE [Fatality_Rate_2021] WITH CHECK ADD CONSTRAINT [Fatality_Rate_2021_fk0] FOREIGN KEY ([CountryID]) REFERENCES [Country_Population]([CountryID])
ON UPDATE CASCADE
GO
ALTER TABLE [Fatality_Rate_2021] CHECK CONSTRAINT [Fatality_Rate_2021_fk0]
GO
ALTER TABLE [Fatality_Rate_2021] WITH CHECK ADD CONSTRAINT [Fatality_Rate_2021_fk1] FOREIGN KEY ([CountryCaseID]) REFERENCES [Confirmed_Cases_2021]([CountryCaseID])
ON UPDATE CASCADE
GO
ALTER TABLE [Fatality_Rate_2021] CHECK CONSTRAINT [Fatality_Rate_2021_fk1]
GO

ALTER TABLE [Fully_Vaccinated_Population] WITH CHECK ADD CONSTRAINT [Fully_Vaccinated_Population_fk0] FOREIGN KEY ([CountryID]) REFERENCES [Country_Population]([CountryID])
ON UPDATE CASCADE
GO
ALTER TABLE [Fully_Vaccinated_Population] CHECK CONSTRAINT [Fully_Vaccinated_Population_fk0]
GO

ALTER TABLE [Fatality_Rate_2020] WITH CHECK ADD CONSTRAINT [Fatality_Rate_2020_fk0] FOREIGN KEY ([CountryID]) REFERENCES [Country_Population]([CountryID])
ON UPDATE CASCADE
GO
ALTER TABLE [Fatality_Rate_2020] CHECK CONSTRAINT [Fatality_Rate_2020_fk0]
GO
ALTER TABLE [Fatality_Rate_2020] WITH CHECK ADD CONSTRAINT [Fatality_Rate_2020_fk1] FOREIGN KEY ([CountryCaseID]) REFERENCES [Confirmed_Cases_2021]([CountryCaseID])
ON UPDATE CASCADE
GO
ALTER TABLE [Fatality_Rate_2020] CHECK CONSTRAINT [Fatality_Rate_2020_fk1]
GO

