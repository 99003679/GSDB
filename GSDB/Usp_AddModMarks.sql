USE [GradingDB]
GO
/****** Object:  StoredProcedure [dbo].[Usp_AddModMarks]    Script Date: 01-04-2021 11:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER       PROCEDURE [dbo].[Usp_AddModMarks](@psno BIGINT,@imp VARCHAR(200),@str VARCHAR(200),@name VARCHAR(50))
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


EXEC Usp_AddModMarks
@psno=99003675,
@imp='no imp',
@str='perfect',
@name='Csharp'
select * from ModuleMarks WHERE PsNumber=99003675
select * from TopicMatrix WHERE PsNumber=99003675