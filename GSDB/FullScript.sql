USE [master]
GO
/****** Object:  Database [GradingDB]    Script Date: 01-04-2021 11:55:41 ******/
CREATE DATABASE [GradingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GradingDB', FILENAME = N'C:\Users\Training\GradingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GradingDB_log', FILENAME = N'C:\Users\Training\GradingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GradingDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GradingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GradingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GradingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GradingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GradingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GradingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GradingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GradingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GradingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GradingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GradingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GradingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GradingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GradingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GradingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GradingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GradingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GradingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GradingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GradingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GradingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GradingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GradingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GradingDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GradingDB] SET  MULTI_USER 
GO
ALTER DATABASE [GradingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GradingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GradingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GradingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GradingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GradingDB] SET QUERY_STORE = OFF
GO
USE [GradingDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [GradingDB]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_AutoGeneration]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE     FUNCTION  [dbo].[ufn_AutoGeneration]()
RETURNS VARCHAR(12)
BEGIN
	DECLARE @BatchID VARCHAR(6)
	SET @BatchID = (SELECT TOP 1 BatchID from Batch ORDER BY BatchID DESC)+1001
	
	DECLARE @YEAR varchar(12)
	DECLARE @Y varchar(4)
	SET @YEAR=GETDATE();
	SET @Y=(SELECT DATEPART(yyyy, @YEAR) AS DatePartInt)

	DECLARE @LOCATION VARCHAR(3)
	SET @LOCATION ='MYS'

	
	DECLARE @convertint varchar(4)
	SET @convertint = CAST(@BatchID AS VARCHAR(4))

	DECLARE @convertDate varchar(4)
	SET @convertDate = CAST(@Y AS VARCHAR(4))


	Declare @FinalRes varchar(12)
	SET @FinalRes = CONCAT(@convertDate,@LOCATION,@convertint)

	RETURN @FinalRes
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_AutoGenerationBLR]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     FUNCTION  [dbo].[ufn_AutoGenerationBLR]()
RETURNS VARCHAR(12)
BEGIN
	DECLARE @BatchID VARCHAR(6)
	SET @BatchID = (SELECT TOP 1 BatchID from Batch ORDER BY BatchID DESC)+1001
	
	DECLARE @YEAR varchar(12)
	DECLARE @Y varchar(4)
	SET @YEAR=GETDATE();
	SET @Y=(SELECT DATEPART(yyyy, @YEAR) AS DatePartInt)

	DECLARE @LOCATION VARCHAR(3)
	SET @LOCATION ='BLR'

	
	DECLARE @convertint varchar(4)
	SET @convertint = CAST(@BatchID AS VARCHAR(4))

	DECLARE @convertDate varchar(4)
	SET @convertDate = CAST(@Y AS VARCHAR(4))


	Declare @FinalRes varchar(12)
	SET @FinalRes = CONCAT(@convertDate,@LOCATION,@convertint)

	RETURN @FinalRes
END
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_EmailValidation]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       FUNCTION [dbo].[ufn_EmailValidation](@EMAIL VARCHAR(50))
RETURNS BIT
AS
BEGIN
  DECLARE @bitEmailVal as BIT
  DECLARE @EmailText varchar(50)

  SET @EmailText=ltrim(rtrim(isnull(@EMAIL,'')))

  SET @bitEmailVal = case when @EmailText = '' then 0
                          when @EmailText like '% %' then 0
                          when @EmailText like ('%["(),:;<>\]%') then 0
                          when substring(@EmailText,charindex('@',@EmailText),len(@EmailText)) like ('%[!#$%&*+/=?^`_{|]%') then 0
                          when (left(@EmailText,1) like ('[-_.+]') or right(@EmailText,1) like ('[-_.+]')) then 0                                                                                    
                          when (@EmailText like '%[%' or @EmailText like '%]%') then 0
                          when @EmailText LIKE '%@%@%' then 0
                          when @EmailText NOT LIKE '_%@_%._%' then 0
                          else 1 
                      end
  ---PRINT @bitEmailVal
  RETURN @bitEmailVal  
