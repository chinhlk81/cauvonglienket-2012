SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePhotoByAlbum]	
	(
	@albumId int
	)	
AS
	update dbo.Photo
	set dbo.Photo.Status='Delete'
	where dbo.Photo.AlbumID=@albumId
	RETURN

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAlbumById]	
	(
	@idAlbum int 
	)	
AS
	select *
	from dbo.Album
	where dbo.Album.AlbumID=@idAlbum
	AND Status<>'Delete'
	RETURN

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultants](
	[ConsultantID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConsultantName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConsultantEmail] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConsultantPhone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConsultantYahooID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConsultantSkypeID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConsultantPicture] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConsultantDesc] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Consultants] PRIMARY KEY CLUSTERED 
(
	[ConsultantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigValues](
	[ConfigValueID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigKey] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConfigKeyValue] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConfigText] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConfigKeyDesc] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConfigKeyGroup] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConfigValueSortOrder] [int] NULL,
 CONSTRAINT [PK_ConfigValues] PRIMARY KEY CLUSTERED 
(
	[ConfigValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteComment] 
	-- Add the parameters for the stored procedure here
	@CommentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE  Comment
	SET [Status]='Delete' 
	Where [CommentID]=@CommentID
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[DeleteMessage] 
	-- Add the parameters for the stored procedure here
	@messageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE  Messages
	SET [Status]='Delete' 
	Where [MessageID]=@messageID
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[GetDefaultUser]	
AS	
	select dbo.Users.UserID
	from dbo.Users
	where dbo.Users.UserStatus='Dummy'
	RETURN




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[UpdateMessageStatus] 
	-- Add the parameters for the stored procedure here
	@messageID int,
	@status nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE  Messages
	SET [Status]=@status 
	Where [MessageID]=@messageID
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCommentsByEventID] 
	-- Add the parameters for the stored procedure here
	@EventID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     dbo.Comment.*
FROM         dbo.Comment INNER JOIN
                      dbo.Events ON dbo.Comment.EventID = dbo.Events.EventID
	WHERE 
			 dbo.Events.Status='Visible'
	AND
			Comment.EventID=@EventID
	AND
			((Comment.Status='Approve')OR(Comment.Status='New'))
	
			
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteConsulting]
	-- Add the parameters for the stored procedure here
@ConsultingID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Consultings
	Set [Status]='Delete'
	where 
			[ConsultingID]=@ConsultingID 
	
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetAllCommentsEvent 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     dbo.Comment.*, dbo.Events.EventName, dbo.Users.UserPicture, dbo.Users.UserFullName
FROM         dbo.Comment INNER JOIN
                      dbo.Events ON dbo.Comment.EventID = dbo.Events.EventID INNER JOIN
                      dbo.Users ON dbo.Comment.UserID = dbo.Users.UserID
	WHERE 
			 dbo.Events.Status='Visible'
	AND
			Comment.Status='Approve'
	
			
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[UpdatePhotoStatus] 
	-- Add the parameters for the stored procedure here
	@PhotoID int,
	@status nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE  Photo
	SET [Status]=@status 
	Where [PhotoID]=@PhotoID
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetDefaultBlog]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT BlogID from Blog
	Where Status='Dummy'
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[DeletePhoto] 
	-- Add the parameters for the stored procedure here
	@PhotoID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE  Photo
	SET [Status]='Delete' 
	Where [PhotoID]=@PhotoID
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllEventTypical]	
AS	
	select *
	from dbo.Events
	where
		dbo.Events.IsTypical=1
	AND 
		dbo.Events.Status<>'Delete' 
	AND 
		dbo.Events.Status<>'Dummy'
	order by Events.EventDate Desc

	RETURN





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetTopEventTypical]	
AS	
	select TOP(3)*
	from dbo.Events
	where
		dbo.Events.IsTypical=1
	
	AND 
		dbo.Events.Status='Visible'
	order by Events.EventDate Desc

	RETURN






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CheckUserEmail
@UserEmail nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserEmail FROM USERS WHERE UserEmail=@UserEmail
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[OSDelete]
	@OSID int
AS
	Delete OlineSupport where OSID =@OSID
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUserName]

AS
	select dbo.Users.UserID, dbo.Users.UserFullName
	from dbo.Users
	where ((UserStatus='New') OR (dbo.Users.UserStatus='Active'))
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE BlogApprove 
	-- Add the parameters for the stored procedure here
	@Status nvarchar(50),
	@blogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Blog 
	Set [Status]=@Status
	Where [BlogID]=@blogID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetUserByName]
@userName nvarchar(50)
AS
	SELECT *
	FROM dbo.Users
	WHERE 
	dbo.Users.UserName=@userName
	AND
	((UserStatus='New')OR (UserStatus='Active'))
	RETURN



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE BlogUnApprove 
	-- Add the parameters for the stored procedure here
	@Status nvarchar(50),
	@blogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Blog 
	Set [Status]=@Status
	Where [BlogID]=@blogID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetDefaultEvent
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EventID from Events
	Where Status='Dummy'
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[ApproveComment] 
	-- Add the parameters for the stored procedure here
	@Status nvarchar(50),
	@commentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Comment 
	Set [Status]=@Status
	Where [CommentID]=@commentID
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[UnApproveComment] 
	-- Add the parameters for the stored procedure here
	@Status nvarchar(50),
	@commentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Comment 
	Set [Status]=@Status
	Where [CommentID]=@commentID
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[OSActive]
	@OSID int
AS
	UPDATE OlineSupport SET IsActive=1 
	where OSID =@OSID
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[OSDeActivate]
	@OSID int
AS
	UPDATE OlineSupport SET IsActive=0 
	where OSID =@OSID
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserSearch]
	@Gender nvarchar(50),
	@BDFrom datetime ,
	@BDTo datetime ,
	@UserAddCity nvarchar(150)
	 
AS
BEGIN 
	
IF (@UserAddCity = NULL OR @UserAddCity = '')
BEGIN  
	SELECT	UserID,UserFullName,UserName,UserBirthday,UserGender,UserPicture,UserAddCity
	FROM 
			USERS
	WHERE
			((UserStatus='New') OR (UserStatus='Active'))
	
	AND
			UserGender= @Gender
			
			
				AND
					UserBirthday<=@BDFrom 
				AND		
					UserBirthday>=@BDTo
				

	END		
ELSE 
BEGIN
SELECT	UserID,UserFullName,UserName,UserBirthday,UserGender,UserPicture,UserAddCity
	FROM 
			USERS
	WHERE
			((UserStatus='New') OR (UserStatus='Active'))
	
	AND
			UserGender= @Gender
	AND		
			UserBirthday<=@BDFrom 
	AND		
			 UserBirthday>=@BDTo
	AND
			UserAddCity= @UserAddCity	
END
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTopFiveNewEvents]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP(5)EventID,EventName,EventTime,EventDate,EventImages FROM EVENTS
	WHERE 
		EVENTS.Status='Visible'
		
	ORDER BY Datepost DESC
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DeleteBlog 
	-- Add the parameters for the stored procedure here
	@blogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE  Blog
	SET [Status]='Delete' 
	Where [BlogID]=@blogID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuConfigs](
	[MenuConfigID] [int] IDENTITY(1,1) NOT NULL,
	[MenuConfigName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MenuNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contents] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_MenuConfigs] PRIMARY KEY CLUSTERED 
