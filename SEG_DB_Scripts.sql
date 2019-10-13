USE [SEG]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/13/2019 8:15:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/13/2019 8:15:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/13/2019 8:15:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/13/2019 8:15:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/13/2019 8:15:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/13/2019 8:15:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/13/2019 8:15:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentEn] [nvarchar](50) NULL,
	[DepartmentAr] [nvarchar](50) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/13/2019 8:15:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Contact] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[Gender] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201910110726282_InitialCreate', N'SEG.MVCUI.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4D416CECA9726488DDD04EEDA6E8DC61764EDA06F0157E2AE8548942A51AE8D225FD6877E527FA14389BAF1A2CBAEBCBB2E02042B727866381C92C3E1D0FFFEFDCFF8FDA3EF190F388ADD804CCC83D1BE696062078E4B961333A18B576FCDF7EFBEFD667CE6F88FC6A79CEE88D1414B124FCC7B4AC363CB8AED7BECA378E4BB7614C4C1828EECC0B790135887FBFB3F59070716060813B00C63FC3121D4F571FA019FD380D838A409F22E03077B312F879A598A6A5C211FC721B2F1C49C9DFD32BAFC34BDBB1865B4A671E2B908E498616F611A889080220A521EDFC57846A3802C67211420EFF629C440B7405E8CB9F4C72579D78EEC1FB28E5865C31CCA4E621AF83D010F8EB8662CB1F94AFA350BCD81EECE40C7F489F53AD5DFC4BC70705AF431F0400122C3E3A91731E2897959B03889C32B4C4779C35106791E01DC9F41F4655445DC333AB7DB2B2CE970B4CFFEED19D3C4A349842704273442DE9E7193CC3DD7FE0D3FDD065F30991C1DCC17476F5FBF41CED19B1FF1D1EB6A4FA1AF40572B80A29B28087104B2E145D17FD3B0EAED2CB161D1ACD226D30AD8124C0AD3B8448F1F3059D27B982E876F4DE3DC7DC44E5EC28DEB8EB83087A0118D12F8BC4A3C0FCD3D5CD45B8D3CD9FF0D5C0F5FBF1984EB157A7097E9D00BFC61E24430AF3E622FAD8DEFDD309B5EB5F1FECCC9CEA3C067DF75FBCA6A3FCF8224B25967022DC92D8A9698D6A51B5BA5F17632690635BC59E7A8BB6FDA4C52D9BC95A4AC43ABCC849CC5A667432EEFF3F2ED6C7127610883979A16D34893C1895BD54868BB671414A5D91C74351B02DDF93FAF82673E72BD0196C10E5CC0FF58B8918F8B5EFE1C80D121D25BE61B14C7B00A38BFA2F8BE4174F83980E8336C271118E78C223F7C766E37F701C157893F6736BF395E830DCDED9FC139B269109D11D66A6DBC0F81FD2548E819714E11C577D4CE01D9E7ADEB770718449C13DBC6717C0EC68C9D6900EE750E7841E8D1616F38B63C6DDB0D997AC8F5D57E88B0907ECE494B5F444D21F9231A32954FD224EA8760E9926EA2E6A47A51338A565139595F511958374939A55ED094A055CE8C6A302F2F1DA1E1DDBC1476F7FDBCF5366FDD5A5051E30C5648FC0B26388265CCB94194E2889423D065DDD886B3900E1F63FAEC7B53CAE913F292A159AD341BD24560F8D990C2EEFE6C48C584E207D7615E4987C34F4E0CF09DE8D5E7AAF6392748B6E9E950EBE6A6996F660DD04D9793380E6C379D058AB0170F5AD4E5071FCE688F6064BD11A320D0313074976D7950027D3345A3BA26A7D8C3141B277616169CA2D8468EAC46E890D343B07C475508564643EAC2FD20F1044BC7116B84D821288699EA122A4F0B97D86E88BC562D092D3B6E61ACEF050FB1E61487983086AD9AE8C25C1DFC6002147C844169D3D0D8AA585CB3216ABC56DD98B7B9B0E5B84B31898DD8648BEFACB14BEEBF3D8B61366B6C03C6D9AC922E02680379DB30507E56E96A00E2C165D70C543831690C94BB541B31D0BAC6B660A07595BC3803CD8EA85DC75F38AFEE9A79D60FCA9BDFD61BD5B505DBACE963C74C33F33DA10D85163892CDF374CE2AF123551CCE404E7E3E8BB9AB2B9A08039F615A0FD994FEAED20FB59A4144236A022C0DAD05945F014A40D284EA215C1ECB6B948E7B113D60F3B85B232C5FFB05D88A0DC8D8D5ABD00AA1FEC25434CE4EA78FA26785354846DEE9B050C1511884B878D53BDE4129BAB8ACAC982EBE701F6FB8D2313E180D0A6AF15C354ACA3B33B89672D36CD792CA21EBE392ADA525C17DD26829EFCCE05AE236DAAE248553D0C32D584B45F52D7CA0C996473A8ADDA6A81B5B597E142F185B9A44AAF1250A43972C2B8955BCC498655955D357B3FE09477E8661D9B122EFA890B6E04483082DB1500BAC41D273378AE929A2688E589C67EAF81299726FD52CFF39CBEAF6290F62BE0FE4D4EC37BF59152FEE6B3BADEC8A708473E89FCFFC993488AE187D757383A5B9210F458AB8FD34F0129FE8DD2B7DEBECF6AEDA3E2B9111C69620BFE43E49BA929CDCBAE23B0D8B3C250619A2C277597D98F4103A65E79E6755DD3A6F548F9207A7AA28BA80D5D6864DE7C4F4182AD13BEC3F52AD08CF33A7784A4A158017F5C4A86435486095BAEEA8F5C4932A66BDA63BA2905D528514AA7A4859CD21A90959AD58094FA3513545770E72D648155DAEED8EACC81FA9422BAA57C056C82CD6754755A498548115D5DDB1CB7C137109DDE15D4B7B665971DBCA0EB5EBED5B1A8CE7590F87D9F62A77F755A04A714F2C7E3B2F81F1F29DB425EDC96E455BCA2219EBD9920643BFEAD4EEBCEB8B4EE345BD1EB376915D5BD89B2EF2F578FD2CF659ED423AD6892405F7E278271CE3C6FC48D5FE68463A636524A691AB11ACE929A6D81F3182D1EC0F6FEAB9982DE139C12522EE02C7344BDE300FF70F0E859737BBF30AC68A63C7531C49754F61EA63B6813C2CF28022FB1E457256C41A2F454A5029E07C411CFC3831FF4A5B1DA7B10BF62B2DDE332EE23BE2FE9140C56D9460E3AB9CE5394CE67C87B71A85A05F5FC42388EE2ABFF8FD73D674CFB88E603A1D1BFB82A25719FEFAD3885ED2644DD79066E507132F77B6D55E24285185D9B2FA0384B94B07797C904BF99D8F1EBFEF2B9AF281C15A888A470443E10DA242DD238155B0B40F041CF8A4E903817E9D553F18584534ED630197F407139F0A745F86F2965BDC8714C7A54D2C49A99E5B53ADD7CABBDCF6DE246564AF35D1E5ACEB1E70836656AFE7A2BCB08CE5C1B64E4542F260D8DBB4FB67CF42DE95C4E3D269DF6EBEF126538C1BAE92FE5799C53B900BA7C8EDD97EFEF0A66D4D17FFDDF124CC7E59C23B666C7C9BDF7E2EF0A68D4D1720DE7163EB95F1BB63B6B6ADFD73CB96D6790BDD7AFEAE9C8AA4B9C7514591DBF273B3903B1CFFE7011841E65166CF2AD509614DC9AC2D0C4B123D537D269AC8589A38125F89A2996DBFBEF20DBFB1B39CA699AD267FB389375FFF1B79739A66DE9AACC86D64162BF31255D9DE2DEB5853E2D44BCA24AEF5A42571BDCD676DBC947F4989C38328A5367B34B7CB2F274F7810950C39757AE405CB17C5B07756FE0623ECDFB1BB2C21D85F6424D8AEED9A05CD055904F9E62D48949308119A4B4C91035BEA4944DD05B22954B30074FA2E3C0DEAB16B9039762EC87542C3844297B13FF76A012FE60434F14F939FEB328FAF43F6150FD10510D36581FB6BF273E27A4E21F7B92226A48160DE050FF7B2B1A42CECBB7C2A90AE02D21188ABAF708A6EB11F7A00165F93197AC0ABC806E6F7012F91FD5446007520ED035157FBF8D445CB08F931C728DBC327D8B0E33FBEFB0FB716EEF38A540000, N'6.2.0-61023')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'02e10ad1-b0cb-4ebf-9ed6-00d3d7f3c0e3', N'test@gmail.com', 0, N'ALX6FXN5Yk7wH9nuViCDBDENc1rfz1xEaaKOYFi2GzkyA1bimP0SMZkphgb08LC49w==', N'5690ffc7-6588-4596-8580-7edba799f774', NULL, 0, 0, NULL, 1, 0, N'test@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'191c5c10-028a-4295-b96a-27bc42357825', N'test12345@gmail.com', 0, N'ACiDuy1iI/FAfQeYUqTbBqwOPGKF35W8w1PFsxwRInkxOkwQ8X7ouMKoiHQ77N7AFA==', N'7e98f052-93ed-430e-ab8f-46bcdd02e751', NULL, 0, 0, NULL, 0, 0, N'test12345@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'605f1e7d-c20b-41f8-a51e-e30a2930f048', N'test4321@gmail.com', 0, N'APIayy494Lcwv5CH19ApTf8Nm/ltC4jDrOY6GTpF4LG/cpikKZfW+B4l6sD51R0shA==', N'233ca50e-f761-4a03-9b49-0bacda7d56e5', NULL, 0, 0, NULL, 0, 0, N'test4321@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'73fde08c-aa53-48a2-af1b-731fc1335f5d', N'test2@gmail.com', 0, N'ACHHMTG9PB77ixWZgE2fmLFEqUk2rqB/1FS4k7JoP38WAqSlTyNQAaO6WNhMJW6v/w==', N'51be0f7b-2bc1-4626-a236-bc1f7cc0e770', NULL, 0, 0, NULL, 0, 0, N'test2@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'926cb841-c752-46ab-9d94-5b7b94b6a966', N'aa@gmail.com', 0, N'AGgdwb9dHUDZAJdptTYipakpXB2E0z52nUn90xOZ9APhzWjuYgSsrnVlZAceAAExTg==', N'd8c48e12-8c47-4a62-ab42-23afd39d3efe', NULL, 0, 0, NULL, 0, 0, N'aa@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'98975188-c553-4f45-a411-7a58d43afc74', N'test1234@gmail.com', 0, N'AMqTiNs437QawjOPjpejDF/U1iQL8vE3WKI/x5u8Azw5FIp3Uhf6nPmbYy8u7kF5Mw==', N'455dec1d-98c2-4cea-9bd8-cc093c07ccec', NULL, 0, 0, NULL, 0, 0, N'test1234@gmail.com')
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Contact], [Address], [Email], [Password], [Gender], [CreatedDate], [DepartmentId]) VALUES (9, N'test', N'dfsdf', N'tdfd', N'dfdf', N'tes@g.com', NULL, N'Male', NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Contact], [Address], [Email], [Password], [Gender], [CreatedDate], [DepartmentId]) VALUES (10, N'dfdfd', N'fsdfdf', N'dfdsfdfd', N'fdfdf', N'dfsdf@gmail.com', NULL, N'Male', NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Contact], [Address], [Email], [Password], [Gender], [CreatedDate], [DepartmentId]) VALUES (11, N'dfdfddfdf', N'sdfdfsdfd', N'fdfdfd', N'sfdf', N'dfd@gmail.com', NULL, N'Male', NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Contact], [Address], [Email], [Password], [Gender], [CreatedDate], [DepartmentId]) VALUES (12, N'test', N'dfsd', N'sdf', N'dfdfd', N'test@gmail.com', NULL, N'Male', NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Contact], [Address], [Email], [Password], [Gender], [CreatedDate], [DepartmentId]) VALUES (13, N'dsf', N'dfsdfdfd', N'fdsfdff', N'dfdfddf', N'fdfdf@gmail.com', NULL, N'Male', NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Contact], [Address], [Email], [Password], [Gender], [CreatedDate], [DepartmentId]) VALUES (1009, NULL, NULL, NULL, NULL, N'aa@gmail.com', N'123', NULL, NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Contact], [Address], [Email], [Password], [Gender], [CreatedDate], [DepartmentId]) VALUES (1010, NULL, NULL, NULL, NULL, N'test124@gmail.com', N'test@1234', NULL, NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Contact], [Address], [Email], [Password], [Gender], [CreatedDate], [DepartmentId]) VALUES (1011, NULL, NULL, NULL, NULL, N'test11@gmail.com', N'P@ss1234', NULL, NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Contact], [Address], [Email], [Password], [Gender], [CreatedDate], [DepartmentId]) VALUES (1012, NULL, NULL, NULL, NULL, N'fsds@test.com', N'P@ss12345', NULL, NULL, NULL)
INSERT [dbo].[Employees] ([EmployeeId], [FirstName], [LastName], [Contact], [Address], [Email], [Password], [Gender], [CreatedDate], [DepartmentId]) VALUES (1013, NULL, NULL, NULL, NULL, N'fdfdf@sdf.sdf', N'1234', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployees]    Script Date: 10/13/2019 8:15:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetEmployees]
	-- Add the parameters for the stored procedure here
	@departmentId int=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select e.*,d.DepartmentEn,d.DepartmentAr  from Employees e
	left join departments d on e.DepartmentId = d.DepartmentId
	where isnull(e.DepartmentId,0) =isnull ((CASE  WHEN @departmentId> 0  THEN @departmentId ELSE e.DepartmentId END),0)
