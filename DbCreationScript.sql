USE [RelationDataModeling]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/12/2018 7:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[SSID] [int] NOT NULL,
	[ManagerSSID] [int] NULL,
	[Name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 10/12/2018 7:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ID] [int] NOT NULL,
	[Name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectMapping]    Script Date: 10/12/2018 7:44:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectMapping](
	[ProjectID] [int] NULL,
	[EmployeeSSID] [int] NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([ManagerSSID])
REFERENCES [dbo].[Employee] ([SSID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[ProjectMapping]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMapping_Employee] FOREIGN KEY([EmployeeSSID])
REFERENCES [dbo].[Employee] ([SSID])
GO
ALTER TABLE [dbo].[ProjectMapping] CHECK CONSTRAINT [FK_ProjectMapping_Employee]
GO
ALTER TABLE [dbo].[ProjectMapping]  WITH CHECK ADD  CONSTRAINT [FK_ProjectMapping_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
ALTER TABLE [dbo].[ProjectMapping] CHECK CONSTRAINT [FK_ProjectMapping_Project]
GO