END
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[BatchID] [int] IDENTITY(1,1) NOT NULL,
	[BatchName] [varchar](50) NOT NULL,
	[BatchLocation] [varchar](3) NOT NULL,
	[BatchStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[ModuleID] [int] IDENTITY(5000,1) NOT NULL,
	[ModuleName] [varchar](50) NOT NULL,
	[ModuleDuration] [varchar](50) NOT NULL,
	[TrackID] [int] NOT NULL,
	[ModuleSyllabus] [varbinary](max) NOT NULL,
	[ModuleStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleMarks]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleMarks](
	[PSnumber] [bigint] NOT NULL,
	[Modulename] [varchar](50) NOT NULL,
	[ModuleMarks] [int] NOT NULL,
	[Improvements] [varchar](200) NOT NULL,
	[Strengths] [varchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicMatrix]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicMatrix](
	[Topic] [varchar](50) NOT NULL,
	[ModuleName] [varchar](50) NOT NULL,
	[Bas] [bit] NULL,
	[Inter] [bit] NULL,
	[Expert] [bit] NULL,
	[Marks] [int] NOT NULL,
	[PsNumber] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Track]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[TrackID] [int] IDENTITY(2001,1) NOT NULL,
	[TrackName] [varchar](50) NOT NULL,
	[TrackDescription] [varchar](200) NULL,
	[TrackStatus] [bit] NULL,
	[BatchID] [int] NOT NULL,
	[TrackDuration] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainee]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainee](
	[PSNumber] [bigint] NOT NULL,
	[TraineeName] [varchar](30) NOT NULL,
	[CollegeName] [varchar](30) NOT NULL,
	[CollegeCGPA] [decimal](2, 1) NOT NULL,
	[YearOfPassing] [int] NOT NULL,
	[EmailID] [varchar](50) NOT NULL,
	[TraineeStatus] [bit] NULL,
	[BatchID] [int] NULL,
	[TrackID] [int] NULL,
 CONSTRAINT [PK_Trainee_PSNumber] PRIMARY KEY CLUSTERED 
(
	[PSNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainees]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainees](
	[PSnumber] [bigint] NOT NULL,
	[TName] [varchar](30) NOT NULL,
	[ClgName] [varchar](30) NOT NULL,
	[ClgGPA] [decimal](2, 1) NOT NULL,
	[YearOfPassing] [int] NOT NULL,
	[EmailID] [varchar](50) NOT NULL,
	[TraineeStatus] [bit] NOT NULL,
	[BatchID] [int] NOT NULL,
	[TrackId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PSnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batch] ADD  DEFAULT ((1)) FOR [BatchStatus]
GO
ALTER TABLE [dbo].[Module] ADD  DEFAULT ((1)) FOR [ModuleStatus]
GO
ALTER TABLE [dbo].[Track] ADD  DEFAULT ((1)) FOR [TrackStatus]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_TrackID] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([TrackID])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_TrackID]
GO
ALTER TABLE [dbo].[TopicMatrix]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Trainees] FOREIGN KEY([PsNumber])
REFERENCES [dbo].[Trainees] ([PSnumber])
GO
ALTER TABLE [dbo].[TopicMatrix] CHECK CONSTRAINT [FK_Topic_Trainees]
GO
ALTER TABLE [dbo].[Track]  WITH CHECK ADD  CONSTRAINT [FK_BatchID] FOREIGN KEY([BatchID])
REFERENCES [dbo].[Batch] ([BatchID])
GO
ALTER TABLE [dbo].[Track] CHECK CONSTRAINT [FK_BatchID]
GO
ALTER TABLE [dbo].[Trainee]  WITH CHECK ADD  CONSTRAINT [FK_Trainee_BatchID] FOREIGN KEY([BatchID])
REFERENCES [dbo].[Batch] ([BatchID])
GO
ALTER TABLE [dbo].[Trainee] CHECK CONSTRAINT [FK_Trainee_BatchID]
GO
ALTER TABLE [dbo].[Trainee]  WITH CHECK ADD  CONSTRAINT [FK_Trainee_TrackID] FOREIGN KEY([TrackID])
REFERENCES [dbo].[Track] ([TrackID])
GO
ALTER TABLE [dbo].[Trainee] CHECK CONSTRAINT [FK_Trainee_TrackID]
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD  CONSTRAINT [FK_Trainees_Batch] FOREIGN KEY([BatchID])
REFERENCES [dbo].[Batch] ([BatchID])
GO
ALTER TABLE [dbo].[Trainees] CHECK CONSTRAINT [FK_Trainees_Batch]
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD  CONSTRAINT [FK_Trainees_Track] FOREIGN KEY([TrackId])
REFERENCES [dbo].[Track] ([TrackID])
GO
ALTER TABLE [dbo].[Trainees] CHECK CONSTRAINT [FK_Trainees_Track]
GO
/****** Object:  StoredProcedure [dbo].[Usp_Add_Trainees]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Usp_Add_Trainees]
(
@TraineePSNo BIGINT,
@TraineeName VARCHAR(30),
@CollegeName VARCHAR(30),
@CollegeCGPA DECIMAL(2,1),
@YearOfPassing INT,
@EmailID VARCHAR(50),
@TraineeStatus BIT,
@BatchID INT,
@TrackID INT
)
AS
BEGIN TRY
DECLARE @res1 AS INT
SET @res1=(SELECT dbo.Ufn_EmailValidation(@EmailID))
IF LEN(@TraineePSNo)=8 AND @res1=1
     IF EXISTS(SELECT BatchID FROM Batch WHERE BatchID=@BatchID) AND EXISTS(SELECT TrackID FROM Track WHERE TrackID=@TrackID)
	        

			INSERT INTO Trainees(PSnumber,TName,ClgName,ClgGPA,YearOfPassing,EmailID,TraineeStatus,BatchID,TrackId) 
              VALUES (@TraineePSNo,@TraineeName,@CollegeName,@CollegeCGPA,@YearOfPassing,@EmailID,@TraineeStatus,@BatchID,@TrackID);
	 
	 ELSE
	    
		PRINT 'Batch id or track id does not exist'
ELSE
   PRINT 'Length exceeded  or invalid email'


RETURN 31

END TRY

BEGIN CATCH
    RETURN -31

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_AddBatch]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create     PROCEDURE [dbo].[usp_AddBatch](
@Location VARCHAR(3)
) 
AS
BEGIN TRY
IF(@Location='BLR')
	BEGIN
		INSERT INTO Batch(BatchName,BatchLocation) VALUES ([dbo].[ufn_AutoGenerationBLR](),@LOCATION)
		RETURN 70
	END
	ELSE IF(@Location='MYS')
	BEGIN
		INSERT INTO Batch(BatchName,BatchLocation) VALUES ([dbo].[ufn_AutoGeneration](),@LOCATION)	
		RETURN 71
	END
END TRY
BEGIN CATCH
	RETURN -79
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Usp_AddModMarks]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [dbo].[Usp_AddModMarks](@psno BIGINT,@imp VARCHAR(200),@str VARCHAR(200),@name VARCHAR(50))
AS
BEGIN TRY
    IF EXISTS(SELECT PSnumber FROM Trainees WHERE PSnumber=@psno) AND EXISTS(SELECT PsNumber FROM TopicMatrix WHERE PsNumber=@psno)
	   IF EXISTS (SELECT ModuleName FROM Module WHERE ModuleName=@name) 
	       IF NOT EXISTS(SELECT ModuleName FROM ModuleMarks WHERE ModuleName=@name AND PSnumber=@psno )
                INSERT INTO ModuleMarks(PSnumber,ModuleMarks,Modulename,Improvements,Strengths) VALUES (@psno,(select sum(Marks) from TopicMatrix WHERE PsNumber=@psno),@name,@imp,@str);
		   ELSE
		      return -90
       ELSE
	         return -91
	ELSE
	        return -92
END TRY
BEGIN  CATCH
     RETURN -99  
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_AddModule]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_AddModule]
(
	@Choice AS VARCHAR(50),
	@ModuleName AS VARCHAR(50),
	@ModuleDuration AS VARCHAR(50),
	@TrackID AS INT,
	@ModuleSyllabus AS [varbinary](max)
)
AS
BEGIN TRY
	IF NOT  EXISTS (SELECT ModuleName FROM Module WHERE ModuleName=@ModuleName)
	BEGIN
		IF EXISTS (SELECT TrackName FROM Track WHERE TrackName=@Choice AND TrackID=@TrackID)
		BEGIN
			INSERT INTO Module(ModuleName,ModuleDuration,TrackID,ModuleSyllabus) VALUES (@ModuleName,@ModuleDuration,@TrackID,@ModuleSyllabus);
			RETURN 80
		END
		ELSE
		BEGIN
			RETURN -88
		END
	END
	ELSE
	BEGIN
		RETURN -87
	END
END TRY

BEGIN CATCH
	RETURN -89;
END CATCH


GO
/****** Object:  StoredProcedure [dbo].[usp_AddTopicMatrix]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_AddTopicMatrix]
(
  @Topic AS VARCHAR(50) ,
  @ModuleName AS VARCHAR(50),
  @Basic AS BIT,
  @Intermediate AS BIT,
  @Expert AS BIT,
  @Marks AS INT,
  @psno AS BIGINT
)
AS
 BEGIN TRY

 IF EXISTS(SELECT ModuleName FROM Module WHERE ModuleName=@ModuleName) AND EXISTS(SELECT PSnumber FROM Trainees WHERE PSnumber=@psno) AND NOT EXISTS(SELECT Topic FROM TopicMatrix WHERE Topic=@Topic)
   
   INSERT INTO TopicMatrix(PsNumber,Topic,ModuleName,Bas,Inter,Expert,Marks) VALUES (@psno,@Topic, @ModuleName, @Basic, @Intermediate , @Expert , @Marks)
END TRY
BEGIN CATCH
  RETURN -99
  END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_AddTrack]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[usp_AddTrack](
@Track_Name VARCHAR(50) ,
@Track_Description  VARCHAR(200),
@Track_Duration VARCHAR (50) ,
@Batch_ID INT 
)
AS
BEGIN TRY
	IF NOT  EXISTS (SELECT BatchID FROM Track WHERE BatchID=@Batch_ID)
	BEGIN 
		INSERT INTO Track(TrackName,TrackDescription,TrackDuration ,BatchID) 
		VALUES(@Track_Name,@Track_Description,@Track_Duration,@Batch_ID)
		RETURN 90
	END
	ELSE
	BEGIN
	 RETURN -98
	END
END TRY
BEGIN CATCH
	RETURN -99
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[usp_AddTrainee]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    PROCEDURE [dbo].[usp_AddTrainee](

@TraineePSNo BIGINT,
@TraineeName VARCHAR(30),
@CollegeName VARCHAR(30),
@CollegeCGPA DECIMAL(2,1),
@YearOfPassing INT,
@EmailID VARCHAR(50),
@BatchID INT,
@TrackID INT

)  

AS
  BEGIN  TRY

  Declare @retVal INT
  Set @retVal = (select dbo.ufn_EmailValidation(@EmailID))
		IF EXISTS (SELECT BatchID FROM Batch WHERE BatchID = @BatchID AND @retVal=1) 
		BEGIN
		 IF EXISTS (SELECT TrackID FROM Track WHERE TrackID = @TrackID)
		 BEGIN
        INSERT INTO Trainee (PSNumber ,TraineeName ,CollegeName,CollegeCGPA,YearOfPassing,EmailID, TraineeStatus,BatchID,TrackID) 
        VALUES     ( @TraineePSNo,  
                     @TraineeName,  
                    @CollegeName,  
                     @CollegeCGPA,  
                     @YearOfPassing,
				     @EmailID,
					 1,
					 @BatchID,
					 @TrackID
				     )  

		RETURN 31
  END
  ELSE
		RETURN -31
  END

  
  END  TRY
  BEGIN CATCH

  RETURN -21
  END CATCH


 -- select * from Trainee
GO
/****** Object:  StoredProcedure [dbo].[usp_GetTraineeByTrackid]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[usp_GetTraineeByTrackid](
@trackname varchar(30)
)
AS
BEGIN TRY
select * from Trainees where TrackId = (Select TrackId from Track where TrackName=@trackname)
END TRY
BEGIN CATCH
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Usp_GroupByTrainee]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create     PROCEDURE [dbo].[Usp_GroupByTrainee](@psno BIGINT)
AS
BEGIN TRY
    IF EXISTS(SELECT PSnumber FROM ModuleMarks WHERE PSnumber=@psno)
	     SELECT ModuleMarks, Modulename,Improvements,Strengths FROM ModuleMarks WHERE PSnumber=@psno
	ELSE
	 PRINT 'PSnumber doesnot exists'
END TRY
BEGIN  CATCH
return -98
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Usp_TrackDetails]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Usp_TrackDetails](@batchname VARCHAR(50))
AS
BEGIN TRY
  IF EXISTS (SELECT BatchName FROM Batch WHERE BatchName=@batchname)
      SELECT * FROM Track WHERE BatchID=(SELECT BatchID FROM Batch WHERE BatchName=@batchname)
   ELSE
       PRINT 'BATCH NAME DOES NOT EXIST'
END TRY
BEGIN CATCH
   RETURN -99
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateBatch]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[usp_UpdateBatch] (
@BatchID INT
)  
AS  
BEGIN TRY 
		IF EXISTS (SELECT BatchID FROM Batch WHERE BatchID=@BatchID)
        BEGIN  
            UPDATE Batch  
            SET BatchStatus = 0
            WHERE BatchID = @BatchID
			RETURN 72
        END  
		ELSE
		BEGIN 
			return -77
		END
END TRY
BEGIN CATCH
	RETURN -78
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateBatchID]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_UpdateBatchID]
(
@PSNumber AS bigint,
@BatchID AS INT,
@TrackID AS INT,
@TraineeStatus AS BIT
)
AS
BEGIN
BEGIN TRY

   IF EXISTS(SELECT BatchID FROM Batch WHERE BatchID=@BatchID)
   BEGIN

       IF @TraineeStatus = 1
       BEGIN
	     UPDATE Trainee SET BatchID=@BatchID,
		                    TrackID=@TrackID 
					    WHERE PSNumber=@PSNumber

	   RETURN 32

	    
    END
	   ELSE 
		RETURN -32
    END
END TRY
BEGIN CATCH
 RETURN -22
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateModuleDuration]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[usp_UpdateModuleDuration](
@ModuleID varchar(50),
@Module_Duration VARCHAR(50)
)
AS
BEGIN TRY
	IF EXISTS(SELECT ModuleID FROM Module WHERE ModuleID=@ModuleID)
	BEGIN	
		UPDATE Module SET ModuleDuration=@Module_Duration WHERE ModuleID=@ModuleID
		RETURN 81
	END
		ELSE
		BEGIN
			RETURN -85
		END
		
END TRY

BEGIN CATCH
	RETURN -86
END CATCH


GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateModuleName]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_UpdateModuleName](
@Module_ID INT,
@Module_Name VARCHAR(50)
)
AS
BEGIN TRY
		IF EXISTS(SELECT ModuleID FROM Module WHERE ModuleID=@Module_ID)
		BEGIN
			UPDATE Module SET ModuleName=@Module_Name WHERE ModuleID=@Module_ID
			RETURN 82
		END
		ELSE
		BEGIN
			RETURN -83
		END
		
END TRY

BEGIN CATCH
	RETURN -84
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateModuleStatus]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_UpdateModuleStatus](
@Module_ID AS INT
)
AS
BEGIN TRY
	IF EXISTS(SELECT ModuleID FROM Module WHERE ModuleID=@Module_ID AND ModuleStatus=0 )
	BEGIN	
		UPDATE Module SET ModuleStatus=1 WHERE ModuleID=@Module_ID 
		RETURN 83
	END
	IF EXISTS(SELECT ModuleID FROM Module WHERE ModuleID=@Module_ID AND ModuleStatus=1 )
	BEGIN	
		UPDATE Module SET ModuleStatus=0 WHERE ModuleID=@Module_ID 
		RETURN 83
	END
		ELSE
		BEGIN
			RETURN -81
		END
		
END TRY

BEGIN CATCH
	RETURN -82
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTrackDescription]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[usp_UpdateTrackDescription](
@TrackID AS INT, 
@TrackDescription AS VARCHAR (200)
)
AS
BEGIN TRY
	IF EXISTS (SELECT TrackID FROM Track WHERE TrackID=@TrackID)
	BEGIN
		UPDATE Track
		SET TrackDescription = @TrackDescription
		WHERE TrackID = @TrackID
		RETURN 91
	END
	ELSE
	BEGIN
		RETURN -96
	END
		
END TRY

BEGIN CATCH
	RETURN -97
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTrackDuration]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[usp_UpdateTrackDuration](
@TrackID AS INT, 
@TrackDuration AS VARCHAR (50)
)
AS
BEGIN TRY
	IF EXISTS (SELECT TrackID FROM Track WHERE TrackID=@TrackID)
	BEGIN
		UPDATE Track SET TrackDuration = @TrackDuration WHERE TrackID = @TrackID
		RETURN 92
	END
	ELSE
	BEGIN
		RETURN -94
	END
		
END TRY

BEGIN CATCH
	RETURN -95
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTrackName]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[usp_UpdateTrackName](
@TrackID AS INT, 
@TrackName AS VARCHAR (50)
)
AS
BEGIN TRY
	IF EXISTS (SELECT TrackID FROM Track WHERE TrackID=@TrackID)
	BEGIN
		UPDATE Track
		SET TrackName = @TrackName
		WHERE TrackID = @TrackID
		RETURN 93
	END
	ELSE
	BEGIN
		RETURN -92
	END
		
END TRY

BEGIN CATCH
	RETURN -93
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTrackStatus]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[usp_UpdateTrackStatus](
@TrackID AS INT
)
AS
BEGIN TRY
	IF EXISTS (SELECT TrackID FROM Track WHERE TrackID=@TrackID and TrackStatus=1)
	BEGIN
		UPDATE Track
		SET TrackStatus = 0
		WHERE TrackID = @TrackID
		RETURN 94
	END
	IF EXISTS (SELECT TrackID FROM Track WHERE TrackID=@TrackID and TrackStatus=0)
	BEGIN
		UPDATE Track
		SET TrackStatus = 1
		WHERE TrackID = @TrackID
		RETURN 94
	END

	ELSE
	BEGIN
		RETURN -90
	END
		
END TRY

BEGIN CATCH
	RETURN -91
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTraineeName]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_UpdateTraineeName]
(
@TraineeName AS VARCHAR(30),
@PSNumber AS BIGINT
)
AS
BEGIN TRY
		IF EXISTS(SELECT PSNumber FROM Trainee WHERE PSNumber = @PSNumber)
		BEGIN
			UPDATE Trainee
			SET TraineeName =@TraineeName
			WHERE PSNumber =@PSNumber

			RETURN 35
		END
			ELSE
			BEGIN
				RETURN -35
			END
END TRY
BEGIN CATCH
		RETURN -25
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateTraineeStatus]    Script Date: 01-04-2021 11:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_UpdateTraineeStatus]
( 
    @PSNumber bigint     
)
AS
BEGIN TRY  
   IF EXISTS(SELECT PSNumber FROM Trainee WHERE PSNumber = @PSNumber)

    BEGIN
	      UPDATE Trainee
		  SET	 TraineeStatus=0
		  WHERE PSNumber=@PSNumber

		  RETURN 36
	
	END
	     ELSE
		 BEGIN
		   RETURN -36
         END
END TRY
BEGIN CATCH
     RETURN -26
END CATCH
GO
USE [master]
GO
ALTER DATABASE [GradingDB] SET  READ_WRITE 
GO