(
	[MenuConfigID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all Coments,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTopFiveBlogByUserID]
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP(5)BlogID,BlogTitle,ImageUpload,Datepost
	FROM 
		dbo.Blog
	Where 	
		Blog.Status<>'Delete'
	AND
		Blog.Status<>'Dummy' 
	AND
		dbo.Blog.UserID =@UserID
ORDER BY Datepost DESC

END












GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE ActiveUser
@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update 
		Users 
	SET 
		UserStatus='Active'
	WHERE 
		USERID=@UserID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DeActivateUser
@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update 
		Users 
	SET 
		UserStatus='DeActivate'
	WHERE 
		USERID=@UserID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UpGradeUserVIP
@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update 
		Users 
	SET 
		UserIsVIP=1
	WHERE 
		USERID=@UserID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE CancelUserVIP
@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update 
		Users 
	SET 
		UserIsVIP=0
	WHERE 
		USERID=@UserID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DeleteUser
@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update 
		Users 
	SET 
		UserStatus='Delete'
	WHERE 
		USERID=@UserID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UserSearchTest]
	@UserAddCity nvarchar(150) =''
AS
BEGIN 
	
IF (@UserAddCity <>'')
BEGIN
    -- Insert statements for procedure here
	SELECT	UserID,UserFullName,UserName,UserBirthday,UserGender,UserPicture,UserAddCity
	FROM 
			USERS
	WHERE
			((UserStatus='New')OR	(UserStatus='Active'))
	and
				UserAddCity =@UserAddCity
	
END
ELSE 
	BEGIN
	SELECT	UserID,UserFullName,UserName,UserBirthday,UserGender,UserPicture,UserAddCity
	FROM 
			USERS
	WHERE
			((UserStatus='New') OR	(UserStatus='Active'))
	
END
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[ApprovePhoto] 
	-- Add the parameters for the stored procedure here
	@photoID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Photo 
	Set [Status]='Approve'
	Where [PhotoID]=@photoID
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[UnApprovePhoto] 
	-- Add the parameters for the stored procedure here
	@photoID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Photo 
	Set [Status]='UnApprove'
	Where [PhotoID]=@photoID
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetAllMenuConfigs
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM MenuConfigs
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserByIdUser]
	(
	@id int
	)
AS
	/* SET NOCOUNT ON */
	select *
	from dbo.Users a
	where 
		((a.UserStatus='New') OR(a.UserStatus='Active'))
	and a.UserID = @id
	RETURN

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMenuConfigsByID]
@MenuConfigID int
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM MenuConfigs WHERE [MenuConfigID]=@MenuConfigID
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UpdateMessageToRead
@msgID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Messages 
	SET 
			MessageUnRead =0
	WHERE 
			MessageID=@msgID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OlineSupport](
	[OSID] [int] IDENTITY(1,1) NOT NULL,
	[OSPhone1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSPhone2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSCellPhone1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSCellPhone2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSEmailTo1] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSEmailTo2] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSEmailFrom] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSPwdEmailFrom] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSPort] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSHost] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSYahoo1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSYahoo2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSSkype1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OSSkype2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsActive] [bit] NOT NULL,
	[Address] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address1] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fax] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fax1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_OlineSupport] PRIMARY KEY CLUSTERED 
(
	[OSID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserInfoByName]
	(
	@username nvarchar(50) 
	)
AS
	/* SET NOCOUNT ON */
	select *
	from dbo.Users us
	where us.UserFullName=@username and us.UserStatus<>'Delete' and us.UserStatus<>'Dummy'
	RETURN

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUsers]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	select *
	from dbo.Users us
	where 

		((us.UserStatus='New')OR (us.UserStatus='Active'))
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Users_AdvanceSearch] 
	-- Add the parameters for the stored procedure here
	@UserID int,
	@UserFullName nvarchar(100),
	@UserGender nvarchar(50),
	@UserEmail nvarchar(150),
	@UserAddCity nvarchar(150),
	@AgeFrom int,
	@AgeTo int,
	@UserHeight nvarchar(50),
	@UserWeight nvarchar(50),
	@UserFavColor nvarchar(100),
	@UserFavFoods nvarchar(200),
	@UserReadingBook nvarchar(250),
	@UserFavPet nvarchar(250),
	@UserPeopleLike nvarchar(250),
	@UserPeopleDislike nvarchar(250),
	@UserHobby nvarchar(250),
	@UserCareer nvarchar(50),
	@UserJobPosition nvarchar(50),
	@UserTimeContact nvarchar(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		UserID,
		UserName,
		UserFullName,
		UserPicture,
		UserBirthday,
		UserGender,
		UserStatus
	FROM
		Users
	WHERE
		UserID <> @UserID
	AND
		((UserFullName IS NULL)OR(UserFullName LIKE '%'+ @UserFullName +'%'))
	AND
		((UserGender IS NULL)OR(UserGender LIKE '%'+ @UserGender +'%'))
	AND	
		((UserEmail IS NULL)OR(UserEmail LIKE '%'+ @UserEmail +'%'))
	AND
		((UserAddCity IS NULL)OR(UserAddCity LIKE '%'+ @UserAddCity +'%'))
	AND
		(((@AgeTo = 0)OR (YEAR(UserBirthday) >= YEAR(GETDATE()) - @AgeTo)) AND ((@AgeFrom = 0) OR (YEAR(UserBirthday) <= YEAR(GETDATE()) - @AgeFrom)))
	AND
		((UserHeight IS NULL)OR(UserHeight LIKE '%'+ @UserHeight +'%'))
	AND
		((UserWeight IS NULL)OR(UserWeight LIKE '%'+ @UserWeight +'%'))
	AND
		((UserFavColor IS NULL)OR(UserFavColor LIKE '%'+ @UserFavColor +'%'))
	AND
		((UserFavFoods IS NULL)OR(UserFavFoods LIKE '%'+ @UserFavFoods +'%'))
	AND
		((UserReadingBook IS NULL)OR(UserReadingBook LIKE '%'+ @UserReadingBook +'%'))
	AND
		((UserFavPet IS NULL)OR(UserFavPet LIKE '%'+ @UserFavPet +'%'))
	AND
		((UserPeopleLike IS NULL)OR(UserPeopleLike LIKE '%'+ @UserPeopleLike +'%'))
	AND
		((UserPeopleDislike IS NULL)OR(UserPeopleDislike LIKE '%'+ @UserPeopleDislike +'%'))
	AND
		((UserHobby IS NULL)OR(UserHobby LIKE '%'+ @UserHobby +'%'))
	AND
		((UserCareer IS NULL)OR(UserCareer LIKE '%'+ @UserCareer +'%'))
	AND
		((UserJobPosition IS NULL)OR(UserJobPosition LIKE '%'+ @UserJobPosition +'%'))
	AND
		((UserTimeContact IS NULL)OR(UserTimeContact LIKE '%'+ @UserTimeContact +'%'))
	AND
		(UserStatus = 'Active')
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ad](
	[AdID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Link] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsVisible] [bit] NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Ad] PRIMARY KEY CLUSTERED 
(
	[AdID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDefaultAlbum]	
AS	
	select dbo.Album.AlbumID
	from dbo.Album
	where dbo.Album.Status='Dummy'
	RETURN



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetEventById]
	(
	@eventId int 	
	)	
