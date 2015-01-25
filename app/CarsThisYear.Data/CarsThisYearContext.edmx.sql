
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/25/2015 14:04:50
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
    ALTER TABLE [dbo].[ModelStyles] DROP CONSTRAINT [FK_ModelModelStyle];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelStyleModelType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelTypes] DROP CONSTRAINT [FK_ModelStyleModelType];
GO
IF OBJECT_ID(N'[dbo].[FK_EngineModelStyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelStyles] DROP CONSTRAINT [FK_EngineModelStyle];
GO
IF OBJECT_ID(N'[dbo].[FK_DrivetrainModelStyle_Drivetrain]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DrivetrainModelStyle] DROP CONSTRAINT [FK_DrivetrainModelStyle_Drivetrain];
GO
IF OBJECT_ID(N'[dbo].[FK_DrivetrainModelStyle_ModelStyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DrivetrainModelStyle] DROP CONSTRAINT [FK_DrivetrainModelStyle_ModelStyle];
GO
IF OBJECT_ID(N'[dbo].[FK_TransmissionModelStyle_Transmission]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TransmissionModelStyle] DROP CONSTRAINT [FK_TransmissionModelStyle_Transmission];
GO
IF OBJECT_ID(N'[dbo].[FK_TransmissionModelStyle_ModelStyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TransmissionModelStyle] DROP CONSTRAINT [FK_TransmissionModelStyle_ModelStyle];
GO
IF OBJECT_ID(N'[dbo].[FK_ModelStyleModelColor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ModelColors] DROP CONSTRAINT [FK_ModelStyleModelColor];
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
IF OBJECT_ID(N'[dbo].[ModelStyles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ModelStyles];
GO
IF OBJECT_ID(N'[dbo].[ModelTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ModelTypes];
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
IF OBJECT_ID(N'[dbo].[DrivetrainModelStyle]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DrivetrainModelStyle];
GO
IF OBJECT_ID(N'[dbo].[TransmissionModelStyle]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TransmissionModelStyle];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Makes'
CREATE TABLE [dbo].[Makes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [EngineId] int  NOT NULL
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

-- Creating table 'ModelStyles'
CREATE TABLE [dbo].[ModelStyles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ModelId] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [EngineId] int  NOT NULL
);
GO

-- Creating table 'ModelTypes'
CREATE TABLE [dbo].[ModelTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ModelStyle_Id] int  NOT NULL
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
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Transmissions'
CREATE TABLE [dbo].[Transmissions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ModelColors'
CREATE TABLE [dbo].[ModelColors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ModelStyleId] int  NOT NULL
);
GO

-- Creating table 'GeneralColors'
CREATE TABLE [dbo].[GeneralColors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [ModelColor_Id] int  NULL
);
GO

-- Creating table 'DrivetrainModelStyle'
CREATE TABLE [dbo].[DrivetrainModelStyle] (
    [Drivetrains_Id] int  NOT NULL,
    [ModelStyles_Id] int  NOT NULL
);
GO

-- Creating table 'TransmissionModelStyle'
CREATE TABLE [dbo].[TransmissionModelStyle] (
    [Transmissions_Id] int  NOT NULL,
    [ModelStyles_Id] int  NOT NULL
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

-- Creating primary key on [Id] in table 'ModelStyles'
ALTER TABLE [dbo].[ModelStyles]
ADD CONSTRAINT [PK_ModelStyles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ModelTypes'
ALTER TABLE [dbo].[ModelTypes]
ADD CONSTRAINT [PK_ModelTypes]
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

-- Creating primary key on [Drivetrains_Id], [ModelStyles_Id] in table 'DrivetrainModelStyle'
ALTER TABLE [dbo].[DrivetrainModelStyle]
ADD CONSTRAINT [PK_DrivetrainModelStyle]
    PRIMARY KEY CLUSTERED ([Drivetrains_Id], [ModelStyles_Id] ASC);
GO

-- Creating primary key on [Transmissions_Id], [ModelStyles_Id] in table 'TransmissionModelStyle'
ALTER TABLE [dbo].[TransmissionModelStyle]
ADD CONSTRAINT [PK_TransmissionModelStyle]
    PRIMARY KEY CLUSTERED ([Transmissions_Id], [ModelStyles_Id] ASC);
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

-- Creating foreign key on [ModelId] in table 'ModelStyles'
ALTER TABLE [dbo].[ModelStyles]
ADD CONSTRAINT [FK_ModelModelStyle]
    FOREIGN KEY ([ModelId])
    REFERENCES [dbo].[Models]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelModelStyle'
CREATE INDEX [IX_FK_ModelModelStyle]
ON [dbo].[ModelStyles]
    ([ModelId]);
GO

-- Creating foreign key on [ModelStyle_Id] in table 'ModelTypes'
ALTER TABLE [dbo].[ModelTypes]
ADD CONSTRAINT [FK_ModelStyleModelType]
    FOREIGN KEY ([ModelStyle_Id])
    REFERENCES [dbo].[ModelStyles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelStyleModelType'
CREATE INDEX [IX_FK_ModelStyleModelType]
ON [dbo].[ModelTypes]
    ([ModelStyle_Id]);
GO

-- Creating foreign key on [EngineId] in table 'ModelStyles'
ALTER TABLE [dbo].[ModelStyles]
ADD CONSTRAINT [FK_EngineModelStyle]
    FOREIGN KEY ([EngineId])
    REFERENCES [dbo].[Engines]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EngineModelStyle'
CREATE INDEX [IX_FK_EngineModelStyle]
ON [dbo].[ModelStyles]
    ([EngineId]);
GO

-- Creating foreign key on [Drivetrains_Id] in table 'DrivetrainModelStyle'
ALTER TABLE [dbo].[DrivetrainModelStyle]
ADD CONSTRAINT [FK_DrivetrainModelStyle_Drivetrain]
    FOREIGN KEY ([Drivetrains_Id])
    REFERENCES [dbo].[Drivetrains]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ModelStyles_Id] in table 'DrivetrainModelStyle'
ALTER TABLE [dbo].[DrivetrainModelStyle]
ADD CONSTRAINT [FK_DrivetrainModelStyle_ModelStyle]
    FOREIGN KEY ([ModelStyles_Id])
    REFERENCES [dbo].[ModelStyles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DrivetrainModelStyle_ModelStyle'
CREATE INDEX [IX_FK_DrivetrainModelStyle_ModelStyle]
ON [dbo].[DrivetrainModelStyle]
    ([ModelStyles_Id]);
GO

-- Creating foreign key on [Transmissions_Id] in table 'TransmissionModelStyle'
ALTER TABLE [dbo].[TransmissionModelStyle]
ADD CONSTRAINT [FK_TransmissionModelStyle_Transmission]
    FOREIGN KEY ([Transmissions_Id])
    REFERENCES [dbo].[Transmissions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ModelStyles_Id] in table 'TransmissionModelStyle'
ALTER TABLE [dbo].[TransmissionModelStyle]
ADD CONSTRAINT [FK_TransmissionModelStyle_ModelStyle]
    FOREIGN KEY ([ModelStyles_Id])
    REFERENCES [dbo].[ModelStyles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TransmissionModelStyle_ModelStyle'
CREATE INDEX [IX_FK_TransmissionModelStyle_ModelStyle]
ON [dbo].[TransmissionModelStyle]
    ([ModelStyles_Id]);
GO

-- Creating foreign key on [ModelStyleId] in table 'ModelColors'
ALTER TABLE [dbo].[ModelColors]
ADD CONSTRAINT [FK_ModelStyleModelColor]
    FOREIGN KEY ([ModelStyleId])
    REFERENCES [dbo].[ModelStyles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelStyleModelColor'
CREATE INDEX [IX_FK_ModelStyleModelColor]
ON [dbo].[ModelColors]
    ([ModelStyleId]);
GO

-- Creating foreign key on [ModelColor_Id] in table 'GeneralColors'
ALTER TABLE [dbo].[GeneralColors]
ADD CONSTRAINT [FK_ModelColorGeneralColor]
    FOREIGN KEY ([ModelColor_Id])
    REFERENCES [dbo].[ModelColors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ModelColorGeneralColor'
CREATE INDEX [IX_FK_ModelColorGeneralColor]
ON [dbo].[GeneralColors]
    ([ModelColor_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------