END


GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeesPaging]    Script Date: 10/13/2019 8:15:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetEmployeesPaging]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortDir nvarchar(10),
@Search nvarchar(255) = NULL
as
begin
    Declare @FirstRec int, @LastRec int
    Set @FirstRec = @DisplayStart;
    Set @LastRec = @DisplayStart + @DisplayLength;
   
    With CTE_Employees as
    (
         Select ROW_NUMBER() over (order by
        
         case when (@SortCol = 0 and @SortDir='asc')
             then EmployeeId
         end asc,
         case when (@SortCol = 0 and @SortDir='desc')
             then EmployeeId
         end desc,
        
        case when (@SortCol = 1 and @SortDir='asc')
             then FirstName
        end asc,
        case when (@SortCol = 1 and @SortDir='desc')
            then FirstName
        end desc,

        case when (@SortCol = 2 and @SortDir='asc')
            then LastName
        end asc,
        case when (@SortCol = 2 and @SortDir='desc')
            then LastName
        end desc,

        case when (@SortCol = 3 and @SortDir='asc')
            then Gender
        end asc,
        case when (@SortCol = 3 and @SortDir='desc')
            then Gender
        end desc,

        case when (@SortCol = 4 and @SortDir='asc')
            then Email
        end asc,
        case when (@SortCol = 4 and @SortDir='desc')
            then Email
        end desc)
         as RowNum,
         COUNT(*) over() as TotalCount,
         EmployeeId,
         FirstName,
         LastName,
         Gender,
         Email
         from Employees
         where (@Search IS NULL
                 Or EmployeeId like '%' + @Search + '%'
                 Or FirstName like '%' + @Search + '%'
                 Or LastName like '%' + @Search + '%'
                 Or Gender like '%' + @Search + '%'
                 Or Email like '%' + @Search + '%')
    )
    Select *
    from CTE_Employees
    where RowNum > @FirstRec and RowNum <= @LastRec
end

GO
