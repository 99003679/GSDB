USE [GradingDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddTopicMatrix]    Script Date: 01-04-2021 09:50:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[usp_AddTopicMatrix]
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

 IF EXISTS(SELECT Modulename FROM ModuleMarks WHERE PSnumber=99003546 AND Modulename=@ModuleName) 
   
   INSERT INTO TopicMatrix(PsNumber,Topic,ModuleName,Bas,Inter,Expert,Marks) VALUES (@psno,@Topic, @ModuleName, @Basic, @Intermediate , @Expert , @Marks)
END TRY
BEGIN CATCH
  RETURN -99
  END CATCH


  EXEC usp_AddTopicMatrix 
  @Topic='Inheritance' ,
  @ModuleName='Csharp',
  @Basic=0,
  @Intermediate=0,
  @Expert=1,
  @Marks=9,
  @psno=99003546
  delete from TopicMatrix Where  PSNumber=99003546 and Topic='DATABASE CREATION'

  select * from TopicMatrix WHERE PSNumber=99003546

  select * from  TopicMatrix Where PSNumber=99003546 
  select * from ModuleMarks where PSnumber=99003546