AS	
	select *
	from dbo.Events
	where dbo.Events.Status<>'Delete' and dbo.Events.Status<>'Dummy' and dbo.Events.EventId=@eventId
	RETURN




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNIdEventParents]	
AS	
	select dbo.EventParents.EventParentID, dbo.EventParents.EventParentName
	from dbo.EventParents
	where dbo.EventParents.Status<>'Delete' AND EventParents.Status<>'Dummy' 
	RETURN



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCommentRelationByCommentID]
@CommentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	cmt.CommentID,cmt.CommentContent,cmt.CommentParentID,cmt.Datepost,
			us.UserID,us.UserFullName,us.UserPicture 
	FROM 
			Comment cmt,Users us
	Where 
			CommentParentID=@CommentID
	AND 
			((Status='Approve') OR(cmt.Status='New' ))
	AND 
			CommentType='Wall'
	AND
			cmt.UserID=us.UserID
		
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllEvents]	
AS	
	select *
	from dbo.Events
	where dbo.Events.Status<>'Delete' and dbo.Events.Status<>'Dummy'
	ORDER BY DatePost desc
	RETURN





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEventById]	
	(
	@eventId int	
	)	
AS
	update dbo.Events
	set dbo.Events.Status='Delete'
	where dbo.Events.EventId=@eventId
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllMessageByUserReceiptID] 
	@UserReceiptID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT us.UserName,us.UserFullName,us.UserPicture,ms.*
	FROM 
		Messages ms ,Users us
	WHERE 
		FK_UserReceiptID=@UserReceiptID

	AND
		((Status='Approve') OR(Status='New'))
	AND
		 ms.FK_UserSendID = us.UserID

	ORDER BY MessageDatetime DESC
	
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllMessageByUserSendID]
	@UserSendID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT us.UserName,us.UserFullName,us.UserPicture,ms.*
	FROM 
		Messages ms ,Users us
	WHERE 
		FK_UserSendID=@UserSendID
	AND
		Status<>'Delete'
	AND
		Status<>'Dummy'
	AND
		 ms.FK_UserReceiptID = us.UserID
	
		ORDER BY MessageDatetime DESC
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetDefaultComment
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CommentID 
	FROM 
			Comment 
	WHERE 
			Status='Dummy'
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllMessageUnRead] 
	@UserReceiptID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT us.UserName,us.UserFullName,us.UserPicture,ms.*
	FROM 
		Messages ms ,Users us
	WHERE 
		FK_UserReceiptID=@UserReceiptID

	AND
		((Status='Approve')OR (Status='New'))
	AND
		MessageUnRead='True'
	AND
		 ms.FK_UserSendID = us.UserID
	ORDER BY MessageDatetime DESC
END





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventParents](
	[EventParentID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventParentName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventParentDesc] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_EventParents] PRIMARY KEY CLUSTERED 
(
	[EventParentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultings](
	[ConsultingID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConsultingQuestions] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConsultingAnwsers] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ConsultingDesction] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DatePost] [datetime] NULL,
 CONSTRAINT [PK_Consultings] PRIMARY KEY CLUSTERED 
(
	[ConsultingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllMessageIsReply]
	@UserReceiptID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT us.UserName,us.UserFullName,us.UserPicture,ms.*
	FROM 
		Messages ms ,Users us
	WHERE 
		FK_UserReceiptID=@UserReceiptID

	AND
		((Status='Approve') OR(Status='New'))
	AND
		MessageIsReply='True'
	AND
		 ms.FK_UserSendID = us.UserID
	ORDER BY MessageDatetime DESC
END





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllMessageIsRead] 
	@UserReceiptID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT us.UserName,us.UserFullName,us.UserPicture,ms.*
	FROM 
		Messages ms ,Users us
	WHERE 
		FK_UserReceiptID=@UserReceiptID

	AND
		((Status='Approve') OR (Status='New'))
	AND
		MessageUnRead='False'
	AND
		 ms.FK_UserSendID = us.UserID
	ORDER BY MessageDatetime DESC
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserIDByName]
@userName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserID 
	FROM 
			Users
	WHERE 
			UserName=@userName 
	AND
	((UserStatus='New')OR (UserStatus='Active'))
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all Coments,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllBlogsOfFriend] 
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Blog.*,
	Users.UserName ,Users.UserFullName
	FROM         dbo.Blog INNER JOIN
                      dbo.Users ON dbo.Blog.UserID = dbo.Users.UserID
	Where 
		Status='Approve'
	AND 
	dbo.Users.UserID=@UserID
	order by Blog.Datepost desc 
END












GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAlbum]
	(
	@albumId int	
	)	
AS
	update dbo.Album
	set dbo.Album.Status='Delete'
	where dbo.Album.AlbumID=@albumId
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMaxIDAlbum]
AS
	/* SET NOCOUNT ON */
	select max(dbo.Album.AlbumID)
	from dbo.Album 
	WHERE Status<>'Delete'
	RETURN

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CommentParentID] [int] NULL,
	[UserID] [int] NULL,
	[UserWall] [int] NULL,
	[BlogID] [int] NULL,
	[EventID] [int] NULL,
	[CommentContent] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Datepost] [datetime] NOT NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsTypical] [bit] NOT NULL,
	[CommentType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FK_EventParentID] [int] NULL,
	[FK_AlbumID] [int] NULL,
	[EventName] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventContent] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Datepost] [datetime] NOT NULL,
	[EventLocation] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventTime] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventDate] [datetime] NOT NULL,
	[EventAgeJoint] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EventImages] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsTypical] [bit] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AlbumID] [int] NULL,
	[Description] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateUpload] [datetime] NULL,
	[PhotoPath] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlogTitle] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [int] NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlogContent] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ImageUpload] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Datepost] [datetime] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AlbumName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [int] NULL,
	[AlbumType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AlbumDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[UserID] [int] NOT NULL,
	[FriendID] [int] NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[FriendID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FK_UserSendID] [int] NULL,
	[FK_UserReceiptID] [int] NULL,
	[MessageDatetime] [datetime] NOT NULL,
	[MessageTitle] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MessageContent] [nvarchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MessageDesc] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MessageUnRead] [bit] NULL,
	[MessageIsReply] [bit] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIPVideo](
	[VipVideoID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserID] [int] NULL,
	[VideoPartnerID] [int] NULL,
	[DateCreate] [datetime] NULL,
	[Description] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_VIPVideo] PRIMARY KEY CLUSTERED 
(
	[VipVideoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserStatus] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserFullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserAddLine] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserAddCity] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Password] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserPhone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserEmail] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserPicture] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserIDCard] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserBirthday] [datetime] NOT NULL,
	[UserGender] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserLevel] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserReligion] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserMaritalStatus] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserCareer] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserJobPosition] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserWage] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserWorkingTime] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserFavColor] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserReadingBook] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserFavPet] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserPeopleLike] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserPeopleDislike] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserHobby] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserLookingObj] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserRequirements] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserPwdRecovery] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserIsVIP] [bit] NOT NULL,
	[UserDatePayment] [datetime] NULL,
	[UserVideoUpload] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserDescriptions] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserHeight] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserWeight] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserHope] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserFavFoods] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserTimeContact] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserOjbLikeDating] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UserRegisterDate] [datetime] NOT NULL,
	[UserEventParentID] [int] NOT NULL,
	[UserType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetMemberAlbum]
	(
	@idUser int 
	)
