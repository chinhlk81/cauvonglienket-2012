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
SET IDENTITY_INSERT [dbo].[Consultants] ON 

GO
INSERT [dbo].[Consultants] ([ConsultantID], [Status], [ConsultantName], [ConsultantEmail], [ConsultantPhone], [ConsultantYahooID], [ConsultantSkypeID], [ConsultantPicture], [ConsultantDesc]) VALUES (6, N'Dummy', N'--Chọn--', NULL, N'', N'', N'', N'', N'')
GO
INSERT [dbo].[Consultants] ([ConsultantID], [Status], [ConsultantName], [ConsultantEmail], [ConsultantPhone], [ConsultantYahooID], [ConsultantSkypeID], [ConsultantPicture], [ConsultantDesc]) VALUES (7, N'Visible', N'Nguyễn Ngọc Tuấn', N'red_pepper01@yahoo.com', N'0935894123', N'red_pepper01', N'ngoc.tuan', N'../../Images/Consultants/e4.jpg', N'Nhân viên kỳ cựu')
GO
INSERT [dbo].[Consultants] ([ConsultantID], [Status], [ConsultantName], [ConsultantEmail], [ConsultantPhone], [ConsultantYahooID], [ConsultantSkypeID], [ConsultantPicture], [ConsultantDesc]) VALUES (12, N'Visible', N'Nguyễn Kim Ngọc', N'kimngoc@cvlk.com', N'0908234567', N'kimngoc', N'kimngoc', N'../../Images/Consultants/Tulips.jpg', N'Nhân viên tư vấn giỏi')
GO
INSERT [dbo].[Consultants] ([ConsultantID], [Status], [ConsultantName], [ConsultantEmail], [ConsultantPhone], [ConsultantYahooID], [ConsultantSkypeID], [ConsultantPicture], [ConsultantDesc]) VALUES (19, N'Visible', N'Mai Thanh ', N'maithanh@cvlk.com', N'090578945', N'maithanh', N'mai.thanh', N'../../Images/Consultants/HQ1.jpg', N'Cộng tác viên')
GO
INSERT [dbo].[Consultants] ([ConsultantID], [Status], [ConsultantName], [ConsultantEmail], [ConsultantPhone], [ConsultantYahooID], [ConsultantSkypeID], [ConsultantPicture], [ConsultantDesc]) VALUES (21, N'Delete', N'Triệu Vi', N'trieuvi@cvlk.com', N'45465544', N'trieuvi_yahoo', N'trieuvi_sky', N'../../Images/Consultants/dautroc.png', N'diễn viên điện ảnh')
GO
INSERT [dbo].[Consultants] ([ConsultantID], [Status], [ConsultantName], [ConsultantEmail], [ConsultantPhone], [ConsultantYahooID], [ConsultantSkypeID], [ConsultantPicture], [ConsultantDesc]) VALUES (22, N'Visible', N'Thanh Hương', N'thanh_huong@cvlk.com', N'01224510101', N'thanh_huong', N'thanh_huong', N'../../Images/Consultants/huong.jpg', N'Người đẹp tư vấn')
GO
SET IDENTITY_INSERT [dbo].[Consultants] OFF
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
SET IDENTITY_INSERT [dbo].[ConfigValues] ON 

GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (1, N'Visible', N'Visible', N'Hiển thị', N'Hiển thị', N'Consultants', 1)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (2, N'Invisible', N'Invisible', N'Ẩn', N'ẩn', N'Consultants', 2)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (6, N'New', N'New', N'Mới', N'Mới', N'Blogs', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (7, N'Approve', N'Approve', N'Duyệt', N'Duyệt', N'Blogs', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (8, N'UnApprove', N'UnApprove', N'Không duyệt', N'Không duyệt', N'Blogs', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (10, N'New', N'New', N'Mới', N'Mới', N'Comments', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (11, N'Approve', N'Approve', N'Duyệt', N'Duyệt', N'Comments', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (12, N'UnApprove', N'UnApprove', N'Không duyệt', N'Không duyệt', N'Comments', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (15, N'New', N'New', N'Mới', N'Mới', N'Messages', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (16, N'Approve', N'Approve', N'Duyệt', N'Duyệt', N'Messages', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (17, N'UnApprove', N'UnApprove', N'Không duyệt', N'Không duyệt', N'Messages', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (19, N'Active', N'Active', N'Hoạt động', N'Hoạt động', N'Users', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (20, N'New', N'New', N'Mới', N'Mới', N'Users', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (24, N'Visible', N'Visible', N'Hiển thị', N'Hiện thị', N'EventParents', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (25, N'Invisible', N'Invisible', N'Ẩn', N'Ẩn', N'EventParents', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (30, N'Approve', N'Approve', N'Duyệt', N'Duyệt', N'Albums', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (31, N'UnApprove', N'UnApprove', N'Không duyệt', N'Không duyệt', N'Albums', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (32, N'Approve', N'Approve', N'Duyệt', N'Duyệt', N'Photos', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (33, N'UnApprove', N'UnApprove', N'Không duyệt', N'Không duyệt', N'Photos', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (34, N'Visible', N'Visible', N'Hiển thị', N'Hiển thị', N'Consultings', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (35, N'Invisible', N'Invisible', N'Ẩn', N'Ẩn', N'Consultings', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (36, N'Disagree', N'Disagree', N'Không đồng ý', N'Không đồng ý', N'Friends', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (37, N'Agree', N'Agree', N'Đồng ý', N'Đồng ý', N'Friends', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (39, N'New', N'New', N'Mới', N'Mới', N'Photos', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (41, N'New', N'New', N'Mới', N'Mới', N'Friends', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (42, N'Approve', N'Approve', N'Duyệt', N'Duyệt', N'Friends', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (43, N'UnApprove', N'UnApprove', N'Không duyệt', N'Không duyệt', N'Friends', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (44, N'New', N'New', N'Mới', N'Mới', N'Albums', NULL)
GO
INSERT [dbo].[ConfigValues] ([ConfigValueID], [ConfigKey], [ConfigKeyValue], [ConfigText], [ConfigKeyDesc], [ConfigKeyGroup], [ConfigValueSortOrder]) VALUES (45, N'DeActivate', N'DeActivate', N'Không hoạt động', N'Không hoạt động', N'Users', NULL)
GO
SET IDENTITY_INSERT [dbo].[ConfigValues] OFF
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
SET IDENTITY_INSERT [dbo].[MenuConfigs] ON 

GO
INSERT [dbo].[MenuConfigs] ([MenuConfigID], [MenuConfigName], [MenuNo], [Contents]) VALUES (2, N'Quy định sử dụng', N'Regulations', N'<div class="content_menu">
<p style="text-align: justify;">Để tham gia v&agrave;o  c&aacute;c cuộc chơi, bạn phải l&agrave; th&agrave;nh vi&ecirc;n của Cầu Vồng Li&ecirc;n Kết từ 25 tuổi  trở l&ecirc;n v&agrave; c&oacute; khả năng l&agrave;m chủ bản th&acirc;n. Người đến tham dự phải ăn mặc  lịch sự v&agrave; thể hiện phong c&aacute;ch sống văn minh.</p>
<ol>
    <li style="text-align: justify;">Để tham dự buổi hẹn n&agrave;o, bạn post  đơn đăng k&yacute; v&agrave;o topic tổ chức buổi hẹn đ&oacute;. Đơn đăng k&yacute; chỉ c&oacute; t&aacute;c dụng  &quot;giữ chỗ&quot; cho bạn. Chỉ cần viết &quot;T&ocirc;i xin đăng k&yacute;&quot; v&agrave; đ&oacute;ng ph&iacute; l&agrave; đủ.</li>
    <li style="text-align: justify;">Sau khi đ&atilde; đủ th&agrave;nh vi&ecirc;n tham gia  hoặc đến thời gian quy định, cuộc &ldquo;phi&ecirc;u lưu&rdquo; sẽ bắt đầu. Khi đ&oacute;, bạn sẽ  c&oacute; cơ hội tiếp x&uacute;c với những th&agrave;nh vi&ecirc;n c&ugrave;ng sở th&iacute;ch, v&agrave; bắt đầu l&agrave;m  chủ cuộc hẹn của ch&iacute;nh m&igrave;nh. Mỗi th&agrave;nh vi&ecirc;n sẽ được tiếp x&uacute;c v&agrave; lựa chọn  cho m&igrave;nh một &ldquo;người bạn&rdquo; th&iacute;ch hợp để tr&ograve; chuyện, giao lưu. Mỗi lượt  tiếp x&uacute;c l&agrave; 05 ph&uacute;t.</li>
    <li style="text-align: justify;">Khi kết th&uacute;c buổi hẹn h&ograve;, phiếu  thăm d&ograve; đ&iacute;nh k&egrave;m trong sổ tay ph&aacute;t cho người tham dự cuộc hẹn sẽ được  thu lại để Rainbow Link x&aacute;c định người th&iacute;ch hợp với bạn nhất v&agrave; tổ chức  lần hẹn tiếp.</li>
    <li style="text-align: justify;">Tất cả những phiếu thăm d&ograve; m&agrave; chưa  đạt y&ecirc;u cầu đều được Rainbow Link thỏa thuận cho một cuộc hẹn lần sau  với những th&agrave;nh vi&ecirc;n kh&aacute;c chi ph&iacute; thấp hơn lần đầu ti&ecirc;n.</li>
    <li style="text-align: justify;">Những người đến tham dự cuộc hẹn do  Rainbow Link tổ chức sẽ được tham dự tr&ograve; chơi R&uacute;t thăm tr&uacute;ng thưởng.  Phần thưởng l&agrave; những tặng phẩm vui nhộn v&agrave; c&oacute; &yacute; nghĩa.</li>
    <li style="text-align: justify;">Để cuộc phi&ecirc;u lưu th&ecirc;m phần ngộ  nghĩnh cũng như an to&agrave;n, Rainbowlink nhắc nhở bạn kh&ocirc;ng n&ecirc;n trao đổi  những th&ocirc;ng tin mang t&iacute;nh đặc th&ugrave; c&aacute; nh&acirc;n với những th&agrave;nh vi&ecirc;n c&ugrave;ng tham  gia.</li>
</ol>
<p style="text-align: justify;"><br />
<strong>Lưu &yacute;,&nbsp; sau đ&acirc;y l&agrave; những quy định m&agrave; th&agrave;nh vi&ecirc;n phải thực hiện để tham gia buổi hẹn: </strong><br />
-&nbsp;&nbsp;&nbsp; Trang phục đ&uacute;ng đắn, <br />
-&nbsp;&nbsp;&nbsp; Kh&ocirc;ng c&oacute; cử chỉ v&agrave; h&agrave;nh vi khiếm nh&atilde;, bất lịch sự,<br />
-&nbsp;&nbsp;&nbsp; Kh&ocirc;ng sử dụng c&aacute;c chất k&iacute;ch th&iacute;ch, bia rượu trước v&agrave; trong khi tham gia,<br />
-&nbsp;&nbsp;&nbsp; Đ&acirc;y l&agrave; buổi gặp mặt l&agrave;nh mạnh v&agrave; bổ &iacute;ch. <span style="color: rgb(255, 0, 0);">Rainbow  Link nghi&ecirc;m cấm c&aacute;c th&agrave;nh vi&ecirc;n tham dự lợi dụng cuộc chơi n&agrave;y để thực  hiện h&agrave;nh vi m&ocirc;i giới mại d&acirc;m dưới mọi h&igrave;nh thức, hoặc c&aacute;c h&agrave;nh vi kh&aacute;c  ngo&agrave;i thể lệ tr&ograve; chơi m&agrave; vi phạm ph&aacute;p luật.<br />
-&nbsp;&nbsp;&nbsp; Rainbow Link chỉ chịu tr&aacute;ch nhiệm về c&aacute;c h&agrave;nh vi  hoạt động trong khi tham gia cuộc chơi, mọi h&agrave;nh vi xảy ra ngo&agrave;i cuộc  chơi n&agrave;y Rainbow Link kh&ocirc;ng chịu tr&aacute;ch nhiệm.</span></p>
</div>')
GO
INSERT [dbo].[MenuConfigs] ([MenuConfigID], [MenuConfigName], [MenuNo], [Contents]) VALUES (4, N'Liên hệ', N'Contact', N'<p style="text-align: center;"><strong>Cầu Vồng Li&ecirc;n Kết</strong> lu&ocirc;n nổ                          lực v&agrave; cố gắng để đ&aacute;p ứng ở mức cao nhất nhu cầu của th&agrave;nh vi&ecirc;n. Nếu bạn                          c&oacute; bất kỳ thắc mắc hoặc kh&oacute; khăn trong qu&aacute; tr&igrave;nh sử dụng dịch vụ, đừng                          ngại li&ecirc;n hệ với ch&uacute;ng t&ocirc;i.</p>
<div style="color: rgb(59, 89, 152); font-weight: bold; text-align: center;">C&ocirc;ng ty TNHH Một Th&agrave;nh Vi&ecirc;n Cầu Vồng Li&ecirc;n Kết</div>
<p style="text-align: center;">Địa chỉ: 143/22 Ung Văn Khi&ecirc;m, phường 25, Q. B&igrave;nh Thạnh - HCM <br />
Điện thoại: (+84)08.<strong>62.58.7531</strong> - (+84)08.<strong>62.58.7532</strong> - (+84)08.<strong>62.58.7536</strong><br />
Fax: (+84)08.<strong>62.58.7534</strong></p>
<p style="text-align: center;"><strong>Chi nh&aacute;nh tại US</strong><br />
Địa chỉ: 35051 Yucaipa blvd  Ste A Yucaipa, Ca 92399<br />
Điện thoại:  909-790-0022 - Fax: 909-790-1818.</p>
<p style="text-align: center;">Email: <strong>Info@cauvonglienket.com.</strong></p>')
GO
INSERT [dbo].[MenuConfigs] ([MenuConfigID], [MenuConfigName], [MenuNo], [Contents]) VALUES (5, N'Giới thiệu', N'Introduction', N'<p><span style="font-size: 12px;">&nbsp;  <strong>Thế kỷ 21</strong>- thế kỷ của những con người th&agrave;nh đạt, với 8 tiếng mỗi ng&agrave;y  v&agrave; 5 ng&agrave;y mỗi tuần, người ta ti&ecirc;u tốn 25% thời gian cho c&ocirc;ng việc, 33%  để nghỉ ngơi, 10 &ndash; 20 % để trau dồi kiến thức v&agrave; chưa đến 1/3 cuộc đời  cho c&aacute;c hoạt động kh&aacute;c bao gồm cả việc t&igrave;m kiếm bạn đời.</span></p>
<p style="text-align: justify;"><span style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;  Tỷ lệ người độc th&acirc;n tăng cao dẫn đến mất c&acirc;n bằng d&acirc;n số, đ&atilde; v&agrave; đang  l&agrave; vấn nạn chung của hầu hết c&aacute;c nước tr&ecirc;n thế giới. Đa số họ c&oacute; mong  muốn kết h&ocirc;n nhưng kh&ocirc;ng c&ograve;n kịp nữa v&igrave; những năm th&aacute;ng tuổi trẻ đ&atilde; d&agrave;nh  hết cho học h&agrave;nh, c&ocirc;ng việc, sự nghiệp. Lịch học tập v&agrave; cường độ l&agrave;m  việc qu&aacute; căng thẳng khiến họ kh&ocirc;ng c&oacute; thời gian hẹn h&ograve; hoặc kh&ocirc;ng c&oacute;  điều kiện tiếp x&uacute;c với những tu&yacute;p người m&igrave;nh mong muốn. Đặc biệt l&agrave; sự  b&ugrave;ng nổ Internet cũng ảnh hưởng kh&ocirc;ng nhỏ đến tỷ lệ độc th&acirc;n v&igrave; người ta  thường bị cuốn h&uacute;t v&agrave;o thế giới ảo tr&ecirc;n m&agrave;n h&igrave;nh m&aacute;y t&iacute;nh thay v&igrave; bước  ra khỏi nh&agrave; v&agrave; gặp gỡ những mối quan hệ s&acirc;u sắc thực sự. Liệu những cuộc  hẹn h&ograve; &ldquo;ảo&rdquo; c&oacute; thể đem đến hạnh ph&uacute;c v&agrave; giải quyết vấn nạn độc th&acirc;n  hiện nay? </span></p>
<p style="text-align: center;"><span style="font-size: 12px;"><img width="500" height="255" alt="H&igrave;nh ảnh một buổi gặp gỡ của Cầu Vồng Li&ecirc;n Kết" src="http://cauvonglienket.com/upload/myupload/hinhanh_off.jpg" /><br />
<em>H&igrave;nh ảnh một buổi gặp gỡ trong chương tr&igrave;nh 5 ph&uacute;t hẹn h&ograve;</em></span></p>
<p style="text-align: justify;"><span style="font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp; &ldquo;<em>Đẹp như rối, kh&ocirc;ng mối kh&ocirc;ng xong</em>&rdquo;  - Trong tập tục từ xa xưa của văn h&oacute;a phương Đ&ocirc;ng, B&agrave; mai đ&atilde; đ&oacute;ng một  vai tr&ograve; quan trọng kh&ocirc;ng thể thiếu trong việc kết đ&ocirc;i. B&agrave; mai ch&iacute;nh l&agrave;  người dẫn lối đưa đường cho những người c&oacute; nguyện vọng t&igrave;m người t&acirc;m  đồng &yacute; hợp đến với nhau, gh&eacute;p nối những những mối tơ duy&ecirc;n đẹp đẽ, m&ocirc;n  đăng hộ đối. Ng&agrave;y nay con người hiện đại c&oacute; lối sống độc lập hơn, kh&ocirc;ng  lệ thuộc v&agrave;o lề lối tập tục xưa, vai tr&ograve; của b&agrave; mai cũng kh&aacute;c đi hẳn.  Th&aacute;ng 7 năm 2009 Cầu Vồng Li&ecirc;n Kết ra đời với vai tr&ograve; l&agrave; một <strong>B&agrave; mai hiện đại</strong> với t&acirc;m nguyện được l&agrave;m &ldquo;&ocirc;ng Tơ b&agrave; Nguyệt&rdquo; mang đến cho bạn nhiều cơ hội mới trong t&igrave;nh duy&ecirc;n.<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp; Mỗi người đều c&oacute; &quot;một nửa&quot; d&agrave;nh cho m&igrave;nh tr&ecirc;n  thế giới n&agrave;y, một số người may mắn gặp được nửa ấy từ rất sớm, một số  người phải t&igrave;m kiếm v&agrave; chờ đợi thật l&acirc;u. V&igrave; thế, Cầu Vồng Li&ecirc;n Kết lu&ocirc;n  muốn g&oacute;p sức se sợi tơ hồng để gắn kết, để h&agrave;nh tr&igrave;nh đi t&igrave;m một nửa của  bạn sẽ dễ d&agrave;ng hơn. Nếu một ng&agrave;y chợt dừng ch&acirc;n tr&ecirc;n đường đời, bạn cảm  thấy cần chia sẻ v&agrave; muốn t&igrave;m một nửa y&ecirc;u thuơng của m&igrave;nh, h&atilde;y đến với  ch&uacute;ng t&ocirc;i. Cầu Vồng Li&ecirc;n Kết rất muốn được l&agrave; nơi nghỉ ch&acirc;n ấm &aacute;p v&agrave; sẵn  s&agrave;ng đồng h&agrave;nh để những bước ch&acirc;n tiếp theo của bạn kh&ocirc;ng c&ograve;n lẻ loi,  thay v&agrave;o đ&oacute; l&agrave; một nhịp điệu mới, một sức sống mới.<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp; <strong>Cầu Vồng Li&ecirc;n Kết</strong> sẽ thường  xuy&ecirc;n tổ chức c&aacute;c sự kiện, tạo bối cảnh l&atilde;ng mạn để c&aacute;c bạn gặp gỡ v&agrave;  t&igrave;m hiểu nhau th&ocirc;ng qua c&aacute;c tr&ograve; chơi giao lưu vui nhộn. Nếu bạn ngại  tiếp x&uacute;c với qu&aacute; đ&ocirc;ng người bạn c&oacute; thể t&acirc;m sự với ch&uacute;ng t&ocirc;i, ch&uacute;ng t&ocirc;i  sẽ gi&uacute;p bạn sắp xếp những buổi hẹn ri&ecirc;ng lịch sự v&agrave; chu đ&aacute;o. Nếu bạn vẫn  c&ograve;n lo lắng, ch&uacute;ng t&ocirc;i sẽ tư vấn v&agrave; hướng dẫn thực h&agrave;nh để bạn tự tin  hơn trong c&aacute;c lần gặp gỡ, gi&uacute;p bạn kh&aacute;m ph&aacute; ra những gi&aacute; trị tốt đẹp c&ograve;n  tiềm ẩn trong ch&iacute;nh bản th&acirc;n bạn. H&atilde;y mạnh dạn đi t&igrave;m hạnh ph&uacute;c cho  m&igrave;nh! D&ugrave; ở bất kỳ đ&acirc;u tr&ecirc;n thế giới, <strong>Cầu Vồng Li&ecirc;n Kết </strong>lu&ocirc;n sẵn s&agrave;ng kết nối v&agrave; ho&agrave;n thiện tr&aacute;i tim bạn.<br />
<br />
<em>Cầu vồng li&ecirc;n kết - kết nối những tr&aacute;i tim, kết nối những mảnh đời bất hạnh</em>.<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp; Ch&uacute;ng t&ocirc;i lu&ocirc;n d&agrave;nh 15% lợi nhuận của m&igrave;nh để  gi&uacute;p đỡ trẻ mồ c&ocirc;i, t&agrave;n tật v&agrave; người gi&agrave; neo đơn. C&aacute;c tổ chức tr&ecirc;n cần  t&agrave;i trợ vui l&ograve;ng li&ecirc;n lạc với ch&uacute;ng t&ocirc;i qua email <b>info@cauvonglienket.com</b> hoặc hotline (08) <strong>62587531</strong> _ <strong>62587532</strong> để được gi&uacute;p đỡ.<br />
<strong><br />
</strong><span style="color: rgb(128, 0, 0);"><strong>Cầu Vồng Li&ecirc;n Kết</strong></span><br />
<strong><em>Nhịp điệu mới, sức sống mới!</em></strong>             </span></p>')
GO
INSERT [dbo].[MenuConfigs] ([MenuConfigID], [MenuConfigName], [MenuNo], [Contents]) VALUES (6, N'Trợ giúp', N'Help', N'<table style="text-align: left;">
    <tbody>
        <tr>
            <td>
            <h3>FAQ - Những c&acirc;u hỏi thường gặp</h3>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            <div>
            <ul>
                <li>
                <h5><a href="../../../Home/TroGiup">Về đăng k&yacute;</a></h5>
                </li>
                <li>
                <h5><a href="../../../Home/TroGiup">Về 5 ph&uacute; hẹn h&ograve;</a></h5>
                </li>
                <li>
                <h5><a href="../../../Home/TroGiup">Về h&acirc;m n&oacute;ng t&igrave;nh y&ecirc;u</a></h5>
                </li>
                <li>
                <h5><a href="../../../Home/TroGiup">Về hẹn ri&ecirc;ng</a></h5>
                </li>
                <li>
                <h5><a href="../../../Home/TroGiup">Về th&agrave;nh vi&ecirc;n VIP</a></h5>
                </li>
            </ul>
            </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            <div>
            <div><a target="_blank" href="../../../Home/TroGiup">5 ph&uacute;t hẹn h&ograve; l&agrave; g&igrave; ?</a></div>
            <p>5 ph&uacute;t hẹn h&ograve; l&agrave; cơ hội ph&aacute;t triển  th&ecirc;m nhiều mối quan hệ mới d&agrave;nh cho nnhững người độc th&acirc;n.                                 Đ&oacute; cũng l&agrave; nơi đem lại cho c&aacute;c bạn bận  rộn cơ hội t&igrave;m thấy nửa c&ograve;n lại.                                 Khoảng thời gian 1 giờ 30 ph&uacute;t của buổi  giao lưu,                                 th&agrave;nh vi&ecirc;n sẽ tham gia những tr&ograve; chơi  vui nhộn v&agrave; đặc biệt l&agrave; được tiếp x&uacute;c &quot;mặt đối mặt&quot; với 10-15 người bạn  kh&aacute;c ph&aacute;i th&ocirc;ng qua c&aacute;c cuộc 5 ph&uacute;t hẹn h&ograve;.                                 Mỗi đ&ocirc;i sẽ c&oacute; 5 ph&uacute;t để tr&ograve; chuyện trong  từng cuộc hẹn nhỏ của m&igrave;nh.</p>
            <div><a target="_blank" href="../../../Home/TroGiup">Ai l&agrave; người tham gia?</a></div>
            <div>
            <p>C&aacute;c bạn c&ocirc;ng sở trẻ, l&agrave;m việc trong nhiều lĩnh vực kh&aacute;c                                 nhau, những doanh nh&acirc;n v&agrave; những người bận rộn kh&ocirc;ng c&oacute; thời gian t&igrave;m                                  hiểu v&agrave; kết bạn ... Bạn c&oacute; thể gặp người c&ugrave;ng sở th&iacute;ch, đối t&aacute;c tiềm                                  năng, hoặc người y&ecirc;u của bạn trong tương lai ở đ&acirc;y.                                 <br />
            <br />
            Một số bạn cảm thấy ngại ng&ugrave;ng v&agrave; lo lắng khi tham gia sự kiện. Nhưng                                  bạn h&atilde;y vui l&ograve;ng nhớ rằng, những người tham gia đều năng động v&agrave; th&acirc;n                                  thiện. Họ đến đ&acirc;y để c&oacute; cơ hội quen biết bạn mới v&agrave; t&igrave;m thấy nửa c&ograve;n                                  lại. Bạn h&atilde;y thoải m&aacute;i v&agrave; cởi mở tham gia để nhận được hiệu quả kết bạn                                  cao nhất từ chương tr&igrave;nh của ch&uacute;ng t&ocirc;i.</p>
            </div>
            <div><a target="_blank" href="../../../Home/TroGiup">Mỗi cuộc hẹn chỉ c&oacute; 5 ph&uacute;t th&igrave; dường như l&agrave; kh&ocirc;ng đủ thời gian để hẹn h&ograve;?</a></div>
            <div>
            <p>5 ph&uacute;t l&agrave; khoảng thời gian đủ cho bạn c&oacute; được cảm nhận                                  đầu ti&ecirc;n về một người. Khoảng thời gian n&agrave;y cũng đủ ngắn để c&aacute;c th&agrave;nh                                  vi&ecirc;n kh&ocirc;ng cảm thấy kh&oacute; chịu nếu cuộc hẹn kh&ocirc;ng như &yacute;<br />
            Nếu bạn muốn t&igrave;m hiểu s&acirc;u hơn về ai đ&oacute;,bạn h&atilde;y ghi ch&uacute; v&agrave;o cuốn sổ ch&uacute;ng                                  t&ocirc;i ph&aacute;t cho bạn. Ch&uacute;ng t&ocirc;i sẽ gởi đến người đ&oacute; th&ocirc;ng tin li&ecirc;n lạc của                                  bạn.</p>
            </div>
            <div><a target="_blank" href="../../../Home/TroGiup">N&ecirc;n n&oacute;i chuyện như thế n&agrave;o trong c&aacute;c cuộc hẹn của m&igrave;nh? </a></div>
            <div>
            <p>H&atilde;y cảm thấy thoải m&aacute;i v&agrave; tự tin th&igrave; một c&aacute;ch rất tự                                  nhi&ecirc;n bạn sẽ đưa ra được những chủ đề hay, thu h&uacute;t người bạn đối diện.                                  Cuộc tr&ograve; chuyện của bạn sẽ trở n&ecirc;n cởi mở v&agrave; vui vẻ. Ngo&agrave;i ra, bạn cũng                                  c&oacute; thể hỏi về sở th&iacute;ch của những người m&agrave; bạn sẽ tiếp x&uacute;c.</p>
            </div>
            <div><a target="_blank" href="../../../Home/TroGiup">T&ocirc;i sẽ mặc trang phục ra sao khi đến buổi hẹn? </a></div>
            <div>
            <p>Bạn sẽ thu h&uacute;t sự ch&uacute; &yacute; của nhiều người bằng những                                  trang phục đẹp v&agrave; lịch l&atilde;m. Lời khuy&ecirc;n d&agrave;nh cho c&aacute;c bạn nữ l&agrave; n&ecirc;n trang                                  điểm nhẹ để l&agrave;m khu&ocirc;n mặt bạn s&aacute;ng v&agrave; đẹp hơn. C&aacute;c bạn nam th&igrave; n&ecirc;n mặc                                  &aacute;o sơ mi lịch sự. Bạn h&atilde;y mặc những trang phục t&ocirc;n l&ecirc;n n&eacute;t đẹp ri&ecirc;ng của                                 m&igrave;nh</p>
            </div>
            <div><a>Nếu người hẹn đối diện kh&ocirc;ng thu h&uacute;t t&ocirc;i ngay từ đầu th&igrave; sao?</a></div>
            <div>
            <p>Ch&uacute;ng t&ocirc;i biết rất nhiều c&acirc;u chuyện về những người bạn                                  sau n&agrave;y trở th&agrave;nh người y&ecirc;u của nhau. Hơn thế nữa, ai trong ch&uacute;ng ta                                  cũng cần c&oacute; bạn b&egrave;. V&igrave; vậy, mặc d&ugrave; trong buổi hẹn, những ai đ&oacute; kh&ocirc;ng l&agrave;m                                 bạn ch&uacute; &yacute; đặc biệt th&igrave; bạn cũng c&oacute; thể t&igrave;m hiểu v&agrave; xem họ như l&agrave; bạn                                  của m&igrave;nh. Nếu vẫn kh&ocirc;ng thể, h&atilde;y lịch sự với nhau. V&igrave; đ&acirc;y l&agrave; qui định                                  của chương tr&igrave;nh.</p>
            </div>
            <div><a target="_blank" href="../../../Home/TroGiup">Ai sẽ l&agrave; người li&ecirc;n lạc trước?</a></div>
            <div>
            <p>Lời khuy&ecirc;n d&agrave;nh cho những bạn đ&atilde; tham gia chương tr&igrave;nh, c&aacute;c bạn n&ecirc;n chủ                                  động li&ecirc;n lạc với nhau khi đ&atilde; nhận được th&ocirc;ng tin li&ecirc;n lạc. Đ&oacute; l&agrave; những                                  người m&agrave; bạn đ&atilde; từng tiếp x&uacute;c. Họ quan t&acirc;m v&agrave; y&ecirc;u mến bạn. H&atilde;y cho họ                                  một cơ hội.</p>
            </div>
            </div>
            </td>
        </tr>
    </tbody>
</table>
<p>&nbsp;</p>
<p style="text-align: left;">Nếu bạn c&oacute; bất k&igrave; thắc mắc g&igrave; chưa được giải đ&aacute;p ở đ&acirc;y. H&atilde;y li&ecirc;n  hệ ngay cho ch&uacute;ng t&ocirc;i theo c&aacute;c th&ocirc;ng tin dưới đ&acirc;y để được giải đ&aacute;p nhanh  nhất.</p>
<p style="text-align: left;"><br />
<br />
<strong>C&ocirc;ng ty TNHH Một Th&agrave;nh Vi&ecirc;n Cầu Vồng Li&ecirc;n Kết</strong></p>
<p style="text-align: left;">Địa chỉ: 143/22 Ung Văn Khi&ecirc;m, phường 25, Q. B&igrave;nh Thạnh - HCM</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">Điện thoại: (+84)08.</p>
<p style="text-align: left;"><strong>62.58.7531</strong></p>
<p style="text-align: left;">- (+84)08.</p>
<p style="text-align: left;"><strong>62.58.7532</strong></p>
<p style="text-align: left;">- (+84)08.</p>
<p style="text-align: left;"><strong>62.58.7536</strong></p>
<p style="text-align: left;">Fax: (+84)08.</p>
<p style="text-align: left;"><strong>62.58.7534</strong></p>
<p style="text-align: left;">Email:</p>
<p style="text-align: left;"><strong>Info@cauvonglienket.com.</strong></p>')
GO
SET IDENTITY_INSERT [dbo].[MenuConfigs] OFF
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
SET IDENTITY_INSERT [dbo].[OlineSupport] ON 

GO
INSERT [dbo].[OlineSupport] ([OSID], [OSPhone1], [OSPhone2], [OSCellPhone1], [OSCellPhone2], [OSEmailTo1], [OSEmailTo2], [OSEmailFrom], [OSPwdEmailFrom], [OSPort], [OSHost], [OSYahoo1], [OSYahoo2], [OSSkype1], [OSSkype2], [IsActive], [Address], [Address1], [Fax], [Fax1], [Description]) VALUES (2, N'08-38383838', N'08-3588688', N'0909990099', NULL, N'red_pepper01@yahoo.com', N'honghieu01@yahoo.com', N'thienhong.nguyen@gmail.com', N'thanhcong1', N'587', N'smtp.gmail.com', N'red_pepper01', N'honghieu01', N'thienhong', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[OlineSupport] ([OSID], [OSPhone1], [OSPhone2], [OSCellPhone1], [OSCellPhone2], [OSEmailTo1], [OSEmailTo2], [OSEmailFrom], [OSPwdEmailFrom], [OSPort], [OSHost], [OSYahoo1], [OSYahoo2], [OSSkype1], [OSSkype2], [IsActive], [Address], [Address1], [Fax], [Fax1], [Description]) VALUES (3, N'0909145789', N'12345777', N'33545678', N'234545667788', N'red_pepper01@yahoo.com', N'honghieu01@yahoo.com', N'thienhong.nguyen01@gmail.com', N'abc123', NULL, NULL, N'honghieu', NULL, N'hieunguye.vn', N'dsafd', 0, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[OlineSupport] OFF
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
SET IDENTITY_INSERT [dbo].[Admin] ON 

GO
INSERT [dbo].[Admin] ([AdminID], [UserName], [Password], [Description]) VALUES (3, N'thienhong', N'2OhWLeNsG2n0N2aHJEDaQA==', NULL)
GO
INSERT [dbo].[Admin] ([AdminID], [UserName], [Password], [Description]) VALUES (5, N'admin', N'2OhWLeNsG2n0N2aHJEDaQA==', NULL)
GO
INSERT [dbo].[Admin] ([AdminID], [UserName], [Password], [Description]) VALUES (6, N'hieu', N'PcCWPZLEwEw/ohICWmyVuQ==', NULL)
GO
SET IDENTITY_INSERT [dbo].[Admin] OFF
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
SET IDENTITY_INSERT [dbo].[EventParents] ON 

GO
INSERT [dbo].[EventParents] ([EventParentID], [Status], [EventParentName], [EventParentDesc]) VALUES (1, N'Dummy', N'', N'')
GO
INSERT [dbo].[EventParents] ([EventParentID], [Status], [EventParentName], [EventParentDesc]) VALUES (2, N'Visible', N'Hâm nóng tình yêu', N'<div class="post-content">
<h3>H&acirc;m n&oacute;ng t&igrave;nh y&ecirc;u</h3>
<p style="text-align: justify;">Bất kỳ đ&ocirc;i t&igrave;nh  nh&acirc;n n&agrave;o cũng mong muốn t&igrave;nh y&ecirc;u của m&igrave;nh lu&ocirc;n bền chặt v&agrave; nồng ấm như  thuở ban đầu. Tuy nhi&ecirc;n cuộc sống bận rộn hằng ng&agrave;y l&agrave;m cho bạn qu&ecirc;n đi  việc cải thiện mối quan hệ ấy, v&ocirc; t&igrave;nh l&agrave;m cho những cảm x&uacute;c y&ecirc;u thương  phai nhạt dần. Bạn d&agrave;nh đa số thời gian cho c&ocirc;ng việc, một &iacute;t cho bạn b&egrave;  v&agrave; một &iacute;t cho gia đ&igrave;nh,&hellip; vậy phần thời gian c&ograve;n lại c&oacute; đủ để bạn giữ  lửa cho t&igrave;nh y&ecirc;u của m&igrave;nh kh&ocirc;ng? Những việc m&agrave; b&igrave;nh thường bạn vẫn hay  l&agrave;m như nhắn tin, gọi điện&hellip; v&agrave; cả những lần hẹn h&ograve; mỗi tuần c&oacute; đủ để  t&igrave;nh y&ecirc;u hai bạn th&ecirc;m khắn kh&iacute;t? Chưa kể l&agrave; sự vụng về trong t&igrave;nh y&ecirc;u  đ&ocirc;i khi l&agrave;m bạn l&uacute;ng t&uacute;ng v&agrave; bị mất điểm kh&ocirc;ng &iacute;t.</p>
<p style="text-align: justify;"><img width="200" vspace="2" hspace="2" height="131" align="right" src="http://cauvonglienket.com/upload/myupload/ser_hamnongtinhyeu.jpg" alt="" /></p>
<div style="text-align: justify; margin: 6pt 0in;">Giữ cho t&igrave;nh y&ecirc;u lu&ocirc;n  mặn nồng kh&ocirc;ng phải l&agrave; một điều kh&ocirc;ng thể thực hiện được. Nguy&ecirc;n l&yacute;  chung để đạt được điều n&agrave;y l&agrave; hai bạn phải d&agrave;nh thời gian v&agrave; sự quan t&acirc;m  cho nhau. H&atilde;y thổi v&agrave;o t&igrave;nh y&ecirc;u của bạn một l&agrave;n gi&oacute; mới v&agrave; th&ecirc;m v&agrave;o  t&igrave;nh y&ecirc;u ấy những gia vị đặc biệt để ch&uacute;ng th&ecirc;m đậm đ&agrave;. Đừng đợi đến l&uacute;c  bạn phải luống cuống t&igrave;m c&aacute;ch cứu nguy cho một t&igrave;nh y&ecirc;u đang ng&agrave;y c&agrave;ng  phai nhạt!<br />
<br />
H&atilde;y để Cầu Vồng Li&ecirc;n Kết&nbsp;mang đến cho bạn những gi&acirc;y ph&uacute;t ri&ecirc;ng tư ngọt  ng&agrave;o b&ecirc;n cạnh người ấy, chắc chắn rằng đ&oacute; sẽ l&agrave; những khoảnh khắc vui  vẻ, thoải m&aacute;i v&agrave; đ&aacute;ng nhớ trong lịch sử t&igrave;nh y&ecirc;u của hai bạn.<br />
<br />
Ch&uacute;ng t&ocirc;i sẽ thường xuy&ecirc;n tổ chức c&aacute;c sự kiện đặc biệt h&agrave;ng th&aacute;ng với  nội dung phong ph&uacute; như d&atilde; ngoại, picnic, thả đ&egrave;n trung thu, l&agrave;m từ thiện  &hellip; Những sự kiện n&agrave;y được thiết kế đặc biệt d&agrave;nh cho những đ&ocirc;i t&igrave;nh nh&acirc;n  đang c&oacute; nhu cầu h&acirc;m n&oacute;ng t&igrave;nh y&ecirc;u của m&igrave;nh. Khi tham gia chương tr&igrave;nh,  họ sẽ nhận ra nhiều n&eacute;t tiềm ẩn đ&aacute;ng y&ecirc;u của nhau&nbsp;v&agrave; c&oacute; cơ hội được gần  nhau hơn. Đ&oacute; sẽ những gi&acirc;y ph&uacute;t thư gi&atilde;n b&ecirc;n nhau thật thoải m&aacute;i v&agrave;  tuyệt vời.&nbsp;<br />
<br />
L&atilde;ng mạng l&agrave; thứ kh&ocirc;ng thể thiếu trong t&igrave;nh y&ecirc;u đ&ocirc;i lứa. H&atilde;y d&agrave;nh cho  nhau những giờ ph&uacute;t ri&ecirc;ng tư thật sự để t&igrave;nh y&ecirc;u được bền chặt theo năm  th&aacute;ng.</div>
</div>')
GO
INSERT [dbo].[EventParents] ([EventParentID], [Status], [EventParentName], [EventParentDesc]) VALUES (4, N'Visible', N'Hẹn riêng', N'<div class="post-content">
<h3>Hẹn Ri&ecirc;ng</h3>
<p class="MsoNormal" style="text-align: justify;">Ph&uacute;t gi&acirc;y t&igrave;m được &ldquo;<i style="">một nửa</i>&rdquo;  cho ri&ecirc;ng m&igrave;nh l&agrave; ph&uacute;t gi&acirc;y hạnh ph&uacute;t nhất của những đ&ocirc;i trai g&aacute;i đ&atilde; v&agrave;  đang y&ecirc;u. Nhưng vẫn kh&ocirc;ng &iacute;t người chưa t&igrave;m được một nửa cho ch&iacute;nh  m&igrave;nh. Kh&ocirc;ng phải v&igrave; họ k&eacute;m cỏi, chưa th&agrave;nh c&ocirc;ng hay kh&ocirc;ng c&oacute; cơ hội&hellip; Đơn  giản chỉ v&igrave; họ đi chưa đ&uacute;ng lối.</p>
<p class="MsoNormal" style="text-align: justify;">Một buổi tối đầy l&atilde;ng  mạn cho những ai c&oacute; t&acirc;m hồn thi sĩ, b&ecirc;n bờ s&ocirc;ng thơ mộng, h&ograve;a m&igrave;nh c&ugrave;ng  gi&oacute; v&agrave; thi&ecirc;n nhi&ecirc;n. Hay một kh&ocirc;ng gian thật ấm c&uacute;ng, tr&aacute;nh xa sự ồn &agrave;o,  x&ocirc; bồ của cuộc sống thường nhật, thả hồn theo &acirc;m điệu ngọt ng&agrave;o của  những bản t&igrave;nh ca, một thế giới kh&aacute;c biệt để bạn thật sự trở lại l&agrave;  ch&iacute;nh m&igrave;nh b&ecirc;n người bạn mới c&oacute; c&ugrave;ng &ldquo;<i style="">tần số</i>&rdquo; v&agrave; bắt đầu một mối quan hệ, biết đ&acirc;u &ldquo;<i style="">người ấy</i>&rdquo; cũng đang chờ đợi những điều m&agrave; bấy l&acirc;u bạn đang t&igrave;m kiếm???</p>
<p class="MsoNormal" style="text-align: center;">&nbsp;<img alt="" style="width: 403px; height: 256px;" src="http://cauvonglienket.com/upload/galang.jpg" />&nbsp;</p>
<p class="MsoNormal" style="text-align: left;">B&ecirc;n cạnh chương tr&igrave;nh &ldquo;<i style="">5 ph&uacute;t hẹn h&ograve;</i>&rdquo;  d&agrave;nh cho c&aacute;c th&agrave;nh vi&ecirc;n năng động, hẹn ri&ecirc;ng sẽ gi&uacute;p bạn bớt đi những e  ngại nếu bạn l&agrave; t&iacute;p người trầm t&iacute;nh, c&oacute; qu&aacute; &iacute;t thời gian hoặc kh&ocirc;ng  th&iacute;ch hợp với những chỗ đ&ocirc;ng người,&hellip; <b style="">Cầu Vồng Li&ecirc;n Kết</b>  sẽ tư vấn v&agrave; chọn gi&uacute;p bạn người bạn kh&aacute;c ph&aacute;i c&oacute; c&ugrave;ng tần số để hai bạn  thực sự c&oacute; một buổi hẹn ấn tượng trong một kh&ocirc;ng gian thật lịch sự, đầy  l&atilde;ng mạn với thời gian &ldquo;<i style="">kh&ocirc;ng giới hạn</i>&rdquo; do c&aacute;c bạn chủ  động để dể d&agrave;ng trao đổi v&agrave; t&igrave;m hiểu nhau. Nếu kết quả chỉ dừng ở mức  t&igrave;nh bạn, ch&uacute;ng t&ocirc;i sẵn s&agrave;ng gi&uacute;p bạn trong những cuộc hẹn mới đến khi  n&agrave;o bạn đi hết chiếc Cầu Vồng v&agrave; t&igrave;m được một nửa thực sự của m&igrave;nh.</p>
<p class="MsoNormal" style="text-align: left;">Sau những cuộc hẹn, ch&uacute;ng  t&ocirc;i lu&ocirc;n chia sẻ c&ugrave;ng bạn đối với những t&igrave;nh huống kh&oacute; xử, đồng thời tư  vấn để bạn c&oacute; được phương &aacute;n giải quyết tốt nhất, l&agrave;m thế n&agrave;o để bạn  ho&agrave;n thiện hơn, ấn tượng hơn trong mắt người bạn kh&aacute;c ph&aacute;i. C&aacute;c bạn tự  do t&igrave;m hiểu v&agrave; Cầu Vồng Li&ecirc;n Kết chỉ chấm dứt sự đồng h&agrave;nh khi c&aacute;c bạn  thực sự đ&atilde; t&igrave;m được bến bờ hạnh ph&uacute;c cho ch&iacute;nh m&igrave;nh.</p>
<p class="MsoNormal" style="text-align: left;">Điều tất nhi&ecirc;n Cầu Vồng  Li&ecirc;n Kết lu&ocirc;n x&aacute;c minh t&iacute;nh x&aacute;c thực của c&aacute;c đơn đăng k&yacute; tham gia v&agrave; cam  kết bảo mật to&agrave;n bộ th&ocirc;ng tin c&aacute; nh&acirc;n của bạn. Ch&uacute;ng t&ocirc;i sẽ mang đến  cho bạn những buổi hẹn thật ấn tượng. V&agrave; biết đ&acirc;u đ&oacute; trong danh s&aacute;ch  th&agrave;nh vi&ecirc;n của <b style="">Cầu Vồng Li&ecirc;n Kết</b>, &ldquo;<i style="">một nửa</i>&rdquo; của bạn cứ m&atilde;i ng&oacute;ng chờ&hellip;?</p>
</div>')
GO
INSERT [dbo].[EventParents] ([EventParentID], [Status], [EventParentName], [EventParentDesc]) VALUES (5, N'Visible', N'5 Phút hẹn hò', N'<h3>Giới thiệu về chương tr&igrave;nh 5 ph&uacute;t hẹn h&ograve;<br />
&nbsp;</h3>
<p style="text-align: justify; margin: 6pt 0in;"><strong><font size="3"><font face="Times New Roman">5 ph&uacute;t hẹn h&ograve; - buổi hẹn kết đ&ocirc;i trang trọng v&agrave; đầy th&uacute; vị.<o:p></o:p></font></font></strong></p>
<p style="text-align: justify; margin: 6pt 0in;"><font size="3" face="Times New Roman">Đến với &ldquo;<strong>5 ph&uacute;t hẹn h&ograve;</strong>&rdquo;, bạn sẽ c&oacute; cơ hội gặp gỡ, giao lưu với những th&agrave;nh vi&ecirc;n kh&aacute;c của <strong>Cầu Vồng Li&ecirc;n Kết</strong>  c&ugrave;ng chung sở th&iacute;ch, t&iacute;nh c&aacute;ch, quan điểm về t&igrave;nh y&ecirc;u v&agrave; cuộc sống. B&ecirc;n  cạnh đ&oacute;, bạn c&oacute; điều kiện lựa chọn tham gia v&agrave;o c&aacute;c nh&oacute;m tuổi ph&ugrave; hợp  với nhu cầu của m&igrave;nh, c&ugrave;ng tr&ograve; chuyện để t&igrave;m hiểu nhau trong trong một  kh&ocirc;ng gian l&atilde;ng mạn v&agrave; sang trọng. </font></p>
<p style="text-align: justify; margin: 6pt 0in;"><font size="3" face="Times New Roman">Khi  tham gia chương tr&igrave;nh, bạn sẽ cảm nhận được sự kh&aacute;c biệt r&otilde; n&eacute;t so với  những chương tr&igrave;nh giao lưu kh&aacute;c với những đối tượng phức tạp thường  kh&ocirc;ng như mong muốn của bạn. Mục đ&iacute;ch cuối c&ugrave;ng của ch&uacute;ng t&ocirc;i kh&ocirc;ng chỉ  l&agrave; đưa c&aacute;c bạn đến gặp gỡ nhau m&agrave; c&ograve;n đồng h&agrave;nh c&ugrave;ng bạn đi&nbsp; hết cầu  vồng để đến với ước mơ của m&igrave;nh. Th&agrave;nh vi&ecirc;n của ch&uacute;ng t&ocirc;i l&agrave; những người  th&agrave;nh đạt trong cuộc sống c&oacute; mong muốn t&igrave;m bạn một c&aacute;ch nghi&ecirc;m t&uacute;c.</font></p>
<p style="text-align: justify; margin: 6pt 0in;"><font size="3" face="Times New Roman">Những  ng&agrave;y cuối tuần, ngo&agrave;i sở th&iacute;ch đi dạo với bạn b&egrave;, đi ăn uống hoặc đi d&atilde;  ngoại... bạn c&oacute; thể mời họ đến tham dự chương tr&igrave;nh c&ugrave;ng ch&uacute;ng t&ocirc;i.</font></p>
<p style="text-align: justify; margin: 6pt 0in;"><strong><font size="3"><font face="Times New Roman">Sau đ&acirc;y l&agrave; t&oacute;m tắt chương tr&igrave;nh 5 ph&uacute;t hẹn h&ograve;. </font></font></strong></p>
<p style="text-align: center; margin: 6pt 0in;"><img alt="" src="http://cauvonglienket.com/upload/myupload/ser_5phut.gif" /></p>
<p style="text-align: justify; margin: 6pt 0in;"><strong><font size="3"><font face="Times New Roman"><o:p></o:p></font></font></strong></p>
<p style="text-align: justify; margin: 6pt 0in;"><font size="3" face="Times New Roman">Khi  buổi giao lưu bắt đầu, tất cả c&aacute;c th&agrave;nh vi&ecirc;n sẽ tiếp x&uacute;c v&agrave; tr&ograve; chuyện  trực tiếp từng đ&ocirc;i. Giới hạn cho mỗi lượt tiếp x&uacute;c của 2 th&agrave;nh vi&ecirc;n l&agrave; 5  ph&uacute;t. Sau đ&oacute; ch&uacute;ng t&ocirc;i sẽ rung chu&ocirc;ng hoặc g&otilde; v&agrave;o ly để b&aacute;o hiệu thời  gian đ&atilde; hết v&agrave; bạn sẽ giao lưu với người tiếp theo trong cuộc hẹn lần  lượt đến khi tất cả c&aacute;c th&agrave;nh vi&ecirc;n được giao lưu với nhau.</font></p>
<p style="text-align: justify; margin: 6pt 0in;"><font size="3" face="Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;  Khi buổi giao lưu kết th&uacute;c, bạn sẽ gửi lại cho ch&uacute;ng t&ocirc;i t&ecirc;n những  th&agrave;nh vi&ecirc;n đ&atilde; để lại cho bạn nhiều ấn tượng. Ch&uacute;ng t&ocirc;i sẽ dựa v&agrave;o đơn  đăng k&yacute; v&agrave; nguyện vọng ban đầu để t&igrave;m cho bạn&nbsp; một người th&iacute;ch hợp nhất  trong số những người bạn ghi t&ecirc;n lại. Khi được sự đồng &yacute; từ cả 2 ph&iacute;a,  Cầu Vồng Li&ecirc;n Kết c&oacute; tr&aacute;ch nhiệm trao đổi th&ocirc;ng tin của 2 bạn cho nhau.  C&aacute;c bạn c&oacute; thể tiếp tục buổi hẹn kh&aacute;c do Cầu Vồng Li&ecirc;n Kết sắp xếp hoặc  tự thực hiện theo sở th&iacute;ch của m&igrave;nh. Khi đ&oacute;, <strong>Cầu Vồng Li&ecirc;n Kết</strong>  đ&atilde; ho&agrave;n th&agrave;nh sứ mệnh li&ecirc;n kết v&agrave; để tr&aacute;nh những t&igrave;nh huống kh&oacute; xử từ  những lời từ chối hay ph&ecirc; b&igrave;nh hoặc đơn giản chỉ l&agrave; v&igrave; sự an to&agrave;n th&ocirc;ng  tin, Cầu Vồng Li&ecirc;n Kết khuyến c&aacute;o bạn kh&ocirc;ng n&ecirc;n trao đổi th&ocirc;ng tin li&ecirc;n  lạc với nhau trongs buổi giao lưu. </font></p>
<p style="text-align: justify; margin: 6pt 0in;"><font size="3" face="Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;  Từ l&acirc;u, những buổi hẹn h&ograve; như thế n&agrave;y đ&atilde; rất phổ biến ở nhiều nơi tr&ecirc;n  thế giới như Ch&acirc;u &Acirc;u, Nam Mỹ, Bắc Mỹ ...&nbsp; Sau khi d&agrave;nh thời gian nghi&ecirc;n  cứu, t&igrave;m giải ph&aacute;p trung h&ograve;a giữa văn h&oacute;a &Aacute; Đ&ocirc;ng v&agrave; phong c&aacute;ch giao lưu  phương T&acirc;y, Cầu Vồng Li&ecirc;n Kết h&acirc;n hạnh mang chương tr&igrave;nh &ldquo;5 ph&uacute;t hẹn h&ograve;&rdquo;  đến Việt Nam với mong muốn gắn kết, tạo cơ hội cho những người độc  th&acirc;n, th&agrave;nh đạt đi t&igrave;m một nửa của cuộc đời m&igrave;nh. Khi tham gia chương  tr&igrave;nh, bạn sẽ cảm thấy thoải m&aacute;i v&agrave; th&acirc;n mật như đến những buổi hẹn với  bạn b&egrave;. Ch&uacute;ng t&ocirc;i hứa sẽ đem đến cho bạn một buổi hẹn v&ocirc; c&ugrave;ng lịch sự v&agrave;  ấn tượng.</font><o:p></o:p></p>
<p style="text-align: justify; margin: 6pt 0in;"><font size="3" face="Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;  Cầu Vồng Li&ecirc;n Kết lu&ocirc;n x&aacute;c minh t&iacute;nh x&aacute;c thực của c&aacute;c đơn đăng k&yacute; tham  gia v&agrave; cam kết bảo mật to&agrave;n bộ th&ocirc;ng tin c&aacute; nh&acirc;n của bạn. Ch&uacute;ng t&ocirc;i sẽ  mang đến cho bạn những buổi hẹn thật tuyệt vời v&agrave; ấn tượng. V&agrave; biết đ&acirc;u,  một nửa của bạn đang lẩn khuất đ&acirc;u đ&oacute; trong danh s&aacute;ch th&agrave;nh vi&ecirc;n của  Cầu Vồng Li&ecirc;n Kết ...</font></p>')
GO
SET IDENTITY_INSERT [dbo].[EventParents] OFF
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
SET IDENTITY_INSERT [dbo].[Consultings] ON 

GO
INSERT [dbo].[Consultings] ([ConsultingID], [Status], [ConsultingQuestions], [ConsultingAnwsers], [ConsultingDesction], [DatePost]) VALUES (1, N'Dummy', N'--Chọn--', NULL, NULL, CAST(0x002D247F00000000 AS DateTime))
GO
INSERT [dbo].[Consultings] ([ConsultingID], [Status], [ConsultingQuestions], [ConsultingAnwsers], [ConsultingDesction], [DatePost]) VALUES (3, N'Visible', N'Tôi phải làm sao??? Xin cho tôi lời khuyên', N'<p><strong>Ch&agrave;o c&aacute;c bạn</strong>,m&igrave;nh c&oacute; 1 c&acirc;u chuyện cần được tư vấn,đ&oacute; l&agrave; chuyện t&igrave;nh y&ecirc;u  của m&igrave;nh,c&oacute; lẽ m&igrave;nh n&ecirc;n kể ra hết để mong c&oacute; được những lời khuy&ecirc;n hữu  &iacute;ch nhất.M&igrave;nh xin n&oacute;i sơ qua về bản th&acirc;n,m&igrave;nh l&agrave; 1 ch&agrave;ng trai  23t,sn88,m&igrave;nh học xong trung cấp v&agrave; c&oacute; việc l&agrave;m ổn định,m&igrave;nh l&agrave; người  t&igrave;nh cảm v&agrave; sống nội t&acirc;m.Chuyện bắt đầu từ th&aacute;ng&nbsp;3 năm 2008 l&uacute;c đ&oacute; m&igrave;nh  uống cafe ở 1 qu&aacute;n quen v&agrave; m&igrave;nh đ&atilde; gặp n&agrave;ng,(n&agrave;ng l&agrave; thu ng&acirc;n của qu&aacute;n  đ&oacute;i)1 người con g&aacute;i lớn hơn m&igrave;nh 3t,học chưa hết lớp 9 v&igrave; ho&agrave;n  cảnh,ngoại h&igrave;nh rất thấp v&agrave; nhỏ con,nhưng m&igrave;nh y&ecirc;u nhất l&agrave; giọng n&oacute;i v&agrave;  t&iacute;nh c&aacute;ch,rất hiền l&agrave;nh v&agrave; dễ thương,cộng th&ecirc;m nhiều lần t&acirc;m sự m&igrave;nh  biết ho&agrave;n cảnh của n&agrave;ng v&agrave; cảm thấy c&agrave;ng thương n&agrave;ng hơn.Cha mẹ n&agrave;ng bỏ  nhau khi n&agrave;ng học lớp 9 v&agrave; từ qu&ecirc; vĩnh long n&agrave;ng phải dở dang việc học  phải l&ecirc;n s&agrave;i g&ograve;n kiếm sống c&ugrave;ng mẹ.Sau đ&oacute; n&agrave;ng l&agrave;m c&ocirc;ng phụ việc với  mẹ,được 6 năm th&igrave; mẹ n&agrave;ng bị giựt hụi v&agrave; phải trốn nợ bỏ n&agrave;ng bơ vơ 1  m&igrave;nh.Trong thời gian n&agrave;ng l&agrave;m c&ugrave;ng mẹ c&oacute; quen 1 anh người y&ecirc;u,v&agrave; sau n&agrave;y  người n&agrave;y đ&atilde; thay đổi sau cuộc t&igrave;nh 3 năm cũng bỏ n&agrave;ng 1 m&igrave;nh.N&agrave;ng v&agrave;o  l&agrave;m cho qu&aacute;n cafe,lo hết việc từ tr&ecirc;n xuống dưới,từ tiền bạc tới việc  nhỏ nhất nhưng chủ cũng bạc đ&atilde;i n&agrave;ng v&agrave; trả cho n&agrave;ng mức lương rẻ  b&egrave;o.M&igrave;nh ngot lời y&ecirc;u n&agrave;ng v&agrave;o th&aacute;ng 5 năm 2008 khi đ&atilde; qua 2 th&aacute;ng cất  giữ t&igrave;nh cảm trong l&ograve;ng,m&igrave;nh v&agrave; n&agrave;ng đến với nhau v&igrave; t&igrave;nh cảm ch&acirc;n  thật,từ đ&oacute; m&igrave;nh khuy&ecirc;n n&agrave;ng bỏ việc ở qu&aacute;n cafe v&agrave; kiếm nghề n&agrave;o đ&oacute; học  cho c&oacute; 1 c&aacute;i nghề,nhưng n&agrave;ng kh&ocirc;ng học v&agrave; chuyển việc l&agrave;m kh&aacute;c,từ l&agrave;m  t&oacute;c cho đến phụ việc nh&agrave;,cho d&ugrave; n&agrave;ng l&agrave;m ở đ&acirc;u m&igrave;nh cũng đi b&ecirc;n cạnh v&agrave;  d&agrave;nh hết t&igrave;nh cảm tốt nhất của m&igrave;nh cho n&agrave;ng,quan t&acirc;m lo lắng săn s&oacute;c  n&agrave;ng.Sau đ&oacute; n&agrave;ng về qu&ecirc; 1 thời gian phụ việc cho người d&igrave; ở dưới  qu&ecirc;,m&igrave;nh khuy&ecirc;n n&ecirc;n l&ecirc;n tp v&igrave; 2 đứa ở xa nhau t&igrave;nh cảm nhớ nhung khiến  m&igrave;nh kh&ocirc;ng thể chịu được.L&ecirc;n tp ng&agrave;y đầu ti&ecirc;n n&agrave;ng đ&atilde; hiến d&acirc;ng trọn vẹn  cho m&igrave;nh v&agrave; m&igrave;nh cảm thấy hạnh ph&uacute;c v&igrave; điều đ&oacute; v&igrave; trong suốt thời gian  qua m&igrave;nh nhiều lần đ&ograve;i hỏi nhưng n&agrave;ng kh&ocirc;ng chịu.L&ecirc;n tp n&agrave;ng phụ l&agrave;m t&oacute;c  cho 1 người quen,nhưng với bản t&iacute;nh thật th&agrave;,hiền l&agrave;nh v&agrave; &iacute;t tiếp x&uacute;c  với người kh&aacute;c,n&agrave;ng bị người kh&aacute;c kiếm chuyện v&agrave; c&oacute; x&iacute;ch m&iacute;ch khiến n&agrave;ng  phải nghỉ l&agrave;m,Sau đ&oacute; n&agrave;ng qua nh&agrave; mẹ n&agrave;ng ở quận 8 sống(mẹ n&agrave;ng l&agrave;m  c&ocirc;ng v&agrave; mướn nh&agrave; ở quận 8),n&agrave;ng ở c&ugrave;ng với mẹ v&agrave; vợ chồng anh 2 n&agrave;ng.V&agrave;  cũng từ những lần tới thăm n&agrave;ng cộng với sự dễ d&agrave;ng của mẹ n&agrave;ng m&igrave;nh đ&atilde;  c&oacute; những h&agrave;nh động sai lầm,đ&oacute; l&agrave;m qua ở chung với n&agrave;ng,1 tuần m&igrave;nh chỉ  về nh&agrave; c&oacute; 2,3 bữa.N&oacute;i th&ecirc;m 1 ch&uacute;t về&nbsp;nh&agrave; m&igrave;nh,ba mẹ m&igrave;nh ngh&egrave;o,bỏ nhau  năm m&igrave;nh học lớp 9,trước giờ m&igrave;nh do người c&ocirc; dượng,l&agrave; chị ruột của ba  m&igrave;nh nu&ocirc;i ăn học cho đến giờ n&agrave;y,ba m&igrave;nh đ&atilde; mất năm 2005,mẹ m&igrave;nh th&igrave;&nbsp;ở  ri&ecirc;ng&nbsp;v&agrave; c&oacute;&nbsp;người kh&aacute;c&nbsp;v&agrave; vợ chồng người c&ocirc; n&agrave;y&nbsp;đ&atilde; lớn tuổi&nbsp;kh&ocirc;ng c&oacute; con  n&ecirc;n&nbsp; xem m&igrave;nh như con.Qua thời gian m&igrave;nh sống&nbsp;ở nh&agrave; n&agrave;ng,m&igrave;nh&nbsp;lại d&iacute;nh  v&ocirc; c&aacute;&nbsp;độ&nbsp;đ&aacute; banh v&agrave;&nbsp;cầm xe,m&igrave;nh mất ch&acirc;n&nbsp;đi,v&igrave; vậy m&igrave;nh về nh&agrave;,c&ocirc; dượng  chuộc&nbsp;xe cho m&igrave;nh,m&igrave;nh&nbsp;ở nh&agrave; v&agrave;i&nbsp;bữa v&agrave; lại qua nh&agrave; n&agrave;ng v&agrave; sống  chung&nbsp;với n&agrave;ng lu&ocirc;n từ&nbsp;đ&oacute;,kể từ&nbsp;đ&oacute; m&igrave;nh&nbsp;bỏ gia&nbsp;đ&igrave;nh&nbsp;qua 1 b&ecirc;n v&agrave; chỉ  biết c&oacute; n&agrave;ng,v&igrave; vậy gia&nbsp;đ&igrave;nh&nbsp;m&igrave;nh rất l&agrave;&nbsp;gh&eacute;t n&agrave;ng v&agrave; nghĩ rằng  n&agrave;ng&nbsp;đang&nbsp;đ&agrave;o mỏ minh.1 thời gian sau v&igrave; kh&ocirc;ng thể sống&nbsp;được&nbsp;với vợ  chồng người a 2 của n&agrave;ng,m&igrave;nh v&agrave; n&agrave;ng&nbsp;mướn nh&agrave;&nbsp;ở ri&ecirc;ng.M&igrave;nh phải&nbsp;đi l&agrave;m  rất cực v&agrave; n&agrave;ng&nbsp;cũng vậy v&igrave; m&igrave;nh tuy c&oacute; bằng cấp nhưng kh&ocirc;ng c&oacute; 1 thứ  giấy tờ g&igrave; trong người,m&igrave;nh v&agrave; n&agrave;ng&nbsp;đ&atilde; sống 1 thời gian kho khăn nhưng  tr&agrave;n&nbsp;đầy hạnh ph&uacute;c&nbsp;dẫu m&igrave;nh biết c&aacute;i gi&aacute;&nbsp;m&igrave;nh phải trả l&agrave; qu&aacute; lớn.Sau&nbsp;đ&oacute;  m&igrave;nh rất may mắn xin&nbsp;được 1 c&ocirc;ng việc c&oacute; thu nhập cũng kh&aacute;&nbsp;ổn&nbsp;định,v&agrave;  c&aacute;i kh&ocirc;ng muốn lại&nbsp;đến,m&igrave;nh lại d&iacute;nh v&agrave;o cờ bạc,n&oacute; cứ th&uacute;c&nbsp;đẩy  m&igrave;nh,những l&uacute;c m&igrave;nh&nbsp;ăn nhiều m&igrave;nh&nbsp;đều&nbsp;đem tiền về&nbsp;đưa cho n&agrave;ng v&agrave;  2&nbsp;đứa&nbsp;đi chơi thỏa&nbsp;th&iacute;ch,thanh ni&ecirc;n m&agrave;,nhưng&nbsp;đến l&uacute;c thua rồi m&igrave;nh lại  phải b&aacute;n xe&nbsp;lần nữa.L&uacute;c&nbsp;đ&oacute; trong m&igrave;nh rất l&agrave; kh&oacute; nghĩ,m&igrave;nh cần  gia&nbsp;đ&igrave;nh,m&igrave;nh kh&ocirc;ng muốn tiếp tục chịu khổ như thế nữa,về nh&agrave; l&agrave; m&igrave;nh  c&oacute;&nbsp;được mọi thứ,m&igrave;nh c&ograve;n qu&aacute; nhỏ&nbsp;để c&oacute; thể tự&nbsp;lập ra ri&ecirc;ng,v&agrave; v&igrave; m&igrave;nh  kh&ocirc;ng c&oacute; 1 mảnh giấy tờ n&agrave;o tr&ecirc;n người cả.V&agrave; m&igrave;nh&nbsp;đ&atilde; quay về mặc cho  n&agrave;ng kh&oacute;c l&oacute;c năn nỉ van xin v&agrave;&nbsp;đ&ograve;i&nbsp;sống&nbsp;đ&ograve;i chết,nhưng..m&igrave;nh&nbsp;đ&atilde;&nbsp;n&oacute;i&nbsp;với  n&agrave;ng ho&agrave;n cảnh như vậy,m&igrave;nh rất y&ecirc;u n&agrave;ng nhưng m&igrave;nh&nbsp;đ&atilde; phạm sai lầm rất  nhiều,m&igrave;nh cần thời gian&nbsp;để thuyết phục gia&nbsp;đ&igrave;nh&nbsp;đồng&nbsp;&yacute; cho cuộc t&igrave;nh  n&agrave;y.M&igrave;nh quay trở về nh&agrave;,c&ocirc; dượng mua cho m&igrave;nh&nbsp;xe mới v&agrave; bắt m&igrave;nh tuyệt  phải bỏ n&agrave;ng,nhưng m&igrave;nh vẫn gặp gỡ cũng như quen n&agrave;ng.1 ng&agrave;y kia&nbsp;đột  nhi&ecirc;n n&agrave;ng muốn mổ c&aacute;i&nbsp;tay,v&igrave; n&oacute; cản trở c&ocirc;ng việc của n&agrave;ng(n&agrave;ng&nbsp;bị  phong&nbsp;thấp v&agrave; ra&nbsp;mồ h&ocirc;i tay rất nhiều),n&agrave;ng&nbsp;c&oacute; gởi ngoại&nbsp;n&agrave;ng 1 số tiền  d&agrave;nh dụm v&agrave; n&agrave;ng&nbsp;đ&atilde; xin lại ph&acirc;n nửa&nbsp;để mổ,sau khi n&agrave;ng mổ 1 thời gian  th&igrave; n&agrave;ng lại nghỉ việc,v&agrave; kh&ocirc;ng hiểu sao n&agrave;ng lại t&igrave;m c&aacute;ch xa l&aacute;nh m&igrave;nh  v&agrave;&nbsp;khuy&ecirc;n m&igrave;nh n&ecirc;n thuận theo&nbsp;&yacute; của gia&nbsp;đ&igrave;nh,m&igrave;nh rất&nbsp;đỗi ngạc nhi&ecirc;n v&igrave;  l&uacute;c trước n&agrave;ng&nbsp;đ&atilde; từng hứa&nbsp;với m&igrave;nh&nbsp;l&agrave; sẽ cố gắng&nbsp;để thuyết phục  gia&nbsp;đ&igrave;nh,n&agrave;ng chủ&nbsp;động chia tay m&igrave;nh,đ&oacute;&nbsp;l&agrave; v&agrave;o ng&agrave;y 16/12/2009.mặc cho  m&igrave;nh năn nỉ v&agrave;&nbsp;khuy&ecirc;n nhủ nhiều,m&igrave;nh cũng&nbsp;đ&atilde;&nbsp;bỏ qua&nbsp;l&ograve;ng tự trọng của  thằng&nbsp;đ&agrave;n&nbsp;&ocirc;ng nhưng&nbsp;n&agrave;ng vẫn 1 mực chia tay.Sau khi chia tay,qua bạn  b&egrave;&nbsp;quen m&igrave;nh biết n&agrave;ng&nbsp;đau khổ rất nhiều.Sau&nbsp;đ&oacute; n&agrave;ng nghỉ lu&ocirc;n&nbsp;ở chỗ cũ  v&agrave; l&agrave;m&nbsp;ở chỗ mới.M&igrave;nh t&igrave;m&nbsp;đến nơi l&agrave;m mới của n&agrave;ng v&agrave;&nbsp;thấy 1 người kh&aacute;c  chở n&agrave;ng,qua n&oacute;i chuyện l&agrave;m quen m&igrave;nh biết người&nbsp;đ&oacute; rất mực y&ecirc;u  n&agrave;ng,người&nbsp;đ&oacute; t&iacute;nh t&igrave;nh hiền l&agrave;nh v&agrave; t&acirc;m sự cho m&igrave;nh rất nhiều.Người&nbsp;đ&oacute;  n&oacute;i l&agrave; n&agrave;ng kh&ocirc;ng m&agrave;ng&nbsp;đến t&igrave;nh&nbsp;cảm của người&nbsp;đ&oacute; v&agrave; cứ nhắc t&ecirc;n  m&igrave;nh,kh&oacute;c l&oacute;c v&agrave; t&acirc;m sự&nbsp;với người&nbsp;đ&oacute;,v&agrave; người&nbsp;đ&oacute; cũng n&oacute;i cho m&igrave;nh biết  l&iacute; do ch&iacute;nh khiến n&agrave;ng chia tay với m&igrave;nh l&agrave;&nbsp;n&agrave;ng kh&ocirc;ng c&oacute; khả năng  c&oacute;&nbsp;con m&agrave; m&igrave;nh th&igrave; l&agrave; con 1 l&agrave; ch&aacute;u&nbsp;đ&iacute;ch t&ocirc;n duy&nbsp;nhất trong&nbsp;d&ograve;ng họ,khi  biết&nbsp;được chuyện n&agrave;y m&igrave;nh cũng kh&ocirc;ng biết&nbsp;n&ecirc;n buồn hay vui,m&igrave;nh&nbsp;đ&atilde;  chủ&nbsp;động n&oacute;i thẳng&nbsp;với n&agrave;ng l&agrave; m&igrave;nh cần n&agrave;ng th&ocirc;i,nhưng n&agrave;ng  kh&ocirc;ng&nbsp;đồng&nbsp;&yacute;,m&igrave;nh phải l&agrave;m sao&nbsp;đ&acirc;y,gia&nbsp;đ&igrave;nh?t&igrave;nh cảm?hay&nbsp;đứa con?trong&nbsp;3  thứ&nbsp;đ&oacute; th&igrave;&nbsp;t&igrave;nh cảm l&agrave; nặng nhất v&igrave; trong suốt gần 2 năm y&ecirc;u nhau  m&igrave;nh&nbsp;đ&atilde; c&oacute; qu&aacute; nhiều kỉ niệm với n&agrave;ng,v&agrave; t&igrave;nh cảm với n&agrave;ng rất  s&acirc;u&nbsp;đậm,m&igrave;nh&nbsp;phải l&agrave;m sao?n&agrave;ng&nbsp;đ&atilde; cương quyết&nbsp;như vậy,h&atilde;y cho m&igrave;nh&nbsp;lời  khuy&ecirc;n!!!!!!!!!!</p>
<p>&nbsp;</p>', NULL, NULL)
GO
INSERT [dbo].[Consultings] ([ConsultingID], [Status], [ConsultingQuestions], [ConsultingAnwsers], [ConsultingDesction], [DatePost]) VALUES (6, N'Visible', N'Hạnh phúc về sau, nếu một ngày bạn thấy mình cô đơn hãy  đến với chúng tôi, Cầu Vòng Liên Kết sẽ giúp bạn thấy cuộc đời còn nhiểu ý nghĩa', N'<p>Cưới nhau đến 5 năm m&agrave; vợ  chồng t&ocirc;i vẫn chưa c&oacute; con. Hồi đ&oacute; chưa c&oacute; chuyện đi bệnh viện để x&aacute;c  định &ldquo;lỗi&rdquo; thuộc ai cho n&ecirc;n mọi người chung quanh nhất l&agrave; b&ecirc;n chồng đều  đổ lỗi về t&ocirc;i.</p>
<p align="justify" class="indexhometext">&nbsp;</p>
<div style="text-align: justify;">T&ocirc;i  chỉ &acirc;m thầm kh&oacute;c v&agrave; đi chữa hết thầy n&agrave;y đến thuốc nọ cũng v&ocirc; &iacute;ch. Mỗi  khi thấy chồng bồng bế n&acirc;ng niu những đứa ch&aacute;u nhỏ l&ograve;ng t&ocirc;i như t&ecirc;  điếng.   <br />
<br />
Một lần t&ocirc;i thu hết can đảm để n&oacute;i với anh: &ldquo;Th&ocirc;i,  em kh&ocirc;ng sinh nở được, anh h&atilde;y đi kiếm vợ kh&aacute;c đi...&rdquo;. Chưa n&oacute;i hết c&acirc;u  anh đ&atilde; lấy tay bụm miệng t&ocirc;i: &ldquo;N&oacute;i tầm bậy! Anh cấm em n&oacute;i c&acirc;u đ&oacute;&rdquo;.   <br />
<br />
T&ocirc;i  kh&oacute;c nức nở v&igrave; thương anh qu&aacute;. Từ đ&oacute; ai n&oacute;i g&igrave; t&ocirc;i cũng thấy vững l&ograve;ng  v&agrave; đỡ tủi v&igrave; biết chồng thương m&igrave;nh... Nhưng rồi mấy năm sau, c&ocirc;ng việc  l&agrave;m ăn của t&ocirc;i tốt đẹp, x&acirc;y được nh&agrave; mới rộng r&atilde;i nhưng lại vắng tiếng  trẻ con bi b&ocirc;. Một lần nữa t&ocirc;i lại năn nỉ anh: &ldquo;Th&ocirc;i anh đi ra ngo&agrave;i,  &ldquo;kiếm&rdquo; một đứa con với ai đ&oacute; rồi đem về cho em nu&ocirc;i, em kh&ocirc;ng ghen tu&ocirc;ng  g&igrave; đ&acirc;u, em biết anh thương em m&agrave;&rdquo;.   <br />
<br />
Anh lại cự nự nhưng rồi  t&ocirc;i n&oacute;i... dai n&ecirc;n dần dần anh cũng xi&ecirc;u l&ograve;ng. Khi biết anh quan hệ với  một phụ nữ g&oacute;a chồng ở đầu x&oacute;m, c&oacute; một đứa con trai đ&atilde; mười tuổi t&ocirc;i  vừa hy vọng nhưng vẫn &acirc;m thầm đau khổ v&igrave; ghen.   <br />
<br />
Kh&ocirc;ng ghen  sao được khi biết chồng m&igrave;nh đi lại với người đ&agrave;n b&agrave; kh&aacute;c, trẻ hơn m&igrave;nh,  rồi biết đ&acirc;u khi c&oacute; con người ta kh&ocirc;ng dứt được nhau. Hiểu l&ograve;ng t&ocirc;i anh  bảo, em y&ecirc;n t&acirc;m, anh muốn kiếm cho em một đứa con th&ocirc;i... Nhưng rốt  cuộc người phụ nữ ấy cũng kh&ocirc;ng sinh được con cho anh.   <br />
<br />
Anh  ch&aacute;n nản v&igrave; biết rằng ch&iacute;nh anh l&agrave; người c&oacute; &ldquo;lỗi&rdquo;. L&uacute;c n&agrave;y t&ocirc;i lại an ủi  anh v&agrave; c&agrave;ng thương anh hơn. D&ugrave; vậy bản năng l&agrave;m mẹ trong t&ocirc;i vẫn th&ocirc;i  th&uacute;c. T&ocirc;i b&agrave;n với anh xin một đứa con nu&ocirc;i.   <br />
<br />
Sau nhiều th&aacute;ng  chờ đợi ch&uacute;ng t&ocirc;i cũng xin được một đứa trẻ sơ sinh từ bệnh viện huyện,  của một c&ocirc; g&aacute;i lỡ lầm sinh xong đem cho. Khỏi phải n&oacute;i vợ chồng t&ocirc;i vui  mừng đến như thế n&agrave;o. V&igrave; kh&ocirc;ng c&oacute; sữa mẹ n&ecirc;n con b&eacute; hơi kh&oacute; nu&ocirc;i, nhiều  l&uacute;c phải thay nhau &ldquo;trực đ&ecirc;m&rdquo; với con nhưng vợ chồng hạnh ph&uacute;c v&ocirc; c&ugrave;ng.    <br />
<br />
Hai đứa ngượng nghịu tập xưng ba xưng mẹ với con. Ngẫu  nhi&ecirc;n m&agrave; con b&eacute; cũng c&oacute; n&eacute;t hao hao giống anh n&ecirc;n nhiều người mới quen  cứ tưởng đ&oacute; l&agrave; con ruột n&ecirc;n bảo &ldquo;Ch&agrave;, con g&aacute;i m&agrave; giống cha qu&aacute; h&eacute;n!&rdquo;  khiến anh sung sướng đỏ lựng cả mặt.   <br />
<br />
Căn nh&agrave; y&ecirc;n lặng l&acirc;u  nay bỗng rộn r&atilde; tiếng cười tiếng kh&oacute;c của con. Con g&aacute;i biết n&oacute;i rất sớm,  gọi ba gọi mẹ vang nh&agrave;. &Ocirc;ng b&agrave; nội, c&ocirc; ch&uacute; đến chơi chỉ dạy một lần l&agrave;  n&oacute; gọi đ&uacute;ng ch&oacute;c khiến ai cũng cưng.   <br />
<br />
Từ khi c&oacute; con, vợ  chồng t&ocirc;i kh&ocirc;ng c&ograve;n day dứt, nghĩ ngợi g&igrave; nữa, cứ y&ecirc;n t&acirc;m lo l&agrave;m ăn nu&ocirc;i  con, cuộc sống ng&agrave;y một sung t&uacute;c. Con g&aacute;i c&agrave;ng lớn c&agrave;ng xinh xắn đ&aacute;ng  y&ecirc;u khiến t&ocirc;i kh&ocirc;ng nghĩ đ&oacute; l&agrave; con nu&ocirc;i nữa v&agrave; anh nếu c&oacute; con đẻ chắc  anh cũng thương đến vậy m&agrave; th&ocirc;i.   <br />
<br />
Anh chăm s&oacute;c con từ c&aacute;i  răng c&aacute;i t&oacute;c, l&uacute;c n&agrave;o cũng cho con mặc quần d&agrave;i v&igrave; sợ con chơi lỡ trầy  xước, c&oacute; sẹo lớn l&ecirc;n kh&ocirc;ng diện được &aacute;o đầm... Anh dạy con học, đọc s&aacute;ch  cho nghe khiến n&oacute; c&ograve;n quấn qu&yacute;t anh hơn cả t&ocirc;i...   <br />
<br />
Giờ đ&acirc;y  con g&aacute;i l&ecirc;n th&agrave;nh phố học đại học, n&oacute; thường xuy&ecirc;n nhắn tin gọi điện về  nh&agrave;, xa nh&agrave; con g&aacute;i mới b&agrave;y tỏ t&igrave;nh cảm. N&oacute; bảo rằng n&oacute; nhớ ba mẹ lắm,  nhiều đ&ecirc;m nằm mơ thấy ba mẹ. Nghe ở qu&ecirc; c&oacute; lụt b&atilde;o l&agrave; n&oacute; lo thon th&oacute;t.  Nghe vừa thương con vừa thấy m&igrave;nh hạnh ph&uacute;c ngập tr&agrave;n...</div>
<p>&nbsp;</p>', N'Tình yêu về già', NULL)
GO
INSERT [dbo].[Consultings] ([ConsultingID], [Status], [ConsultingQuestions], [ConsultingAnwsers], [ConsultingDesction], [DatePost]) VALUES (8, N'Visible', N'Lý do nàng luôn quạu ?', N'<div class="fon33 mt1">(D&acirc;n tr&iacute;) - Một trải nghiệm chung đối với đ&agrave;n &ocirc;ng  tr&ecirc;n to&agrave;n thế giới l&agrave; lu&ocirc;n bị &ldquo;một nửa c&ograve;n lại&rdquo; đay nghiến, ch&igrave; chiết,  l&agrave;m t&igrave;nh l&agrave;m tội. D&ugrave; ch&agrave;ng cố gắng thế n&agrave;o cũng kh&ocirc;ng thể thay đổi &ldquo;sở  th&iacute;ch&rdquo; ch&ecirc; bai, chỉ tr&iacute;ch của n&agrave;ng.</div>
<div style="margin: 0in 0in 0pt;" class="MsoNormal">Kh&ocirc;ng phải tự nhi&ecirc;n  m&agrave; đ&agrave;n &ocirc;ng lu&ocirc;n bị &ldquo;ngược đ&atilde;i&rdquo; như vậy. Sự kh&aacute;c biệt về cơ chế sinh học  v&agrave; giao tiếp x&atilde; hội giữa nam v&agrave; nữ giải th&iacute;ch tại sao đ&agrave;n &ocirc;ng thường bị  phụ nữ chỉ tr&iacute;ch, bắt nạt. Nếu bạn thường xuy&ecirc;n phải dựng lại &ldquo;gi&agrave;n  thi&ecirc;n l&yacute; đổ&rdquo; nh&agrave; m&igrave;nh, h&atilde;y c&ugrave;ng t&igrave;m hiểu điều g&igrave; khiến n&agrave;ng b&ugrave;ng nổ v&agrave;  t&igrave;m c&aacute;ch xoa dịu n&agrave;ng th&agrave;nh c&ocirc;ng. <o:p></o:p></div>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><span style="font-weight: bold;">C&aacute;ch phụ nữ thể hiện bản th&acirc;n<o:p></o:p></span></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Phụ nữ chuyển tải  nhiều t&igrave;nh cảm v&agrave; th&aacute;i độ khi giao tiếp hơn nam giới. Trong một nghi&ecirc;n  cứu, khi được y&ecirc;u cầu viết một c&acirc;u chuyện t&igrave;nh y&ecirc;u, nam giới viết ngắn  hơn một nửa so với nữ giới. Đ&agrave;n &ocirc;ng tập trung v&agrave;o c&aacute;ch giải quyết vấn đề  c&ograve;n phụ nữ tập trung v&agrave;o th&aacute;i độ, t&igrave;nh cảm đi c&ugrave;ng với sự việc.<span style="">&nbsp; </span><o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">V&iacute; dụ trong quan hệ  y&ecirc;u đương, vợ chồng, sự kh&aacute;c biệt trong c&aacute;ch thể hiện t&igrave;nh cảm giải  th&iacute;ch tại sao khi bạn đi đổ r&aacute;c v&agrave; nghĩ rằng m&igrave;nh đang l&agrave;m việc nh&agrave; gi&uacute;p  n&agrave;ng, đang thể hiện t&igrave;nh cảm với n&agrave;ng, th&igrave; n&agrave;ng lại kh&ocirc;ng hề nhận ra ẩn  &yacute; t&igrave;nh y&ecirc;u đ&oacute;.</p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Tương tự, khi n&agrave;ng kể  cho bạn nghe về ng&agrave;y l&agrave;m việc mệt nho&agrave;i, bạn ngồi nghĩ c&aacute;ch gi&uacute;p n&agrave;ng  giải quyết, nhưng h&oacute;a ra n&agrave;ng chỉ cần những lời dịu d&agrave;ng, những cử chỉ  &acirc;u yếm từ bạn, với n&agrave;ng như thế mới l&agrave; sự gi&uacute;p đỡ tận t&acirc;m nhất. Sự kh&aacute;c  biệt trong c&aacute;ch thể hiện t&igrave;nh cảm khiến n&agrave;ng thường giận dỗi n&oacute;i rằng  bạn kh&ocirc;ng y&ecirc;u n&agrave;ng, kh&ocirc;ng quan t&acirc;m tới n&agrave;ng, tất cả l&agrave; bởi bạn v&agrave; n&agrave;ng  đ&atilde; kh&ocirc;ng hiểu được c&aacute;ch thể hiện t&igrave;nh cảm của nhau. <o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Để n&agrave;ng hiểu được cảm  nhận của bạn, h&atilde;y thể hiện bằng lời n&oacute;i v&agrave; cử chỉ y&ecirc;u thương thật thường  xuy&ecirc;n, nhưng đừng qu&ecirc;n &ldquo;quảng c&aacute;o&rdquo; để n&agrave;ng hiểu khi bạn thay lốp xe cho  n&agrave;ng cũng l&agrave; một c&aacute;ch giản dị để n&oacute;i rằng &ldquo;anh rất quan t&acirc;m, rất y&ecirc;u  thương em&rdquo;. <o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><span style="font-weight: bold;">Đ&agrave;n &ocirc;ng cần nhiều thời gian mới &ldquo;hạ hỏa&rdquo; được<o:p></o:p></span></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Khi hai người c&atilde;i nhau  v&agrave; bạn thấy v&ocirc; c&ugrave;ng tức giận, bạn c&oacute; thể sẽ lựa chọn c&aacute;ch im lặng v&agrave;  dừng cuộc tranh c&atilde;i bằng c&aacute;ch &ldquo;cấm khẩu&rdquo;, kh&ocirc;ng th&egrave;m n&oacute;i nữa, kh&ocirc;ng th&egrave;m  thể hiện cảm x&uacute;c g&igrave; nữa. Khi con người qu&aacute; tức giận hoặc buồn khổ, c&oacute;  hai c&aacute;ch để lựa chọn: hoặc tiếp tục chiến đấu (n&agrave;ng tiếp tục chỉ tr&iacute;ch  bạn gay gắt) hoặc cố gắng nghiến răng chịu đựng (bạn im lặng, mong muốn  mọi sự kết th&uacute;c thật nhanh). Đ&agrave;n &ocirc;ng lu&ocirc;n muốn kết th&uacute;c nhanh gọn những  &aacute;p lực v&agrave; căng thẳng thần kinh, họ c&oacute; thể ngay lập tức nhượng bộ, &ldquo;ngậm  hột thị&rdquo; mặc cho loa ph&aacute;t thanh cứ việc mở hết c&ocirc;ng suất, nhưng ch&iacute;nh  c&aacute;ch giải quyết đ&oacute; khiến cảm gi&aacute;c tức giận, tổn thương c&agrave;ng trở n&ecirc;n kh&oacute;  chịu v&agrave; kh&oacute; qu&ecirc;n. <o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Đ&agrave;n &ocirc;ng th&iacute;ch im lặng  thế đấy. Nhưng c&aacute;ch n&agrave;y kh&ocirc;ng gi&uacute;p giải quyết vấn đề hiệu quả, khi bạn  quyết im lặng đ&aacute;p lại sự lắm lời của vợ/người y&ecirc;u, n&agrave;ng sẽ cảm thấy m&igrave;nh  kh&ocirc;ng được lắng nghe, vậy l&agrave; n&agrave;ng c&agrave;ng n&oacute;i hăng say, đay nghiến c&agrave;ng  s&acirc;u cay v&agrave; anh c&agrave;ng ch&igrave;m s&acirc;u v&agrave;o sự im lặng &ldquo;tr&ecirc;u ngươi&rdquo;. T&oacute;m lại, một  v&ograve;ng tr&ograve;n luẩn quẩn, bế tắc c&oacute; thể g&acirc;y ra những ảnh hưởng kh&ocirc;ng nhỏ đối  với t&igrave;nh cảm hai người.</p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Để ph&aacute; vỡ v&ograve;ng tr&ograve;n  luẩn quẩn n&agrave;y, lần tới khi xảy ra &ldquo;khẩu chiến&rdquo; v&agrave; bạn đ&atilde; cảm thấy qu&aacute;  bức bối, kh&oacute; chịu, h&atilde;y n&oacute;i thế n&agrave;y: &ldquo;Anh kh&ocirc;ng đủ b&igrave;nh tĩnh để n&oacute;i  chuyện với em l&uacute;c n&agrave;y, ch&uacute;ng m&igrave;nh tạm &ldquo;ngưng chiến&rdquo; 40 ph&uacute;t em nh&eacute;&rdquo;. H&atilde;y  n&oacute;i cho n&agrave;ng nghe những cảm gi&aacute;c của bạn v&agrave; để n&agrave;ng hiểu điều bạn cần  chỉ l&agrave; thời gian &ldquo;hạ hỏa&rdquo;. Khi bạn n&oacute;i ra, n&agrave;ng sẽ hiểu cảm gi&aacute;c của bạn  cũng như l&yacute; do của sự im lặng kia (&Agrave;, h&oacute;a ra kh&ocirc;ng phải anh ta nhơn  nhơn tr&ecirc;u tức m&igrave;nh!), v&agrave; thế l&agrave; n&agrave;ng sẽ kh&ocirc;ng g&agrave;o to hơn v&igrave; hiểu nhầm  rằng bạn đ&atilde; lờ n&agrave;ng đi. <o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><span style="font-weight: bold;">Phụ nữ giỏi giao tiếp x&atilde; hội hơn nam giới<o:p></o:p></span></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Phụ nữ c&oacute; tố chất bẩm  sinh để thực hiện những giao tiếp x&atilde; hội một c&aacute;ch hiệu quả. Từ khi c&ograve;n  l&agrave; một đứa trẻ sơ sinh, c&aacute;c b&eacute; g&aacute;i đ&atilde; d&agrave;nh nhiều thời gian để nh&igrave;n v&agrave;o  mắt người kh&aacute;c hơn c&aacute;c b&eacute; trai. Ở tuổi ấu thơ, c&aacute;c b&eacute; g&aacute;i th&iacute;ch chơi  những tr&ograve; chơi gắn liền với c&aacute;c mối quan hệ c&ograve;n b&eacute; trai th&iacute;ch tham gia  v&agrave;o những pha h&agrave;nh động tưởng tượng đầy phi&ecirc;u lưu mạo hiểm v&agrave; kịch t&iacute;nh.  Ở tuổi trưởng th&agrave;nh, phụ nữ n&oacute;i nhiều hơn nam giới 3 lần, họ n&oacute;i ra  trung b&igrave;nh 20.000 từ một ng&agrave;y so với 7.000 từ của nam giới. Phụ nữ lu&ocirc;n  th&iacute;ch chia sẻ hơn nam giới v&agrave; n&agrave;ng sẽ rất tủi th&acirc;n, bị x&uacute;c phạm l&ograve;ng tự  trọng nếu kh&ocirc;ng được bạn đời quan t&acirc;m, chia sẻ, v&agrave; n&agrave;ng c&oacute; thể sẽ c&oacute;  những h&agrave;nh động tuyệt vọng tội nghiệp chỉ để thu h&uacute;t sự ch&uacute; &yacute; của chồng,  thậm ch&iacute; l&agrave; chỉ tr&iacute;ch, đay nghiến anh ta cho thỏa cơn tức giận. <o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Thực tế, sự chỉ tr&iacute;ch  của n&agrave;ng c&oacute; thể h&agrave;m &yacute;: &ldquo;H&atilde;y nghe em n&oacute;i đi, em đang c&oacute; việc quan trọng  m&agrave;!&rdquo;. Để giải quyết vấn đề, để bạn c&oacute; thời gian ở một m&igrave;nh v&agrave; n&agrave;ng vẫn  thấy m&igrave;nh được chồng quan t&acirc;m, t&ocirc;n trọng, h&atilde;y d&agrave;nh ra một khoảng thời  gian d&ugrave; chỉ l&agrave; 20 ph&uacute;t mỗi ng&agrave;y để n&oacute;i chuyện với n&agrave;ng. Trong thời gian  đ&oacute;, bạn chỉ được quan t&acirc;m v&agrave; nghĩ tới n&agrave;ng th&ocirc;i, một sự tập trung tuyệt  đối, h&atilde;y đ&oacute;ng vai tr&ograve; chủ động v&agrave; dẫn dắt cuộc n&oacute;i chuyện với n&agrave;ng. Khi  cần thời gian ở một m&igrave;nh để thư gi&atilde;n, h&atilde;y n&oacute;i nhẹ nh&agrave;ng thế n&agrave;y: &ldquo;Anh  rất muốn n&oacute;i chuyện với em l&uacute;c n&agrave;y, nhưng ng&agrave;y h&ocirc;m nay anh l&agrave;m việc mệt  mỏi, căng thẳng qu&aacute;, cho anh nghỉ một l&uacute;c đ&atilde; nh&eacute;&rdquo;.a <o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><span style="font-weight: bold;">Đ&agrave;n &ocirc;ng th&iacute;ch nắm quyền quyết định<o:p></o:p></span></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Trong gia đ&igrave;nh, đ&agrave;n  &ocirc;ng thấy kh&oacute; khăn trong việc chia sẻ quyền quyết định với vợ. Nhưng nếu  anh kh&ocirc;ng chia sẻ quyền quyết định với bạn đời, c&oacute; 81% mối quan hệ của  hai người sẽ đổ vỡ. Khi vai tr&ograve; quyết định v&agrave; khả năng ảnh hưởng lẫn  nhau của hai người qu&aacute; mất c&acirc;n bằng, ch&iacute;nh người đ&agrave;n &ocirc;ng sẽ phải đ&oacute;n  nhận nhiều lời chỉ tr&iacute;ch, tr&aacute;ch m&oacute;c từ người phụ nữ, đơn giản bởi n&agrave;ng  thấy &yacute; kiến của m&igrave;nh kh&ocirc;ng được coi trọng. N&agrave;ng sẽ thấy ấm ức, thậm ch&iacute;  v&ocirc; c&ugrave;ng tức giận. Nếu muốn n&agrave;ng bớt lời đi, h&atilde;y học c&aacute;ch chia sẻ quyền  lực. H&atilde;y nhượng bộ n&agrave;ng trong những quyết định kh&ocirc;ng ảnh hưởng nhiều tới  bạn. Đứng trước những quyết định quan trọng, h&atilde;y c&ugrave;ng n&agrave;ng b&agrave;n bạc, h&atilde;y  để n&agrave;ng c&ugrave;ng gh&eacute; vai g&aacute;nh v&aacute;c. <o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><span style="font-weight: bold;">B&ocirc;i trơn cỗ m&aacute;y gia đ&igrave;nh<o:p></o:p></span></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">V&igrave; đ&agrave;n &ocirc;ng v&agrave; phụ nữ  c&ugrave;ng chung sống tr&ecirc;n một h&agrave;nh tinh, v&agrave; d&ugrave; c&oacute; những sự kh&aacute;c biệt giữa hai  giới nhưng đ&oacute; l&agrave; l&yacute; do để hai b&ecirc;n học c&aacute;ch thấu hiểu cho nhau v&agrave; biến  sự kh&aacute;c biệt trở th&agrave;nh qui luật b&ugrave; trừ tuyệt vời trong mỗi gia đ&igrave;nh. Học  được điều n&agrave;y, đ&agrave;n &ocirc;ng sẽ xử l&yacute; tốt mọi m&acirc;u thuẫn trong gia đ&igrave;nh v&agrave; c&aacute;c  mối quan hệ với phụ nữ n&oacute;i chung. Mong h&ograve;a thuận v&agrave; b&igrave;nh y&ecirc;n sẽ đến với  tổ ấm của mỗi người đ&agrave;n &ocirc;ng ch&uacute;ng ta!<o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<div align="right" style="margin: 0in 0in 0pt; text-align: right;" class="MsoNormal"><span style="font-weight: bold;">Hồ B&iacute;ch Ngọc</span></div>
<p>&nbsp;</p>', NULL, CAST(0x00009EBA00000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Consultings] OFF
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
SET IDENTITY_INSERT [dbo].[Comment] ON 

GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (1, N'Dummy', NULL, 1, NULL, 1, 2, N'', CAST(0x00009EA900000000 AS DateTime), N'', 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (11, N'New', NULL, 2, NULL, 5, 2, N'tao xau qua', CAST(0x00009EB30114A51A AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (12, N'Approve', NULL, 2, NULL, 5, 2, N'Blog vừa tạo chưa có nội dung gì cả', CAST(0x00009EB301156742 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (15, N'Approve', NULL, 10, NULL, 1, 3, N'một ngày thật đáng nhớ', CAST(0x00009EB501001998 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (16, N'Approve', NULL, 10, NULL, 1, 6, N'cảm nhận về hoa vàng', CAST(0x00009EB501250AE0 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (17, N'Approve', NULL, 3, NULL, 9, 2, N'tàu chạy gì mà ghê quá bà con ơi', CAST(0x00009EB6016983DB AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (18, N'Approve', NULL, 3, NULL, 9, 2, N'chạy kiểu này có mả có mà chết, hỏng giám đi tàu nữa', CAST(0x00009EB6016A8E91 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (19, N'Approve', NULL, 3, NULL, 9, 2, N'falksflksdflk
', CAST(0x00009EB6016ABF1F AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (20, N'Approve', NULL, 3, NULL, 9, 2, N'afafjafasfasfaf', CAST(0x00009EB6016AD34B AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (21, N'Approve', NULL, 3, NULL, 9, 2, N'afahfjasfkjjfaskjf', CAST(0x00009EB6016AE55E AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (22, N'Approve', NULL, 10, NULL, 13, 2, N'test good blog', CAST(0x00009EB6018AD77A AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (58, N'New', NULL, 10, NULL, 10, 2, N'kim yến bình luận về blog của minh châu', CAST(0x00009EBB00176ADB AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (59, N'New', NULL, 10, NULL, 11, 2, N'yến bình luận', CAST(0x00009EBB001F1902 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (70, N'New', NULL, 10, NULL, 18, 2, N'test bình luận', CAST(0x00009ECA01427331 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (71, N'New', NULL, 5, NULL, 20, 2, N'VFF gà ăn quẩn cối xay', CAST(0x00009ECC0115FBF3 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (72, N'New', NULL, 5, NULL, 20, 2, N'test ajax', CAST(0x00009ECC012A96ED AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (73, N'New', NULL, 5, NULL, 20, 2, N'tiếp theo', CAST(0x00009ECC012BDB38 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (74, N'New', NULL, 5, NULL, 20, 2, N'test test test', CAST(0x00009ECC0132D8F7 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (75, N'New', NULL, 5, NULL, 20, 2, N'ajax chạy đi đâu rồi', CAST(0x00009ECC013441E5 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (76, N'New', NULL, 5, NULL, 20, 2, N'abc', CAST(0x00009ECC0134D966 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (77, N'New', NULL, 5, NULL, 20, 2, N'thanh cong', CAST(0x00009ECC01370539 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (78, N'New', NULL, 5, NULL, 20, 2, N'hieu.nguyen', CAST(0x00009ECC0157EB4F AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (79, N'New', NULL, 5, NULL, 20, 2, N'thanh conng', CAST(0x00009ECC017165AE AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (80, N'New', NULL, 5, NULL, 20, 2, N'thanh conng chua', CAST(0x00009ECC0172E3C9 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (81, N'New', NULL, 10, NULL, 18, 2, N'thanh cong', CAST(0x00009ECD0148DAB1 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (82, N'New', NULL, 10, NULL, 18, 2, N'thanhcong ', CAST(0x00009ECD014A1460 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (83, N'New', NULL, 10, NULL, 18, 2, N'dasfdsf', CAST(0x00009ECD014DD7C9 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (84, N'New', NULL, 10, NULL, 18, 2, N'11111111111111111111', CAST(0x00009ECD014F0B13 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (85, N'New', NULL, 10, NULL, 18, 2, N'22222222222222222', CAST(0x00009ECD014F3FE6 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (86, N'New', NULL, 10, NULL, 13, 2, N'2222222222222', CAST(0x00009ECD014F6CB1 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (87, N'Delete', NULL, 10, NULL, 13, 2, N'333333333333333333', CAST(0x00009ECD014FAA7E AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (88, N'New', NULL, 5, NULL, 20, 2, N'test ajax', CAST(0x00009ECE0003BF62 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (89, N'New', NULL, 5, NULL, 20, 2, N'hieu 23-4-2011', CAST(0x00009ECE00045ED4 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (90, N'New', NULL, 10, NULL, 18, 2, N'hieu test 12345', CAST(0x00009ECE000AB0FE AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (91, N'New', NULL, 10, NULL, 18, 2, N'test test test', CAST(0x00009ECE000C4CA0 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (92, N'New', NULL, 10, NULL, 18, 2, N'test test test', CAST(0x00009ECE000C57C7 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (93, N'New', NULL, 10, NULL, 18, 2, N'test thanh cong', CAST(0x00009ECE00EACB45 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (94, N'New', NULL, 10, NULL, 18, 2, N'hieu test ddddddd', CAST(0x00009ECE00EF8936 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (95, N'New', NULL, 10, NULL, 18, 2, N'comment trang cuoi', CAST(0x00009ECE00F012E3 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (96, N'New', NULL, 10, NULL, 18, 2, N'con gi dau em ', CAST(0x00009ECE00F19AC5 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (97, N'New', NULL, 10, NULL, 18, 2, N'hieu nguyen', CAST(0x00009ECE00F28C4C AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (100, N'New', NULL, 10, NULL, 13, 2, N'ngày không bình yên', CAST(0x00009ECE00F7E305 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (103, N'New', NULL, 10, NULL, 8, 2, N'hiểu', CAST(0x00009ECE00FD71F3 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (104, N'New', NULL, 10, NULL, 8, 2, N'co roi', CAST(0x00009ECE00FD9A54 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (105, N'New', NULL, 10, NULL, 8, 2, N'good', CAST(0x00009ECE00FDA0BF AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (106, N'New', NULL, 10, NULL, 8, 2, N'thanh cong', CAST(0x00009ECE00FDA662 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (107, N'New', NULL, 10, NULL, 8, 2, N'kaka', CAST(0x00009ECE00FDB90C AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (111, N'New', NULL, 10, NULL, 18, 2, N'fff', CAST(0x00009ECE0109DF10 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (112, N'Delete', NULL, 10, NULL, 10, 2, N'hieu test', CAST(0x00009ECE010EA794 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (113, N'New', NULL, 10, NULL, 18, 2, N'dd', CAST(0x00009ECE01124A04 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (114, N'New', NULL, 10, NULL, 18, 2, N'dsdfs', CAST(0x00009ECE012CAA87 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (161, N'New', NULL, 10, NULL, 18, 2, N'dsfgdfg', CAST(0x00009ECF01180D29 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (194, N'New', NULL, 5, NULL, 22, 2, N'sao kỳ vậy? làm hoài không được', CAST(0x00009ED00011EF8C AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (195, N'New', NULL, 5, NULL, 22, 2, N'thì sao? tại làm chưa đúng cách
', CAST(0x00009ED0001209A3 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (196, N'New', NULL, 5, NULL, 22, 2, N'làm được bánh chưa', CAST(0x00009ED0001410F7 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (197, N'New', NULL, 5, NULL, 22, 2, N'hix mới làm được một phần
', CAST(0x00009ED000144CE9 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (222, N'New', NULL, 10, NULL, 18, 2, N'thông tin
', CAST(0x00009ED0008CEA57 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (264, N'New', NULL, 10, NULL, 13, 2, N'test', CAST(0x00009ED100E277A5 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (265, N'New', NULL, 10, NULL, 13, 2, N'hieu', CAST(0x00009ED100E2C222 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (277, N'New', NULL, 10, NULL, 13, 2, N'tinh nhu
', CAST(0x00009ED100E74F08 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (278, N'Delete', NULL, 10, NULL, 13, 2, N'tinh nhu
fsfksfdslkkl', CAST(0x00009ED100E77D09 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (354, N'New', 1, 10, 2, 1, 2, N'tuổi nào như lá', CAST(0x00009ED2003E255F AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (355, N'New', 354, 10, 2, 1, 2, N'thứ I ok', CAST(0x00009ED2003E54A9 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (356, N'New', 1, 10, 2, 1, 2, N'thứ 2', CAST(0x00009ED2003E8DEE AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (357, N'New', 354, 10, 2, 1, 2, N'thứ II ok ko?', CAST(0x00009ED2003EB2D8 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (358, N'New', 354, 10, 2, 1, 2, N'thứ II ok ko?dfsfs', CAST(0x00009ED2003EE2CE AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (359, N'New', 354, 10, 2, 1, 2, N'test', CAST(0x00009ED2003F6367 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (360, N'New', 354, 10, 2, 1, 2, N'testvsfsfsdf', CAST(0x00009ED2003F6F26 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (361, N'New', 354, 10, 2, 1, 2, N'sfsfsdf', CAST(0x00009ED2003FBEF7 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (365, N'New', 1, 10, 10, 1, 2, N'sfsfs', CAST(0x00009ED200402EC3 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (366, N'New', 365, 10, 10, 1, 2, N'sfsfdsdf', CAST(0x00009ED2004034D4 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (368, N'New', 365, 10, 10, 1, 2, N'nguyen hong  hieu', CAST(0x00009ED2008826B3 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (371, N'New', 365, 10, 10, 1, 2, N'hieu nguyen', CAST(0x00009ED2008A43BF AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (373, N'New', 365, 10, 10, 1, 2, N'abc123', CAST(0x00009ED2008B90B4 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (378, N'New', 365, 10, 10, 1, 2, N'thanh cong roi', CAST(0x00009ED2008E650B AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (380, N'Delete', 365, 10, 10, 1, 2, N'làm gì mà lâu quá vậy', CAST(0x00009ED2008EA7FD AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (382, N'New', 365, 10, 10, 1, 2, N'co tuoi nao cho em', CAST(0x00009ED20090C6AA AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (384, N'New', 1, 10, 10, 1, 2, N'tuổi trẻ ', CAST(0x00009ED2009EB29D AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (385, N'New', 1, 10, 10, 1, 2, N'dân trí
', CAST(0x00009ED2009EBA2E AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (386, N'New', 1, 10, 10, 1, 2, N'vnexpress', CAST(0x00009ED2009EBF7F AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (387, N'New', 1, 10, 10, 1, 2, N'thanh niên', CAST(0x00009ED2009EE4CC AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (388, N'New', 1, 10, 10, 1, 2, N'hieu nguyễn', CAST(0x00009ED200A5FC0A AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (389, N'New', 1, 10, 10, 1, 2, N'thôi', CAST(0x00009ED200A81267 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (390, N'New', 389, 10, 10, 1, 2, N'em hãy về', CAST(0x00009ED200A823C5 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (391, N'New', 1, 10, 10, 1, 2, N'hiểu rồi', CAST(0x00009ED200AAC6D0 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (395, N'Delete', 365, 10, 10, 1, 2, N'very good', CAST(0x00009ED200AC51B4 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (396, N'Delete', 386, 10, 10, 1, 2, N'comment vnexpress', CAST(0x00009ED200AC8AE1 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (397, N'New', 1, 5, 5, 1, 2, N'tuong  nha toi', CAST(0x00009ED200ACF7CC AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (398, N'New', 1, 5, 5, 1, 2, N'co ai tham quan nha toi khong nhi', CAST(0x00009ED200AD14EE AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (399, N'New', 1, 5, 5, 1, 2, N'sao lai khong co ai het', CAST(0x00009ED200AD1EE7 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (400, N'New', 1, 5, 5, 1, 2, N'troi oi buon qua vay', CAST(0x00009ED200AD2A88 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (401, N'New', 1, 5, 5, 1, 2, N'troi oi buon qua vay', CAST(0x00009ED200AD2BC2 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (402, N'New', 397, 5, 5, 1, 2, N'co ai chia se noi buon khong', CAST(0x00009ED200AD522A AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (403, N'New', 397, 5, 5, 1, 2, N'sao ky vay ha', CAST(0x00009ED200AD606F AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (404, N'New', 400, 5, 5, 1, 2, N'mot ngay khong em anh co buon khong', CAST(0x00009ED200AD7B16 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (405, N'New', 399, 5, 5, 1, 2, N'sao roi tren troi ai den tim em', CAST(0x00009ED200AD8AC6 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (407, N'New', 391, 5, 10, 1, 2, N'sau do up cho ban vai dieu', CAST(0x00009ED200ADCE0B AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (411, N'Delete', 397, 10, 5, 1, 2, N'test', CAST(0x00009ED200C6F73B AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (412, N'New', 1, 10, 5, 1, 2, N'ssdfsd', CAST(0x00009ED200C93859 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (413, N'New', 365, 10, 0, 1, 2, N'tsdfd', CAST(0x00009ED200D8E215 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (414, N'Delete', 399, 10, 5, 1, 2, N'sdfsd', CAST(0x00009ED200DE8B8C AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (415, N'Delete', 399, 10, 5, 1, 2, N'fsdfsdf', CAST(0x00009ED200DE9063 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (416, N'Delete', 399, 10, 5, 1, 2, N'sdfsfds', CAST(0x00009ED200DE948C AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (417, N'New', 399, 10, 5, 1, 2, N'fsdfsf', CAST(0x00009ED200DE9851 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (418, N'New', 399, 10, 5, 1, 2, N'mới I đây', CAST(0x00009ED200DEB0AB AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (419, N'New', 399, 10, 0, 1, 2, N'hieu roi ', CAST(0x00009ED200E34B38 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (420, N'Delete', 399, 10, 0, 1, 2, N'xong chua ', CAST(0x00009ED200E350FD AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (421, N'Delete', 399, 10, 0, 1, 2, N'ok good good', CAST(0x00009ED200E35BF8 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (422, N'New', 399, 10, 5, 1, 2, N'hieu roi fsdfa', CAST(0x00009ED200E3A779 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (423, N'New', 399, 10, 5, 1, 2, N'ai vậy ta', CAST(0x00009ED200E3C9E1 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (424, N'Delete', NULL, 5, NULL, 13, 2, N'tôi binh luận', CAST(0x00009ED201003BCB AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (425, N'New', NULL, 5, NULL, 21, 2, N'blog gi ma ghe vậy
', CAST(0x00009ED201010673 AS DateTime), NULL, 0, NULL)
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (426, N'New', 365, 10, 10, 1, 2, N'good', CAST(0x00009ED201101B51 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (427, N'New', 387, 10, 10, 1, 2, N'thanh viên', CAST(0x00009ED2015E0A7C AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (428, N'New', 1, 10, 10, 1, 2, N'cung vì yêu em mà lòng hóa điên dại', CAST(0x00009ED2015E29C6 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (429, N'New', 1, 10, 1, 1, 3, N'tinh yeu nhu nang', CAST(0x00009ED30004A7E2 AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (430, N'Delete', 1, 10, 1, 1, 3, N'fsdfsa', CAST(0x00009ED30004DE04 AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (431, N'New', 1, 10, 1, 1, 7, N'tôi yêu thành phố này', CAST(0x00009ED30006EECA AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (432, N'New', 1, 10, 1, 1, 7, N'fsdfsdf', CAST(0x00009ED300070733 AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (433, N'New', 1, 10, 1, 1, 7, N'sdfsdfsdf', CAST(0x00009ED30007134C AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (434, N'New', 1, 10, 1, 1, 7, N'0sdfsdfsdf', CAST(0x00009ED300071928 AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (435, N'New', 1, 10, 1, 1, 7, N'0fsdfsdfsd', CAST(0x00009ED3000721C1 AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (436, N'New', 1, 10, 1, 1, 7, N'dfsdf', CAST(0x00009ED300087ACA AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (437, N'New', 1, 5, 1, 1, 3, N'TUOI DA BUON', CAST(0x00009ED30086EDA3 AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (438, N'New', 1, 10, 1, 1, 3, N'nguyễn hồng hiếu', CAST(0x00009ED3008B073D AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (439, N'New', 1, 10, 1, 1, 3, N'trang cuối', CAST(0x00009ED3008F9CB3 AS DateTime), NULL, 0, N'Event')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (440, N'New', 388, 10, 10, 1, 2, N'toi day', CAST(0x00009ED40100A180 AS DateTime), NULL, 0, N'Wall')
GO
INSERT [dbo].[Comment] ([CommentID], [Status], [CommentParentID], [UserID], [UserWall], [BlogID], [EventID], [CommentContent], [Datepost], [Description], [IsTypical], [CommentType]) VALUES (441, N'New', 1, 10, 10, 1, 2, N'hom nay nghi le roi', CAST(0x00009ED40100B288 AS DateTime), NULL, 0, N'Wall')
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
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
SET IDENTITY_INSERT [dbo].[Events] ON 

GO
INSERT [dbo].[Events] ([EventID], [Status], [FK_EventParentID], [FK_AlbumID], [EventName], [Description], [EventContent], [Datepost], [EventLocation], [EventTime], [EventDate], [EventAgeJoint], [EventImages], [IsTypical]) VALUES (2, N'Dummy', 1, 1, N'', NULL, N'', CAST(0x00009EAE00000000 AS DateTime), NULL, NULL, CAST(0x00009E8A00000000 AS DateTime), NULL, NULL, 0)
GO
INSERT [dbo].[Events] ([EventID], [Status], [FK_EventParentID], [FK_AlbumID], [EventName], [Description], [EventContent], [Datepost], [EventLocation], [EventTime], [EventDate], [EventAgeJoint], [EventImages], [IsTypical]) VALUES (3, N'Visible', 2, 2, N'Ngày valentine nồng ấm cho tình nhân', N'Sự kiện dành cho các đôi tình nhân', N'<h2 class="contentheadingy nghia cac ngay le, &yacute; nghĩa c&aacute;c ng&agrave;y lễ"><a href="http://www.hoatuoidep.com/tu-van-hoa-tuoi/y-nghia-cac-ngay-le/380-ngay-valentine--qngay-tinh-yeuq.html" class="contentpagetitley nghia cac ngay le, &yacute; nghĩa c&aacute;c ng&agrave;y lễ"> 		Ng&agrave;y valentine : &quot;ng&agrave;y t&igrave;nh y&ecirc;u&quot;	</a></h2>
<p>&nbsp;</p>
<p><br />
<img width="NaN" height="150" align="left" style="margin-right: 10px;" title="" src="http://www.hoatuoidep.com/images/stories/20752279_images1440346_hallow.jpg" alt="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  Ng&agrave;y 14 th&aacute;ng 2 l&agrave; ng&agrave;y lễ Valentine, ng&agrave;y lễ của những t&igrave;nh nh&acirc;n đang  y&ecirc;u nhau thắm thiết. Họ gởi cho nhau những tấm thiệp với lời lẽ y&ecirc;u  đương n&ograve;ng ch&aacute;y hoặc những c&aacute;nh hoa hồng rực rở tượng trưng cho t&igrave;nh  y&ecirc;u. Trong dịp n&agrave;y người ta thường kể lại c&acirc;u chuyện t&igrave;nh của quận c&ocirc;ng  d&quot; Orl&eacute;ans. Khi &ocirc;ng bị qu&acirc;n Anh bắt v&agrave; đem giam ở Tour de Londres, cứ  đến ng&agrave;y lễ Valentine th&igrave; qu&acirc;n Anh cho ph&eacute;p &ocirc;ng được viết một bức thư  gởi cho người y&ecirc;u l&agrave; quận ch&uacute;a Marie de Cleves, những bức thư n&agrave;y l&agrave;  những bức thư t&igrave;nh nổi tiếng trong văn học của nước Ph&aacute;p. Sau khi được  qu&acirc;n Anh thả ra khỏi t&ugrave; &ocirc;ng đ&atilde; cưới người y&ecirc;u Marie l&agrave;m vợ.</p>', CAST(0x00009EAE00000000 AS DateTime), N'Nhà văn hóa thanh niên Q1', N'19 h đến 24 h', CAST(0x00009E8A00000000 AS DateTime), N'18 đến 45 tuổi', N'../../Images/Events/sukien_demo1.gif', 1)
GO
INSERT [dbo].[Events] ([EventID], [Status], [FK_EventParentID], [FK_AlbumID], [EventName], [Description], [EventContent], [Datepost], [EventLocation], [EventTime], [EventDate], [EventAgeJoint], [EventImages], [IsTypical]) VALUES (4, N'Visible', 2, 1, N'Happy Wonmen''s Day', N'', N'<p>C&ugrave;ng nhau ch&uacute;c mừng v&agrave; t&ocirc;n vinh những người phụ nữ quanh ta</p>', CAST(0x00009EAE00000000 AS DateTime), N'Nhà văn hóa phụ nữ', N'10h30-22h30', CAST(0x00009EA000000000 AS DateTime), N'14- 50 tuổi', N'../../Images/Events/sukien_demo3.gif', 0)
GO
INSERT [dbo].[Events] ([EventID], [Status], [FK_EventParentID], [FK_AlbumID], [EventName], [Description], [EventContent], [Datepost], [EventLocation], [EventTime], [EventDate], [EventAgeJoint], [EventImages], [IsTypical]) VALUES (5, N'Visible', 2, 1, N'Hâm nóng tình yêu', N'', N'<p>C&ugrave;ng nhau &ocirc;n lại những kỷ niệm</p>', CAST(0x00009EAE00000000 AS DateTime), N'Công ty cầu vồng liên kết', N'19h đến 22 h', CAST(0x00009EAF00000000 AS DateTime), N'18 đến 35', N'../../Images/Events/5phuthenho_2.jpg', 0)
GO
INSERT [dbo].[Events] ([EventID], [Status], [FK_EventParentID], [FK_AlbumID], [EventName], [Description], [EventContent], [Datepost], [EventLocation], [EventTime], [EventDate], [EventAgeJoint], [EventImages], [IsTypical]) VALUES (6, N'Visible', 2, 1, N'Chiến dịch tìm ý trung nhân', N'', N'<p>hoa vang<img width="102" height="77" alt="" src="/Content/fckeditor/editor/filemanager/connectors/aspx/userfiles/Tulips(2).jpg" /></p>', CAST(0x00009EAE00000000 AS DateTime), N'Công ty cầu vồng liên kết', N'10h30-22h30', CAST(0x00009EAF00000000 AS DateTime), N'28 đến 40', N'../../Images/Events/sukien_demo2.gif', 0)
GO
INSERT [dbo].[Events] ([EventID], [Status], [FK_EventParentID], [FK_AlbumID], [EventName], [Description], [EventContent], [Datepost], [EventLocation], [EventTime], [EventDate], [EventAgeJoint], [EventImages], [IsTypical]) VALUES (7, N'Visible', 2, 1, N'Thành phố tôi yêu', N'Cập nhật ok', N'<p style="text-align: center;">T&ocirc;i y&ecirc;u th&agrave;nh phố của t&ocirc;i<br />
Y&ecirc;u từ khi mới ra đời<br />
C&oacute; g&oacute;c phố ng&ocirc;i trường<br />
C&oacute; bến nước con đường<br />
Nắng sớm mưa chiều gợi nhớ trong t&ocirc;i bao điều<br />
<br />
Th&agrave;nh phố t&ocirc;i y&ecirc;u cho t&ocirc;i tr&aacute;i tim tự h&agrave;o<br />
Th&agrave;nh phố t&ocirc;i y&ecirc;u cho t&ocirc;i ước mơ dạt d&agrave;o<br />
Bao năm một kiếp người, trăm năm cuộc bể d&acirc;u<br />
S&agrave;i G&ograve;n của t&ocirc;i c&acirc;y xanh b&oacute;ng m&aacute;t<br />
S&agrave;i G&ograve;n của t&ocirc;i &acirc;m vang tiếng h&aacute;t<br />
Đ&atilde; qua nhiều cay đắng ngọt b&ugrave;i<br />
Trẻ trung m&atilde;i m&atilde;i, thắm tươi th&ecirc;m từng ng&agrave;y<br />
<br />
Th&agrave;nh phố t&ocirc;i y&ecirc;u năm xưa h&eacute;o kh&ocirc; cuộc đời<br />
Th&agrave;nh phố t&ocirc;i y&ecirc;u năm xưa mất bao nụ cười<br />
Bao đ&ecirc;m mẹ mỏi m&ograve;n, tin con nơi đạn bom<br />
Một ng&agrave;y m&ugrave;a xu&acirc;n lung linh nắng ấm<br />
S&agrave;i G&ograve;n sục s&ocirc;i như mu&ocirc;n lớp s&oacute;ng<br />
Phố tưng bừng vui đ&oacute;n qu&acirc;n về<br />
Cờ sao phất phới, mắt rưng rưng lệ tr&agrave;o</p>', CAST(0x00009EB500000000 AS DateTime), N'Nhà văn hóa thanh niên Q1, tp HCM', N'7 giờ đến 18 giờ', CAST(0x00009EB400000000 AS DateTime), N'18-30 tuổi', N'../../Images/Events/Thiennhien-2.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[Events] OFF
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
SET IDENTITY_INSERT [dbo].[Photo] ON 

GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (1, N'Dummy', 1, N'--Chọn--', CAST(0x00009EA900000000 AS DateTime), N'')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (2, N'Delete', 2, N'hieu test', CAST(0x00009EA900000000 AS DateTime), N'../../images/ico_users_64.png')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (3, N'UnApprove', 3, N'', CAST(0x00009EB2009F5D5A AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (4, N'Approve', 2, N'', CAST(0x00009EB2009F5D5F AS DateTime), N'../../../Content/Images/Penguins.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (5, N'Approve', 2, N'', CAST(0x00009EB2009F5D5F AS DateTime), N'../../../Content/Images/dautroc.png')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (6, N'Approve', 2, N'', CAST(0x00009EB200A0D8ED AS DateTime), N'../../../Content/Images/Chrysanthemum.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (7, N'Approve', 2, N'', CAST(0x00009EB200A0D8ED AS DateTime), N'../../../Content/Images/Tulips.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (8, N'Approve', 2, N'', CAST(0x00009EB4003449CC AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (9, N'Approve', 2, N'', CAST(0x00009EB400923811 AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (10, N'Approve', 9, N'', CAST(0x00009EB40180E592 AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (11, N'Approve', 9, N'', CAST(0x00009EB40180E598 AS DateTime), N'../../../Content/Images/huong.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (12, N'Approve', 9, N'', CAST(0x00009EB40180E59A AS DateTime), N'../../../Content/Images/Picnic.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (13, N'Approve', 9, N'', CAST(0x00009EB40180E59B AS DateTime), N'../../../Content/Images/Thiennhien.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (14, N'Approve', 9, N'', CAST(0x00009EB40180E59C AS DateTime), N'../../../Content/Images/Thiennhien-2.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (15, N'Approve', 9, N'', CAST(0x00009EB40180E59D AS DateTime), N'../../../Content/Images/thiennhien-3.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (16, N'Approve', 9, N'', CAST(0x00009EB40180E46C AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (17, N'Approve', 9, N'', CAST(0x00009EB40180E598 AS DateTime), N'../../../Content/Images/huong.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (18, N'Approve', 9, N'', CAST(0x00009EB40180E598 AS DateTime), N'../../../Content/Images/Picnic.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (19, N'Delete', 9, N'', CAST(0x00009EB40180E598 AS DateTime), N'../../../Content/Images/Thiennhien.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (20, N'Approve', 9, N'', CAST(0x00009EB40180E598 AS DateTime), N'../../../Content/Images/Thiennhien-2.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (21, N'Approve', 9, N'', CAST(0x00009EB40180E598 AS DateTime), N'../../../Content/Images/thiennhien-3.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (22, N'Approve', 10, N'', CAST(0x00009EB5001B6B46 AS DateTime), N'../../../Content/Images/Thiennhien.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (23, N'Approve', 10, N'', CAST(0x00009EB5001B700A AS DateTime), N'../../../Content/Images/thiennhien-1.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (24, N'Approve', 10, N'', CAST(0x00009EB5001B72E6 AS DateTime), N'../../../Content/Images/Thiennhien-2.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (25, N'Approve', 10, N'', CAST(0x00009EB5001B75A2 AS DateTime), N'../../../Content/Images/thiennhien-3.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (26, N'Approve', 11, N'', CAST(0x00009EB5009248AF AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (27, N'Approve', 12, N'Hình chia sẽ cho thành viên Nguyễn thành nhân', CAST(0x00009EB80010577C AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (28, N'Approve', 13, N'Hình chia sẽ cho thành viên Nguyễn hồng hiếu', CAST(0x00009EB800105B88 AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (29, N'Approve', 3, N'', CAST(0x00009EBC001D1E87 AS DateTime), N'../../../Content/Images/images.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (30, N'Approve', 17, N'', CAST(0x00009EBC00BACE1E AS DateTime), N'../../../Content/Images/CheaRim.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (31, N'Delete', 17, N'', CAST(0x00009EBC00BACE1F AS DateTime), N'../../../Content/Images/images.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (32, N'Delete', 17, N'', CAST(0x00009EBC00BBD992 AS DateTime), N'../../../Content/Images/huongmuahe.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (33, N'New', 17, N'', CAST(0x00009EBC00BF91D5 AS DateTime), N'../../../Content/Images/a25VT.QT181210.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (34, N'New', 17, N'', CAST(0x00009EBC00C0A44C AS DateTime), N'../../../Content/Images/hongkong.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (35, N'Delete', 17, N'', CAST(0x00009EBC00C0A455 AS DateTime), N'../../../Content/Images/huongmuahe.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (36, N'New', 17, N'', CAST(0x00009EBC00C0A455 AS DateTime), N'../../../Content/Images/images.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (37, N'New', 17, N'', CAST(0x00009EBC00C0A455 AS DateTime), N'../../../Content/Images/nonla.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (38, N'Delete', 17, N'', CAST(0x00009EBC00C1E534 AS DateTime), N'../../../Content/Images/300311-nu-tinh_130.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (39, N'New', 18, N'', CAST(0x00009EBC00CA41A0 AS DateTime), N'../../../Content/Images/kyquan1.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (40, N'New', 18, N'', CAST(0x00009EBC00CA41A1 AS DateTime), N'../../../Content/Images/kyquan2.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (41, N'New', 18, N'', CAST(0x00009EBC00CA41AD AS DateTime), N'../../../Content/Images/kyquan3.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (42, N'Approve', 12, N'Hình chia sẽ cho thành viên Nguyễn thành nhân', CAST(0x00009EBC00D810B0 AS DateTime), N'../../../Content/Images/CheaRim.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (43, N'Delete', 12, N'Hình chia sẽ cho thành viên Nguyễn thành nhân', CAST(0x00009EBC00D85B50 AS DateTime), N'../../../Content/Images/CheaRim.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (44, N'Delete', 4, N'', CAST(0x00009EBC00DA013E AS DateTime), N'../../../Content/Images/kyquan3.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (45, N'Approve', 4, N'', CAST(0x00009EBC00DB2F36 AS DateTime), N'../../../Content/Images/Picnic.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (46, N'Delete', 17, N'', CAST(0x00009EBF01844266 AS DateTime), N'../../../Content/Images/images.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (47, N'Delete', 17, N'', CAST(0x00009EC000031DDC AS DateTime), N'../../../Content/Images/kyquan1.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (48, N'UnApprove', 19, N'Hình chia sẽ cho thành viên Trần Thanh Tùng', CAST(0x00009EC1002EBC0C AS DateTime), N'../../../Content/Images/kyquan1.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (49, N'Approve', 17, N'', CAST(0x00009EC4001DE60E AS DateTime), N'../../../Content/Images/IMG_2335.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (50, N'Approve', 12, N'Hình chia sẽ cho thành viên Nguyễn thành nhân', CAST(0x00009EC4001ECF2D AS DateTime), N'../../../Content/Images/IMG_2335.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (51, N'Approve', 21, N'Hình chia sẽ cho thành viên Nguyễn Quang Hoàng', CAST(0x00009EC4001ECF56 AS DateTime), N'../../../Content/Images/IMG_2335.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (52, N'Approve', 3, N'', CAST(0x00009EC40133DD2D AS DateTime), N'../../../Content/Images/CheaRim.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (53, N'New', 3, N'', CAST(0x00009EC700A2A0D7 AS DateTime), N'../../../Content/Images/HQ1.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (54, N'Delete', 4, N'', CAST(0x00009EC700AB4426 AS DateTime), N'../../../Content/Images/kyquan1.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (55, N'New', 4, N'', CAST(0x00009EC700BF376C AS DateTime), N'../../../Content/Images/HQ1.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (56, N'New', 4, N'', CAST(0x00009EC700C423E6 AS DateTime), N'../../../Content/Images/images.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (69, N'New', 4, N'', CAST(0x00009EC701037A02 AS DateTime), N'../../../Content/Images/Images10.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (70, N'New', 4, N'', CAST(0x00009EC7010D60BA AS DateTime), N'../../../Content/Images/Images101.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (71, N'New', 4, N'', CAST(0x00009EC7010D8AC2 AS DateTime), N'../../../Content/Images/Images102.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (72, N'New', 4, N'', CAST(0x00009EC701119809 AS DateTime), N'../../../Content/Images/Images10.png')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (73, N'Delete', 4, N'', CAST(0x00009EC70111C5EF AS DateTime), N'../../../Content/Images/Images101.png')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (74, N'New', 4, N'', CAST(0x00009EC70112AD8F AS DateTime), N'../../../Content/Images/Images101.png')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (75, N'Approve', 23, N'', CAST(0x00009EC7011EE478 AS DateTime), N'../../../Content/Images/Images5.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (76, N'Approve', 23, N'', CAST(0x00009EC7011F0FE7 AS DateTime), N'../../../Content/Images/Images51.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (77, N'Delete', 23, N'', CAST(0x00009EC7011F1AB6 AS DateTime), N'../../../Content/Images/Images52.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (78, N'New', 17, N'', CAST(0x00009ECA013F0B94 AS DateTime), N'../../../Content/Images/Images103.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (79, N'Approve', 12, N'Hình ảnh được chia sẽ ', CAST(0x00009ECC00D5304F AS DateTime), N'../../../Content/Images/IMG_2335.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (80, N'Approve', 24, N'Hình ảnh được chia sẽ ', CAST(0x00009ECD00B62E99 AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (81, N'Approve', 19, N'Hình ảnh được chia sẽ ', CAST(0x00009ECD00B63541 AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (82, N'Approve', 12, N'Hình ảnh được chia sẽ ', CAST(0x00009ECD00B795D4 AS DateTime), N'../../../Content/Images/hello_kitty_angel_heart2.gif')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (83, N'Approve', 19, N'Hình ảnh được chia sẽ ', CAST(0x00009ECD00B85CDE AS DateTime), N'../../../Content/Images/Penguins.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (84, N'Approve', 12, N'Hình ảnh được chia sẽ ', CAST(0x00009ECD00EA3BC3 AS DateTime), N'../../../Content/Images/IMG_2335.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (85, N'Approve', 25, N'Hình ảnh được chia sẽ ', CAST(0x00009ECD00F55FF2 AS DateTime), N'../../../Content/Images/Images10.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (86, N'New', 29, N'', CAST(0x00009ED000050773 AS DateTime), N'../../../Content/Images/Images54.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (87, N'New', 29, N'', CAST(0x00009ED000050774 AS DateTime), N'../../../Content/Images/Images541.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (88, N'New', 29, N'', CAST(0x00009ED000050774 AS DateTime), N'../../../Content/Images/Images542.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (89, N'New', 29, N'', CAST(0x00009ED000050775 AS DateTime), N'../../../Content/Images/Images543.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (90, N'New', 29, N'', CAST(0x00009ED000050776 AS DateTime), N'../../../Content/Images/Images544.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (91, N'New', 29, N'', CAST(0x00009ED000050777 AS DateTime), N'../../../Content/Images/Images545.JPG')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (92, N'Approve', 30, N'', CAST(0x00009ED000B18199 AS DateTime), N'../../../Content/Images/Images52.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (93, N'Delete', 30, N'', CAST(0x00009ED000B181A2 AS DateTime), N'../../../Content/Images/Images5.htm')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (94, N'Approve', 30, N'', CAST(0x00009ED000B181A3 AS DateTime), N'../../../Content/Images/Images53.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (95, N'Approve', 30, N'', CAST(0x00009ED000B181A3 AS DateTime), N'../../../Content/Images/Images55.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (96, N'Approve', 30, N'', CAST(0x00009ED000B181AE AS DateTime), N'../../../Content/Images/Images56.jpg')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (97, N'Approve', 30, N'', CAST(0x00009ED000B181AE AS DateTime), N'../../../Content/Images/Images5.png')
GO
INSERT [dbo].[Photo] ([PhotoID], [Status], [AlbumID], [Description], [DateUpload], [PhotoPath]) VALUES (98, N'Approve', 12, N'Hình ảnh được chia sẽ ', CAST(0x00009ED000B2E5AC AS DateTime), N'../../../Content/Images/HQ1.jpg')
GO
SET IDENTITY_INSERT [dbo].[Photo] OFF
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
SET IDENTITY_INSERT [dbo].[Blog] ON 

GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (1, N'Dummy', N'', 1, N'Dummy', N'', N'', CAST(0x002D247F00000000 AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (3, N'Delete', N'tuổi 30', 4, N'hieu test', N'<p>Ng&agrave;y ta bước qua tuổi 30 c&oacute; nhiểu điều để nh&igrave;n lại,một  nữa cuộc đời</p>', N'../../../Images/Blogs/Thiennhien-2.jpg', CAST(0x00009EA800000000 AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (4, N'UnApprove', N'tuổi 35', 2, N'hieu test', N'<p>Ng&agrave;y ta bước qua tuổi 30 c&oacute; nhiểu điều để nh&igrave;n lại,một  nữa cuộc đời</p>', N'../../../Images/Blogs/Picnic.jpg', CAST(0x00009EA800000000 AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (5, N'Delete', N'Mới vừa tạo blog', 3, NULL, N'<p>b&agrave;i h&aacute;t mang t&acirc;m safdasfdasd


dafasd
adsfự buồn của một người</p>', N'../../../Images/Blogs/Tulips.jpg', CAST(0x00009EB100C54B62 AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (8, N'Approve', N'Trận cầu đinh cao bóng đá anh', 2, NULL, N'<p class="Normal"><span style="background-color: rgb(51, 204, 204);">&nbsp;</span><strong>Thay đổi kh&ocirc;ng d&ugrave;ng UpdateModel Đ&acirc;y l&agrave; một tấm h&igrave;nh giả, v&agrave; tạo n&ecirc;n n&oacute; l&agrave; một nh&oacute;m cổ động vi&ecirc;n của MU - những                      người đang xem Atkinson như kẻ th&ugrave;. Họ ch&acirc;m biếm cho rằng trọng t&agrave;i n&agrave;y chẳng                      kh&aacute;c n&agrave;o người của Chelsea.</strong></p>
<p class="Normal">Atkinson trong v&agrave;i m&ugrave;a giải gần đ&acirc;y thường xuy&ecirc;n c&oacute; những quyết định g&acirc;y tranh                      c&atilde;i v&agrave; c&oacute; phần bất lợi cho MU trong những trận đấu &ocirc;ng bắt ch&iacute;nh.</p>
<p class="Normal">Mới đ&acirc;y nhất l&agrave; trận đấu tr&ecirc;n s&acirc;n Stamford Bridge ở Ngoại hạng Anh. Atkinson đ&atilde;                      kh&ocirc;ng truất quyền thi đấu của David Luiz khi cầu thủ n&agrave;y phạm lỗi với Wayne                      Rooney, v&agrave; kh&ocirc;ng l&acirc;u sau đ&oacute; c&ograve;n thổi phạt đền g&acirc;y tranh c&atilde;i dẫn đến trận thua                      1-2 của MU. M&ugrave;a trước cũng ch&iacute;nh tr&ecirc;n s&acirc;n của Chelsea, Atkinson đ&atilde; cho đội chủ                      nh&agrave; hưởng một quả phạt m&agrave; theo HLV Alex Ferguson l&agrave; kh&ocirc;ng đ&aacute;ng c&oacute;, dẫn đến t&igrave;nh                      huống John Terry ghi b&agrave;n duy nhất đem lại chiến thắng cho Chelsea.</p>
<p class="Normal">Tuy nhi&ecirc;n nếu như MU chỉ tr&iacute;ch Atkinson, ở chiều ngược lại cổ động vi&ecirc;n của                      Chelsea cũng c&oacute; l&yacute; do để ch&acirc;m biếm.</p>
<p class="Normal">H&ocirc;m qua trọng t&agrave;i Mark Clattenburg điều khiển trận đấu của Man City v&agrave; Aston                      Villa ở v&ograve;ng 5 Cup FA (tỷ số 3-0 nghi&ecirc;ng về đội chủ s&acirc;n City of Manchester).                      Trong một t&igrave;nh huống tranh chấp khoảng đầu hiệp hai, cầu thủ Mario Balotelli đ&atilde;                      th&uacute;c c&ugrave;i chỏ v&agrave;o mặt Chris Herd của đội kh&aacute;ch v&agrave; ngay lập tức phải nhận thẻ v&agrave;ng                      từ Clattenburg.</p>
<table cellspacing="0" cellpadding="3" border="0" align="center" width="1">
    <tbody>
        <tr>
            <td><img height="251" border="1" width="400" alt="Trọng t&agrave;i Clattenberg được cho l&agrave; đ&atilde; nương tai với Rooney." src="http://vnexpress.net/Files/Subject/3b/a2/70/3c/rooney.jpg" /></td>
        </tr>
        <tr>
            <td class="Image">Trọng t&agrave;i Clattenberg được cho l&agrave; đ&atilde; nương tay với Rooney.</td>
        </tr>
    </tbody>
</table>
<p class="Normal">Sẽ chẳng c&oacute; g&igrave; đ&aacute;ng n&oacute;i nếu đ&oacute; l&agrave; một trọng t&agrave;i kh&aacute;c. Nhưng đằng n&agrave;y lại l&agrave;                      ch&iacute;nh Clattenburg - người đ&atilde; bỏ qua <a class="Normal" href="http://vnexpress.net/gl/the-thao/2011/03/rooney-thoat-an-phat-du-danh-doi-phuong/">                     <font color="#800080">t&igrave;nh huống đ&aacute;nh c&ugrave;i chỏ của Wayne Rooney</font></a> được                      cho l&agrave; nghi&ecirc;m trọng hơn trong trận đấu với Wigan tại Ngoại hạng Anh cuối tuần                      trước. Một tờ b&aacute;o th&acirc;n Chelsea đ&atilde; li&ecirc;n kết hai sự việc tr&ecirc;n trong một b&agrave;i viết                      mang t&ecirc;n: &quot;Chiếc thẻ v&agrave;ng của Balotelli quả l&agrave; sự nhạo b&aacute;ng đối với vụ tho&aacute;t tội                      của Rooney&quot;.</p>
<p class="Normal">C&aacute;ch đ&acirc;y kh&ocirc;ng l&acirc;u, vị trọng t&agrave;i nổi tiếng của Anh Howard Webb cũng bị chế nhạo                      l&agrave; ủng hộ vi&ecirc;n của MU.</p>', N'../../../Images/Blogs/Hydrangeas.jpg', CAST(0x00009EB1010A34D3 AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (9, N'Approve', N'Tàu hỏa', 3, NULL, N'<p>T&agrave;u hỏa &ldquo;đụng&rdquo; xe đi ăn hỏi, 9 người tử vong</p>
<div class="fon33 mt1">(D&acirc;n tr&iacute;) - Một vụ tai nạn đường sắt nghi&ecirc;m  trọng vừa xảy ra tr&ecirc;n Quốc lộ 1A cũ tại địa phận huyện Thường T&iacute;n, H&agrave;  Nội. Đo&agrave;n t&agrave;u đ&acirc;m n&aacute;t đu&ocirc;i một chiếc xe du lịch 16 chỗ chở đo&agrave;n ăn hỏi  từ Th&aacute;i Nguy&ecirc;n cố vượt đường sắt khiến 9 người tử vong.</div>
<div align="center">
<div><img align="center" width="450" alt="" style="margin: 5px;" src="http://dantri.vcmedia.vn/Uploaded/2011/03/30/tau300311-1sua.jpg" _fl="" /></div>
</div>
<div align="center"><span style="font-size: 10pt; font-family: Tahoma;">Chiếc xe cố băng ngang đường sắt khi đo&agrave;n t&agrave;u đ&atilde; tới rất gần. </span></div>
<div align="center">&nbsp;</div>
<div>Vụ tai nạn xảy ra khoảng 15h30. Chiếc xe du lịch loại 16 chỗ BKS  20L-4564 đi từ đường th&ocirc;n Đ&igrave;nh Tổ x&atilde; Mễ Sơn, Thường T&iacute;n ra đường Quốc lộ  1A cũ. Khi băng qua đường sắt, kh&ocirc;ng c&oacute; r&agrave;o chắn, th&igrave; bị t&agrave;u hỏa đi  hướng Nam&nbsp;- Bắc đ&acirc;m v&agrave;o đu&ocirc;i xe.</div>
<div>&nbsp;</div>
<div>Tại hiện trường, chiếc xe bị t&agrave;u đ&acirc;m m&oacute;p m&eacute;p rất nặng ở phần  đu&ocirc;i,&nbsp;bắn về&nbsp;b&ecirc;n phải&nbsp;v&agrave; mắc kẹt v&agrave;o h&agrave;ng r&agrave;o chắn b&ecirc;n đường. Chiếc xe  va chạm h&uacute;c đổ cả một cột đ&egrave;n t&iacute;n hiệu của ng&agrave;nh đường sắt.</div>
<div>&nbsp;</div>
<div align="center">
<div><img align="center" width="450" alt="" style="margin: 5px;" src="http://dantri.vcmedia.vn/Uploaded/2011/03/30/tau300311-2%20sua.jpg" _fl="" /></div>
</div>
<div align="center"><span style="font-size: 10pt; font-family: Tahoma;">Chiếc xe kẹt v&agrave;o h&agrave;ng r&agrave;o chắn b&ecirc;n đường với 2 thi thể mắc kẹt b&ecirc;n trong. </span></div>
<div>7 người tr&ecirc;n xe &ocirc;t&ocirc;&nbsp;tử vong&nbsp;tại chỗ. C&oacute; 2 thi thể dập n&aacute;t, mắc kẹt  trong xe, lực lượng cứu hộ đ&atilde; phải mất nhiều thời gian k&eacute;o chiếc xe mới  đưa được c&aacute;c nạn nh&acirc;n ra ngo&agrave;i. Được biết, l&aacute;i xe v&agrave; một đ&ocirc;i vợ chồng  c&ugrave;ng con nhỏ ngồi h&agrave;ng ghế tr&ecirc;n chỉ bị thương nhẹ.</div>
<div>&nbsp;</div>
<div>Một nh&acirc;n chứng trực tiếp thấy cảnh va chạm cho biết, t&agrave;i xế khi đ&oacute;  vừa chạy xe vừa nghe điện thoại. Đến gần ng&atilde; 3 giao cắt với đường sắt,  người d&acirc;n đ&atilde; h&ocirc; b&aacute;o c&oacute; t&agrave;u nhưng t&agrave;i xế vẫn tiếp tục nghe điện thoại v&agrave;  cho xe vượt nhưng kh&ocirc;ng kịp. Đo&agrave;n t&agrave;u lao tới, &ldquo;cắt&rdquo; ngang đu&ocirc;i xe.</div>', N'../../Images/Blogs/tau300311-2 sua.jpg', CAST(0x00009EB60168172E AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (10, N'Approve', N'Nữ tính của vợ đâu rồi?', 3, NULL, N'<div class="fon33 mt1">Sau khi cưới, nhiều người vợ đ&aacute;nh mất đi vẻ dịu d&agrave;ng, nữ t&iacute;nh.</div>
<div style="margin: 0in 0in 0pt;" class="MsoNormal">&nbsp;</div>
<div align="center" style="margin: 0in 0in 0pt;" class="MsoNormal"><span style="font-weight: bold;"><img src="http://dantri.vcmedia.vn/Uploaded/2011/03/30/7de300311-nu-tinh.jpg" alt="" /><br />
<br />
</span></div>
<div style="margin: 0in 0in 0pt;" class="MsoNormal"><span style="font-weight: bold;">B&agrave;i ca gi&aacute; cả<o:p></o:p></span></div>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Anh Long thấy rằng số  lần vợ gắt gỏng v&igrave; tiền nong, v&igrave; gi&aacute; cả tăng diễn ra nhiều nhất trong  v&ograve;ng hai th&aacute;ng qua. Cứ chờ l&uacute;c chồng về đến nh&agrave; l&agrave; chị Ngọc lại lải nhải  n&agrave;o &ldquo;rau cải bằng c&aacute;i t&iacute; ấy m&agrave; 9 ngh&igrave;n bạc&rdquo;, &ldquo;thịt th&agrave; tăng vậy th&igrave; ăn  nỗi g&igrave;?&rdquo;, &ldquo;gi&aacute; m&agrave; lương anh th&ecirc;m được v&agrave;i triệu nữa th&igrave; em đỡ khổ&rdquo;&hellip;<o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Kh&ocirc;ng đủ ki&ecirc;n nhẫn để  nghe hết &ldquo;b&agrave;i ca gi&aacute; cả&rdquo; của vợ, anh Long chỉ biết thở d&agrave;i rồi chui v&agrave;o  giường nằm ngủ trước v&igrave; chung quy lại cũng l&agrave; chuyện bị vợ ch&ecirc; h&egrave;n k&eacute;m,  kh&ocirc;ng bằng người nọ, người kia. T&igrave;nh h&igrave;nh c&ograve;n trở n&ecirc;n căng thẳng hơn khi  phải đ&oacute;ng tiền học cho con v&agrave; đi mừng đ&aacute;m cưới.<o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Theo lời anh Long th&igrave;  mỗi lần chờ vợ r&uacute;t v&iacute; để bỏ v&agrave;o phong b&igrave; đều phải t&iacute;nh to&aacute;n chi li, rồi  n&acirc;ng l&ecirc;n đặt xuống m&atilde;i mới quyết định được đi mừng bao nhi&ecirc;u. &ldquo;Nhiều l&uacute;c  t&ocirc;i c&oacute; cảm gi&aacute;c như vợ đang bố th&iacute; cứ l&agrave;m như m&igrave;nh đi chơi chẳng bằng&rdquo;,  anh Long n&oacute;i th&ecirc;m.<o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Bữa ăn chắp b&oacute;p đ&atilde;  đ&agrave;nh nhưng những lời vợ cằn nhằn khiến anh thấy rất khổ t&acirc;m. Dường như  cứ đụng đến c&aacute;i g&igrave; thiếu thốn l&agrave; chị Ngọc lại trở th&agrave;nh một người kh&aacute;c  vậy. Kh&ocirc;ng phải l&agrave; người trực tiếp đi chợ nhưng anh Long cũng đủ thấm  th&iacute;a cơn b&atilde;o gi&aacute; n&agrave;y ảnh hưởng kh&ocirc;ng &iacute;t đến &ldquo;h&ograve;a b&igrave;nh&rdquo; v&agrave; sự y&ecirc;n ổn của  gia đ&igrave;nh m&igrave;nh. Điều anh nhận ra r&otilde; nhất l&agrave; giọng n&oacute;i của vợ cứ sang  sảng, kh&ocirc;ng c&ograve;n nhẹ nh&agrave;ng, ngọt ng&agrave;o như trước.<o:p></o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p>Trường hợp kh&aacute;c, anh  H&ugrave;ng cũng khổ sở v&igrave; vợ chẳng c&ograve;n dịu d&agrave;ng như xưa m&agrave; hơi t&iacute; l&agrave; nổi kh&ugrave;ng  l&ecirc;n. Tất cả cũng chỉ v&igrave; đồng tiền trượt gi&aacute; m&agrave; lương bổng của cả hai vợ  chồng vẫn &ldquo;dậm ch&acirc;n tại chỗ&rdquo;. Thời gian gần đ&acirc;y, cũng giống nhiều gia  đ&igrave;nh kh&aacute;c, c&aacute;c khoản chi ti&ecirc;u trong nh&agrave; đều bị vợ cắt giảm đ&aacute;ng kể,  những bữa cơm tối &ecirc;m đềm, vui vẻ chỉ c&ograve;n đếm tr&ecirc;n đầu ng&oacute;n tay. Thay v&agrave;o  đ&oacute; l&agrave; việc vợ hạch s&aacute;ch, cau c&oacute; v&agrave; thi thoảng c&ograve;n dậm ch&acirc;n, nạt nộ nếu  chồng l&agrave;m sai việc g&igrave;.</p>', N'../../Images/Blogs/300311-nu-tinh_130.jpg', CAST(0x00009EB6017238C8 AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (11, N'Approve', N'Nữ tính của vợ đâu rồi? test blog2', 3, NULL, N'<div class="fon33 mt1">Sau khi cưới, nhiều người vợ đ&aacute;nh mất đi vẻ dịu d&agrave;ng, nữ t&iacute;nh.</div>', N'../../Images/Blogs/300311-nu-tinh_130.jpg', CAST(0x00009EB601723890 AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (13, N'New', N'ĐT Việt Nam gặp thuận lợi ở vòng loại World Cup 2014', 10, NULL, N'<p>D&acirc;n tr&iacute;) - H&ocirc;m nay, Li&ecirc;n đo&agrave;n BĐ ch&acirc;u &Aacute; đ&atilde; tổ  chức bốc thăm v&ograve;ng sơ loại World Cup 2014 v&agrave; v&ograve;ng loại Olympic London  2012. ĐT Việt Nam được đ&aacute;nh gi&aacute; gặp nhiều thuận lợi khi đối mặt Ma Cao  (Trung Quốc) ở v&ograve;ng sơ loại World Cup, c&ograve;n tuyển Olympic sẽ vấp phải kh&oacute;  khăn&hellip;</p>
<div style="margin: 0in 0in 0pt;" class="MsoNormal">Theo  thể thức thi đấu vừa th&ocirc;ng qua, 16 đội b&oacute;ng c&oacute; thứ hạng thấp sẽ tham dự  v&ograve;ng loại World Cup 2014 với thể thức knock-out qua 2 lượt trận s&acirc;n nh&agrave;  v&agrave; s&acirc;n kh&aacute;ch. 8 đội gi&agrave;nh v&eacute; vượt qua v&ograve;ng sơ loại, c&ugrave;ng 22 đội b&oacute;ng c&oacute;  thứ hạng cao hơn tiếp tục đấu loại trực tiếp để lựa chọn ra 15 đội b&oacute;ng  đi tiếp.</div>
<div style="margin: 0in 0in 0pt;" class="MsoNormal">&nbsp;</div>
<div align="center" style="margin: 0in 0in 0pt;" class="MsoNormal">
<div><img align="center" width="450" _fl="" src="http://dantri.vcmedia.vn/Uploaded/2011/03/30/a25VT.QT181210.jpg" style="margin: 5px;" alt="" /></div>
</div>
<div align="center" style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p><span style="font-size: 10pt; font-family: Tahoma;">&nbsp;ĐT Việt Nam c&oacute; nhiều cơ hội vượt qua v&ograve;ng sơ loại World Cup 2014 - Ảnh: Quang Thắng</span></o:p></div>
<div align="center" style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p></o:p>&nbsp;</div>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Theo kết quả bốc thăm vừa được Li&ecirc;n đo&agrave;n BĐ ch&acirc;u &Aacute; (AFC) th&ocirc;ng b&aacute;o, ở v&ograve;ng sơ loại World Cup 2014, ĐT Việt <st1:place w:st="on"><st1:country-region w:st="on">Nam</st1:country-region></st1:place> gặp Ma Cau - Trung Quốc. Đ&acirc;y được xem như cơ hội rất thuận lợi để c&aacute;c tuyển thủ Việt <st1:place w:st="on"><st1:country-region w:st="on">Nam</st1:country-region></st1:place> gi&agrave;nh v&eacute; đi tiếp, bởi sự vượt trội về lực lượng v&agrave; kinh nghiệm so với đối thủ.</p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Việt <st1:place w:st="on"><st1:country-region w:st="on">Nam</st1:country-region></st1:place>  sẽ tiếp Ma Cau - Trung Quốc tr&ecirc;n s&acirc;n Mỹ Đ&igrave;nh ở trận lượt đi diễn ra  ng&agrave;y 29/6, trận lượt về diễn ra ng&agrave;y 3/7. Nếu gi&agrave;nh v&eacute; đi tiếp v&agrave;o v&ograve;ng  loại thứ 2, ĐT Việt <st1:country-region w:st="on">Nam</st1:country-region> phải đối đầu với đối thủ mạnh đến từ T&acirc;y &Aacute; l&agrave; <st1:country-region w:st="on"><st1:place w:st="on">Qatar</st1:place></st1:country-region>.</p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Trong khi ĐT Việt Nam  gặp thuận lợi tại v&ograve;ng loại World Cup 2014, lứa đ&agrave;n em Olympic lại vấp  phải rất nhiều kh&oacute; khăn khi đối mặt đối thủ Ả Rập x&ecirc; &uacute;t ngay v&ograve;ng loại  thứ 2 m&ocirc;n b&oacute;ng đ&aacute; nam Olympic London 2012 khu vực ch&acirc;u &Aacute;. Trận đấu lượt  đi tổ chức tr&ecirc;n s&acirc;n Ả Rập x&ecirc; &uacute;t ng&agrave;y 19/6, lượt về thi đấu tại Mỹ Đ&igrave;nh  ng&agrave;y 23/6.</p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Cũng trong chiều nay,  AFC đ&atilde; tiến h&agrave;nh th&ocirc;ng qua thể thức thi đấu v&agrave; ph&acirc;n chia lịch thi đấu  v&ograve;ng loại giải U16 ch&acirc;u &Aacute; v&agrave; U19 Ch&acirc;u &Aacute; 2012.</p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">40 đội b&oacute;ng tham dự  v&ograve;ng loại giải U16 ch&acirc;u &Aacute; được chia l&agrave;m 7 bảng, c&aacute;c đội sẽ thi đấu v&ograve;ng  tr&ograve;n t&iacute;nh điểm để chọn ra 14 đội đứng đầu c&aacute;c bảng gi&agrave;nh v&eacute; tham dự v&ograve;ng  đấu kế tiếp. Ở giải đấu n&agrave;y, Việt <st1:country-region w:st="on"><st1:place w:st="on">Nam</st1:place></st1:country-region> thi đấu tại bảng F c&ugrave;ng: Nhật Bản, Đ&agrave;i Loan (Trung Quốc), L&agrave;o, H&agrave;n Quốc, Campuchia.</p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Ở v&ograve;ng loại giải U19  ch&acirc;u &Aacute; c&oacute; tổng số 39 đội trong khu vực tham gia, c&aacute;c đội b&oacute;ng cũng được  chia th&agrave;nh 7 bảng đếu để lựa chọn ra 2 đội c&oacute; th&agrave;nh t&iacute;ch tốt nhất gi&agrave;nh  v&eacute; dự v&ograve;ng đấu kết tiếp. Theo kết quả bốc thăm, U19 Việt <st1:country-region w:st="on">Nam</st1:country-region> nằm ở bảng F c&ugrave;ng với: <st1:country-region w:st="on">Myanmar</st1:country-region>, <st1:place w:st="on"><st1:country-region w:st="on">Malaysia</st1:country-region></st1:place>, CHDCND Triều Ti&ecirc;n, L&agrave;o.</p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal"><o:p>&nbsp;</o:p></p>
<p style="margin: 0in 0in 0pt;" class="MsoNormal">Để chuẩn bị cho c&aacute;c  trận đấu v&ograve;ng loại World Cup 2014 (ĐT Việt Nam) v&agrave; v&ograve;ng loại m&ocirc;n b&oacute;ng đ&aacute;  nam Olympic London 2012, hiện l&atilde;nh đạo VFF vẫn đang tiến h&agrave;nh r&agrave; so&aacute;t  c&aacute;c ứng cử vi&ecirc;n để lựa chọn ra gương mặt ph&ugrave; hợp bổ nhiệm v&agrave;o chiếc &ldquo;ghế  n&oacute;ng&rdquo; bỏ trống từ đầu th&aacute;ng 3.</p>', N'../../Images/Blogs/a25VT.QT181210.jpg', CAST(0x00009EB6018943A2 AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (18, N'New', N'Nữ sinh trung học liên tục ngất xỉu', 10, NULL, N'<h2 class="Lead"><span style="font-size: small;">Cho&aacute;ng, ngất xỉu, kh&oacute; thở, sợ h&atilde;i, chiều 2/4, s&aacute;u nữ  sinh lớp 7 v&agrave; một nữ sinh lớp 8, trường THCS Tịnh Hiệp đ&atilde; phải nhập Bệnh  viện đa khoa Quảng Ng&atilde;i.</span></h2>
<p class="Normal">Đ&acirc;y l&agrave; lần thứ hai, bảy nữ sinh n&agrave;y bị ngất. Bốn ng&agrave;y  trước, đang học trong lớp th&igrave; c&aacute;c em bỗng dưng ngất xỉu. C&aacute;c gi&aacute;o vi&ecirc;n  đ&atilde; đưa đến sơ cứu ở trạm x&aacute; rồi đưa đến điều trị tại bệnh viện huyện.  Sau bốn đ&ecirc;m điều trị tại đ&acirc;y, c&aacute;c b&aacute;c sĩ cho xuất viện trở về đi học  b&igrave;nh thường th&igrave; bảy nữ sinh n&agrave;y lại đồng loạt cho&aacute;ng, ngất xỉu.</p>
<table width="1" cellspacing="0" cellpadding="3" border="0" align="center">
    <tbody>
        <tr>
            <td><img width="490" height="350" border="1" alt="Học sinh ngất đang được điều trị tại bệnh viện. Ảnh: Tr&iacute; T&iacute;n." src="http://vnexpress.net/Files/Subject/3b/a2/83/c6/3-4,_Anh_2,_Nhieu_hoc_sinh_nu_ngat_xiu_phai_nhap_vien_gui_VNE.jpg" /></td>
        </tr>
        <tr>
            <td class="Image">Học sinh ngất đang được điều trị tại bệnh viện. Ảnh: <em>Tr&iacute; T&iacute;n.</em></td>
        </tr>
    </tbody>
</table>
<p class="Normal">Trao đổi với <em>Vnexpress.net</em> s&aacute;ng nay, thầy  gi&aacute;o Đỗ Đ&igrave;nh Thuận, Hiệu trưởng trường THCS Tịnh Hiệp, huyện Sơn Tịnh  cho biết, ngay sau khi sự việc xảy ra, ban gi&aacute;m hiệu đ&atilde; tổ chức họp,  trấn an phụ huynh học sinh b&igrave;nh tĩnh để chủ động xử l&yacute; t&igrave;nh huống học  sinh ngất xỉu.</p>
<p class="Normal">C&aacute;n bộ y tế trạm x&aacute; của x&atilde; chẩn đo&aacute;n, c&aacute;c nữ sinh ngất  xỉu c&oacute; thể do thiếu dinh dưỡng. C&ograve;n theo c&aacute;c b&aacute;c sĩ Bệnh viện đa khoa  Quảng Ng&atilde;i, c&aacute;c nữ sinh bị hội chứng Hysteria. Đ&acirc;y l&agrave; hội chứng d&acirc;y  chuyền, xảy ra đối với c&aacute;c nữ sinh tuổi dậy th&igrave;, đang ph&aacute;t triển nhanh  nhưng thiếu một số vi chất g&acirc;y mất c&acirc;n bằng t&acirc;m, sinh l&yacute;.</p>
<p class="Normal">B&aacute;c sĩ Nguyễn Tấn Phụ, Trưởng khoa Nhi, Bệnh viện đa  khoa Quảng Ng&atilde;i khuy&ecirc;n nh&agrave; trường, phụ huynh cần b&igrave;nh tĩnh, tr&aacute;nh g&acirc;y  hoang mang, lo sợ cho học sinh khiến hội chứng bệnh dễ l&acirc;y lan nhanh v&agrave;  xảy ra với cường độ cao hơn.</p>', N'../../../Images/Blogs/3-4,_Anh_2,_Nhieu_hoc_sinh_nu_ngat_xiu_phai_nhap_vien_gui_VNE.jpg', CAST(0x00009EBB001E897A AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (20, N'New', N'VFF khó tìm người thay ông Calisto vì tiền lương', 5, NULL, N'<h2 class="Lead">Hợp đồng t&agrave;i trợ tiền lương cho HLV tuyển Việt Nam giữa  VFF v&agrave; c&ocirc;ng ty AVG mặc nhi&ecirc;n hết hiệu lực khi &ocirc;ng thầy người Bồ Đ&agrave;o Nha  chia tay. Việc chưa t&igrave;m được nh&agrave; t&agrave;i trợ thay thế khiến VFF l&uacute;ng t&uacute;ng  khi chọn HLV mới.</h2>
<p class="Normal">Năm 2008 khi HLV Calisto lần thứ hai nắm tuyển Việt  Nam, tiền lương trong một năm hợp đồng của &ocirc;ng được VFF lấy từ 10.000  USD của Ủy ban TDTT, phần c&ograve;n lại lấy từ khoản 2 tỷ đồng t&agrave;i trợ cho đội  tuyển. Năm 2010, &ocirc;ng Calisto t&aacute;i k&yacute; hợp đồng ba năm, nhận mức lương  24000 USD mỗi th&aacute;ng. Ngo&agrave;i 10.000 USD theo định mức từ Ủy ban TDTT, VFF  đ&atilde; thuyết phục được C&ocirc;ng ty nghe nh&igrave;n to&agrave;n cầu (AVG) g&aacute;nh v&aacute;c phần lương  c&ograve;n lại của &ocirc;ng Calisto.</p>
<p class="Normal">Khi &ocirc;ng Calisto chuyển tới CLB Muang Thong của Th&aacute;i  Lan, hợp đồng t&agrave;i trợ tiền lương cho HLV tuyển Việt Nam giữa AVG v&agrave; VFF  hết hiệu lực. Th&ocirc;ng tin từ VFF cho hay, tổ chức n&agrave;y đang thuyết phục AVG  tiếp tục chia sẻ khoản tiền lương của vị HLV mới. Ở thời điểm đồng &yacute;  nhận tr&aacute;ch nhiệm trả một phần lương của &ocirc;ng Calisto, AVG đang thuyết  phục VFF b&aacute;n bản quyền truyền h&igrave;nh V-League trong 20 năm. Nay thương vụ  đ&oacute; đ&atilde; ho&agrave;n tất. Đ&acirc;y được cho l&agrave; l&yacute; do khiến AVG kh&ocirc;ng dễ d&agrave;ng gật đầu  trước đề nghị của VFF lần n&agrave;y. Theo th&ocirc;ng tin từ VFF, AVG mới đưa ra  nhiều điều kiện kh&ocirc;ng dễ chấp nhận cho VFF nếu họ muốn c&ocirc;ng ty n&agrave;y tiếp  tục chia sẻ g&aacute;nh nặng tiền lương của HLV mới. Đ&acirc;y đang được coi l&agrave; trở  ngại lớn nhất của trong việc t&igrave;m HLV mới, bởi một m&igrave;nh VFF kh&ocirc;ng thể  kham nổi mức lương tới h&agrave;ng chục ngh&igrave;n USD mỗi th&aacute;ng cho HLV ngoại.</p>
<table width="1" cellspacing="0" cellpadding="3" border="0" align="center">
    <tbody>
        <tr>
            <td><img width="410" height="304" border="1" alt="" src="http://vnexpress.net/Files/Subject/3b/a2/8f/85/goetzs.jpg" /></td>
        </tr>
        <tr>
            <td class="Image">Ứng vi&ecirc;n người Đức Falko Goetz.</td>
        </tr>
    </tbody>
</table>
<p class="Normal">5 ứng vi&ecirc;n cuối c&ugrave;ng được VFF chọn l&agrave; Hans Juergen  Gede, Falko Goetz, Pierre Lechantre, Eduardo Martinho Viganda, Steve  Sampson, trong đ&oacute; c&oacute; một người đ&atilde; từ chối thẳng, hai người kh&aacute;c đưa ra  mức lương qu&aacute; cao. Steve Sampson kh&ocirc;ng mặn m&agrave; với c&ocirc;ng t&aacute;c huấn luyện  ngo&agrave;i nước Mỹ. Pierre Lechantre đ&ograve;i 40.000 USD mỗi th&aacute;ng. Martinho  Viganda chỉ chấp nhận sang Việt Nam nếu nhận được 50.000 USD mỗi th&aacute;ng  v&agrave; phải c&oacute; hai hai trợ l&yacute; đồng hương đi c&ugrave;ng (lương th&aacute;ng 10.000 USD mỗi  người). Cả ba c&aacute;i t&ecirc;n n&agrave;y v&igrave; thế đều bị loại.</p>
<p class="Normal">Hans Juergen Gede, Falko Goetz v&igrave; thế trở th&agrave;nh hai  ứng vi&ecirc;n v&agrave;o chung kết. Falko Goetz được Hội đồng HLV quốc gia đ&aacute;nh gi&aacute;  rất cao nhờ những th&agrave;nh t&iacute;ch ấn tượng c&ugrave;ng CLB Hertha Berlin. &Ocirc;ng y&ecirc;u  cầu lương 25.000 USD mỗi th&aacute;ng cộng th&ecirc;m một người trợ l&yacute;. Tuy nhi&ecirc;n  trong qu&aacute; tr&igrave;nh thương lượng Goetz đ&atilde; chấp nhận sẽ chỉ tới Việt Nam một  m&igrave;nh.</p>
<p class="Normal">Nhưng ngay cả khi Goetz chấp nhận kh&ocirc;ng c&oacute; trợ l&yacute;  người Đức, VFF cũng l&uacute;ng t&uacute;ng trong việc t&igrave;m nguồn kinh ph&iacute; trả lương.  Đ&uacute;ng l&uacute;c đ&oacute; Hans Juergen Gede bất ngờ tuy&ecirc;n bố c&oacute; thể đến Việt Nam với  mức lương chưa đến 15.000 USD mỗi th&aacute;ng. Động th&aacute;i n&agrave;y buộc VFF phải đắn  đo giữa hai HLV người Đức.</p>
<p class="Normal">Những người c&oacute; tr&aacute;ch nhiệm tuyển chọn hiện vẫn chưa  thống nhất được sẽ chọn Gede hay Goetz. V&igrave; vậy việc t&igrave;m người thay &ocirc;ng  Calisto vẫn chưa ho&agrave;n tất d&ugrave; c&aacute;i hạn c&ocirc;ng bố ng&agrave;y 15/4 qua từ l&acirc;u.</p>
<p class="Normal">Vị HLV mới c&oacute; tr&aacute;ch nhiệm đưa U23 Việt Nam gi&agrave;nh HC  v&agrave;ng SEA Games 26 cuối năm nay; gi&uacute;p tuyển Việt Nam v&agrave; Olympic Việt Nam  chơi tốt ở v&ograve;ng loại World Cup 2014, Olympic London 2012 diễn ra v&agrave;o  th&aacute;ng 6.</p>
<p><strong><font color="#4f4f4f">V&agrave;i n&eacute;t về hai ứng vi&ecirc;n người Đức</font></strong></p>
<p class="BoxLink"><strong><font color="#4f4f4f">Falko Goetz (49 tuổi)</font></strong>  từng kho&aacute;c &aacute;o Bayer Leverkusen, FC Koln, Hertha Berlin (Đức),  Galatasaray (Thổ Nhĩ Kỳ). Năm 1988, &ocirc;ng c&ugrave;ng Leverkusen đoạt Cup UEFA  (thắng Espanyol của T&acirc;y Ban Nha ở chung kết, trong đ&oacute; c&oacute; một b&agrave;n của  Goetz).</p>
<p class="BoxLink">Trong sự nghiệp HLV, Goetz từng đưa đội Hertha  Berlin, 1860 Munich thi đấu kh&aacute; th&agrave;nh c&ocirc;ng ở giải v&ocirc; địch Đức  Bundesliga. Th&agrave;nh t&iacute;ch tốt nhất của &ocirc;ng l&agrave; gi&uacute;p Hertha Belin đứng thứ tư  m&ugrave;a b&oacute;ng 2004-2005 v&agrave; gi&agrave;nh suất dự Cup UEFA.</p>
<p class="BoxLink"><strong><font color="#4f4f4f">Jurgen Gede (55 tuổi)</font></strong>  từng kho&aacute;c &aacute;o CLB Schalke 04, Cologne (Đức). Từ năm 1991, &ocirc;ng từng l&agrave;  HLV c&aacute;c CLB Cologne, Schalke 04, U20 Uzbekistan, Kuala Lumpur  (Malaysia), Ghandi v&agrave; Al- ahli (Iran), Neftchi (Azerbaijan), trợ l&yacute; HLV  trưởng đội tuyển Azerbaijan.</p>', N'../../../Images/Blogs/goetzsdf.jpg', CAST(0x00009ECC0113C320 AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (21, N'New', N'Trống trải', 54, NULL, N'<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">&nbsp;Sao dạo n&agrave;y nok'' cứ nhớ.....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">nhớ bạn b&egrave;....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">nhớ gia đ&igrave;nh...</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">nok'' cảm thấy thiếu thiếu c&aacute;i g&igrave; đ&oacute; nhưng lại hok biết c&aacute;i g&igrave; đ&oacute; l&agrave; c&aacute;i g&igrave;.....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">nok'' đ&atilde; từng suy ngĩ rất nhiều v&agrave; p&ugrave;n rất nhiều....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">khi bị bệnh nok'' cảm thấy nhớ gia đ&igrave;nh v&ocirc; c&ugrave;ng....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">ở  nh&agrave; d&ugrave; nok'' cảm thấy hơi mệt,nh&igrave;n mặt nok'' biến sắc l&agrave; mọi người đ&atilde; lo  cho nok'' tất cả...zậy mok` giờ đ&acirc;y nok'' lại một th&acirc;n một m&igrave;nh....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">l&uacute;c nok'' thấy &aacute;c mộng hok ngủ được l&agrave; nok'' lại &ocirc;m gối sang ph&ograve;ng mẹ....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">ở  nh&agrave; c&oacute; sự che chở của mọi người nok'' đ&atilde; quen oy`...giờ đ&acirc;y phải đối  diện tất cả với mok` chỉ c&oacute; một m&igrave;nh nok''..nok'' cảm thấy tủi th&acirc;n v&ocirc;  c&ugrave;ng....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">nok'' c&ograve;n c&oacute; pạn p&egrave; lu&ocirc;n ở b&ecirc;n cạnh nok'' nhưng lại l&agrave; l&uacute;c trước....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">l&uacute;c trước khi đi học nok'' mệt th&igrave; bạn nok'' ch&eacute;p b&agrave;i cho &nbsp;nok''....bạn nok'' đi mua thuốc cho nok''....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">nok'' buồn th&igrave; bạn nok'' t&acirc;m sự zới nok''....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">zậy mok` giờ đ&acirc;y....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">c&agrave;ng nghĩ nok'' c&agrave;ng cảm thấy nhớ bạn b&egrave; qu&aacute; đi....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">nhưng hok pjt bạn của nok'' c&oacute; giống như nok'' đang nhớ hok nữa?.......</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">sống một m&igrave;nh...hok c&oacute; ai b&ecirc;n cạnh...phải tự lập...bạn b&egrave; gần như đ&atilde; qu&ecirc;n nok'' oy`...</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">nok''  hok hiểu nok'' đối xử tốt zới bạn lắm mok` tại sao người ta lại đối xử  zới nok'' như zậy...hok pjt người ta c&oacute; c&ograve;n coi nok'' l&agrave; bạn nữa hok mok`  tại sao lại lừa dối nok''....tại sao lại xem nok'' như l&agrave; một quả b&oacute;ng  th&iacute;ch th&igrave; đ&aacute; đi hok thik th&igrave; lượm lại như zậy...tại sao người ta hok  hiểu cảm gi&aacute;c của nok''....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">nok'' hok muốn v&igrave; người ta mok` nok'' mất l&ograve;ng tin zới bạn p&egrave;....nhưng tại sao người ta vẵn cứ cố t&igrave;nh....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">nok'' cảm thấy &nbsp;sợ c&aacute;i x&atilde; hội n&agrave;y ....nok'' m&uacute;n tin nhưng lại hok d&aacute;m tin....</span></span></span></p>
<p><span style="color: rgb(136, 136, 136);"><span style="font-size: small;"><span style="font-family: georgia,palatino;">hok pjt c&oacute; ai đ&oacute; sẽ l&agrave;m nok'' thay đổi suy nghĩ được hok nữa?......</span></span></span></p>
<p>&nbsp;</p>', N'../../../Images/Blogs/VnExpress - Đọc báo, tin tức online 24h_1301327394994.png', CAST(0x00009ED0001072BA AS DateTime))
GO
INSERT [dbo].[Blog] ([BlogID], [Status], [BlogTitle], [UserID], [Description], [BlogContent], [ImageUpload], [Datepost]) VALUES (22, N'New', N'bánh socola', 5, NULL, N'<p>&nbsp;Nguồng k&ecirc;nh14</p>
<p>&nbsp;</p>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <td align="left" width="100%">
            <div>Chuẩn bị những nguy&ecirc;n liệu sau:</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            </td>
        </tr>
        <tr>
            <td align="left" width="100%">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                    <tr>
                        <td valign="top">
                        <table align="left" border="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td valign="top">
                                    <div>&nbsp;&nbsp; <img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocolanguyenlieu2.jpg" /></div>
                                    <div>&nbsp;</div>
                                    <div>&nbsp;</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>- 20gr bột mỳ + 3gr bột nở</div>
                        <div>&nbsp;</div>
                        <div>- 10gr bột cacao</div>
                        <div>&nbsp;</div>
                        <div>- 20gr đường</div>
                        <div>&nbsp;</div>
                        <div>- 1 quả trứng</div>
                        <div>&nbsp;</div>
                        <div>- 20gr bơ (đun chảy)</div>
                        <div>&nbsp;</div>
                        <div>- Một &iacute;t nho kh&ocirc;</div>
                        </td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
        <tr>
            <td align="left" width="100%">&nbsp;</td>
        </tr>
        <tr>
            <td align="left" width="100%">&nbsp;</td>
        </tr>
        <tr>
            <td align="left" width="100%">
            <div>Đến phần h&agrave;nh động n&agrave;y: &gt;:D&lt;</div>
            <div>&nbsp;</div>
            <div>&nbsp;</div>
            </td>
        </tr>
        <tr>
            <td align="left" width="100%">
            <table border="0" cellpadding="0" cellspacing="10" width="100%">
                <tbody>
                    <tr>
                        <td valign="top">
                        <table align="left" border="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td valign="top">
                                    <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola12.jpg" /></div>
                                    <div>&nbsp;</div>
                                    <div>&nbsp;</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>Bước 1:</div>
                        <div>&nbsp;</div>
                        <div>- Trước ti&ecirc;n, m&igrave;nh cần trộn đều bột mỳ, bột nở,&nbsp;cacao&nbsp;v&agrave; đường lại với nhau đ&atilde; n&agrave;y.</div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                        <table align="left" border="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td valign="top">
                                    <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola22.jpg" /></div>
                                    <div>&nbsp;</div>
                                    <div>&nbsp;</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>Bước 2:</div>
                        <div>&nbsp;</div>
                        <div>- Tiếp theo l&agrave; cho trứng v&agrave; bơ đun chảy v&agrave;o trộn c&ugrave;ng rồi mới cho nốt nho kh&ocirc; v&agrave;o nh&eacute;!</div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                        <table align="left" border="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td valign="top">
                                    <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola32.jpg" /></div>
                                    <div>&nbsp;</div>
                                    <div>&nbsp;</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>Bước 3:</div>
                        <div>&nbsp;</div>
                        <div>- Qu&eacute;t một &iacute;t bơ chảy v&agrave;o khu&ocirc;n để b&aacute;nh kh&ocirc;ng bị d&iacute;nh khu&ocirc;n nghen.  V&igrave; m&igrave;nh sẽ d&ugrave;ng l&ograve; vi s&oacute;ng để nướng b&aacute;nh thế n&ecirc;n c&aacute;c bạn ch&uacute; &yacute; d&ugrave;ng loại  khu&ocirc;n th&iacute;ch hợp cho l&ograve; vi s&oacute;ng đấy!</div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                        <table align="left" border="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td valign="top">
                                    <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola42.jpg" /></div>
                                    <div>&nbsp;</div>
                                    <div>&nbsp;</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>Bước 4:</div>
                        <div>&nbsp;</div>
                        <div>- Đổ bột v&agrave;o 2/3&nbsp;khu&ocirc;n r&ugrave;i d&ugrave;ng nilon bọc thực phẩm, bọc k&iacute;n khu&ocirc;n lại n&egrave;.</div>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                        <table align="left" border="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td valign="top">
                                    <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola52.jpg" /></div>
                                    <div>&nbsp;</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div>Bước 5:</div>
                        <div>&nbsp;</div>
                        <div>- Để l&ograve; ở chế độ cao nhất&nbsp;v&agrave; đặt thời gian l&agrave; 2'' c&aacute;c bạn nh&eacute;!</div>
                        </td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
        <tr>
            <td align="left" width="100%">
            <div>C&aacute;c bạn c&oacute; thể d&ugrave;ng một &iacute;t đường bột để trang tr&iacute; b&aacute;nh nh&aacute;!Nguồng k&ecirc;nh14</div>
            <p>&nbsp;</p>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                    <tr>
                        <td align="left" width="100%">
                        <div>Chuẩn bị những nguy&ecirc;n liệu sau:</div>
                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" width="100%">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr>
                                    <td valign="top">
                                    <table align="left" border="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td valign="top">
                                                <div>&nbsp;&nbsp; <img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocolanguyenlieu2.jpg" /></div>
                                                <div>&nbsp;</div>
                                                <div>&nbsp;</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div>- 20gr bột mỳ + 3gr bột nở</div>
                                    <div>&nbsp;</div>
                                    <div>- 10gr bột cacao</div>
                                    <div>&nbsp;</div>
                                    <div>- 20gr đường</div>
                                    <div>&nbsp;</div>
                                    <div>- 1 quả trứng</div>
                                    <div>&nbsp;</div>
                                    <div>- 20gr bơ (đun chảy)</div>
                                    <div>&nbsp;</div>
                                    <div>- Một &iacute;t nho kh&ocirc;</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" width="100%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" width="100%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" width="100%">
                        <div>Đến phần h&agrave;nh động n&agrave;y: &gt;:D&lt;</div>
                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" width="100%">
                        <table border="0" cellpadding="0" cellspacing="10" width="100%">
                            <tbody>
                                <tr>
                                    <td valign="top">
                                    <table align="left" border="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td valign="top">
                                                <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola12.jpg" /></div>
                                                <div>&nbsp;</div>
                                                <div>&nbsp;</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div>Bước 1:</div>
                                    <div>&nbsp;</div>
                                    <div>- Trước ti&ecirc;n, m&igrave;nh cần trộn đều bột mỳ, bột nở,&nbsp;cacao&nbsp;v&agrave; đường lại với nhau đ&atilde; n&agrave;y.</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                    <table align="left" border="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td valign="top">
                                                <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola22.jpg" /></div>
                                                <div>&nbsp;</div>
                                                <div>&nbsp;</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div>Bước 2:</div>
                                    <div>&nbsp;</div>
                                    <div>- Tiếp theo l&agrave; cho trứng v&agrave; bơ đun chảy v&agrave;o trộn c&ugrave;ng rồi mới cho nốt nho kh&ocirc; v&agrave;o nh&eacute;!</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                    <table align="left" border="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td valign="top">
                                                <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola32.jpg" /></div>
                                                <div>&nbsp;</div>
                                                <div>&nbsp;</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div>Bước 3:</div>
                                    <div>&nbsp;</div>
                                    <div>- Qu&eacute;t một &iacute;t bơ chảy v&agrave;o khu&ocirc;n để b&aacute;nh kh&ocirc;ng bị d&iacute;nh khu&ocirc;n nghen.  V&igrave; m&igrave;nh sẽ d&ugrave;ng l&ograve; vi s&oacute;ng để nướng b&aacute;nh thế n&ecirc;n c&aacute;c bạn ch&uacute; &yacute; d&ugrave;ng loại  khu&ocirc;n th&iacute;ch hợp cho l&ograve; vi s&oacute;ng đấy!</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                    <table align="left" border="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td valign="top">
                                                <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola42.jpg" /></div>
                                                <div>&nbsp;</div>
                                                <div>&nbsp;</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div>Bước 4:</div>
                                    <div>&nbsp;</div>
                                    <div>- Đổ bột v&agrave;o 2/3&nbsp;khu&ocirc;n r&ugrave;i d&ugrave;ng nilon bọc thực phẩm, bọc k&iacute;n khu&ocirc;n lại n&egrave;.</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                    <table align="left" border="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td valign="top">
                                                <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola52.jpg" /></div>
                                                <div>&nbsp;</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div>Bước 5:</div>
                                    <div>&nbsp;</div>
                                    <div>- Để l&ograve; ở chế độ cao nhất&nbsp;v&agrave; đặt thời gian l&agrave; 2'' c&aacute;c bạn nh&eacute;!</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" width="100%">
                        <div>C&aacute;c bạn c&oacute; thể d&ugrave;ng một &iacute;t đường bột để trang tr&iacute; b&aacute;nh nh&aacute;!Nguồng k&ecirc;nh14</div>
                        <p>&nbsp;</p>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr>
                                    <td align="left" width="100%">
                                    <div>Chuẩn bị những nguy&ecirc;n liệu sau:</div>
                                    <div>&nbsp;</div>
                                    <div>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" width="100%">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td valign="top">
                                                <table align="left" border="0" cellspacing="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top">
                                                            <div>&nbsp;&nbsp; <img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocolanguyenlieu2.jpg" /></div>
                                                            <div>&nbsp;</div>
                                                            <div>&nbsp;</div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div>- 20gr bột mỳ + 3gr bột nở</div>
                                                <div>&nbsp;</div>
                                                <div>- 10gr bột cacao</div>
                                                <div>&nbsp;</div>
                                                <div>- 20gr đường</div>
                                                <div>&nbsp;</div>
                                                <div>- 1 quả trứng</div>
                                                <div>&nbsp;</div>
                                                <div>- 20gr bơ (đun chảy)</div>
                                                <div>&nbsp;</div>
                                                <div>- Một &iacute;t nho kh&ocirc;</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" width="100%">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left" width="100%">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left" width="100%">
                                    <div>Đến phần h&agrave;nh động n&agrave;y: &gt;:D&lt;</div>
                                    <div>&nbsp;</div>
                                    <div>&nbsp;</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" width="100%">
                                    <table border="0" cellpadding="0" cellspacing="10" width="100%">
                                        <tbody>
                                            <tr>
                                                <td valign="top">
                                                <table align="left" border="0" cellspacing="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top">
                                                            <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola12.jpg" /></div>
                                                            <div>&nbsp;</div>
                                                            <div>&nbsp;</div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div>Bước 1:</div>
                                                <div>&nbsp;</div>
                                                <div>- Trước ti&ecirc;n, m&igrave;nh cần trộn đều bột mỳ, bột nở,&nbsp;cacao&nbsp;v&agrave; đường lại với nhau đ&atilde; n&agrave;y.</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                <table align="left" border="0" cellspacing="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top">
                                                            <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola22.jpg" /></div>
                                                            <div>&nbsp;</div>
                                                            <div>&nbsp;</div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div>Bước 2:</div>
                                                <div>&nbsp;</div>
                                                <div>- Tiếp theo l&agrave; cho trứng v&agrave; bơ đun chảy v&agrave;o trộn c&ugrave;ng rồi mới cho nốt nho kh&ocirc; v&agrave;o nh&eacute;!</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                <table align="left" border="0" cellspacing="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top">
                                                            <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola32.jpg" /></div>
                                                            <div>&nbsp;</div>
                                                            <div>&nbsp;</div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div>Bước 3:</div>
                                                <div>&nbsp;</div>
                                                <div>- Qu&eacute;t một &iacute;t bơ chảy v&agrave;o khu&ocirc;n để b&aacute;nh kh&ocirc;ng bị d&iacute;nh khu&ocirc;n nghen.  V&igrave; m&igrave;nh sẽ d&ugrave;ng l&ograve; vi s&oacute;ng để nướng b&aacute;nh thế n&ecirc;n c&aacute;c bạn ch&uacute; &yacute; d&ugrave;ng loại  khu&ocirc;n th&iacute;ch hợp cho l&ograve; vi s&oacute;ng đấy!</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                <table align="left" border="0" cellspacing="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top">
                                                            <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola42.jpg" /></div>
                                                            <div>&nbsp;</div>
                                                            <div>&nbsp;</div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div>Bước 4:</div>
                                                <div>&nbsp;</div>
                                                <div>- Đổ bột v&agrave;o 2/3&nbsp;khu&ocirc;n r&ugrave;i d&ugrave;ng nilon bọc thực phẩm, bọc k&iacute;n khu&ocirc;n lại n&egrave;.</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                <table align="left" border="0" cellspacing="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top">
                                                            <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola52.jpg" /></div>
                                                            <div>&nbsp;</div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <div>Bước 5:</div>
                                                <div>&nbsp;</div>
                                                <div>- Để l&ograve; ở chế độ cao nhất&nbsp;v&agrave; đặt thời gian l&agrave; 2'' c&aacute;c bạn nh&eacute;!</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" width="100%">
                                    <div>C&aacute;c bạn c&oacute; thể d&ugrave;ng một &iacute;t đường bột để trang tr&iacute; b&aacute;nh nh&aacute;!Nguồng k&ecirc;nh14</div>
                                    <p>&nbsp;</p>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td align="left" width="100%">
                                                <div>Chuẩn bị những nguy&ecirc;n liệu sau:</div>
                                                <div>&nbsp;</div>
                                                <div>&nbsp;</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="100%">
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top">
                                                            <table align="left" border="0" cellspacing="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td valign="top">
                                                                        <div>&nbsp;&nbsp; <img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocolanguyenlieu2.jpg" /></div>
                                                                        <div>&nbsp;</div>
                                                                        <div>&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <div>- 20gr bột mỳ + 3gr bột nở</div>
                                                            <div>&nbsp;</div>
                                                            <div>- 10gr bột cacao</div>
                                                            <div>&nbsp;</div>
                                                            <div>- 20gr đường</div>
                                                            <div>&nbsp;</div>
                                                            <div>- 1 quả trứng</div>
                                                            <div>&nbsp;</div>
                                                            <div>- 20gr bơ (đun chảy)</div>
                                                            <div>&nbsp;</div>
                                                            <div>- Một &iacute;t nho kh&ocirc;</div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="100%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="100%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="100%">
                                                <div>Đến phần h&agrave;nh động n&agrave;y: &gt;:D&lt;</div>
                                                <div>&nbsp;</div>
                                                <div>&nbsp;</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="100%">
                                                <table border="0" cellpadding="0" cellspacing="10" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top">
                                                            <table align="left" border="0" cellspacing="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td valign="top">
                                                                        <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola12.jpg" /></div>
                                                                        <div>&nbsp;</div>
                                                                        <div>&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <div>Bước 1:</div>
                                                            <div>&nbsp;</div>
                                                            <div>- Trước ti&ecirc;n, m&igrave;nh cần trộn đều bột mỳ, bột nở,&nbsp;cacao&nbsp;v&agrave; đường lại với nhau đ&atilde; n&agrave;y.</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                            <table align="left" border="0" cellspacing="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td valign="top">
                                                                        <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola22.jpg" /></div>
                                                                        <div>&nbsp;</div>
                                                                        <div>&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <div>Bước 2:</div>
                                                            <div>&nbsp;</div>
                                                            <div>- Tiếp theo l&agrave; cho trứng v&agrave; bơ đun chảy v&agrave;o trộn c&ugrave;ng rồi mới cho nốt nho kh&ocirc; v&agrave;o nh&eacute;!</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                            <table align="left" border="0" cellspacing="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td valign="top">
                                                                        <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola32.jpg" /></div>
                                                                        <div>&nbsp;</div>
                                                                        <div>&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <div>Bước 3:</div>
                                                            <div>&nbsp;</div>
                                                            <div>- Qu&eacute;t một &iacute;t bơ chảy v&agrave;o khu&ocirc;n để b&aacute;nh kh&ocirc;ng bị d&iacute;nh khu&ocirc;n nghen.  V&igrave; m&igrave;nh sẽ d&ugrave;ng l&ograve; vi s&oacute;ng để nướng b&aacute;nh thế n&ecirc;n c&aacute;c bạn ch&uacute; &yacute; d&ugrave;ng loại  khu&ocirc;n th&iacute;ch hợp cho l&ograve; vi s&oacute;ng đấy!</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                            <table align="left" border="0" cellspacing="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td valign="top">
                                                                        <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola42.jpg" /></div>
                                                                        <div>&nbsp;</div>
                                                                        <div>&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <div>Bước 4:</div>
                                                            <div>&nbsp;</div>
                                                            <div>- Đổ bột v&agrave;o 2/3&nbsp;khu&ocirc;n r&ugrave;i d&ugrave;ng nilon bọc thực phẩm, bọc k&iacute;n khu&ocirc;n lại n&egrave;.</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td valign="top">
                                                            <table align="left" border="0" cellspacing="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td valign="top">
                                                                        <div><img alt="" src="http://k14.vcmedia.vn/Images/Uploaded/Share/2011/4/17/2126/110417mbtbanhsocola52.jpg" /></div>
                                                                        <div>&nbsp;</div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <div>Bước 5:</div>
                                                            <div>&nbsp;</div>
                                                            <div>- Để l&ograve; ở chế độ cao nhất&nbsp;v&agrave; đặt thời gian l&agrave; 2'' c&aacute;c bạn nh&eacute;!</div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" width="100%">
                                                <div>C&aacute;c bạn c&oacute; thể d&ugrave;ng một &iacute;t đường bột để trang tr&iacute; b&aacute;nh nh&aacute;!</div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            </td>
        </tr>
    </tbody>
</table>', N'../../Images/Blogs/VnExpress - Đọc báo, tin tức online 24h_1301327394994.png', CAST(0x00009ED00011B852 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Blog] OFF
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
SET IDENTITY_INSERT [dbo].[Album] ON 

GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (1, N'Dummy', N'--Chọn--', 1, N'0', N'Dummy', CAST(0x002D247F00000000 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (2, N'New', N'Cho lần hẹn đầu tiên', 2, N'Member', N'Album theo sự kiện', CAST(0x00009EB100000000 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (3, N'Approve', N'Cho lần hẹn đầu tiên', 10, N'Member', N'Album theo sự kiện', CAST(0x00009EB100000000 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (4, N'Approve', N'Cho lần hẹn đầu tiên', 10, N'Member', N'Album theo sự kiện', CAST(0x00009EB100000000 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (7, N'Delete', N'dfas', 1, N'Admin', N'hieu test', CAST(0x00009EB100000000 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (8, N'Approve', N'50 ngày hẹn đầu tiên', 1, N'Admin', N'Album hình ảnh kỷ niệm', CAST(0x00009EB100000000 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (9, N'Approve', N'hieu tạo', 1, N'Admin', N'dfdafasf', CAST(0x00009EB100000000 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (10, N'Approve', N'thành phố tôi yêu', 1, N'Event', N'Album của sự kiện thành phố tôi yêu', CAST(0x00009EB100000000 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (11, N'UnApprove', N'Album valentine', 1, N'Admin', N'Album của sự kiện', CAST(0x00009EB100000000 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (12, N'Approve', N'Album được chia sẻ', 2, N'Share', N'', CAST(0x00009EB8001045D9 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (13, N'Approve', N'Album được chia sẻ', 10, N'Share', N'', CAST(0x00009EB800105B83 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (14, N'Approve', N'fadfadsf', 1, N'Event', N'Album của sự kiện fadfadsf', CAST(0x00009EBA00FFF06D AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (17, N'Approve', N'Bình yên nhé tôi ơi!', 10, N'Member', N'album Ảnh đẹp đã được duyệt ', CAST(0x00009EBC00BAA13E AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (18, N'New', N'Kỳ quan thiên nhiên thế giới', 5, N'Member', N'Hãy chiêm ngưỡng vẽ đẹp ', CAST(0x00009EBC00CA2D36 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (19, N'Approve', N'Album được chia sẻ', 4, N'Share', N'Album chia sẽ', CAST(0x00009EC1002EBB0E AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (20, N'Delete', N'ada', 1, N'Admin', N'fdfs', CAST(0x00009EC20187BAE6 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (21, N'Approve', N'Album được chia sẻ', 14, N'Share', N'Album chia sẽ', CAST(0x00009EC4001ECF40 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (22, N'New', N'Cuộc tình đã mất', 3, N'Member', N'hiếu tạo', CAST(0x00009EC700B662CC AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (23, N'Approve', N'Test album', 1, N'Admin', N'hieu test', CAST(0x00009EC7011E3428 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (24, N'Approve', N'Album được chia sẻ', 5, N'Share', N'Album chia sẽ', CAST(0x00009ECD00B62B08 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (25, N'Approve', N'Album được chia sẻ', 18, N'Share', N'Album chia sẽ', CAST(0x00009ECD00F55FCF AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (27, N'Approve', N'test thu album', 18, N'Member', N'test thu', CAST(0x00009ECD00000000 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (28, N'New', N'picnic', 54, N'Member', N'lần đi picnic cùng nhóm cầu vồng liên kết', CAST(0x00009ED00002ED5C AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (29, N'New', N'du lich hà nội', 54, N'Member', N'lần đi du lịch cùng các thành viên cầu vồng liên kết', CAST(0x00009ED000042860 AS DateTime))
GO
INSERT [dbo].[Album] ([AlbumID], [Status], [AlbumName], [UserID], [AlbumType], [Description], [AlbumDate]) VALUES (30, N'Approve', N'cauvonglink', 1, N'Admin', NULL, CAST(0x00009ED000B15CCB AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Album] OFF
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
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (1, 1, N'Dummy', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (2, 3, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (2, 4, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (2, 10, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (3, 4, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (4, 3, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (5, 10, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (10, 2, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (10, 3, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (10, 4, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (10, 5, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (10, 14, N'New', N'Nguyễn Kim Yến muốn kết bạn cùng bạn!')
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (10, 18, N'Delete', N'Nguyễn Kim Yến muốn kết bạn cùng bạn!')
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (14, 10, N'Agree', NULL)
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (54, 5, N'Agree', N'Nguyễn Hoàng muốn kết bạn cùng bạn!')
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (54, 18, N'New', N'Nguyễn Hoàng muốn kết bạn cùng bạn!')
GO
INSERT [dbo].[Friends] ([UserID], [FriendID], [Status], [Description]) VALUES (54, 50, N'New', N'Nguyễn Hoàng muốn kết bạn cùng bạn!')
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
SET IDENTITY_INSERT [dbo].[Messages] ON 

GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (1, N'Dummy', 1, 1, CAST(0x00009EA900000000 AS DateTime), N'', N'', NULL, NULL, NULL)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (2, N'New', 2, 3, CAST(0x00009EA900000000 AS DateTime), N'hieu nguyen test', N'test chương trình ma sao ko co ai cung lam het', NULL, 0, 1)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (3, N'New', 3, 2, CAST(0x00009EA900000000 AS DateTime), N'hieu nguyen test', N'test chương trình ma sao ko co ai cung lam het', NULL, NULL, NULL)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (6, N'New', 3, 2, CAST(0x00009EAE0030C7D5 AS DateTime), N'mu?n k?t b?n', N'chào bạn, minh tên HH ', NULL, NULL, NULL)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (7, N'Approve', 2, 4, CAST(0x00009EA900000000 AS DateTime), N'Làm quen', N'test chương trình ma sao ko co ai cung lam het', NULL, 0, 1)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (8, N'Approve', 3, 4, CAST(0x00009EA900000000 AS DateTime), N'Tìm tr? l?c', N'test chương trình ma sao ko co ai cung lam het afjkalkfdjlakfadfadklakjfkajlfk;q5poorosgopsgosfgsp4-rgkklmaflsmflasmdfgaofjwe9df;asglag;lagklkalgkal;gla;glagadg;lgj', NULL, 0, NULL)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (9, N'Delete', 3, 4, CAST(0x00009EAE0030C780 AS DateTime), N'Tìm ngu?i yêu', N'4''t3ips', NULL, NULL, NULL)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (11, N'Delete', 4, 2, CAST(0x00009EB100A340B6 AS DateTime), N'tao moi', N'aafakflakflaklfkl', NULL, 0, 1)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (12, N'Delete', 2, 10, CAST(0x00009EB100B9D64A AS DateTime), N'tao moi', N'tra lời tin và cập nhật IsReply=true', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (13, N'Delete', 2, 10, CAST(0x00009EB100BD04F6 AS DateTime), N'Re:tao moi', N'test reply ok', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (14, N'Delete', 2, 10, CAST(0x00009EB100E3B7E6 AS DateTime), N'Re:tao moi', N'tra loi', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (15, N'Delete', 10, 2, CAST(0x00009EB6011D625C AS DateTime), N'Re:tao moi', N'test reply usercontrol', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (16, N'Delete', 10, 10, CAST(0x00009EB60136626C AS DateTime), N'Re:tao moi', N'test test', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (17, N'Delete', 10, 2, CAST(0x00009EBA0168B5B5 AS DateTime), N'test message', N'nội dung messages', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (20, N'New', 10, 2, CAST(0x00009ECA00B72F10 AS DateTime), N'autocomplete', N'thành công rồi', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (21, N'New', 10, 3, CAST(0x00009ECA00B74453 AS DateTime), N'autocomplete', N'thành công rồi', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (22, N'New', 10, 2, CAST(0x00009ECA00B7D570 AS DateTime), N'autocomplete', N'thành công rồi', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (23, N'New', 10, 3, CAST(0x00009ECA00B7D60A AS DateTime), N'autocomplete', N'thành công rồi', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (24, N'New', 10, 4, CAST(0x00009ECA00B7F536 AS DateTime), N'test', N'test ok ', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (25, N'Delete', 10, 3, CAST(0x00009ECA00F74D3C AS DateTime), N'fsdfs', N'sfsdfsf', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (26, N'New', 10, 5, CAST(0x00009ECA00F7550E AS DateTime), N'fsdfs', N'sfsdfsf', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (27, N'Delete', 10, 5, CAST(0x00009ECA0187DFAF AS DateTime), N'ddd', N'sdsss', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (28, N'New', 10, 5, CAST(0x00009ECA01881CB5 AS DateTime), N'ddd', N'sdsss', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (29, N'Delete', 10, 3, CAST(0x00009ECA01881D8D AS DateTime), N'ddd', N'sdsss', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (30, N'New', 10, 4, CAST(0x00009ECB001337F7 AS DateTime), N'gdfg', N'gdgdgf', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (31, N'Delete', 10, 3, CAST(0x00009ECB0013421F AS DateTime), N'gdfg', N'gdgdgf', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (32, N'Delete', 10, 50, CAST(0x00009ECB00134A11 AS DateTime), N'gdfg', N'gdgdgf', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (33, N'New', 10, 2, CAST(0x00009ECB0184E0D9 AS DateTime), N'test autocomplete ', N'đã test ok ', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (34, N'New', 10, 5, CAST(0x00009ECB0184EF94 AS DateTime), N'test autocomplete ', N'đã test ok ', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (35, N'New', 10, 18, CAST(0x00009ECC002C434D AS DateTime), N'test on IE', N'hieu test tren IE', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (36, N'New', 10, 4, CAST(0x00009ECC002C4351 AS DateTime), N'test on IE', N'hieu test tren IE', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (37, N'New', 10, 5, CAST(0x00009ECC002CB1F7 AS DateTime), N'test on IE', N'hieu test on IE', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (38, N'New', 10, 4, CAST(0x00009ECC002CB84A AS DateTime), N'test on IE', N'hieu test on IE', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (39, N'New', 10, 5, CAST(0x00009ECC00BCD40B AS DateTime), N'hieu', N'test', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (40, N'Delete', 10, 5, CAST(0x00009ECC00C3F3DD AS DateTime), N'fff', N'ffff', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (41, N'Delete', 10, 2, CAST(0x00009ECC00C3F405 AS DateTime), N'fff', N'ffff', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (42, N'Delete', 10, 18, CAST(0x00009ECC00C3F408 AS DateTime), N'fff', N'ffff', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (43, N'New', 10, 18, CAST(0x00009ECC00E41CE1 AS DateTime), N'tttt', N'ddddddd', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (46, N'New', 18, 10, CAST(0x00009ECC0106A125 AS DateTime), N'Re:tttt', N'tôi đẵ nhận được tin nhắn', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (47, N'New', 10, 5, CAST(0x00009ECD00030F60 AS DateTime), N'tiêu d? tin nh?n', N'nội dung tin nhắn', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (48, N'New', 10, 4, CAST(0x00009ECD00031672 AS DateTime), N'tiêu d? tin nh?n', N'nội dung tin nhắn', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (49, N'New', 10, 5, CAST(0x00009ECD00041ED8 AS DateTime), N'tiêu d? tin nh?n tiep theo', N'nội dung tin nhắn tiếp theo', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (50, N'New', 10, 4, CAST(0x00009ECD00042D78 AS DateTime), N'tiêu d? tin nh?n tiep theo', N'nội dung tin nhắn tiếp theo', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (51, N'New', 10, 5, CAST(0x00009ECD000638FF AS DateTime), N'test', N'test', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (52, N'New', 10, 2, CAST(0x00009ECD000869E0 AS DateTime), N'test', N'test1', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (53, N'New', 10, 2, CAST(0x00009ECD0008E19C AS DateTime), N'test2', N'test2', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (54, N'New', 10, 5, CAST(0x00009ECD000C02C9 AS DateTime), N'thành công', N'ssfdsdfsfd', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (55, N'New', 10, 5, CAST(0x00009ECD000CD762 AS DateTime), N'thành công', N'ssfdsdfsfd', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (56, N'New', 10, 5, CAST(0x00009ECD000D0273 AS DateTime), N'thành công', N'thành công 1', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (57, N'New', 10, 5, CAST(0x00009ECD000D0664 AS DateTime), N'thành công', N'thành công 1', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (58, N'New', 5, 2, CAST(0x00009ECD000FDBDF AS DateTime), N'thành công', N'thành công thành công', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (59, N'New', 5, 10, CAST(0x00009ECD000FE15D AS DateTime), N'thành công', N'thành công thành công', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (60, N'New', 5, 4, CAST(0x00009ECD001220B1 AS DateTime), N'test ', N'test test test', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (61, N'New', 5, 2, CAST(0x00009ECD00134D2C AS DateTime), N'return view("Index")', N'test return view index show message', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (62, N'New', 10, 4, CAST(0x00009ECD00A87142 AS DateTime), N'ddd', N'dddd', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (63, N'New', 10, 4, CAST(0x00009ECD00A8AD67 AS DateTime), N'TEST1', N'TEST1', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (64, N'New', 10, 4, CAST(0x00009ECD00AA8114 AS DateTime), N'hong hieu', N'nguyen hong hieu', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (65, N'New', 10, 5, CAST(0x00009ECD00AAD5AA AS DateTime), N'tu?i tr? th?i d?i m?i', N' năng động và sáng tạo', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (66, N'New', 10, 5, CAST(0x00009ECD00AB474D AS DateTime), N'Re:thành công', N'trả lời tin nhắn', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (67, N'New', 10, 5, CAST(0x00009ECE00FEF001 AS DateTime), N'Re:thành công', N'trả lời bạn', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (68, N'Delete', 5, 54, CAST(0x00009ED000162AC6 AS DateTime), N'g?i l?i cám on', N'Chào hoàng! cám ơn vì món quà sinh nhé', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (69, N'New', 5, 10, CAST(0x00009ED000162AE1 AS DateTime), N'g?i l?i cám on', N'Chào hoàng! cám ơn vì món quà sinh nhé', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (70, N'New', 5, 5, CAST(0x00009ED00016BED7 AS DateTime), N'Re:g?i l?i cám on', N'nhầm quà sinh nhật', NULL, 0, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (71, N'Delete', 10, 18, CAST(0x00009ED1017EC2ED AS DateTime), N'', N'', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (72, N'New', 10, 18, CAST(0x00009ED40101DC50 AS DateTime), N'test autocomplete', N'nội dụng này thì không có gì', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (73, N'New', 10, 50, CAST(0x00009ED40101DC5C AS DateTime), N'test autocomplete', N'nội dụng này thì không có gì', NULL, 1, 0)
GO
INSERT [dbo].[Messages] ([MessageID], [Status], [FK_UserSendID], [FK_UserReceiptID], [MessageDatetime], [MessageTitle], [MessageContent], [MessageDesc], [MessageUnRead], [MessageIsReply]) VALUES (74, N'New', 10, 14, CAST(0x00009ED40101DC60 AS DateTime), N'test autocomplete', N'nội dụng này thì không có gì', NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Messages] OFF
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
SET IDENTITY_INSERT [dbo].[VIPVideo] ON 

GO
INSERT [dbo].[VIPVideo] ([VipVideoID], [Status], [UserID], [VideoPartnerID], [DateCreate], [Description]) VALUES (1, N'Dummy', 1, 1, NULL, NULL)
GO
INSERT [dbo].[VIPVideo] ([VipVideoID], [Status], [UserID], [VideoPartnerID], [DateCreate], [Description]) VALUES (2, N'Delete', 10, 3, CAST(0x00009EBF017AA0B9 AS DateTime), N'')
GO
INSERT [dbo].[VIPVideo] ([VipVideoID], [Status], [UserID], [VideoPartnerID], [DateCreate], [Description]) VALUES (4, N'Visible', 3, 10, CAST(0x00009ECD011AC7C7 AS DateTime), N'Video hài kịch vui')
GO
INSERT [dbo].[VIPVideo] ([VipVideoID], [Status], [UserID], [VideoPartnerID], [DateCreate], [Description]) VALUES (5, N'Visible', 3, 5, CAST(0x00009ECD011B6AA0 AS DateTime), N'')
GO
INSERT [dbo].[VIPVideo] ([VipVideoID], [Status], [UserID], [VideoPartnerID], [DateCreate], [Description]) VALUES (6, N'Visible', 3, 54, CAST(0x00009ED0000688F4 AS DateTime), N'')
GO
SET IDENTITY_INSERT [dbo].[VIPVideo] OFF
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
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (1, N'Dummy', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, CAST(0x002D247F00000000 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x002D247F00000000 AS DateTime), 1, N'None')
GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (2, N'Active', N'Nguyễn thành nhân', N'B3 Nguyễn Văn trỗi,F17 ,QPN', N'TP.Hồ Chí Minh', N'thanhnhan', N'2OhWLeNsG2n0N2aHJEDaQA==', N'01234567831', N'nhan@gmail.com', N'../../Images/avatar.jpg', N'250382111', CAST(0x0000735600000000 AS DateTime), N'Male', N'Đại học', N'Không', N'Chưa kết hôn', N'Kinh doanh', N'Trưởng phòng', N'Thay doi sau', N'8', N'Màu đỏ và màu trắng', N'Trinh thám', N'Mèo', N'Hòa đồng,vui vẽ', N'Hòa đồng,vui vẽ', N'Nghe nhạc, thể thao', N'Nữ độc thân', N'Cao 1m60 trở lên', NULL, 1, CAST(0x00009EAC00000000 AS DateTime), NULL, N'Đã cập nhật thông tin', N'180', N'75', N'Tìm được ý trung nhân', N'KFC', N'Bất kỳ lúc nào', N'Ngoại hình ưa nhìn', CAST(0x00009EB800000000 AS DateTime), 1, N'None')
GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (3, N'Active', N'Nguyễn Minh Châu', N'Võ Văn Tầng', N'Hồ Chí Minh', N'minhchau', N'2OhWLeNsG2n0N2aHJEDaQA==', N'0908745123', N'chau@gmail.com', N'../../Images/Users/minhchau.jpg', N'250123465', CAST(0x00006F1400000000 AS DateTime), N'Female', N'Đại học', N'Phật', N'Chưa kết hôn', N'Kinh doanh', N'Trưởng phòng', N'Thay doi sau', N'9', N'Màu đỏ và màu trắng', N'Nội trợ, nấu ăn', N'Chó', N'Hòa đồng,vui vẽ', N'Hòa đồng,vui vẽ', N'Đá bóng, bóng rổ', NULL, NULL, NULL, 0, NULL, N'../../Content/Videos/YouTube - HAI KICH phan 1.flv', NULL, NULL, NULL, NULL, NULL, N'Bất kỳ lúc nào', NULL, CAST(0x00009EB800000000 AS DateTime), 1, N'None')
GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (4, N'Active', N'Trần Thanh Tùng', N'Nguyễn Kiệm,GV', N'Hà Nội', N'thanhtung', N'2OhWLeNsG2n0N2aHJEDaQA==', N'93587412585', N'tung@yahoo.com', N'../../Images/Users/Images41.JPG', N'232121321', CAST(0x000073E301427538 AS DateTime), N'Male', N'Đại học', N'Không', N'Chưa kết hôn', N'IT - Phần mềm', N'Trưởng phòng', N'Thay doi sau', N'12', N'Màu đỏ và màu trắng', N'Hài,', N'Khỉ', N'Hòa đồng,vui vẽ', N'Hòa đồng,vui vẽ', N'Quyền Anh', N'Bạn khác phái', N'asasads', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'Tìm một nửa của mình', N'Lẩu mắm', N'Bất kỳ lúc nào', N'dfsfd', CAST(0x00009EB800000000 AS DateTime), 1, N'None')
GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (5, N'Active', N'Nguyễn Ngọc Thanh', N'Lê Lợi,Q1', N'TP.Hồ Chí Minh', N'ngocthanh', N'2OhWLeNsG2n0N2aHJEDaQA==', N'09837412582', N'thanh.nguyen@gmail.com', N'../../Images/Users/ngocthanh.jpg', N'147895461', CAST(0x0000659201427538 AS DateTime), N'Female', N'Đại học', N'Không', N'Chưa kết hôn', N'IT - Phần mềm', N'Trưởng phòng', N'20tr/tháng', N'12h/ngày', N'Đen, trắng', N'Kiếm hiệp', N'Thỏ', N'Hòa đồng,vui vẽ', N'Hòa đồng,vui vẽ', N'Đua xa đạp', N'Bạn khác phái', N'Đối tượng vui vẽ dễ gần', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'Tìm người có chung sở thích', N'Bò tái', N'Bất kỳ lúc nào', N'Bạn nam từ 30 tuổi trở lên', CAST(0x00009EB800000000 AS DateTime), 1, N'Other')
GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (10, N'Active', N'Nguyễn Kim Yến', N'B3 cx nguyễn văn trỗi F17', N'Đồng Nai', N'red_pepper01', N'2OhWLeNsG2n0N2aHJEDaQA==', N'0909210456', N'red_pepper01@yahoo.com', N'../../Images/Users/Images10.png', N'25034875200', CAST(0x00006B7800000000 AS DateTime), N'Female', N'Đại học', N'Không', N'Chưa kết hôn', N'IT - Phần mềm', N'Trưởng phòng', N'Thay doi sau', N'10', N'xanh, trắng', N'Làm giàu và kiến thức khoa học', N'Mèo', N'Người vui vẽ hòa đồng', N'Người giả dối', N'Chơi đàn và sáng tác nhạc', N'Bạn khác phái', N'Vui vẽ, năng động', N'abc123', 1, NULL, N'../../Content/Flash/video.flv', NULL, N'160', N'52', N'Tìm và kết bạn với mọi người,', N'Gà luộc', N'Bất kỳ lúc nào', N'Hiền lành, dễ gần', CAST(0x00009EB800000000 AS DateTime), 1, N'None')
GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (14, N'Active', N'Nguyễn Quang Hoàng', N'29/6/10 Đỗ nhuận', N'TP.Hồ Chí Minh', N'hoang.nguyen', N'2OhWLeNsG2n0N2aHJEDaQA==', N'0904234324', N'hoang.nguyen@gmail.com', N'../../Images/Users/Images14.jpg', N'2023434243', CAST(0x0000838000000000 AS DateTime), N'Male', N'Dưới PTTH', N'Phật giáo', N'Chưa kết hôn', N'IT - Phần mềm', N'coder', N'Thay doi sau', N'10', N'tùm lum', N'tùm lum', N'tùm lum', N'tùm lum', N'tùm lum', N'tùm lum', N'Bạn khác phái', N'tùm lum', N'a', 1, NULL, NULL, NULL, N'4234', N'234', N'tùm lum', N'tùm lum', N'Buổi sáng', N'tùm lum', CAST(0x00009EB800000000 AS DateTime), 1, N'None')
GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (18, N'Active', N'chearim', N'50 Tô Hiến Thành, phường 6, Quận 10', N'Huế', N'chearim', N'2OhWLeNsG2n0N2aHJEDaQA==', N'01245621000', N'chearim@gmail.com', N'../../Images/Users/Images18.jpg', N'ASXH-12345', CAST(0x00006C6E00000000 AS DateTime), N'Female', N'Đại học', N'Không', N'Chưa kết hôn', N'IT - Phần cứng/ Mạng', N'DIỄN VIÊN', N'5000usd', N'12 giờ/ngày', N'nhiều thứ', N'nhiều thứ', N'nhiều thứ', N'nhiều thứ', N'nhiều thứ', N'nhiều thứ', N'Bạn khác phái', N'nhiều thứ', NULL, 1, NULL, NULL, NULL, N'165', N'56', N'nhiều thứ', N'nhiều thứ', N'Bất kỳ lúc nào', N'nhiều thứ', CAST(0x00009EBD00000000 AS DateTime), 1, N'None')
GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (50, N'Active', N'hong nguyen', N'78 Tô Hiến Thành, phường 6, Quận 10', N'TP.Hồ Chí Minh', N'hong', N'2OhWLeNsG2n0N2aHJEDaQA==', N'09050888080', N'hong@yahoo.com', N'../../Images/Users/Images50.jpg', N'250382111', CAST(0x000084B000000000 AS DateTime), N'Male', N'Dưới PTTH', N'Không', N'Chưa kết hôn', N'IT - Phần cứng/ Mạng', N'sdfdsf', N'sdsf', N'sfsdf', N'sdfsdf', N'dfsf', N'sdfsf', N'dsfsfd', N'sdfsfd', N'sdfsf', N'Bạn khác phái', N'sdfsf', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'dfsfd', N'dsfsdf', N'Bất kỳ lúc nào', N'dfsfd', CAST(0x00009EC800000000 AS DateTime), 2, N'None')
GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (53, N'New', N'hiền', N'6/10 Tô Hiến Thành, phường 6, Quận 8', N'TP.Hồ Chí Minh', N'hien', N'2OhWLeNsG2n0N2aHJEDaQA==', N'09050888080', N'hien@yahoo.com', N'../../Images/Users/Images54.jpg', N'250382111', CAST(0x000084B000000000 AS DateTime), N'Male', N'Dưới PTTH', N'Không', N'Chưa kết hôn', N'IT - Phần cứng/ Mạng', N'ffqff', N'sdfs', N'dfsfd', N'fsf', N'sfdsdf', N'sdfsf', N'fsf', N'sdfsf', N'fsf', N'Bạn khác phái', N'fsf', NULL, 1, NULL, NULL, NULL, NULL, NULL, N'fsf', N'dfsdf', N'Bất kỳ lúc nào', N'fsf', CAST(0x00009ECE00000000 AS DateTime), 5, N'None')
GO
INSERT [dbo].[Users] ([UserID], [UserStatus], [UserFullName], [UserAddLine], [UserAddCity], [UserName], [Password], [UserPhone], [UserEmail], [UserPicture], [UserIDCard], [UserBirthday], [UserGender], [UserLevel], [UserReligion], [UserMaritalStatus], [UserCareer], [UserJobPosition], [UserWage], [UserWorkingTime], [UserFavColor], [UserReadingBook], [UserFavPet], [UserPeopleLike], [UserPeopleDislike], [UserHobby], [UserLookingObj], [UserRequirements], [UserPwdRecovery], [UserIsVIP], [UserDatePayment], [UserVideoUpload], [UserDescriptions], [UserHeight], [UserWeight], [UserHope], [UserFavFoods], [UserTimeContact], [UserOjbLikeDating], [UserRegisterDate], [UserEventParentID], [UserType]) VALUES (54, N'Active', N'Nguyễn Hoàng', N'29/6/10 Tô Hiến Thành, phường 6, Quận 10', N'TP.Hồ Chí Minh', N'nguyen.hoang', N'2OhWLeNsG2n0N2aHJEDaQA==', N'09050888080', N'nguyen.hoang@gmail.com', N'../../Images/Users/Images54.jpg', N'225209830', CAST(0x00007BE500000000 AS DateTime), N'Male', N'Trung học chuyên nghiệp/Cao đẳng', N'Phật giáo', N'Chưa kết hôn', N'IT - Phần mềm', N'giám đốc', N'10 triệu', N'toàn thời gian', N'XANH, ĐỎ, VÀNG TÍM', N'Conan, tiểu thuyết', N'chó, mèo, chuột', N'người mẫu', N'người ích kỷ, tự cao', N'ăn, ngủ, nghỉ', N'Bạn khác phái', N'dễ nhìn, có chiều cao tương đối tốt', NULL, 1, NULL, NULL, NULL, N'180', N'75', N'tìm kiếm cuộc hôn nhân đích thực', N'Tôm hùm, ghẹ, yến sào, vi cá, hải sản cao cấp.', N'Bất kỳ lúc nào', N'người con gái dịu dàng, thùy mị, nết na, đoan trang', CAST(0x00009ECF00000000 AS DateTime), 4, N'None')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
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
CREATE PROCEDURE [dbo].[Admin_FilterForBlogs]
	-- Add the parameters for the stored procedure here
	@DatePost datetime,
	@Status nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		b.*,
		c.ConfigText as StatusText,
		u.UserName,u.UserFullName 
	FROM 
		ConfigValues c, Users u
	INNER JOIN 
		Blog b
	ON
		b.UserID = u.UserID 
	Where
		((b.Status IS NULL)OR(b.Status LIKE @Status +'%'))
	AND
		((b.Datepost >= @DatePost) AND (b.Datepost < DATEADD(day,1,@DatePost)))
	AND
		b.Status = c.ConfigKey
	AND   
		ConfigKeyGroup = 'Blogs'
	AND
		b.Status<>'Delete'
	AND
		b.Status<>'Dummy'
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
CREATE PROCEDURE [dbo].[Admin_FilterForComments]
	-- Add the parameters for the stored procedure here
	@DatePost datetime,
	@Status nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		Comment.*,ConfigValues.ConfigText as StatusText,
		Users.UserName,Users.UserFullName, 
		Blog.BlogTitle,Events.EventName
	FROM 
		ConfigValues , dbo.Users, dbo.Blog , Comment,Events
	Where
		((Comment.Status IS NULL)OR(Comment.Status LIKE @Status +'%'))
	AND
		((Comment.Datepost >= @DatePost) AND (Comment.Datepost < DATEADD(day,1,@DatePost)))
	AND
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

	ORDER BY DatePost DESC
END

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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Admin_FilterForMessages]
	-- Add the parameters for the stored procedure here
	@DatePost datetime,
	@Status nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		Messages.*,ConfigValues.ConfigText as StatusText,
		a.UserName as UserNameSend,a.UserFullName as FullNameSend,
		b.UserName as UserNameReceipt,b.UserFullName as UserFullNameReceipt
	FROM 
		ConfigValues ,  
		dbo.Messages, 
		Users a, users b
	Where
		((Messages.Status IS NULL)OR(Messages.Status LIKE @Status +'%'))
	AND
		((Messages.MessageDatetime >= @DatePost) AND (Messages.MessageDatetime < DATEADD(day,1,@DatePost)))
	AND
		Messages.Status =ConfigValues.ConfigKey 
	AND   
		ConfigKeyGroup = 'Messages'
	AND
		Messages.Status <> 'Delete'
	AND
		Messages.Status <> 'Dummy' 
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
CREATE PROCEDURE [dbo].[Admin_FilterForAlbums]
	-- Add the parameters for the stored procedure here
	@UserID int,
	@AlbumType nvarchar(50),
	@AlbumStatus nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		al.*, us.UserFullName, con.ConfigText
	FROM
		dbo.Album al, dbo.Users us, dbo.ConfigValues con
	WHERE
		((al.UserID = @UserID) OR (@UserID = 0))
	AND
		((al.AlbumType IS NULL) OR (al.AlbumType LIKE @AlbumType+'%'))
	AND
		((al.Status IS NULL) OR (al.Status LIKE @AlbumStatus+'%'))
	AND	
		al.UserID = us.UserID
	AND
		con.ConfigKeyGroup = 'Albums'
	AND
		con.ConfigKey = al.Status
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
CREATE PROCEDURE [dbo].[Admin_FilterForUsers]
	-- Add the parameters for the stored procedure here
	@UserType nvarchar(50),
	@UserGender nvarchar(50),
	@UserStatus nvarchar(50),
	@eventParrent int 
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
		((a.UserName IS NULL)OR(a.UserType LIKE @UserType+'%'))
	AND
		((a.UserGender IS NULL)OR(a.UserGender LIKE @UserGender+'%'))
	AND
		((a.UserStatus IS NULL)OR(a.UserStatus LIKE @UserStatus+'%'))
	AND
		((a.UserEventParentID = @eventParrent) OR (@eventParrent = 0))
	AND 
		a.UserStatus =b.ConfigKey
	AND 
		b.ConfigKeyGroup='Users' 
	AND 
		a.UserEventParentID=e.EventParentID
	ORDER BY 
		a.UserRegisterDate DESC
	
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
