USE AskEpam
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE Name = 'Users' )
	CREATE TABLE dbo.Users(
		UserId INT NOT NULL IDENTITY(1,1),
		DomainName NVARCHAR(100) NOT NULL,
		CreateDate DATETIME NOT NULL CONSTRAINT DF_Users_CreateDate DEFAULT (GETDATE())

		CONSTRAINT UQ_UserName UNIQUE(DomainName),
		CONSTRAINT PK_Users PRIMARY KEY (UserId)
		)
GO

IF NOT EXISTS(SELECT * FROM sys.tables WHERE Name = 'Skills' )
	CREATE TABLE dbo.Skills(
		SkillId INT NOT NULL,
		SkillName NVARCHAR(100) NOT NULL

		CONSTRAINT UQ_Skills UNIQUE(SkillName),
		CONSTRAINT PK_Skills PRIMARY KEY (SkillId)
	)
GO
IF NOT EXISTS(SELECT * FROM sys.tables WHERE Name = 'UsersSkils' )
	CREATE TABLE dbo.UsersSkils(
		UserId INT NOT NULL,
		SkillId INT NOT NULL,

		CONSTRAINT PK_UsersSkils PRIMARY KEY (UserId, SkillId),
		CONSTRAINT FK_UsersSkils_User FOREIGN KEY (UserId) REFERENCES dbo.Users(UserId),
		CONSTRAINT FK_UsersSkils_Skils FOREIGN KEY (SkillId) REFERENCES dbo.Skills(SkillId)
	)
GO


