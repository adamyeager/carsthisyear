
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/02/2015 23:44:36
-- Generated from EDMX file: D:\_workarea\carsthisyear\app\CarsThisYear.Data\CarsThisYearContext.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [carsthisyear];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_MakeModel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Models] DROP CONSTRAINT [FK_MakeModel];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelModelStyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelSeries] DROP CONSTRAINT [FK_ModelModelStyle];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelColorGeneralColor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GeneralColors] DROP CONSTRAINT [FK_ModelColorGeneralColor];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelStyleModelColor_ModelStyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelStyleModelColor] DROP CONSTRAINT [FK_ModelStyleModelColor_ModelStyle];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelStyleModelColor_ModelColor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelStyleModelColor] DROP CONSTRAINT [FK_ModelStyleModelColor_ModelColor];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelSeriesModelStyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelStyles] DROP CONSTRAINT [FK_ModelSeriesModelStyle];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelStyleEngine_ModelStyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelStyleEngine] DROP CONSTRAINT [FK_ModelStyleEngine_ModelStyle];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelStyleEngine_Engine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelStyleEngine] DROP CONSTRAINT [FK_ModelStyleEngine_Engine];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelStyleDrivetrain_ModelStyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelStyleDrivetrain] DROP CONSTRAINT [FK_ModelStyleDrivetrain_ModelStyle];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelStyleDrivetrain_Drivetrain]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelStyleDrivetrain] DROP CONSTRAINT [FK_ModelStyleDrivetrain_Drivetrain];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelStyleTransmission]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transmissions] DROP CONSTRAINT [FK_ModelStyleTransmission];
GO
IF OBJECT_ID(N'[dbo].[FK_MakeEngine_Make]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MakeEngine] DROP CONSTRAINT [FK_MakeEngine_Make];
GO
IF OBJECT_ID(N'[dbo].[FK_MakeEngine_Engine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MakeEngine] DROP CONSTRAINT [FK_MakeEngine_Engine];
GO
IF OBJECT_ID(N'[dbo].[FK_MakeDrivetrain_Make]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MakeDrivetrain] DROP CONSTRAINT [FK_MakeDrivetrain_Make];
GO
IF OBJECT_ID(N'[dbo].[FK_MakeDrivetrain_Drivetrain]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MakeDrivetrain] DROP CONSTRAINT [FK_MakeDrivetrain_Drivetrain];
GO
IF OBJECT_ID(N'[dbo].[FK_MakeTransmission_Make]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MakeTransmission] DROP CONSTRAINT [FK_MakeTransmission_Make];
GO
IF OBJECT_ID(N'[dbo].[FK_MakeTransmission_Transmission]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MakeTransmission] DROP CONSTRAINT [FK_MakeTransmission_Transmission];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Makes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Makes];
GO
IF OBJECT_ID(N'[dbo].[Models]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Models];
GO
IF OBJECT_ID(N'[dbo].[ModelSeries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ModelSeries];
GO
IF OBJECT_ID(N'[dbo].[ModelStyles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ModelStyles];
GO
IF OBJECT_ID(N'[dbo].[Engines]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Engines];
GO
IF OBJECT_ID(N'[dbo].[Drivetrains]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Drivetrains];
GO
IF OBJECT_ID(N'[dbo].[Transmissions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transmissions];
GO
IF OBJECT_ID(N'[dbo].[ModelColors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ModelColors];
GO
IF OBJECT_ID(N'[dbo].[GeneralColors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GeneralColors];
GO
IF OBJECT_ID(N'[dbo].[ModelStyleModelColor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ModelStyleModelColor];
GO
IF OBJECT_ID(N'[dbo].[ModelStyleEngine]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ModelStyleEngine];
GO
IF OBJECT_ID(N'[dbo].[ModelStyleDrivetrain]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ModelStyleDrivetrain];
GO
IF OBJECT_ID(N'[dbo].[MakeEngine]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MakeEngine];
GO
IF OBJECT_ID(N'[dbo].[MakeDrivetrain]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MakeDrivetrain];
GO
IF OBJECT_ID(N'[dbo].[MakeTransmission]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MakeTransmission];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Makes'
CREATE TABLE [dbo].[Makes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Models'
CREATE TABLE [dbo].[Models] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Year] nvarchar(max)  NOT NULL,
    [MakeId] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ModelSeries'
CREATE TABLE [dbo].[ModelSeries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ModelId] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [EngineId] int  NOT NULL
);
GO

-- Creating table 'ModelStyles'
CREATE TABLE [dbo].[ModelStyles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ModelSeriesId] int  NOT NULL
);
GO

-- Creating table 'Engines'
CREATE TABLE [dbo].[Engines] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Drivetrains'
CREATE TABLE [dbo].[Drivetrains] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Transmissions'
CREATE TABLE [dbo].[Transmissions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [ModelStyleId] int  NOT NULL
);
GO

-- Creating table 'ModelColors'
CREATE TABLE [dbo].[ModelColors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'GeneralColors'
CREATE TABLE [dbo].[GeneralColors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ModelStyleModelColor'
CREATE TABLE [dbo].[ModelStyleModelColor] (
    [ModelStyles_Id] int  NOT NULL,
    [ModelColors_Id] int  NOT NULL
);
GO

-- Creating table 'ModelStyleEngine'
CREATE TABLE [dbo].[ModelStyleEngine] (
    [ModelStyles_Id] int  NOT NULL,
    [Engines_Id] int  NOT NULL
);
GO

-- Creating table 'ModelStyleDrivetrain'
CREATE TABLE [dbo].[ModelStyleDrivetrain] (
    [ModelStyles_Id] int  NOT NULL,
    [Drivetrains_Id] int  NOT NULL
);
GO

-- Creating table 'MakeEngine'
CREATE TABLE [dbo].[MakeEngine] (
    [Makes_Id] int  NOT NULL,
    [Engines_Id] int  NOT NULL
);
GO

-- Creating table 'MakeDrivetrain'
CREATE TABLE [dbo].[MakeDrivetrain] (
    [Makes_Id] int  NOT NULL,
    [Drivetrains_Id] int  NOT NULL
);
GO

-- Creating table 'MakeTransmission'
CREATE TABLE [dbo].[MakeTransmission] (
    [Makes_Id] int  NOT NULL,
    [Transmissions_Id] int  NOT NULL
);
GO

-- Creating table 'ModelColorGeneralColor'
CREATE TABLE [dbo].[ModelColorGeneralColor] (
    [ModelColors_Id] int  NOT NULL,
    [GeneralColors_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Makes'
ALTER TABLE [dbo].[Makes]
ADD CONSTRAINT [PK_Makes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Models'
ALTER TABLE [dbo].[Models]
ADD CONSTRAINT [PK_Models]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ModelSeries'
ALTER TABLE [dbo].[ModelSeries]
ADD CONSTRAINT [PK_ModelSeries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ModelStyles'
ALTER TABLE [dbo].[ModelStyles]
ADD CONSTRAINT [PK_ModelStyles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Engines'
ALTER TABLE [dbo].[Engines]
ADD CONSTRAINT [PK_Engines]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Drivetrains'
ALTER TABLE [dbo].[Drivetrains]
ADD CONSTRAINT [PK_Drivetrains]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Transmissions'
ALTER TABLE [dbo].[Transmissions]
ADD CONSTRAINT [PK_Transmissions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ModelColors'
ALTER TABLE [dbo].[ModelColors]
ADD CONSTRAINT [PK_ModelColors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GeneralColors'
ALTER TABLE [dbo].[GeneralColors]
ADD CONSTRAINT [PK_GeneralColors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ModelStyles_Id], [ModelColors_Id] in table 'ModelStyleModelColor'
ALTER TABLE [dbo].[ModelStyleModelColor]
ADD CONSTRAINT [PK_ModelStyleModelColor]
    PRIMARY KEY CLUSTERED ([ModelStyles_Id], [ModelColors_Id] ASC);
GO

-- Creating primary key on [ModelStyles_Id], [Engines_Id] in table 'ModelStyleEngine'
ALTER TABLE [dbo].[ModelStyleEngine]
ADD CONSTRAINT [PK_ModelStyleEngine]
    PRIMARY KEY CLUSTERED ([ModelStyles_Id], [Engines_Id] ASC);
GO

-- Creating primary key on [ModelStyles_Id], [Drivetrains_Id] in table 'ModelStyleDrivetrain'
ALTER TABLE [dbo].[ModelStyleDrivetrain]
ADD CONSTRAINT [PK_ModelStyleDrivetrain]
    PRIMARY KEY CLUSTERED ([ModelStyles_Id], [Drivetrains_Id] ASC);
GO

-- Creating primary key on [Makes_Id], [Engines_Id] in table 'MakeEngine'
ALTER TABLE [dbo].[MakeEngine]
ADD CONSTRAINT [PK_MakeEngine]
    PRIMARY KEY CLUSTERED ([Makes_Id], [Engines_Id] ASC);
GO

-- Creating primary key on [Makes_Id], [Drivetrains_Id] in table 'MakeDrivetrain'
ALTER TABLE [dbo].[MakeDrivetrain]
ADD CONSTRAINT [PK_MakeDrivetrain]
    PRIMARY KEY CLUSTERED ([Makes_Id], [Drivetrains_Id] ASC);
GO

-- Creating primary key on [Makes_Id], [Transmissions_Id] in table 'MakeTransmission'
ALTER TABLE [dbo].[MakeTransmission]
ADD CONSTRAINT [PK_MakeTransmission]
    PRIMARY KEY CLUSTERED ([Makes_Id], [Transmissions_Id] ASC);
GO

-- Creating primary key on [ModelColors_Id], [GeneralColors_Id] in table 'ModelColorGeneralColor'
ALTER TABLE [dbo].[ModelColorGeneralColor]
ADD CONSTRAINT [PK_ModelColorGeneralColor]
    PRIMARY KEY CLUSTERED ([ModelColors_Id], [GeneralColors_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MakeId] in table 'Models'
ALTER TABLE [dbo].[Models]
ADD CONSTRAINT [FK_MakeModel]
    FOREIGN KEY ([MakeId])
    REFERENCES [dbo].[Makes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MakeModel'
CREATE INDEX [IX_FK_MakeModel]
ON [dbo].[Models]
    ([MakeId]);
GO

-- Creating foreign key on [ModelId] in table 'ModelSeries'
ALTER TABLE [dbo].[ModelSeries]
ADD CONSTRAINT [FK_ModelModelStyle]
    FOREIGN KEY ([ModelId])
    REFERENCES [dbo].[Models]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelModelStyle'
CREATE INDEX [IX_FK_ModelModelStyle]
ON [dbo].[ModelSeries]
    ([ModelId]);
GO

-- Creating foreign key on [ModelStyles_Id] in table 'ModelStyleModelColor'
ALTER TABLE [dbo].[ModelStyleModelColor]
ADD CONSTRAINT [FK_ModelStyleModelColor_ModelStyle]
    FOREIGN KEY ([ModelStyles_Id])
    REFERENCES [dbo].[ModelStyles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ModelColors_Id] in table 'ModelStyleModelColor'
ALTER TABLE [dbo].[ModelStyleModelColor]
ADD CONSTRAINT [FK_ModelStyleModelColor_ModelColor]
    FOREIGN KEY ([ModelColors_Id])
    REFERENCES [dbo].[ModelColors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelStyleModelColor_ModelColor'
CREATE INDEX [IX_FK_ModelStyleModelColor_ModelColor]
ON [dbo].[ModelStyleModelColor]
    ([ModelColors_Id]);
GO

-- Creating foreign key on [ModelSeriesId] in table 'ModelStyles'
ALTER TABLE [dbo].[ModelStyles]
ADD CONSTRAINT [FK_ModelSeriesModelStyle]
    FOREIGN KEY ([ModelSeriesId])
    REFERENCES [dbo].[ModelSeries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelSeriesModelStyle'
CREATE INDEX [IX_FK_ModelSeriesModelStyle]
ON [dbo].[ModelStyles]
    ([ModelSeriesId]);
GO

-- Creating foreign key on [ModelStyles_Id] in table 'ModelStyleEngine'
ALTER TABLE [dbo].[ModelStyleEngine]
ADD CONSTRAINT [FK_ModelStyleEngine_ModelStyle]
    FOREIGN KEY ([ModelStyles_Id])
    REFERENCES [dbo].[ModelStyles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Engines_Id] in table 'ModelStyleEngine'
ALTER TABLE [dbo].[ModelStyleEngine]
ADD CONSTRAINT [FK_ModelStyleEngine_Engine]
    FOREIGN KEY ([Engines_Id])
    REFERENCES [dbo].[Engines]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelStyleEngine_Engine'
CREATE INDEX [IX_FK_ModelStyleEngine_Engine]
ON [dbo].[ModelStyleEngine]
    ([Engines_Id]);
GO

-- Creating foreign key on [ModelStyles_Id] in table 'ModelStyleDrivetrain'
ALTER TABLE [dbo].[ModelStyleDrivetrain]
ADD CONSTRAINT [FK_ModelStyleDrivetrain_ModelStyle]
    FOREIGN KEY ([ModelStyles_Id])
    REFERENCES [dbo].[ModelStyles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Drivetrains_Id] in table 'ModelStyleDrivetrain'
ALTER TABLE [dbo].[ModelStyleDrivetrain]
ADD CONSTRAINT [FK_ModelStyleDrivetrain_Drivetrain]
    FOREIGN KEY ([Drivetrains_Id])
    REFERENCES [dbo].[Drivetrains]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelStyleDrivetrain_Drivetrain'
CREATE INDEX [IX_FK_ModelStyleDrivetrain_Drivetrain]
ON [dbo].[ModelStyleDrivetrain]
    ([Drivetrains_Id]);
GO

-- Creating foreign key on [ModelStyleId] in table 'Transmissions'
ALTER TABLE [dbo].[Transmissions]
ADD CONSTRAINT [FK_ModelStyleTransmission]
    FOREIGN KEY ([ModelStyleId])
    REFERENCES [dbo].[ModelStyles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelStyleTransmission'
CREATE INDEX [IX_FK_ModelStyleTransmission]
ON [dbo].[Transmissions]
    ([ModelStyleId]);
GO

-- Creating foreign key on [Makes_Id] in table 'MakeEngine'
ALTER TABLE [dbo].[MakeEngine]
ADD CONSTRAINT [FK_MakeEngine_Make]
    FOREIGN KEY ([Makes_Id])
    REFERENCES [dbo].[Makes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Engines_Id] in table 'MakeEngine'
ALTER TABLE [dbo].[MakeEngine]
ADD CONSTRAINT [FK_MakeEngine_Engine]
    FOREIGN KEY ([Engines_Id])
    REFERENCES [dbo].[Engines]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MakeEngine_Engine'
CREATE INDEX [IX_FK_MakeEngine_Engine]
ON [dbo].[MakeEngine]
    ([Engines_Id]);
GO

-- Creating foreign key on [Makes_Id] in table 'MakeDrivetrain'
ALTER TABLE [dbo].[MakeDrivetrain]
ADD CONSTRAINT [FK_MakeDrivetrain_Make]
    FOREIGN KEY ([Makes_Id])
    REFERENCES [dbo].[Makes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Drivetrains_Id] in table 'MakeDrivetrain'
ALTER TABLE [dbo].[MakeDrivetrain]
ADD CONSTRAINT [FK_MakeDrivetrain_Drivetrain]
    FOREIGN KEY ([Drivetrains_Id])
    REFERENCES [dbo].[Drivetrains]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MakeDrivetrain_Drivetrain'
CREATE INDEX [IX_FK_MakeDrivetrain_Drivetrain]
ON [dbo].[MakeDrivetrain]
    ([Drivetrains_Id]);
GO

-- Creating foreign key on [Makes_Id] in table 'MakeTransmission'
ALTER TABLE [dbo].[MakeTransmission]
ADD CONSTRAINT [FK_MakeTransmission_Make]
    FOREIGN KEY ([Makes_Id])
    REFERENCES [dbo].[Makes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Transmissions_Id] in table 'MakeTransmission'
ALTER TABLE [dbo].[MakeTransmission]
ADD CONSTRAINT [FK_MakeTransmission_Transmission]
    FOREIGN KEY ([Transmissions_Id])
    REFERENCES [dbo].[Transmissions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MakeTransmission_Transmission'
CREATE INDEX [IX_FK_MakeTransmission_Transmission]
ON [dbo].[MakeTransmission]
    ([Transmissions_Id]);
GO

-- Creating foreign key on [ModelColors_Id] in table 'ModelColorGeneralColor'
ALTER TABLE [dbo].[ModelColorGeneralColor]
ADD CONSTRAINT [FK_ModelColorGeneralColor_ModelColor]
    FOREIGN KEY ([ModelColors_Id])
    REFERENCES [dbo].[ModelColors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [GeneralColors_Id] in table 'ModelColorGeneralColor'
ALTER TABLE [dbo].[ModelColorGeneralColor]
ADD CONSTRAINT [FK_ModelColorGeneralColor_GeneralColor]
    FOREIGN KEY ([GeneralColors_Id])
    REFERENCES [dbo].[GeneralColors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelColorGeneralColor_GeneralColor'
CREATE INDEX [IX_FK_ModelColorGeneralColor_GeneralColor]
ON [dbo].[ModelColorGeneralColor]
    ([GeneralColors_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------