AS
	/* SET NOCOUNT ON */
	select al.AlbumID, al.AlbumName, min(pho.PhotoPath)as PhotoPath, count(pho.PhotoID) as NumberPho
	from dbo.Album al 
		left join  dbo.Photo pho on al.AlbumID=pho.AlbumID
	where  
		((al.Status='Approve') OR (al.Status='New'))
	AND
		al.Albumtype='Member'
	AND 
		((pho.Status='Approve') OR (pho.Status='New'))
	AND 
		al.UserID=@idUser 
	group by al.AlbumID, al.AlbumName
	RETURN






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[GetMemberAlbumAndPhoto]
	
AS
	/* SET NOCOUNT ON */
	select al.AlbumID, al.AlbumName,al.AlbumDate, min(pho.PhotoPath)as PhotoPath
	from dbo.Album al left join dbo.Photo pho on al.AlbumID=pho.AlbumID 
	where ((al.Status='Approve')OR(al.Status='New')) and ((Albumtype='Share') OR(Albumtype='Member'))
	group by al.AlbumID, al.AlbumName,al.AlbumDate
	order by al.AlbumDate desc
	RETURN








GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPhotoByAlbum]	
	(
	@idAlbum int
	)
AS
	/* SET NOCOUNT ON */
	select *
	from dbo.Photo
	where dbo.Photo.AlbumID = @idAlbum 
	AND ((Status='New')OR (Status='Approve'))
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [dbo].[GetAlbumAndPhoto]
	
AS
	/* SET NOCOUNT ON */
	select al.AlbumID, al.AlbumName,al.AlbumDate, min(pho.PhotoPath)as PhotoPath
	from dbo.Album al , dbo.Photo pho  
	where ((al.Status='Approve')OR(al.Status='New')) and ((Albumtype='Event') OR(Albumtype='Admin'))
	And al.AlbumID=pho.AlbumID
	group by al.AlbumID, al.AlbumName,al.AlbumDate
	order by al.AlbumDate desc
	RETURN









GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DeleteConsultant 
	-- Add the parameters for the stored procedure here
@consultantID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Consultants
	Set [Status]='Delete'
	where 
			[ConsultantID]=@consultantID 
	
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UpdateConsultant 
	-- Add the parameters for the stored procedure here
@ConsultantID int,
@Status nvarchar(50),
@ConsultantName nvarchar(50),
@ConsultantEmail nvarchar(250),
@ConsultantPhone nvarchar(50),
@ConsultantYahooID nvarchar(50),
@ConsultantSkypeID nvarchar(50),
@ConsultantPicture nvarchar(250),
@ConsultantDesc nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE 
		Consultants 
	SET
		Status=@Status,
		ConsultantName =@ConsultantName,
		ConsultantEmail =@ConsultantEmail,
		ConsultantPhone =@ConsultantPhone,
		ConsultantYahooID =@ConsultantYahooID,
		ConsultantSkypeID =@ConsultantSkypeID,
		ConsultantPicture =@ConsultantPicture,
		ConsultantDesc =@ConsultantDesc
WHERE 
	ConsultantID=@ConsultantID
	

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllConsultants] 
	-- Add the parameters for the stored procedure here
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.*,b.ConfigText as StatusText 
	FROM Consultants a,ConfigValues b
	where 
		a.Status = b.ConfigKey 
	AND   
		b.ConfigKeyGroup='Consultants'
	AND
		a.Status<>'Delete'
	AND 
		a.Status<>'Dummy'
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetConsultantByID] 
	-- Add the parameters for the stored procedure here
@consultantID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.*,b.ConfigText as StatusText 
	FROM Consultants a,ConfigValues b
	where 
		a.Status = b.ConfigKey 
	AND   
		b.ConfigKeyGroup='Consultants'
	AND
		a.Status<>'Delete'
	AND
		a.Status<>'Dummy'
	AND
			[ConsultantID]=@consultantID 
	
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Admin_SearchAllConsultantsByName] 
	-- Add the parameters for the stored procedure here
	@ConsultantName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		a.*, b.ConfigText as StatusText
	FROM
		Consultants a, ConfigValues b
	WHERE
		((a.ConsultantName IS NULL)OR(a.ConsultantName LIKE '%'+ @ConsultantName +'%'))
	AND 
		a.Status =b.ConfigKey
	AND 
		b.ConfigKeyGroup='Consultants'
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Admin_AdvanceSearchByConsultants] 
	-- Add the parameters for the stored procedure here
	@ConsultantName nvarchar(50),
	@ConsultantEmail nvarchar(250),
	@ConsultantPhone varchar(50),
	@ConsultantYahooID nvarchar(50),
	@ConsultantSkypeID nvarchar(50),
	@ConsultantDesc nvarchar(500),
	@Status nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		a.*, b.ConfigText as StatusText
	FROM
		Consultants a, ConfigValues b
	WHERE
		((a.ConsultantName IS NULL)OR(a.ConsultantName LIKE '%'+ @ConsultantName +'%'))
	AND
		((a.ConsultantEmail IS NULL)OR(a.ConsultantEmail LIKE '%'+ @ConsultantEmail +'%'))
	AND
		((a.ConsultantPhone IS NULL)OR(a.ConsultantPhone LIKE '%'+ @ConsultantPhone +'%'))
	AND	
		((a.ConsultantYahooID IS NULL)OR(a.ConsultantYahooID LIKE '%'+ @ConsultantYahooID +'%'))
	AND
		((a.ConsultantSkypeID IS NULL)OR(a.ConsultantSkypeID LIKE '%'+ @ConsultantSkypeID +'%'))
	AND
		((a.ConsultantDesc IS NULL)OR(a.ConsultantDesc LIKE '%'+ @ConsultantDesc +'%'))
	AND 
		a.Status =b.ConfigKey
	AND 
		b.ConfigKeyGroup='Consultants'
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author, Hoang.Nguyen>
-- Create date: <Create Date,2011.03.31,>
-- Description:	<Description,Get All User not exist in friend list,>
-- =============================================

