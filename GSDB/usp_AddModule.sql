USE [GradingDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddModule]    Script Date: 01-04-2021 11:18:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[usp_AddModule]
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



