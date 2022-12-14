USE [Do2romStage23112021]
GO
/****** Object:  Table [ph].[ph_market_assigned_user]    Script Date: 8/24/2022 4:30:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ph].[ph_market_assigned_user](
	[mas_assigned_w_user_id] [bigint] NOT NULL,
	[mas_admin_w_user_id] [bigint] NULL,
	[mas_market_id] [int] NOT NULL,
 CONSTRAINT [PK_ph_market_assigned_user] PRIMARY KEY CLUSTERED 
(
	[mas_assigned_w_user_id] ASC,
	[mas_market_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (12112, 12112, 1)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (12112, 12112, 13)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (12112, 12112, 14)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (12112, 12112, 40)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (12112, 12112, 48)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (22995, 12112, 13)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23009, 12112, 13)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23018, 12112, 1)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23026, 12112, 1)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23036, 12112, 1)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23036, 12112, 14)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23036, 12112, 40)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23036, 12112, 48)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23039, 12112, 13)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23054, 12112, 1)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23062, 12112, 40)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23091, 12112, 1)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23094, 12112, 13)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23095, 12112, 13)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23096, 12112, 14)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23098, 12112, 48)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23101, 12112, 1)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23104, 12112, 1)
INSERT [ph].[ph_market_assigned_user] ([mas_assigned_w_user_id], [mas_admin_w_user_id], [mas_market_id]) VALUES (23104, 12112, 13)
GO
ALTER TABLE [ph].[ph_market_assigned_user]  WITH CHECK ADD  CONSTRAINT [FK_ph_market_assigned_user_Market_mas_market_id] FOREIGN KEY([mas_market_id])
REFERENCES [dbo].[Market] ([market_id])
ON DELETE CASCADE
GO
ALTER TABLE [ph].[ph_market_assigned_user] CHECK CONSTRAINT [FK_ph_market_assigned_user_Market_mas_market_id]
GO
ALTER TABLE [ph].[ph_market_assigned_user]  WITH CHECK ADD  CONSTRAINT [FK_ph_market_assigned_user_web_users_mas_admin_w_user_id] FOREIGN KEY([mas_admin_w_user_id])
REFERENCES [dbo].[web_users] ([w_user_id])
GO
ALTER TABLE [ph].[ph_market_assigned_user] CHECK CONSTRAINT [FK_ph_market_assigned_user_web_users_mas_admin_w_user_id]
GO
ALTER TABLE [ph].[ph_market_assigned_user]  WITH CHECK ADD  CONSTRAINT [FK_ph_market_assigned_user_web_users_mas_assigned_w_user_id] FOREIGN KEY([mas_assigned_w_user_id])
REFERENCES [dbo].[web_users] ([w_user_id])
ON DELETE CASCADE
GO
ALTER TABLE [ph].[ph_market_assigned_user] CHECK CONSTRAINT [FK_ph_market_assigned_user_web_users_mas_assigned_w_user_id]
GO