CREATE PROCEDURE [dbo].[SearchAllNewFriendsByCurrentUserIdAndFullName]
	-- Add the parameters for the stored procedure here
	@UserID int,
	@FriendFullName nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT
		UserID,
		UserName,
		UserFullName,
		UserPicture,
		UserBirthday,
		UserGender,
		UserStatus
	FROM
		Users
	WHERE
		UserID NOT IN
		(
			SELECT
				FriendID
			FROM
				Friends
			WHERE
				UserID = @UserID
			AND
				Status = 'Agree'
		)
	AND
		UserID <> @UserID
	AND
		UserStatus IN
		(
			SELECT
				ConfigKeyValue
			FROM
				ConfigValues
			WHERE
				ConfigKeyGroup = 'Users'
			AND
				ConfigKey = 'Active'
		)
	AND
		((UserFullName IS NULL)OR(UserFullName LIKE +'%'+ @FriendFullName +'%'))
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Admin_SearchAllUsersByFullName] 
	@UserFullName nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		*, b.ConfigText as StatusText,e.EventParentName,e.EventParentID
	FROM 
		Users a , ConfigValues b,EventParents e
	WHERE
		((a.UserFullName IS NULL)OR(a.UserFullName LIKE +'%'+ @UserFullName +'%'))
	AND
		((a.UserStatus='New') OR (a.UserStatus='Active'))
	AND 
		a.UserStatus =b.ConfigKey
	AND 
		b.ConfigKeyGroup='Users' 
	AND
		a.UserEventParentID=e.EventParentID 
	ORDER BY 
		UserRegisterDate Desc
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetConfigValueByEventParentsGroup  
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM 
		ConfigValues 
	WHERE
		ConfigKeyGroup='EventParents' 

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all blogs,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllPhotos] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.*,b.ConfigText as StatusText,c.AlbumName 
	FROM 
		Photo a, ConfigValues b, Album c 
	Where 
		a.Status =b.ConfigKey 
	AND   
		ConfigKeyGroup='Photos'
	AND
		a.Status<>'Delete' 
	AND 
		a.Status<>'Dummy'
	AND 
		a.AlbumID=c.AlbumID
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all blogs,>
-- =============================================
Create PROCEDURE [dbo].[GetPhotoByID] 
	-- Add the parameters for the stored procedure here
	@PhotoID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.*,b.ConfigText as StatusText,c.AlbumName 
	FROM 
		Photo a, ConfigValues b, Album c 
	Where 
		a.Status =b.ConfigKey 
	AND   
		ConfigKeyGroup='Photos'
	AND
		a.Status<>'Delete' 
	AND 
		a.Status<>'Dummy'
	AND 
		a.AlbumID=c.AlbumID
	AND 
		a.PhotoID =@PhotoID
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetTopTreeConsulting]
AS
	select TOP(3)consul.*, config.ConfigText
	from dbo.Consultings consul, dbo.ConfigValues config
	where consul.Status='Visible'
	 and config.ConfigKeyGroup='Consultings' and config.ConfigKey=consul.Status
	ORDER BY DatePost DESC
	RETURN





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsersHaveBirthdayInCurrentMonth]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @CurrentDate DATETIME,
	@FirstDayOfMonth INT,
	@LastDayOfMonth INT
	SELECT @CurrentDate = GETDATE()
	SELECT @FirstDayOfMonth =(
	SELECT DAY(CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(@CurrentDate)-1),@CurrentDate),101)))
	SELECT @LastDayOfMonth =(
	SELECT DAY(CONVERT(VARCHAR(25),DATEADD(dd,-(DAY(DATEADD(mm,1,@CurrentDate))),DATEADD(mm,1,@CurrentDate)),101)))
	
	SELECT
		u.*, cv.ConfigText as StatusText,ep.EventParentName,ep.EventParentID
	FROM
		Users u, ConfigValues cv,EventParents ep
	WHERE
		Month(u.UserBirthday) = Month(@CurrentDate)
	AND
		Day(u.UserBirthday) BETWEEN Day(@FirstDayOfMonth)AND Day(@LastDayOfMonth)
	AND 
		u.UserStatus =cv.ConfigKey
	AND 
		cv.ConfigKeyGroup='Users' 
	and 
		u.UserEventParentID=ep.EventParentID
	ORDER BY 
		u.Userbirthday DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetConsultingsById]
	(
	@id int
	)
AS
	select consul.*, config.ConfigText
	from dbo.Consultings consul, dbo.ConfigValues config
	where consul.Status<>'Delete' and consul.Status<>'Dummy' and consul.ConsultingID=@id
	and config.ConfigKeyGroup='Consultings' and config.ConfigKey=consul.Status
	RETURN




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetConsultingStatus]	
AS
	select dbo.ConfigValues.ConfigKey, dbo.ConfigValues.ConfigText
	from dbo.ConfigValues
	where dbo.ConfigValues.ConfigKeyGroup='Consultings'
	RETURN

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetALLConsultings]
AS
	select consul.*, config.ConfigText
	from dbo.Consultings consul, dbo.ConfigValues config
	where consul.Status<>'Delete' and consul.Status<>'Dummy'
	 and config.ConfigKeyGroup='Consultings' and config.ConfigKey=consul.Status
	ORDER BY DatePost DESC
	RETURN





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Admin_AdvanceSearchByUsers] 
	-- Add the parameters for the stored procedure here
	@UserName nvarchar(50),
	@UserFullName nvarchar(100),
	@UserGender nvarchar(50),
	@UserPhone nvarchar(50),
	@UserEmail nvarchar(150),
	@UserAddCity nvarchar(150),
	@AgeFrom int,
	@AgeTo int,
	@UserHeight nvarchar(50),
	@UserWeight nvarchar(50),
	@UserFavColor nvarchar(100),
	@UserFavFoods nvarchar(200),
	@UserReadingBook nvarchar(250),
	@UserFavPet nvarchar(250),
	@UserPeopleLike nvarchar(250),
	@UserPeopleDislike nvarchar(250),
	@UserHobby nvarchar(250),
	@UserCareer nvarchar(50),
	@UserJobPosition nvarchar(50),
	@UserTimeContact nvarchar(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		a.*, b.ConfigText as StatusText,e.EventParentName,e.EventParentID 
	FROM
		Users a, ConfigValues b,EventParents e
	WHERE
		((a.UserName IS NULL)OR(a.UserName LIKE '%'+ @UserName +'%'))
	AND
		((a.UserFullName IS NULL)OR(a.UserFullName LIKE '%'+ @UserFullName +'%'))
	AND
		((a.UserGender IS NULL)OR(a.UserGender LIKE '%'+ @UserGender +'%'))
	AND	
		((a.UserEmail IS NULL)OR(a.UserEmail LIKE '%'+ @UserEmail +'%'))
	AND
		((a.UserAddCity IS NULL)OR(a.UserAddCity LIKE '%'+ @UserAddCity +'%'))
	AND
		(((@AgeTo = 0)OR (YEAR(a.UserBirthday) >= YEAR(GETDATE()) - @AgeTo)) AND ((@AgeFrom = 0) OR (YEAR(a.UserBirthday) <= YEAR(GETDATE()) - @AgeFrom)))
	AND
		((a.UserHeight IS NULL)OR(a.UserHeight LIKE '%'+ @UserHeight +'%'))
	AND
		((a.UserWeight IS NULL)OR(a.UserWeight LIKE '%'+ @UserWeight +'%'))
	AND
		((a.UserFavColor IS NULL)OR(a.UserFavColor LIKE '%'+ @UserFavColor +'%'))
	AND
		((a.UserFavFoods IS NULL)OR(a.UserFavFoods LIKE '%'+ @UserFavFoods +'%'))
	AND
		((UserReadingBook IS NULL)OR(UserReadingBook LIKE '%'+ @UserReadingBook +'%'))
	AND
		((UserFavPet IS NULL)OR(UserFavPet LIKE '%'+ @UserFavPet +'%'))
	AND
		((a.UserPeopleLike IS NULL)OR(a.UserPeopleLike LIKE '%'+ @UserPeopleLike +'%'))
	AND
		((a.UserPeopleDislike IS NULL)OR(a.UserPeopleDislike LIKE '%'+ @UserPeopleDislike +'%'))
	AND
		((a.UserHobby IS NULL)OR(a.UserHobby LIKE '%'+ @UserHobby +'%'))
	AND
		((a.UserCareer IS NULL)OR(a.UserCareer LIKE '%'+ @UserCareer +'%'))
	AND
		((a.UserJobPosition IS NULL)OR(a.UserJobPosition LIKE '%'+ @UserJobPosition +'%'))
	AND
		((a.UserTimeContact IS NULL)OR(a.UserTimeContact LIKE '%'+ @UserTimeContact +'%'))
	AND 
		a.UserStatus =b.ConfigKey
	AND 
		b.ConfigKeyGroup='Users' 
	and 
		a.UserEventParentID=e.EventParentID
	order by 
		a.UserRegisterDate Desc
	
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAlbumInfoById]	
	(
	@idAlbum int 
	)	
