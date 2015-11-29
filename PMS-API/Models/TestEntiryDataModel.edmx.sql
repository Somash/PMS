
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/15/2015 23:06:14
-- Generated from EDMX file: D:\Soms\Projects\PMS-git\PMS\PMS-API\Models\TestEntiryDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PMS];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'NewProjects'
CREATE TABLE [dbo].[NewProjects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ProjectName] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [Street] nvarchar(max)  NOT NULL,
    [CommencedOn] nvarchar(max)  NOT NULL,
    [ConcludedOn] nvarchar(max)  NOT NULL,
    [ArchitectId] int  NOT NULL,
    [BusinessPartnerId] int  NOT NULL,
    [PlanUrl] nvarchar(max)  NOT NULL,
    [SectionsUrl] nvarchar(max)  NOT NULL,
    [ElevationsUrl] nvarchar(max)  NOT NULL,
    [TDImageUrl] nvarchar(max)  NOT NULL,
    [AreaPanelCalculationUrl] nvarchar(max)  NOT NULL,
    [ConceptsDrawingUrl] nvarchar(max)  NOT NULL,
    [OptimizationUrl] nvarchar(max)  NOT NULL,
    [ShopDrawingUrl] nvarchar(max)  NOT NULL,
    [AnalysisUrl] nvarchar(max)  NOT NULL,
    [BOQUrl] nvarchar(max)  NOT NULL,
    [InteriorUrl] nvarchar(max)  NOT NULL,
    [OwnerId] int  NOT NULL,
    [ProjectTypeId] int  NOT NULL,
    [FixingTypeId] int  NOT NULL,
    [ApplicationsId] int  NOT NULL,
    [TDRenderImageUrl] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BusinessPartners'
CREATE TABLE [dbo].[BusinessPartners] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [OwnerName] nvarchar(max)  NOT NULL,
    [ContactNo] nvarchar(max)  NOT NULL,
    [Emailid] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Architects'
CREATE TABLE [dbo].[Architects] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [FirmName] nvarchar(max)  NOT NULL,
    [ContactNo] nvarchar(max)  NOT NULL,
    [EmailId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProjectHealths'
CREATE TABLE [dbo].[ProjectHealths] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProjectPictures'
CREATE TABLE [dbo].[ProjectPictures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Picture] nvarchar(max)  NOT NULL,
    [VisitReportId] int  NOT NULL
);
GO

-- Creating table 'Checklists'
CREATE TABLE [dbo].[Checklists] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [VisitReportId] int  NOT NULL
);
GO

-- Creating table 'AutocadDiagrams'
CREATE TABLE [dbo].[AutocadDiagrams] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [NewProjectId] int  NOT NULL
);
GO

-- Creating table 'ProjectStatus'
CREATE TABLE [dbo].[ProjectStatus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Owners'
CREATE TABLE [dbo].[Owners] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FullName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'VisitReports'
CREATE TABLE [dbo].[VisitReports] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [VisitedBy] nvarchar(max)  NOT NULL,
    [VisitedOn] nvarchar(max)  NOT NULL,
    [ActionPlanReportUrl] nvarchar(max)  NOT NULL,
    [NewProjectId] int  NOT NULL,
    [ProjectStatusId] int  NOT NULL,
    [ProjectHealthId] int  NOT NULL
);
GO