AS
	select al.*, us.UserFullName, con.ConfigText
	from dbo.Album al, dbo.Users us, dbo.ConfigValues con
	where al.Status<>'Delete' and al.Status<>'Dummy'	 
	 and al.UserId=us.UserID
	 and con.ConfigKeyGroup='Albums' and con.ConfigKey=al.Status
	 and al.AlbumID=@idAlbum
	RETURN

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author, Hoang.Nguyen>
-- Create date: <Create Date,2011.03.31,>
-- Description:	<Description,Get All User not exist in friend list,>
-- =============================================

CREATE PROCEDURE [dbo].[GetAllUsersCanMakeFriendsByCurrentUserID]
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT
		UserID,
		UserName,
		UserFullName,
		UserPicture,
		UserBirthday,
		UserGender,
		UserStatus
	FROM
		Users
	WHERE
		UserID NOT IN
		(
			SELECT
				FriendID
			FROM
				Friends
			WHERE
				UserID = @UserID
			AND
				Status = 'Agree'
		)
	AND
		UserID <> @UserID
	AND
		UserStatus IN
		(
			SELECT
				ConfigKeyValue
			FROM
				ConfigValues
			WHERE
				ConfigKeyGroup = 'Users'
			AND
				ConfigKey = 'Active'
		)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAlbumInfo]	
AS
	/* SET NOCOUNT ON */
	select al.*, us.UserFullName, con.ConfigText
	from dbo.Album al, dbo.Users us, dbo.ConfigValues con
	where	(( al.Status='New') OR (al.Status='Approve'))	 
	 and al.UserId=us.UserID
	 and con.ConfigKeyGroup='Albums' and con.ConfigKey=al.Status
	RETURN

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsers] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.*,b.ConfigText as StatusText, e.EventParentName,e.EventParentID 
	FROM 
		Users a,ConfigValues b,EventParents e
	WHERE
		a.UserStatus<>'Delete'
	AND 
		a.UserStatus<>'Dummy'
	AND 
		a.UserStatus =b.ConfigKey
	AND 
		b.ConfigKeyGroup='Users' 
	and 
		a.UserEventParentID=e.EventParentID
	order by 
		UserRegisterDate Desc
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all Coments,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMessageByID] 
	-- Add the parameters for the stored procedure here
	@MessageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Messages.*,ConfigValues.ConfigText as StatusText,
	a.UserName as UserNameSend,a.UserFullName as FullNameSend,
	b.UserName as UserNameReceipt,b.UserFullName as UserFullNameReceipt,
	a.UserPicture as UserPictureSend
	FROM 
		ConfigValues ,  
		dbo.Messages, 
		Users a, users b
	Where 
		Messages.Status =ConfigValues.ConfigKey 
	AND   
		ConfigKeyGroup='Messages'
	AND
		Messages.Status<>'Delete'
	AND
		Messages.Status<>'Dummy' 
	AND
		 dbo.Messages.FK_UserSendID = a.UserID
	AND 
		dbo.Messages.FK_UserReceiptID = b.UserID
	AND MessageID =@messageID

END







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all Coments,>
-- =============================================
Create PROCEDURE [dbo].[GetAllEventParents] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EventParents.*,ConfigValues.ConfigText as StatusText
	
	FROM 
		ConfigValues ,  
		dbo.EventParents
	Where 
		EventParents.Status =ConfigValues.ConfigKey 
	AND   
		ConfigKeyGroup='EventParents'
	AND
		EventParents.Status<>'Delete' 
	AND
		 dbo.EventParents.Status<>'Dummy'
	


END

--select * from Messages
--Users.UserName as UserNameReceipt,Users.UserFullName as UserFullNameReceipt







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all Coments,>
-- =============================================
Create PROCEDURE [dbo].[GetEventParentByID] 
	-- Add the parameters for the stored procedure here
	@eventParentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EventParents.*,ConfigValues.ConfigText as StatusText
	
	FROM 
		ConfigValues ,  
		dbo.EventParents
	Where 
		EventParents.Status =ConfigValues.ConfigKey 
	AND   
		ConfigKeyGroup='EventParents'
	AND
		EventParents.Status<>'Delete' 
	AND
		 dbo.EventParents.Status<>'Dummy'	
	AND
		[EventParentID]=@eventParentID

END

--select * from Messages
--Users.UserName as UserNameReceipt,Users.UserFullName as UserFullNameReceipt







GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAlbumStatus]	
AS
	select dbo.ConfigValues.ConfigKey, dbo.ConfigValues.ConfigText
	from dbo.ConfigValues
	where dbo.ConfigValues.ConfigKeyGroup='Albums'
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByID]
	-- Add the parameters for the stored procedure here
	@userID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.*,b.ConfigText as StatusText,e.EventParentName
	FROM 
		Users a,ConfigValues b,EventParents e
	WHERE
		
		a.UserStatus<>'Delete'
	AND 
		a.UserStatus<>'Dummy'
	AND 
		a.UserStatus =b.ConfigKey
	AND 
		b.ConfigKeyGroup='Users' 
	AND 
		a.UserID=@userID
	AND 
		a.UserEventParentID=e.EventParentID
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetBlogByID] 
	-- Add the parameters for the stored procedure here
	@blogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
--	Select * from Blog 
--	Where [BlogID]=@blogID
SELECT a.*,b.ConfigText as StatusText,c.UserName,c.UserFullName 
	FROM 
		ConfigValues b, Users c 
	INNER JOIN 
		Blog a 
	ON 
		a.UserID=c.UserID 
	Where 
		a.BlogID=@blogID
	AND
		a.Status =b.ConfigKey 
	AND   
		ConfigKeyGroup='Blogs'
	AND
		a.Status<>'Delete' 
	AND 
		a.Status<>'Dummy'
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetStatusByConsultantsGroup 
	-- Add the parameters for the stored procedure here
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM ConfigValues
	Where [ConfigKeyGroup]='Consultants'
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all blogs,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllBlogs] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT a.*,b.ConfigText as StatusText,c.UserName,c.UserFullName 
	FROM 
		ConfigValues b, Users c 
	INNER JOIN 
		Blog a 
	ON 
		a.UserID=c.UserID 
	Where 
		a.Status =b.ConfigKey 
	AND   
		ConfigKeyGroup='Blogs'
	AND
		a.Status<>'Delete'
	AND
		a.Status<>'Dummy'
--	AND 
--	c.UserStatus<>'Delete'
END





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all Coments,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllMessages] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Messages.*,ConfigValues.ConfigText as StatusText,
	a.UserName as UserNameSend,a.UserFullName as FullNameSend,
	b.UserName as UserNameReceipt,b.UserFullName as UserFullNameReceipt
	FROM 
		ConfigValues ,  
		dbo.Messages, 
		Users a, users b
	Where 
		Messages.Status =ConfigValues.ConfigKey 
	AND   
		ConfigKeyGroup='Messages'
	AND
		Messages.Status<>'Delete'
	AND
		Messages.Status<>'Dummy' 
	AND
		 dbo.Messages.FK_UserSendID = a.UserID
	AND 
		dbo.Messages.FK_UserReceiptID = b.UserID
	ORDER BY MessageDatetime DESC


END









GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCommentByID]
	-- Add the parameters for the stored procedure here
	@commentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Comment.*,ConfigValues.ConfigText as StatusText,Users.UserName,Users.UserFullName, 
	Blog.BlogTitle,Events.EventName
	FROM 
		ConfigValues ,dbo.Blog ,dbo.Users,dbo.Comment,dbo.Events
	 
	Where 
		Comment.Status =ConfigValues.ConfigKey 
	AND   
		ConfigKeyGroup='Comments'
	AND
		Comment.Status<>'Delete' 
	AND 
		Comment.Status<>'Dummy'
	AND
	 Comment.CommentID=@commentID
  AND
		dbo.Blog.BlogID = dbo.Comment.BlogID 
	AND 
		dbo.Users.UserID = dbo.Comment.UserID 
	AND
		dbo.Comment.EventID = dbo.Events.EventID
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all Coments,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllComments] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Comment.*,ConfigValues.ConfigText as StatusText,Users.UserName,Users.UserFullName, 
	Blog.BlogTitle,Events.EventName
	FROM 
		ConfigValues , dbo.Users,dbo.Blog ,Comment,Events
	Where 
		Comment.Status =ConfigValues.ConfigKey 
	AND   
		ConfigKeyGroup='Comments'
	AND
		Comment.Status<>'Delete' 
	AND 
		Comment.Status<>'Dummy'
	AND 
		dbo.Blog.BlogID = dbo.Comment.BlogID 
	AND 
		dbo.Users.UserID = dbo.Comment.UserID 
    AND
		dbo.Comment.EventID = dbo.Events.EventID



END









GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all Coments,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllBlogsByUserID]
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Blog.*,ConfigValues.ConfigText as StatusText,
	a.UserName ,a.UserFullName
	FROM 
		ConfigValues ,  
		dbo.Blog, 
		Users a
	Where 
		Blog.Status =ConfigValues.ConfigKey 
	AND   
		ConfigKeyGroup='Blogs'
	AND
		Blog.Status<>'Delete'
	AND
		Blog.Status<>'Dummy' 
	AND
		 dbo.Blog.UserID = a.UserID
	AND
		dbo.Blog.UserID =@UserID
ORDER BY Datepost DESC

END











GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		<Author,,thienhong>
-- Create date: <Create Date,20111603,>
-- Description:	<Description,Get all Coments,>
-- =============================================
Create PROCEDURE [dbo].[GetAllCommentsOrderByDatePost] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Comment.*,ConfigValues.ConfigText as StatusText,Users.UserName,Users.UserFullName, 
	Blog.BlogTitle,Events.EventName
	FROM 
		ConfigValues , dbo.Users,dbo.Blog ,Comment,Events
	Where 
		Comment.Status =ConfigValues.ConfigKey 
	AND   
		ConfigKeyGroup='Comments'
	AND
		Comment.Status<>'Delete' 
	AND 
		Comment.Status<>'Dummy'
	AND 
		dbo.Blog.BlogID = dbo.Comment.BlogID 
	AND 
		dbo.Users.UserID = dbo.Comment.UserID 
    AND
		dbo.Comment.EventID = dbo.Events.EventID

	ORDER BY DatePost Desc

END










GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetAllAlbumByUserID
@userID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM ALBUM
	WHERE 
		ALBUMID =@userID
	AND
		STATUS<>'Delete'
	AND
		STATUS<>'Dummy'
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAlbumShareByUser]	
	(
	@idUser int 
	)	
AS
	/* SET NOCOUNT ON */
	select al.*
	from dbo.Album al
	where al.UserId=@idUser and al.AlbumType='Share' and al.Status<>'Delete' and al.Status<>'Dummy'
	RETURN

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[GetTopFiveAlbumAndPhotoByUserID]
	@UserID int
AS
	/* SET NOCOUNT ON */
	select top(5) al.AlbumID, al.AlbumName,al.AlbumDate, min(pho.PhotoPath)as PhotoPath
	from dbo.Album al, dbo.Photo pho
	where al.AlbumID=pho.AlbumID and al.Status<>'Delete' AND al.Status<>'Dummy'
	AND al.UserID=@UserID
	group by al.AlbumID, al.AlbumName,al.AlbumDate 
	order by al.AlbumDate desc
	RETURN






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPhotoByUser]
	(
	@idUser int 
	)
AS
	/* SET NOCOUNT ON */
	select pho.*
	from dbo.Photo pho, dbo.Album al
	where pho.AlbumID = al.AlbumID and pho.Status<>'Delete' and pho.Status<>'Dummy'
	and al.UserID=@idUser
	RETURN

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmailConfigSupport]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT OSEmailTo1,OSEmailTo2,OSEmailFrom,OSPwdEmailFrom,OSPort,OSHost
	FROM OlineSupport WHERE IsActive=1
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Hoang.nguyen>
-- Create date: <Create Date,2011.03.20,>
-- Update date: <Update Date, 2011.04.04>
-- Description:	<Description,Get all friends of current user by user id,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllFriendsOfCurrentUserByID]
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		UserID as UserIdOfFriend,
		UserName as UserNameOfFriend,
		UserFullName as FullNameOfFriend,
		UserPicture as PictureOfFriend
	FROM
		Users
	WHERE
	(
		UserID IN
		(
			SELECT
				FriendID
			FROM
				Friends
			WHERE
				UserID = @UserID
			AND
				Status = 'Agree'
		)
	OR
		UserID IN
		(
			SELECT
				UserID
			FROM
				Friends
			WHERE
				FriendID = @UserID
			AND
				Status = 'Agree'
		)
	)