-- Creating table 'FixingTypes'
CREATE TABLE [dbo].[FixingTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProjectTypes'
CREATE TABLE [dbo].[ProjectTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Applications'
CREATE TABLE [dbo].[Applications] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'NewProjects'
ALTER TABLE [dbo].[NewProjects]
ADD CONSTRAINT [PK_NewProjects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BusinessPartners'
ALTER TABLE [dbo].[BusinessPartners]
ADD CONSTRAINT [PK_BusinessPartners]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Architects'
ALTER TABLE [dbo].[Architects]
ADD CONSTRAINT [PK_Architects]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectHealths'
ALTER TABLE [dbo].[ProjectHealths]
ADD CONSTRAINT [PK_ProjectHealths]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectPictures'
ALTER TABLE [dbo].[ProjectPictures]
ADD CONSTRAINT [PK_ProjectPictures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Checklists'
ALTER TABLE [dbo].[Checklists]
ADD CONSTRAINT [PK_Checklists]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AutocadDiagrams'
ALTER TABLE [dbo].[AutocadDiagrams]
ADD CONSTRAINT [PK_AutocadDiagrams]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectStatus'
ALTER TABLE [dbo].[ProjectStatus]
ADD CONSTRAINT [PK_ProjectStatus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Owners'
ALTER TABLE [dbo].[Owners]
ADD CONSTRAINT [PK_Owners]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'VisitReports'
ALTER TABLE [dbo].[VisitReports]
ADD CONSTRAINT [PK_VisitReports]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FixingTypes'
ALTER TABLE [dbo].[FixingTypes]
ADD CONSTRAINT [PK_FixingTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProjectTypes'
ALTER TABLE [dbo].[ProjectTypes]
ADD CONSTRAINT [PK_ProjectTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Applications'
ALTER TABLE [dbo].[Applications]
ADD CONSTRAINT [PK_Applications]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [NewProjectId] in table 'VisitReports'
ALTER TABLE [dbo].[VisitReports]
ADD CONSTRAINT [FK_NewProjectVisitReport]
    FOREIGN KEY ([NewProjectId])
    REFERENCES [dbo].[NewProjects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewProjectVisitReport'
CREATE INDEX [IX_FK_NewProjectVisitReport]
ON [dbo].[VisitReports]
    ([NewProjectId]);
GO

-- Creating foreign key on [ProjectStatusId] in table 'VisitReports'
ALTER TABLE [dbo].[VisitReports]
ADD CONSTRAINT [FK_ProjectStatusVisitReport]
    FOREIGN KEY ([ProjectStatusId])
    REFERENCES [dbo].[ProjectStatus]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectStatusVisitReport'
CREATE INDEX [IX_FK_ProjectStatusVisitReport]
ON [dbo].[VisitReports]
    ([ProjectStatusId]);
GO

-- Creating foreign key on [ProjectHealthId] in table 'VisitReports'
ALTER TABLE [dbo].[VisitReports]
ADD CONSTRAINT [FK_ProjectHealthVisitReport]
    FOREIGN KEY ([ProjectHealthId])
    REFERENCES [dbo].[ProjectHealths]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectHealthVisitReport'
CREATE INDEX [IX_FK_ProjectHealthVisitReport]
ON [dbo].[VisitReports]
    ([ProjectHealthId]);
GO

-- Creating foreign key on [VisitReportId] in table 'ProjectPictures'
ALTER TABLE [dbo].[ProjectPictures]
ADD CONSTRAINT [FK_VisitReportProjectPictures]
    FOREIGN KEY ([VisitReportId])
    REFERENCES [dbo].[VisitReports]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitReportProjectPictures'
CREATE INDEX [IX_FK_VisitReportProjectPictures]
ON [dbo].[ProjectPictures]
    ([VisitReportId]);
GO

-- Creating foreign key on [VisitReportId] in table 'Checklists'
ALTER TABLE [dbo].[Checklists]
ADD CONSTRAINT [FK_VisitReportChecklist]
    FOREIGN KEY ([VisitReportId])
    REFERENCES [dbo].[VisitReports]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitReportChecklist'
CREATE INDEX [IX_FK_VisitReportChecklist]
ON [dbo].[Checklists]
    ([VisitReportId]);
GO

-- Creating foreign key on [ArchitectId] in table 'NewProjects'
ALTER TABLE [dbo].[NewProjects]
ADD CONSTRAINT [FK_ArchitectNewProject]
    FOREIGN KEY ([ArchitectId])
    REFERENCES [dbo].[Architects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArchitectNewProject'
CREATE INDEX [IX_FK_ArchitectNewProject]
ON [dbo].[NewProjects]
    ([ArchitectId]);
GO

-- Creating foreign key on [BusinessPartnerId] in table 'NewProjects'
ALTER TABLE [dbo].[NewProjects]
ADD CONSTRAINT [FK_BusinessPartnerNewProject]
    FOREIGN KEY ([BusinessPartnerId])
    REFERENCES [dbo].[BusinessPartners]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BusinessPartnerNewProject'
CREATE INDEX [IX_FK_BusinessPartnerNewProject]
ON [dbo].[NewProjects]
    ([BusinessPartnerId]);
GO

-- Creating foreign key on [NewProjectId] in table 'AutocadDiagrams'
ALTER TABLE [dbo].[AutocadDiagrams]
ADD CONSTRAINT [FK_NewProjectAutocadDiagrams]
    FOREIGN KEY ([NewProjectId])
    REFERENCES [dbo].[NewProjects]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewProjectAutocadDiagrams'
CREATE INDEX [IX_FK_NewProjectAutocadDiagrams]
ON [dbo].[AutocadDiagrams]
    ([NewProjectId]);
GO

-- Creating foreign key on [OwnerId] in table 'NewProjects'
ALTER TABLE [dbo].[NewProjects]
ADD CONSTRAINT [FK_OwnerNewProject]
    FOREIGN KEY ([OwnerId])
    REFERENCES [dbo].[Owners]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OwnerNewProject'
CREATE INDEX [IX_FK_OwnerNewProject]
ON [dbo].[NewProjects]
    ([OwnerId]);
GO

-- Creating foreign key on [ProjectTypeId] in table 'NewProjects'
ALTER TABLE [dbo].[NewProjects]
ADD CONSTRAINT [FK_ProjectTypeNewProject]
    FOREIGN KEY ([ProjectTypeId])
    REFERENCES [dbo].[ProjectTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProjectTypeNewProject'
CREATE INDEX [IX_FK_ProjectTypeNewProject]
ON [dbo].[NewProjects]
    ([ProjectTypeId]);
GO

-- Creating foreign key on [FixingTypeId] in table 'NewProjects'
ALTER TABLE [dbo].[NewProjects]
ADD CONSTRAINT [FK_FixingTypeNewProject]
    FOREIGN KEY ([FixingTypeId])
    REFERENCES [dbo].[FixingTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FixingTypeNewProject'
CREATE INDEX [IX_FK_FixingTypeNewProject]
ON [dbo].[NewProjects]
    ([FixingTypeId]);
GO

-- Creating foreign key on [ApplicationsId] in table 'NewProjects'
ALTER TABLE [dbo].[NewProjects]
ADD CONSTRAINT [FK_ApplicationsNewProject]
    FOREIGN KEY ([ApplicationsId])
    REFERENCES [dbo].[Applications]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ApplicationsNewProject'
CREATE INDEX [IX_FK_ApplicationsNewProject]
ON [dbo].[NewProjects]
    ([ApplicationsId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------