END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Hoang.Nguyen>
-- Create date: <Create Date,2011.03.29>
-- Description:	<Description,Search friends in list>
-- =============================================
CREATE PROCEDURE [dbo].[SearchAllFriendsOfCurrentUserIdByFullName]
	-- Add the parameters for the stored procedure here
	@UserID int, 
	@FriendFullName nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		UserID as UserIdOfFriend,
		UserName as UserNameOfFriend,
		UserFullName as FullNameOfFriend,
		UserPicture as PictureOfFriend
	FROM
		Users
	WHERE
	(
		UserID IN
		(
			SELECT
				FriendID
			FROM
				Friends
			WHERE
				UserID = @UserID
			AND
				Status = 'Agree'
		)
	OR
		UserID IN
		(
			SELECT
				UserID
			FROM
				Friends
			WHERE
				FriendID = @UserID
			AND
				Status = 'Agree'
		)
	)
	AND
		((UserFullName IS NULL)OR(UserFullName LIKE +'%'+ @FriendFullName +'%'))
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Hoang.nguyen>
-- Create date: <Create Date,2011.03.20,>
-- Update date: <Update Date, 2011.04.04>
-- Description:	<Description,Get all friends of current user by user id,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsersIWantToMakeFriends]
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		UserID,
		UserName,
		UserFullName,
		UserPicture,
		UserBirthday,
		UserGender,
		UserStatus
	FROM
		Users
	WHERE
	(
		UserID IN
		(
			SELECT
				FriendID
			FROM
				Friends
			WHERE
				UserID = @UserID
			AND
				Status = 'New'
		)
	)

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteFriendFromFriendsList]
	-- Add the parameters for the stored procedure here
	@iUserID int,
	@iFriendID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(SELECT UserID FROM Friends WHERE UserID = @iUserID AND FriendID = @iFriendID AND Status = 'Agree') > 0
		UPDATE
			Friends
		SET
			Status = 'Delete'
		WHERE
			UserID = @iUserID
		AND
			FriendID = @iFriendID
	ELSE IF (SELECT UserID FROM Friends WHERE UserID = @iFriendID AND FriendID = @iUserID AND Status = 'Agree') > 0
		UPDATE
			Friends
		SET
			Status = 'Delete'
		WHERE
			UserID = @iFriendID
		AND
			FriendID = @iUserID
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Hoang.nguyen>
-- Create date: <Create Date,2011.03.20,>
-- Update date: <Update Date, 2011.04.04>
-- Description:	<Description,Get all friends of current user by user id,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsersWantToMakeFriendsWithMe]
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		u.UserID as UserIdOfFriend,
		u.UserName as UserNameOfFriend,
		u.UserFullName as UserFullNameOfFriend,
		u.UserPicture as UserPictureOfFriend,
		u.UserBirthday as UserBirthdayOfFriend,
		u.UserGender as UserGenderOfFriend,
		f.Description
	FROM
		Users as u,
		Friends as f
	WHERE
	(
		u.UserID IN
		(
			SELECT
				f.UserID
			FROM
				Friends
			WHERE
				f.FriendID = @UserID
			AND
				f.Status = 'New'
		)
	)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStatusToFriends]
	-- Add the parameters for the stored procedure here
	@iUserID int,
	@iFriendID int,
	@Status nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF (SELECT UserID FROM Friends WHERE UserID = @iFriendID AND FriendID = @iUserID AND Status = 'New') > 0
		UPDATE
			Friends
		SET
			Status = @Status
		WHERE
			UserID = @iFriendID
		AND
			FriendID = @iUserID
	ELSE
		PRINT 'Không tìm thấy người bạn này trong danh sách'
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author, Hoang.Nguyen>
-- Create date: <Create Date,2011.03.31,>
-- Description:	<Description,Get All User not exist in friend list,>
-- =============================================

CREATE PROCEDURE [dbo].[UserExistInFriendsList]
	-- Add the parameters for the stored procedure here
	@CurrentUserID int,
	@UserID int,
	@UserStatus nvarchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT
		*
	FROM
		Friends
	WHERE
		(((UserID = @CurrentUserID) AND (FriendID = @UserID))
		OR
		((UserID = @UserID) AND (FriendID = @CurrentUserID)))
	AND
		Status = @UserStatus
	
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllFriendsByUserID]
@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		Friends.*,
		Users.UserName as UserNameOfFriend,
		Users.UserFullName as FullNameOfFriend,
		Users.UserPicture as PictureOfFriend
	FROM
		Friends,
		Users
	Where
		Friends.UserID = @UserID
	AND
		Friends.FriendID = Users.UserID
	AND
		Friends.Status = 'Agree'

END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteVIPVideo]
	-- Add the parameters for the stored procedure here
@VipVideoID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update VIPVideo
	Set [Status]='Delete'
	where 
			VipVideoID=@VipVideoID 
	
END





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllShareVideo]
AS
	/* SET NOCOUNT ON */
	select *
from dbo.VIPVideo v, dbo.Users u
where v.UserID = u.UserID and v.Status='Visible'
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetShareVideo]
	(
	@idUser int 
	)
AS
	/* SET NOCOUNT ON */
select *
from dbo.VIPVideo v, dbo.Users u
where v.UserID = u.UserID and v.VideoPartnerID = @idUser and v.Status='Visible'
	RETURN


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Member_SearchAllMessageByTitle]
	-- Add the parameters for the stored procedure here
	@UserReceiptID int,
	@MessageTitle nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		us.UserName,
		us.UserFullName,
		us.UserPicture,
		ms.*
	FROM
		Messages ms, Users us
	WHERE
		FK_UserReceiptID = @UserReceiptID
	AND
		((Status='Approve') OR(Status='New'))
	AND
		 ms.FK_UserSendID = us.UserID
	AND
		((MessageTitle IS NULL)OR(MessageTitle LIKE +'%'+ @MessageTitle +'%'))
	
		ORDER BY MessageDatetime DESC
END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetTopNewCommentRelationByCommentID
@CommentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	TOP(3)cmt.CommentID,cmt.CommentContent,cmt.CommentParentID,cmt.Datepost,
			us.UserID,us.UserFullName,us.UserPicture 
	FROM 
			Comment cmt,Users us
	Where 
			CommentParentID=@CommentID
	AND 
			((Status='Approve') OR(cmt.Status='New' ))
	AND 
			CommentType='Wall'
	AND
			cmt.UserID=us.UserID
	ORDER BY cmt.Datepost DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetAdminByName
@UserName nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Admin 
	Where 
			UserName=@UserName
	
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTopCommentTypicalEvent] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT    TOP(3)dbo.Comment.*, dbo.Events.EventName, dbo.Users.UserPicture, dbo.Users.UserFullName
FROM      Users, dbo.Comment INNER JOIN
                      dbo.Events ON dbo.Comment.EventID = dbo.Events.EventID
                      
	WHERE 
			 dbo.Events.Status='Visible'
	AND
			((Comment.Status='Approve')OR(Comment.Status='New'))
	AND		
			dbo.Comment.IsTypical=1
	AND	
			dbo.Comment.UserID = dbo.Users.UserID

	order by Comment.DatePost Desc
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCommentsByBlogID]
@BlogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Comment 
	Where 
			((Comment.Status='Approve') OR(Comment.Status='New'))
	AND		
			Comment.BlogID=@BlogID

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllCommentByWall]
@UserWall int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT cmt.CommentID,cmt.CommentContent,cmt.CommentParentID,cmt.Datepost,
			us.UserID,us.UserFullName,us.UserPicture 
	FROM 
			Comment cmt,Users us
	Where 
			cmt.UserWall=@UserWall
	AND 
			((cmt.Status='Approve')OR (cmt.Status='New'))
	AND		
			cmt.CommentType='Wall'
	And		
			cmt.UserID=us.UserID
	AND		
			cmt.CommentParentID=(Select CommentID FROM Comment WHERE Status='Dummy')
	
			ORDER BY Datepost DESC
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DeleteCommentRelation 
	@commentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete Comment where commentID =@commentID OR commentParentID=@commentID
END

GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Blog] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([BlogID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Blog]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Comment] FOREIGN KEY([CommentParentID])
REFERENCES [dbo].[Comment] ([CommentID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Comment]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Events] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([EventID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Events]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Album] FOREIGN KEY([FK_AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Album]
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_Album] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_Album]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Users]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Users]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users] FOREIGN KEY([FK_UserSendID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users1] FOREIGN KEY([FK_UserReceiptID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users1]
GO
ALTER TABLE [dbo].[VIPVideo]  WITH CHECK ADD  CONSTRAINT [FK_VIPVideo_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[VIPVideo] CHECK CONSTRAINT [FK_VIPVideo_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_EventParents] FOREIGN KEY([UserEventParentID])
REFERENCES [dbo].[EventParents] ([EventParentID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_EventParents]
GO
