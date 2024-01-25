USE [POS]
GO
/****** Object:  Table [dbo].[CategoryFlavorMapping]    Script Date: 6/18/2021 2:25:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryFlavorMapping](
	[CategoryID] [int] NULL,
	[FlavorID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](500) NULL,
	[PhoneNo] [varchar](100) NULL,
	[EmailAddress] [varchar](100) NULL,
	[Address] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[PicName] [varchar](100) NULL,
	[PicGuid] [varchar](max) NULL,
	[PicPath] [varchar](max) NULL,
	[VirtualKeyboard] [bit] NULL,
	[PrintForKitchen] [bit] NULL,
	[IsTax] [bit] NULL,
	[TaxName] [varchar](50) NULL,
	[TaxPercentage] [decimal](18, 2) NULL,
	[EnableTakeAwayOnSale] [bit] NULL,
	[EnableDeliveryOnSale] [bit] NULL,
	[EnableDineInnOnSale] [bit] NULL,
	[Licensekey] [varchar](max) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerCategory](
	[CustomerCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[PhoneNo] [varchar](100) NULL,
	[Address] [varchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK__Customer__A4AE64B8DCD28026] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DealItem]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealItem](
	[DealID] [int] NULL,
	[ItemID] [int] NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dining]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dining](
	[TableID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](100) NULL,
	[Sort] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Flavor]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Flavor](
	[FlavorID] [int] IDENTITY(1,1) NOT NULL,
	[FlavorName] [varchar](100) NULL,
	[Sort] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlavorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](200) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[PicName] [varchar](100) NULL,
	[PicGuid] [varchar](max) NULL,
	[PicPath] [varchar](max) NULL,
	[Sort] [int] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_ItemCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Description] [varchar](max) NULL,
	[Active] [bit] NULL,
	[PurchaseRate] [decimal](18, 2) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[CategoryID] [int] NULL,
	[PicName] [varchar](100) NULL,
	[PicGuid] [varchar](max) NULL,
	[PicPath] [varchar](max) NULL,
	[Sort] [int] NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemsFlavorMapping]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsFlavorMapping](
	[ItemID] [int] NULL,
	[FlavorID] [int] NULL,
	[ShowOnlyItemsFlavor] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NULL,
	[MenuIcon] [varchar](50) NULL,
	[MenuSortedID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Module]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Module](
	[ModuleID] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [varchar](50) NULL,
	[ModuleDescription] [varchar](500) NULL,
	[Active] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ModulePermission]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModulePermission](
	[ModulePermissionID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[ModuleID] [int] NULL,
	[Can_View] [bit] NULL,
	[Can_Insert] [bit] NULL,
	[Can_Update] [bit] NULL,
	[Can_Delete] [bit] NULL,
	[Active] [tinyint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_ModulePermission] PRIMARY KEY CLUSTERED 
(
	[ModulePermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Page](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [varchar](50) NULL,
	[PageDescription] [varchar](500) NULL,
	[PageUrl] [varchar](100) NULL,
	[PageIcon] [varchar](50) NULL,
	[PageSortedID] [int] NULL,
	[Active] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PageDetails]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageDetails](
	[PageDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NULL,
	[MenuID] [int] NULL,
	[ModuleID] [int] NULL,
 CONSTRAINT [PK_PageDetails] PRIMARY KEY CLUSTERED 
(
	[PageDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Riders]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Riders](
	[RiderID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[PhoneNo] [varchar](100) NULL,
	[CNIC] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK__Riders__7D726C00CC45BD96] PRIMARY KEY CLUSTERED 
(
	[RiderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[RoleName] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales](
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[SalesRate] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[PurchaseRate] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[SaleNo] [int] NULL,
	[CashReceived] [decimal](18, 2) NULL,
	[TableID] [int] NULL,
	[IsPaid] [bit] NULL,
	[WaiterID] [int] NULL,
	[RiderID] [int] NULL,
	[IsPrint] [bit] NULL,
	[DeliveryCharges] [decimal](18, 2) NULL,
	[PaidBy] [int] NULL,
	[PaidDate] [datetime] NULL,
	[ShiftID] [int] NULL,
	[CustomerID] [int] NULL,
	[TaxPercentage] [decimal](18, 2) NULL,
	[TaxName] [varchar](50) NULL,
	[FlavorID] [int] NULL,
 CONSTRAINT [PK__Sales__C952FB126E890E7C] PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesItemFlavor]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesItemFlavor](
	[SalesID] [int] NULL,
	[ItemID] [int] NULL,
	[FlavorID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[UserID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesItemFlavorTemp]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesItemFlavorTemp](
	[SalesTempID] [int] NULL,
	[ItemID] [int] NULL,
	[FlavorID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[UserID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesReturn]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesReturn](
	[SalesReturnID] [int] IDENTITY(1,1) NOT NULL,
	[SalesID] [int] NULL,
	[SaleNo] [int] NULL,
	[ItemID] [int] NULL,
	[Quantity] [int] NULL,
	[UpdatedQty] [int] NULL,
	[Actions] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesReturnDetail]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesReturnDetail](
	[SaleReturnDetailID] [int] IDENTITY(1,1) NOT NULL,
	[SaleNo] [int] NULL,
	[ItemID] [int] NULL,
	[SalesRate] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[SaleDate] [datetime] NULL,
 CONSTRAINT [PK_SalesReturnDetail] PRIMARY KEY CLUSTERED 
(
	[SaleReturnDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salestemp]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salestemp](
	[SalesTempID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ItemID] [int] NULL,
	[Quantity] [int] NULL,
	[SalesRate] [decimal](18, 2) NULL,
	[PurchaseRate] [decimal](18, 2) NULL,
	[FlavorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesTempID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shift]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shift](
	[ShiftID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[ShiftTimeFrom] [varchar](100) NULL,
	[ShiftTimeTo] [varchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Updatedby] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Active] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblExpense]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblExpense](
	[ExpenseID] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseTypeID] [int] NOT NULL,
	[Discription] [varchar](250) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[ExpenseDate] [date] NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tblExpense] PRIMARY KEY CLUSTERED 
(
	[ExpenseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblExpenseType]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExpenseType](
	[ExpenseTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseType] [nvarchar](50) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tblExpenseType] PRIMARY KEY CLUSTERED 
(
	[ExpenseTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[Name] [varchar](50) NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Address] [varchar](500) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[DesignationID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRolePermission]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRolePermission](
	[UserRolePermissionID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[PageID] [int] NULL,
	[Can_View] [bit] NULL,
	[Can_Insert] [bit] NULL,
	[Can_Update] [bit] NULL,
	[Can_Delete] [bit] NULL,
	[Active] [tinyint] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_UserRolePermission] PRIMARY KEY CLUSTERED 
(
	[UserRolePermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Waiters]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Waiters](
	[WaiterID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[PhoneNo] [varchar](100) NULL,
	[CNIC] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK__Waiters__88C0F0724DE8067D] PRIMARY KEY CLUSTERED 
(
	[WaiterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

GO
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [PhoneNo], [EmailAddress], [Address], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [PicName], [PicGuid], [PicPath], [VirtualKeyboard], [PrintForKitchen], [IsTax], [TaxName], [TaxPercentage], [EnableTakeAwayOnSale], [EnableDeliveryOnSale], [EnableDineInnOnSale], [Licensekey]) VALUES (1, N'CS RESTAURANT & CATERING', N'0321-3853153', N'sajjadali97@gmail.com', N'', NULL, NULL, CAST(N'2021-06-15 17:44:29.570' AS DateTime), 1, N'zaiqah.png', N'cd3698cb-8f21-4a92-a2d1-679cbae94169', N'/App_Images/Gallery/cd3698cb-8f21-4a92-a2d1-679cbae94169.png', 0, 1, 1, N'SST', CAST(13.00 AS Decimal(18, 2)), 1, 1, 1, N'qbdcrDPcuO9zUNduqEU0D5qn7+z7rQob6oEN1eu4+WMihqYHZ/39yOhyR3i4v4UrvqBVSb53btcA87ro1iVcbA3gDd5h5JnTYgt48sPnSzva9lobZMrxPtlY7KdUQ6oE9s9vf1GTfvEgeinBZLvOc1jxlOZTD0hN')
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

GO
INSERT [dbo].[Customers] ([CustomerID], [Name], [PhoneNo], [Address], [CreatedBy], [CreatedDate], [UpdateBy], [UpdateDate], [Active]) VALUES (1, N'Cash', NULL, N'', NULL, NULL, 1, CAST(N'2021-06-15 15:54:09.560' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Dining] ON 

GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (1, N'Table 1', 1, CAST(N'2021-06-14 13:09:06.823' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (2, N'Table 2', 2, CAST(N'2021-06-14 13:09:06.823' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (3, N'Table 3', 3, CAST(N'2021-06-14 13:09:06.823' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (4, N'Table 4', 4, CAST(N'2021-06-14 13:09:06.823' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (5, N'Table 5', 5, CAST(N'2021-06-14 13:09:06.823' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (6, N'Table 6', 6, CAST(N'2021-06-14 13:09:06.823' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (7, N'Table 7', 7, CAST(N'2021-06-14 13:09:06.823' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (8, N'Table 8', 8, CAST(N'2021-06-14 13:09:06.823' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (9, N'Table 9', 9, CAST(N'2021-06-14 13:09:06.823' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (10, N'Table 10', 10, CAST(N'2021-06-14 13:09:06.823' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (11, N'Table 11', 11, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (12, N'Table 12', 12, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (13, N'Table 13', 13, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (14, N'Table 14', 14, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (15, N'Table 15', 15, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (16, N'Table 16', 16, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (17, N'Table 17', 17, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (18, N'Table 18', 18, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (19, N'Table 19', 19, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (20, N'Table 20', 20, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (21, N'Table 21', 21, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (22, N'Table 22', 22, CAST(N'2021-06-14 13:09:06.827' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (23, N'Table 23', 23, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (24, N'Table 24', 24, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (25, N'Table 25', 25, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (26, N'Table 26', 26, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (27, N'Table 27', 27, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (28, N'Table 28', 28, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (29, N'Table 29', 29, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (30, N'Table 30', 30, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (31, N'Table 31', 31, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (32, N'Table 32', 32, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (33, N'Table 33', 33, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (34, N'Table 34', 34, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (35, N'Table 35', 35, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (36, N'Table 36', 36, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (37, N'Table 37', 37, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (38, N'Table 38', 38, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (39, N'Table 39', 39, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (40, N'Table 40', 40, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (41, N'Table 41', 41, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (42, N'Table 42', 42, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (43, N'Table 43', 43, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (44, N'Table 44', 44, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (45, N'Table 45', 45, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (46, N'Table 46', 46, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (47, N'Table 47', 47, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (48, N'Table 48', 48, CAST(N'2021-06-14 13:09:06.830' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (49, N'Table 49', 49, CAST(N'2021-06-14 13:09:06.833' AS DateTime), 1, NULL, NULL, 1)
GO
INSERT [dbo].[Dining] ([TableID], [TableName], [Sort], [CreateDate], [CreatedBy], [UpdateDate], [UpdateBy], [Active]) VALUES (50, N'Table 50', 50, CAST(N'2021-06-14 13:09:06.833' AS DateTime), 1, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Dining] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MenuIcon], [MenuSortedID]) VALUES (1, N'Business Setting', N'site-menu-icon icon fa-building', 1)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MenuIcon], [MenuSortedID]) VALUES (2, N'Items', N'site-menu-icon icon fa-tags', 3)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MenuIcon], [MenuSortedID]) VALUES (4, N'Purchase', N'site-menu-icon icon fa-cart-plus', 12)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MenuIcon], [MenuSortedID]) VALUES (5, N'Sales', N'site-menu-icon icon fa-money', 7)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MenuIcon], [MenuSortedID]) VALUES (7, N'Reports', N'site-menu-icon icon fa-file-text', 9)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MenuIcon], [MenuSortedID]) VALUES (8, N'Backup', N'site-menu-icon icon fa-briefcase', 11)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MenuIcon], [MenuSortedID]) VALUES (9, N'Security', N'site-menu-icon icon fa-briefcase', 10)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MenuIcon], [MenuSortedID]) VALUES (1017, N'Expense', N'site-menu-icon icon fa-user-plus', 4)
GO
INSERT [dbo].[Menu] ([MenuID], [MenuName], [MenuIcon], [MenuSortedID]) VALUES (1018, N'Customers', N'site-menu-icon icon fa-user-plus', 2)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Module] ON 

GO
INSERT [dbo].[Module] ([ModuleID], [ModuleName], [ModuleDescription], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'Business Setting', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Module] ([ModuleID], [ModuleName], [ModuleDescription], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'Items', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Module] ([ModuleID], [ModuleName], [ModuleDescription], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'Sales', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Module] ([ModuleID], [ModuleName], [ModuleDescription], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (7, N'Reports', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Module] ([ModuleID], [ModuleName], [ModuleDescription], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (8, N'Backup', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Module] ([ModuleID], [ModuleName], [ModuleDescription], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (9, N'Security', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Module] ([ModuleID], [ModuleName], [ModuleDescription], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1017, N'Expense', NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Module] ([ModuleID], [ModuleName], [ModuleDescription], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1018, N'Customers', NULL, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Module] OFF
GO
SET IDENTITY_INSERT [dbo].[ModulePermission] ON 

GO
INSERT [dbo].[ModulePermission] ([ModulePermissionID], [RoleID], [ModuleID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1024, 1, 1, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.000' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[ModulePermission] ([ModulePermissionID], [RoleID], [ModuleID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1025, 1, 2, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.003' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[ModulePermission] ([ModulePermissionID], [RoleID], [ModuleID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1026, 1, 5, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.003' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[ModulePermission] ([ModulePermissionID], [RoleID], [ModuleID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1027, 1, 7, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.007' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[ModulePermission] ([ModulePermissionID], [RoleID], [ModuleID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1028, 1, 8, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.007' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[ModulePermission] ([ModulePermissionID], [RoleID], [ModuleID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1029, 1, 9, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.010' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[ModulePermission] ([ModulePermissionID], [RoleID], [ModuleID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2019, 1, 1017, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.010' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[ModulePermission] ([ModulePermissionID], [RoleID], [ModuleID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2020, 1, 1018, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.010' AS DateTime), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ModulePermission] OFF
GO
SET IDENTITY_INSERT [dbo].[Page] ON 

GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (11, N'Sales', N'Sales', N'Sales/Sales.aspx', N'custom_icon md-dot-circle-alt', 3, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (12, N'Sales Details', N'Sales', N'Sales/SaleDetails.aspx', N'custom_icon md-dot-circle-alt', 4, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (15, N'Business Setting', N'Business', N'BusinessInfo/BusinessInfo.aspx', N'custom_icon md-dot-circle-alt', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (16, N'Items Info', N'Items', N'Items/ItemsInfo.aspx', N'custom_icon md-dot-circle-alt', 3, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (18, N'Unit of Measurement', N'Items', N'Items/UnitofMeasurement.aspx', N'custom_icon md-dot-circle-alt', 2, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (33, N'Item Category', N'Item Category', N'Items/ItemCategoryInfo.aspx', N'custom_icon md-dot-circle-alt', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (35, N'Item Detail Report', N'Reports', N'Rpts/ItemDetailReport.aspx', N'custom_icon md-dot-circle-alt', 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (36, N'Item List Report', N'Reports', N'Rpts/ItemListReport.aspx', N'custom_icon md-dot-circle-alt', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (37, N'Purchase Register Report', N'Reports', N'Rpts/PurchaseRegisterReport.aspx', N'custom_icon md-dot-circle-alt', 3, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (38, N'Sale Register', N'Reports', N'Rpts/SaleRegisterReport.aspx', N'custom_icon md-dot-circle-alt', 4, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (40, N'Stock Register', N'Reports', N'Rpts/StockRegisterReport.aspx', N'custom_icon md-dot-circle-alt', 5, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (41, N'Pay Customer Balance', N'Sales', N'Sales/PayCustomerBalance.aspx', N'custom_icon md-dot-circle-alt', 5, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (42, N'Bill Wise Profit', N'Reports', N'Rpts/ProfitBillWiseReport.aspx', N'custom_icon md-dot-circle-alt', 6, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (43, N'Customer Wise Profit', N'Reports', N'Rpts/ProfitCustomerWiseReport.aspx', N'custom_icon md-dot-circle-alt', 7, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (44, N'Date Wise Profit', N'Reports', N'Rpts/ProfitDateWiseReport.aspx', N'custom_icon md-dot-circle-alt', 8, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (45, N'Highest Customer Profit', N'Reports', N'Rpts/HighestCustomerProfitReport.aspx', N'custom_icon md-dot-circle-alt', 9, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (46, N'Current Stock Report', N'Reports', N'Rpts/CurrentStockReport.aspx', N'custom_icon md-dot-circle-alt', 5, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (47, N'Highest Item Profit', N'Reports', N'Rpts/HighestItemProfitReport.aspx', N'custom_icon md-dot-circle-alt', 10, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (48, N'Highest Customer Sale', N'Reports', N'Rpts/HighestCustomerSaleReport.aspx', N'custom_icon md-dot-circle-alt', 11, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (49, N'Highest Item Sale', N'Reports', N'Rpts/HighestItemSaleReport.aspx', N'custom_icon md-dot-circle-alt', 12, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (50, N'Customer Credit List', N'Reports', N'Rpts/CustomerCreditReport.aspx', N'custom_icon md-dot-circle-alt', 13, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (51, N'Customer Credit Detail', N'Reports', N'Rpts/CustomerCreditDetail.aspx', N'custom_icon md-dot-circle-alt', 14, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (52, N'Stock Detail Report', N'Reports', N'Rpts/StockDetailReport.aspx', N'custom_icon md-dot-circle-alt', 15, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (53, N'Order Booker Sale', N'Reports', N'Rpts/OrderBookerSaleReport.aspx', N'custom_icon md-dot-circle-alt', 16, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (54, N'Order Booker Profit', N'Reports', N'Rpts/OrderBookerProfitReport.aspx', N'custom_icon md-dot-circle-alt', 17, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (55, N'Company', N'Items', N'Items/CompanyInfo.aspx', N'custom_icon md-dot-circle-alt', 2, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (56, N'Backup', N'Backup', N'Backup/Backup.aspx', N'site-menu-icon icon fa-briefcase', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (57, N'Month Wise Profit', N'Reports', N'Rpts/ProfitMonthWiseReport.aspx', N'custom_icon md-dot-circle-alt', 18, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (58, N'Avg Price Detail Report', N'Reports', N'Rpts/AvgPriceDetailReport.aspx', N'custom_icon md-dot-circle-alt', 19, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (59, N'Role', N'Security', N'Security/UserRole.aspx', N'custom_icon md-dot-circle-alt', 20, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (60, N'User', N'Security', N'Security/Users.aspx', N'custom_icon md-dot-circle-alt', 21, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (61, N'Highest Item', N'Reports', N'Rpts/HighestItemReport.aspx', N'custom_icon md-dot-circle-alt', 21, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (63, N'Dining Table', N'Table', N'Table/Table.aspx', N'custom_icon md-dot-circle-alt', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (64, N'Waiters', N'Waiters', N'Waiters/Waiters.aspx', N'custom_icon md-dot-circle-alt', 22, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (65, N'Riders', N'Riders', N'Riders/Riders.aspx', N'custom_icon md-dot-circle-alt', 23, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (67, N'Deal Item Report', N'Reports', N'Rpts/DealItem.aspx', N'custom_icon md-dot-circle-alt', 6, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (70, N'Expense Report', N'Reports', N'Rpts/ExpenseReport.aspx', N'custom_icon md-dot-circle-alt', 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (71, N'Sales Return ', N'Sales', N'Sales/SalesReturn.aspx', N'custom_icon md-dot-circle-alt', 3, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (72, N'Item Flavor', N'Flavor', N'Flavor/Flavors.aspx', N'custom_icon md-dot-circle-alt', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (73, N'Sale Return Detail', N'Reports', N'Rpts/SaleReturnDetailReport.aspx', N'custom_icon md-dot-circle-alt', 6, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1074, N'Delivery Report', N'Reports', N'Rpts/DeliveryReport.aspx', N'custom_icon md-dot-circle-alt', 24, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1075, N'Expense Type', N'Expense', N'Expense/ExpenseType.aspx', N'custom_icon md-dot-circle-alt', 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1076, N'Expense', N'Expense', N'Expense/Expense.aspx', N'custom_icon md-dot-circle-alt', 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1077, N'Customer Category', N'CustomerCategory', N'Customers/CustomerCategoryInfo.aspx', N'custom_icon md-dot-circle-alt', 1, 0, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1078, N'Customer', N'Customers', N'Customers/Customers.aspx', N'site-menu-icon icon fa-users', 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Page] ([PageID], [PageName], [PageDescription], [PageUrl], [PageIcon], [PageSortedID], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1079, N'Shifts', N'Shifts', N'Shift/Shift.aspx', N'custom_icon md-dot-circle-alt', 24, 0, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Page] OFF
GO
SET IDENTITY_INSERT [dbo].[PageDetails] ON 

GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (11, 11, 5, 5)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (12, 12, 5, 5)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (15, 15, 1, 1)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (16, 16, 2, 2)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (18, 18, 2, 2)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (32, 33, 2, 2)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (34, 35, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (35, 36, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (36, 37, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (37, 37, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (38, 38, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (40, 40, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (41, 41, 5, 5)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (42, 42, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (43, 43, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (44, 44, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (45, 45, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (46, 46, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (47, 47, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (48, 48, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (49, 49, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (50, 50, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (51, 51, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (52, 52, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (53, 53, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (54, 54, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (55, 55, 2, 2)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1055, 56, 8, 8)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1056, 57, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1057, 58, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1058, 59, 9, 9)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1060, 60, 9, 9)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1061, 61, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1062, 63, 1, 1)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1063, 64, 1, 1)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1064, 65, 1, 1)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1066, 67, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1069, 70, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1070, 71, 5, 5)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1071, 72, 2, 2)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (1072, 73, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (2073, 1074, 7, 7)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (2074, 1075, 1017, 1017)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (2075, 1076, 1017, 1017)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (2076, 1077, 1018, 1018)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (2077, 1078, 1018, 1018)
GO
INSERT [dbo].[PageDetails] ([PageDetailsID], [PageID], [MenuID], [ModuleID]) VALUES (2078, 1079, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[PageDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Riders] ON 

GO
INSERT [dbo].[Riders] ([RiderID], [Name], [PhoneNo], [CNIC], [Address], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Active]) VALUES (1, N'Default Rider', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Riders] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

GO
INSERT [dbo].[Role] ([RoleID], [CompanyID], [RoleName], [Description], [Status], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 1, N'Administration', N'', 1, NULL, NULL, CAST(N'2020-07-08 15:58:28.903' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

GO
INSERT [dbo].[User] ([UserID], [RoleID], [Name], [UserName], [Password], [Address], [Phone], [Email], [Status], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy], [DesignationID]) VALUES (1, 1, N'Point of Sale', N'POS', N'aGnqmSZaZqk=', NULL, N'0321-3853153', N'sajjadali97@gmail.com', 1, NULL, NULL, CAST(N'2021-03-09 16:32:10.023' AS DateTime), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRolePermission] ON 

GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2424, 1, 15, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.013' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2425, 1, 63, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.013' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2426, 1, 64, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.017' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2427, 1, 65, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.017' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2428, 1, 16, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.020' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2429, 1, 33, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.020' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2430, 1, 72, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.023' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2431, 1, 11, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.023' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2432, 1, 12, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.027' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2433, 1, 71, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.027' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2434, 1, 35, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.030' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2435, 1, 36, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.030' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2436, 1, 38, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.033' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2437, 1, 42, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.033' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2438, 1, 44, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.037' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2439, 1, 47, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.037' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2440, 1, 49, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.037' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2441, 1, 67, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.040' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2442, 1, 70, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.040' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2443, 1, 73, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.043' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2444, 1, 1074, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.043' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2445, 1, 56, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.047' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2446, 1, 59, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.047' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (2447, 1, 60, 1, 1, 1, 1, 1, CAST(N'2021-03-09 16:25:44.050' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3409, 1, 1075, 1, 1, 1, 1, 1, CAST(N'2021-03-11 12:56:45.657' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3410, 1, 1076, 1, 1, 1, 1, 1, CAST(N'2021-03-11 12:56:45.657' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3411, 1, 1077, 1, 1, 1, 1, 1, CAST(N'2021-03-11 12:56:45.657' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3412, 1, 1078, 1, 1, 1, 1, 1, CAST(N'2021-03-11 12:56:45.657' AS DateTime), 1, NULL, NULL)
GO
INSERT [dbo].[UserRolePermission] ([UserRolePermissionID], [RoleID], [PageID], [Can_View], [Can_Insert], [Can_Update], [Can_Delete], [Active], [CreatedDate], [CreatedBy], [UpdatedDate], [UpdatedBy]) VALUES (3413, 1, 1079, 1, 1, 1, 1, 1, CAST(N'2021-03-11 12:56:45.657' AS DateTime), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserRolePermission] OFF
GO
SET IDENTITY_INSERT [dbo].[Waiters] ON 

GO
INSERT [dbo].[Waiters] ([WaiterID], [Name], [PhoneNo], [CNIC], [Address], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Active]) VALUES (1, N'Default Waiter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Waiters] OFF
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_ItemCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ItemCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_ItemCategory]
GO
ALTER TABLE [dbo].[ModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_ModulePermission_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[ModulePermission] CHECK CONSTRAINT [FK_ModulePermission_Role]
GO
ALTER TABLE [dbo].[PageDetails]  WITH CHECK ADD  CONSTRAINT [FK_PageDetails_Menu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Menu] ([MenuID])
GO
ALTER TABLE [dbo].[PageDetails] CHECK CONSTRAINT [FK_PageDetails_Menu]
GO
ALTER TABLE [dbo].[PageDetails]  WITH CHECK ADD  CONSTRAINT [FK_PageDetails_Module] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Module] ([ModuleID])
GO
ALTER TABLE [dbo].[PageDetails] CHECK CONSTRAINT [FK_PageDetails_Module]
GO
ALTER TABLE [dbo].[PageDetails]  WITH CHECK ADD  CONSTRAINT [FK_PageDetails_Page] FOREIGN KEY([PageID])
REFERENCES [dbo].[Page] ([PageID])
GO
ALTER TABLE [dbo].[PageDetails] CHECK CONSTRAINT [FK_PageDetails_Page]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Company]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK__Sales__ItemID__3A4CA8FD] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK__Sales__ItemID__3A4CA8FD]
GO
ALTER TABLE [dbo].[tblExpense]  WITH CHECK ADD  CONSTRAINT [FK_tblExpense_tblExpenseType] FOREIGN KEY([ExpenseTypeID])
REFERENCES [dbo].[tblExpenseType] ([ExpenseTypeID])
GO
ALTER TABLE [dbo].[tblExpense] CHECK CONSTRAINT [FK_tblExpense_tblExpenseType]
GO
ALTER TABLE [dbo].[UserRolePermission]  WITH CHECK ADD  CONSTRAINT [FK_UserRolePermission_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRolePermission] CHECK CONSTRAINT [FK_UserRolePermission_Role]
GO
/****** Object:  StoredProcedure [dbo].[getitemcategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getitemcategory] --40
@CategoryID int
as 
begin
select i.CategoryID,i.Name from [dbo].[ItemCategory] ic
inner join [Items] i on i.CategoryID = ic.CategoryID
where  i.CategoryID = @CategoryID 
end








GO
/****** Object:  StoredProcedure [dbo].[SP_AddKey]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_AddKey]        
 @Key varchar(max)
as      
begin      
update Company set Licensekey = @Key 
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_BindCompany]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_BindCompany]
as
begin
select CompanyID,CompanyName from Company
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_ChallanExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ChallanExist]                      
@ChallanNo varchar(50),
@VendorID int               
as                    
begin                    
Select ChallanNo from StockIn where ChallanNo = @ChallanNo  and VendorID= @VendorID   
end 
















GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteCustomer]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckandDeleteCustomer]          
 @CustomerID int   
            
AS          
BEGIN            
Delete from [Customers] where CustomerID = @CustomerID 
 END  






GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteCustomerCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_CheckandDeleteCustomerCategory]        
 @CustomerCategoryID int 
          
AS        

 Begin 
Delete from [CustomerCategory] where  [CustomerCategoryID] = @CustomerCategoryID
 END










GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteFlavor]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckandDeleteFlavor]        
 @FlavorID int 
          
AS        
BEGIN  
if exists(select FlavorID from Sales where FlavorID = @FlavorID)  
begin
select 0
end     
else
begin
Delete from [Flavor] where  [FlavorID] = @FlavorID
select 1
 END
 end 


GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteItem]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_CheckandDeleteItem]        
 @ItemID int 
          
AS        
BEGIN        
 SET NOCOUNT ON;        

 IF EXISTS(Select [ItemID] from [Sales]  where  [ItemID] = @ItemID )
 OR
Exists(Select [ItemID] from [Salestemp]  where  [ItemID] = @ItemID)
 Begin
 select 0
 END
 Else
 Begin 
Delete from [Items] where  [ItemID] = @ItemID
Delete from [DealItem] where  [DealID] = @ItemID
 select 1
 END

END












GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteItemCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_CheckandDeleteItemCategory]        
 @CategoryID int 
          
AS        
BEGIN        
 SET NOCOUNT ON;        

 IF EXISTS(Select ItemID from [Items]  where  [CategoryID] = @CategoryID)
 Begin
 select 0
 END
 Else
 Begin 
Delete from [ItemCategory] where  [CategoryID] = @CategoryID
 select 1
 END

END










GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeletePurchase]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckandDeletePurchase]          
 @ChallanNo int   
            
AS          
BEGIN          
 SET NOCOUNT ON;          
  
  
Delete from [StockIn] where ChallanNo = @ChallanNo
Delete from [PurchasePayment] where InvoiceNo = @ChallanNo
  
END  















GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteRiders]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CheckandDeleteRiders]
@RiderID int 
as 
begin 
if exists(select RiderID from Sales where RiderID = @RiderID)
begin 
select 0
end 
else
begin
delete from Riders where RiderID = @RiderID
select 1
end 
end 



GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteSale]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckandDeleteSale]          
 @STONo int   
            
AS          
BEGIN          
 SET NOCOUNT ON;          
  
  
Delete from [StockOut] where StockOutNo = @STONo
Delete from [SalePayment] where InvoiceNo = @STONo
  
END  











GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteSales]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CheckandDeleteSales]
@SaleNo int 
as
begin 
delete from Sales where SaleNo = @SaleNo and IsPaid = 0
end 



GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteSalesTemp]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procEDURE [dbo].[SP_CheckandDeleteSalesTemp]    
 @SalesTempID int          
AS        
BEGIN        
 SET NOCOUNT ON;        
Delete from [Salestemp] where  [SalesTempID] = @SalesTempID
Delete from SalesItemFlavorTemp where SalesTempID = @SalesTempID


END


GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteShift]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckandDeleteShift]          
 @ShiftID int   
            
AS          
BEGIN            
Delete from [Shift] where ShiftID = @ShiftID
 END  



GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteTable]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_CheckandDeleteTable]        
 @TableID int 
          
AS        
BEGIN  
if exists(select TableID from Sales where TableID = @TableID)  
begin
select 0
end     
else
begin
Delete from [Dining] where  [TableID] = @TableID
select 1
 END
 end 




GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteTableSales]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_CheckandDeleteTableSales]    
 @SalesID int          
AS        
BEGIN        
 SET NOCOUNT ON;         
Delete from [Sales] where  SalesID = @SalesID
Delete from SalesItemFlavor where SalesID = @SalesID


END


GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteVendors]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckandDeleteVendors]          
 @VendorID int   
            
AS          
BEGIN          
 SET NOCOUNT ON;          
  
 IF EXISTS(Select VendorID from  StockIn where VendorID = @VendorID)  
 Begin  
 select 0  
 END  
 Else  
 Begin   
Delete from [Vendors] where VendorID = @VendorID  
 select 1  
 END  
  
END  















GO
/****** Object:  StoredProcedure [dbo].[SP_CheckandDeleteWaiters]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CheckandDeleteWaiters]
@WaiterID int 
as 
begin 

 IF EXISTS(Select WaiterID from [Sales]  where  WaiterID = @WaiterID)
 Begin
 select 0
 END
 Else
 Begin 
delete from Waiters where WaiterID = @WaiterID
 select 1
 END

end




GO
/****** Object:  StoredProcedure [dbo].[SP_CheckCompanyInfoExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
  
  

CREATE procEDURE [dbo].[SP_CheckCompanyInfoExist]        
 @Company varchar(500) 
          
AS        
BEGIN        
 SET NOCOUNT ON;        

 IF EXISTS(Select Company from [dbo].CompanyInfo where Company = @Company)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END












GO
/****** Object:  StoredProcedure [dbo].[SP_CheckCustomerCategoryExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
  
  

CREATE procEDURE [dbo].[SP_CheckCustomerCategoryExist]        
 @CategoryName varchar(500) 
          
AS        
BEGIN        
 SET NOCOUNT ON;        

 IF EXISTS(Select CategoryName from [dbo].[CustomerCategory] where CategoryName = @CategoryName)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END












GO
/****** Object:  StoredProcedure [dbo].[SP_CheckCustomerExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckCustomerExist]        
 @PhoneNo varchar(100) 
          
AS       
BEGIN        
 SET NOCOUNT ON;        
 IF EXISTS( select PhoneNo from Customers where PhoneNo = @PhoneNo)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END







GO
/****** Object:  StoredProcedure [dbo].[SP_CheckFlavorExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_CheckFlavorExist]        
 @FlavorName varchar(500) 
          
AS        
BEGIN        
 SET NOCOUNT ON;        

 IF EXISTS(Select FlavorName from [dbo].[Flavor] where FlavorName = @FlavorName)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END



GO
/****** Object:  StoredProcedure [dbo].[SP_CheckItemCategoryExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
  
  

CREATE procEDURE [dbo].[SP_CheckItemCategoryExist]        
 @CategoryName varchar(500) 
          
AS        
BEGIN        
 SET NOCOUNT ON;        

 IF EXISTS(Select CategoryName from [dbo].[ItemCategory] where CategoryName = @CategoryName)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END












GO
/****** Object:  StoredProcedure [dbo].[SP_CheckItemExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_CheckItemExist]        
 @Name varchar(500) 
          
AS        
BEGIN        
 SET NOCOUNT ON;        

 IF EXISTS(Select Name from  [Items] where Name = @Name)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END
















GO
/****** Object:  StoredProcedure [dbo].[SP_CheckPurchaseExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_CheckPurchaseExist]        
 @ItemID varchar(500) 
          
AS       
BEGIN        
 SET NOCOUNT ON;       
 IF EXISTS(select ItemID from StockInTemp where ItemID = @ItemID)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END










GO
/****** Object:  StoredProcedure [dbo].[SP_CheckRiderExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckRiderExist]        
 @PhoneNo varchar(100) 
          
AS       
BEGIN        
 SET NOCOUNT ON;        
 IF EXISTS( select PhoneNo from Riders where PhoneNo = @PhoneNo)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END







GO
/****** Object:  StoredProcedure [dbo].[SP_CheckSaleExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_CheckSaleExist]        
 @ItemID varchar(500) 
          
AS       
BEGIN        
 SET NOCOUNT ON;       
 IF EXISTS(select ItemID from StockOutTemp where ItemID = @ItemID)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END










GO
/****** Object:  StoredProcedure [dbo].[SP_CheckShiftExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckShiftExist]        
 @Name varchar(100) 
          
AS       
BEGIN        
 SET NOCOUNT ON;        
 IF EXISTS( select Name from Shift where Name = @Name)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END


GO
/****** Object:  StoredProcedure [dbo].[SP_CheckTableExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
  
  

CREATE procEDURE [dbo].[SP_CheckTableExist]        
 @TableName varchar(500) 
          
AS        
BEGIN        
 SET NOCOUNT ON;        

 IF EXISTS(Select TableName from [dbo].[Dining] where TableName = @TableName)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END












GO
/****** Object:  StoredProcedure [dbo].[SP_CheckTableSalesInsert]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_CheckTableSalesInsert] 
@TableID int 
as
begin
select isnull((select top(1) SaleNo from [Sales] where TableID = @TableID and IsPaid=0),0)

end 






GO
/****** Object:  StoredProcedure [dbo].[SP_CheckUOMExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckUOMExist]        
 @UOM varchar(500) 
          
AS       
BEGIN        
 SET NOCOUNT ON;        
 IF EXISTS( select UOM from UnitOfMeasure where UOM = @UOM)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END










GO
/****** Object:  StoredProcedure [dbo].[SP_CheckVendorExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_CheckVendorExist]        
 @Vendor varchar(500) 
          
AS        
BEGIN        
 SET NOCOUNT ON;        
 IF EXISTS(select Company from Vendors where Company = @Vendor)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END











GO
/****** Object:  StoredProcedure [dbo].[SP_CheckWaiterExist]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_CheckWaiterExist]        
 @PhoneNo varchar(100) 
          
AS       
BEGIN        
 SET NOCOUNT ON;        
 IF EXISTS( select PhoneNo from Waiters where PhoneNo = @PhoneNo)
 Begin
 select 1
 END
 Else
 Begin 
 select 0
 END

END






GO
/****** Object:  StoredProcedure [dbo].[SP_ChildRecordExistsByRole]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ChildRecordExistsByRole]
@RoleID int
As
Begin
IF EXISTS (SELECT RoleID FROM [User] WHERE RoleID = @RoleID)
BEGIN
Select 1
--Yes
END
ELSE
BEGIN
Select 0
--No
END
End
















GO
/****** Object:  StoredProcedure [dbo].[SP_CusNameForCash]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CusNameForCash]
@CustomerID int 
as
begin
select top(1)* from Customers
where CustomerID = @CustomerID or @CustomerID is null 
end














GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerCreditDetailReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_CustomerCreditDetailReport]--'2018-05-14 00:00:00.000', '2018-05-17 00:00:00.000',1

@FromDate datetime  ,
@TODate datetime  ,
@CustomerID int 
as          
begin          
select  '-'  as Customer, '-' as BillDate, '-' as BillAmount, '-' as PayAmount , 
(select ISNULL(SUM((ISNULL(InvoiceAmount,0) + ISNULL(TransportationCharges,0)) -  ISNULL(PayAmount,0)),0) from SalePayment ss where ss.CustomerID = @CustomerID
and (ss.InvoiceDate < @FromDate or @FromDate  is null)
) as BillBalance
union 
select c.Name as Customer,CONVERT(varchar, sp.InvoiceDate, 101) as BillDate,CONVERT(varchar,InvoiceAmount + TransportationCharges) as BillAmount,CONVERT(varchar,PayAmount),(InvoiceAmount + TransportationCharges) -  PayAmount as BillBalance
 from [dbo].[Customer] c Inner join 
[dbo].[SalePayment] sp on c.CustomerID = sp.CustomerID
where c.CustomerID = @CustomerID and ((sp.InvoiceDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
 order by Customer asc
	 
end 












GO
/****** Object:  StoredProcedure [dbo].[SP_CustomerCreditReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_CustomerCreditReport] --null, null,null

@FromDate datetime  ,
@TODate datetime  ,
@CustomerID int 
as          
begin          


 select cc.CustomerID,cc.Name as Customer, 
 (select (ISNULL(SUM([InvoiceAmount]),0) + ISNULL(SUM([TransportationCharges]),0)) - ISNULL(SUM([PayAmount]),0) 
 from [dbo].[SalePayment] where [CustomerID] = cc.CustomerID and ((InvoiceDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))) as Credit from [dbo].[Customer] cc
  where (cc.CustomerID = @CustomerID or @CustomerID is null)
	 
end 












GO
/****** Object:  StoredProcedure [dbo].[SP_DealBasedItems]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_DealBasedItems]
@DealID int 
as 
begin
select di.ItemID, di.Quantity, i.Name, i.SaleRate, (i.SaleRate * di.Quantity) as Amount from DealItem di
inner join Items i on di.ItemID = i.ItemID
where DealID = @DealID
end





GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteDealItems]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DeleteDealItems]
@DealID int
as 
begin 
delete from DealItem
where DealID = @DealID
end 





GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteDinning]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_DeleteDinning]        
 @TableID int 
as       
begin
delete from Sales where [TableID] = @TableID  and [IsPaid] = 0
end



GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteExpense]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_DeleteExpense]
@ExpenseID int
as
begin
delete from tblExpense where expenseid = @ExpenseID
end



GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteExpenseType]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_DeleteExpenseType]
@ExpenseTypeID int
as
begin
delete from tblExpenseType where ExpenseTypeID = @ExpenseTypeID
end



GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteFlavorOnCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_DeleteFlavorOnCategory]
@CategoryID int 
as
begin 
delete from CategoryFlavorMapping
where CategoryID = @CategoryID
end 


GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteFlavorOnItem]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SP_DeleteFlavorOnItem]
@ItemID int 
as 
begin 
delete from ItemsFlavorMapping
where ItemID = @ItemID
end 


GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteModulePermission]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_DeleteModulePermission]      
@RoleID int               
AS                
BEGIN               
DELETE FROM ModulePermission WHERE RoleID=@RoleID                                     
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteRole]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_DeleteRole]
@RoleID int
As
Begin
Delete from [Role] Where RoleID = @RoleID
End
















GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteRolePagePermission]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_DeleteRolePagePermission]                      
@RoleID int                    
AS                    
BEGIN                                   
DELETE FROM UserRolePermission                    
 WHERE RoleID=@RoleID                                     
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteSaleBySalesID]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_DeleteSaleBySalesID]
@SalesID int ,
@UserID int
as
begin 
Insert into SalesReturnDetail
select 
SaleNo ,
ItemID ,
SalesRate, 
Quantity , 
getdate(), 
CreatedBy = @UserID ,
CreatedDate
from Sales where SalesID = @SalesID 

 delete from Sales where SalesID = @SalesID
 end 


GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteSalePayment]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_DeleteSalePayment]        
 @CustomerID int ,
 @InvoiceNo int
          
AS        
BEGIN        
 SET NOCOUNT ON;        


Delete from [SalePayment] where  CustomerID = @CustomerID and InvoiceNo=@InvoiceNo
 select 1
 

END










GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteStockIn]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_DeleteStockIn]                    
@StockInID int,           
@User int              
as                  
begin           
          
declare @msg varchar(100)    
     
     
      

		delete from StockIn  where StockInID = @StockInID       
   set @msg = 'Stock deleted successfully!'    
         
    select @msg     
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteStockInTemp]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_DeleteStockInTemp]                    
@StockInTempID int            
as                  
begin           
          
declare @msg varchar(100)    
     
     
      

		delete from StockInTemp  where StockInTempID = @StockInTempID
   set @msg = 'Item deleted successfully!'    
         
    select @msg     
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteStockOut]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_DeleteStockOut]                      
@StockOutID int,             
@User int                
as                    
begin             
            
declare @msg varchar(100)      
  --update  StockOut set IsDeleted=1,DeletedBy=@User,DeletedDate=GETDATE() where StockOutID = @StockOutID         
  delete from StockOut where StockOutID = @StockOutID     
   set @msg = 'Sales Item deleted successfully!'      
           
    select @msg       
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteStockOutTemp]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_DeleteStockOutTemp]                      
@StockOutID bigint               
as                    
begin             
            
   
  delete from StockOutTemp where StockOutTempID = @StockOutID     
     
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteUsers]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_DeleteUsers]        
@UserID int  
as      
begin      
Delete from [User] where UserID = @UserID  
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_FinalPayment]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_FinalPayment] 
@TableID int ,
@PaidBy int ,
@PaidDate datetime
as
begin
update Sales 
set 
	[IsPaid] = 1,
	PaidBy = @PaidBy,
	PaidDate = @PaidDate
where TableID = @TableID and isPaid=0

end 


GO
/****** Object:  StoredProcedure [dbo].[SP_FinalPaymentDelivery]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_FinalPaymentDelivery] 
@SaleNo int 
as
begin
update Sales 
set 
	[IsPaid] = 1
where SaleNo = @SaleNo and isPaid=0

end 






GO
/****** Object:  StoredProcedure [dbo].[SP_FinalPaymentDeliveryAmount]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE proc [dbo].[SP_FinalPaymentDeliveryAmount]
@SaleNo int,
@PaidBy int,
@PaidDate datetime
as
begin 
update Sales
set 
[IsPaid] = 1,
[PaidBy] = @PaidBy,
[PaidDate] = @PaidDate
where SaleNo = @SaleNo and IsPaid = 0
end 


GO
/****** Object:  StoredProcedure [dbo].[SP_GetActiveItemList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetActiveItemList] 
@serchq  varchar(max)            
as          
begin          
Select I.Name,I.ItemID,I.SaleRate,i.PicPath from  Items I        
left Join [dbo].[ItemCategory] IC on IC.CategoryID=I.CategoryID
Where (I.name like '%'+@serchq+'%' or @serchq is null) and I.Active = 1 and I.Type='Item'   Order by I.Sort asc    
end  






GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllModuleByModuleID]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetAllModuleByModuleID]    
@ModuleID int    
as    
begin    
select * from [Module]     
Where (ModuleID = @ModuleID or @ModuleID is null)    
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllPageByModuleID]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetAllPageByModuleID]    
@ModuleID int    
as    
begin    
select distinct(P.PageName),P.PageID, M.ModuleName, M.ModuleID from [Page] as P    
inner join [PageDetails] as PD on P.PageID = PD.PageID    
inner join [Module] as M on PD.ModuleID = M.ModuleID    
where (M.ModuleID = @ModuleID or @ModuleID is null) and P.Active = 1    
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllRole]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetAllRole]  
@RoleID int
AS  
Begin  
select R.CompanyID,R.RoleID,R.RoleName,R.Description,R.Status from [Role] as R 
Where (R.RoleID = @RoleID or @RoleID is null)
End
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetAVGPriceDetailReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetAVGPriceDetailReport]    
@CategoryID int      
as    
begin   
select 
ROW_NUMBER() OVER (ORDER BY i.Name) AS SrNo,i.Name as ItemName,
case when (select avg(Price) from StockIn where StockIn.ItemID = i.ItemID) is null then i.PurchaseRate else (select avg(Price) from StockIn where StockIn.ItemID = i.ItemID) end as PurchasePrice,
case when (select avg(Rate) from StockOut where StockOut.ItemID = i.ItemID) is null then i.saleRate else (select avg(Rate) from StockOut where StockOut.ItemID = i.ItemID) end as SalePrice,

ic.CategoryName 
 as CategoryName from Items i
inner join ItemCategory IC 
on i.CategoryID=IC.[CategoryID] 
Where IC.CategoryID = @CategoryID or @CategoryID is null  Order by I.Name asc    
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_getChallanNo]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[SP_getChallanNo]                      
               
as                    
begin             
            
select ISNULL(Max(ChallanNo),0) + 1 from StockIn   

delete from [dbo].[StockInTemp]
end 
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetCompanyInfoList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetCompanyInfoList]            
@CompanyID int      
as          
begin          
Select ROW_NUMBER() OVER(ORDER BY CompanyID ASC) as SrNo,* from [dbo].[Company]      
    
Where CompanyID = @CompanyID or @CompanyID is null  Order by CompanyID asc    
end  












GO
/****** Object:  StoredProcedure [dbo].[SP_GetCompanyList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetCompanyList]    --null        
as          
begin          
select * from Company c   
end  












GO
/****** Object:  StoredProcedure [dbo].[SP_getCustomerBalance]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_getCustomerBalance]                      
@CustomerID int              
as                    
begin             
            
select (ISNULL(SUM([InvoiceAmount]),0) + ISNULL(SUM([TransportationCharges]),0)) - ISNULL(SUM([PayAmount]),0) from [dbo].[SalePayment] where [CustomerID] = @CustomerID
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_getCustomerBalanceEdit]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_getCustomerBalanceEdit]                      
@CustomerID int ,
@InvoiceNo int             
as                    
begin             
            
select (ISNULL(SUM([InvoiceAmount]),0) + ISNULL(SUM([TransportationCharges]),0)) - ISNULL(SUM([PayAmount]),0) from [dbo].[SalePayment]
 where [CustomerID] = @CustomerID and InvoiceNo < @InvoiceNo and InvoiceNo > 0
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerCategoryList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetCustomerCategoryList]            
@CategoryID int      
as          
begin          
Select ROW_NUMBER() OVER(ORDER BY CategoryName ASC) as SrNo,* from [dbo].[CustomerCategory]      
    
Where CustomerCategoryID = @CategoryID or @CategoryID is null  Order by CategoryName asc    
end 












GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetCustomerList]          
@CustomerID int    
as        
begin        
Select * from  [Customers] c          
Where CustomerID = @CustomerID or @CustomerID is null    
end





GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerListAgent]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetCustomerListAgent]   --null            
as        
begin        
Select Name,CustomerID from  [Customer] where IsAgent=1
end













GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerListByCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetCustomerListByCategory]          
@CustomerCategoryID int    
as        
begin        
Select Name,CustomerID from  [Customer] c
  
Where CustomerCategoryID = @CustomerCategoryID
end













GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerListFroDrop]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetCustomerListFroDrop]   --null            
as        
begin        
Select Name,CustomerID from  [Customer]  where IsAgent=0
end













GO
/****** Object:  StoredProcedure [dbo].[SP_GetCustomerName]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[SP_GetCustomerName]
 @CustomerID int
 as
 begin 
 select Name from Customers
 where CustomerID = @CustomerID
 end


GO
/****** Object:  StoredProcedure [dbo].[SP_getCustomerRef]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_getCustomerRef]                      
@CustomerID int              
as                    
begin             
            
select top(1)ISNULL(ReferenceBy,0) from StockOut where [CustomerID] = @CustomerID order by StockOutID desc
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_GetDealItem]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_GetDealItem]
@DealID int 
as
begin 
select (select top(1) items.Name from items where items.itemid= d.dealid and items.type='Deal') as DealName,i.Name, d.Quantity, (i.SaleRate * d.Quantity) as Total from DealItem d
inner join Items i on d.itemid = i.ItemID
where (DealID = @DealID or @DealID is null) order by DealName
end 





GO
/****** Object:  StoredProcedure [dbo].[SP_GetDealList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetDealList]            
@DealID int      
as          
begin 
select * from DealItem
where DealID = @DealID or @DealID is null
end 





GO
/****** Object:  StoredProcedure [dbo].[SP_GetDealName]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetDealName] 
@ItemID int
as
begin
select * from Items 
where   [Type] = 'Deal' and (ItemID = @ItemID or @ItemID is null) 
end 





GO
/****** Object:  StoredProcedure [dbo].[SP_GetDealsList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetDealsList]
@serchq  varchar(max)  
as
begin 
select I.Name,I.ItemID,I.SaleRate,i.PicPath from Items i 
left join ItemCategory ic on ic.CategoryID = i.CategoryID
where (I.name like '%'+@serchq+'%' or @serchq is null) and I.Active = 1 and i.Type = 'Deal' Order by I.Sort asc 
end



GO
/****** Object:  StoredProcedure [dbo].[SP_GetDeliveryDetails]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetDeliveryDetails] --6
@RiderID int
as
begin 
select s.SaleNo, r.RiderID, sum((s.SalesRate * s.Quantity) + s.DeliveryCharges) as Total, s.IsPaid from Sales s 
inner join Items i on s.ItemID = i.ItemID 
inner join Riders r on s.RiderID = r.RiderID
where s.RiderID = @RiderID and s.IsPaid = 0
group by s.SaleNo, r.RiderID, s.IsPaid
order by COUNT(s.SaleNo)
end


GO
/****** Object:  StoredProcedure [dbo].[SP_GetDeliveryList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetDeliveryList]
as
begin
select distinct r.Name, SaleNo from Sales s
inner join Riders r on s.RiderID=r.RiderID
where s.RiderID is not null and (IsPaid = 0)
end 








GO
/****** Object:  StoredProcedure [dbo].[SP_GetDeliverySales]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[SP_GetDeliverySales]
@UserID int ,
@SaleNo int
as
begin 
select SaleNo,RiderID,Discount,CashReceived as ReceivedAmount,SalesID,Items.ItemID,Items.Name, ts.SalesRate as Price, ts.Quantity,  (SalesRate * Quantity) as Total from Sales ts
inner join Items on ts.ItemID = Items.ItemID 
where ts.CreatedBy = @UserID and ts.SaleNo = @SaleNo and ts.IsPaid = 0 and ts.RiderID is not null 
end








GO
/****** Object:  StoredProcedure [dbo].[sp_GetEexpensetypebyid]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[sp_GetEexpensetypebyid]
@Expensetypeid int
as
begin
Select * from tblExpensetype where ExpensetypeID = @Expensetypeid
end





GO
/****** Object:  StoredProcedure [dbo].[sp_Getexpensebyid]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_Getexpensebyid]
@Expenseid int
as
begin
Select * from tblExpense where ExpenseID = @Expenseid
end



GO
/****** Object:  StoredProcedure [dbo].[sp_GetExpenseList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_GetExpenseList]
@ExpenseID int
as
begin
Select * from tblExpense inner join tblExpenseType on tblExpense.ExpenseTypeID=tblExpenseType.ExpenseTypeID
 where ExpenseID=@ExpenseID or @ExpenseID is null
end


GO
/****** Object:  StoredProcedure [dbo].[sp_GetExpenseListReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_GetExpenseListReport]
@Datefrom Varchar(50),
@Dateto Varchar(50)

as
begin
Select * from tblExpense inner join tblExpenseType on tblExpense.ExpenseTypeID=tblExpenseType.ExpenseTypeID 
where ExpenseDate between @Datefrom and  @Dateto

end


GO
/****** Object:  StoredProcedure [dbo].[sp_GetexpensetypeList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_GetexpensetypeList]
@ExpenseTypeID int

as
begin
Select * from tblExpenseType where ExpenseTypeID=@ExpenseTypeID or @ExpenseTypeID is null
end



GO
/****** Object:  StoredProcedure [dbo].[SP_GetFlavorAndCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetFlavorAndCategory] --26
@CategoryID int
as
begin 
select CategoryID = @CategoryID, f.FlavorID,f.FlavorName,case when cf.CategoryID is null then 0 else 1 end IsCheck from Flavor f 
left join CategoryFlavorMapping cf on f.FlavorID = cf.FlavorID and (cf.CategoryID = @CategoryID or cf.CategoryID is null)
end


GO
/****** Object:  StoredProcedure [dbo].[SP_GetFlavorAndItem]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetFlavorAndItem] --92
@ItemID int
as 
begin 
select ItemID = @ItemID , f.FlavorID, f.FlavorName, case when ifm.ItemID is null then 0 else 1 end IsCheck from Flavor f
left join ItemsFlavorMapping ifm on f.FlavorID = ifm.FlavorID and (ifm.ItemID = @ItemID or ifm.ItemID is null)

end


GO
/****** Object:  StoredProcedure [dbo].[SP_GetFlavorList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetFlavorList]            
@FlavorID int      
as          
begin          
Select ROW_NUMBER() OVER(ORDER BY FlavorName ASC) as SrNo,* from [dbo].[Flavor]      
    
Where FlavorID = @FlavorID or @FlavorID is null Order by [Flavor].Sort asc    
end  



GO
/****** Object:  StoredProcedure [dbo].[SP_GetFlavorsForSale]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetFlavorsForSale] 
@ItemID int
as
begin 
declare @CategoryID int
set @CategoryID = (select CategoryID from Items Where ItemID = @ItemID)

if not exists (select ItemID from ItemsFlavorMapping Where ItemID = @ItemID)
begin
select ItemID=@ItemID,f.FlavorID,f.FlavorName,f.Sort from Flavor f inner join CategoryFlavorMapping cf on f.FlavorID = cf.FlavorID
where cf.CategoryID = @CategoryID and f.Active=1 order by f.Sort asc
end

else
begin
if exists (select 1 from ItemsFlavorMapping where ItemID = @ItemID and ShowOnlyItemsFlavor = 0)
begin
select ItemID=@ItemID, f.FlavorID,f.FlavorName,f.Sort from Flavor f inner join CategoryFlavorMapping cf on f.FlavorID = cf.FlavorID
where cf.CategoryID = @CategoryID and f.Active=1 
union
select ItemID=@ItemID,f.FlavorID,f.FlavorName,f.Sort from Flavor f inner join ItemsFlavorMapping ifm on f.FlavorID = ifm.FlavorID
where ifm.ItemID = @ItemID and f.Active=1 order by Sort asc 
end

else
begin
select ItemID=@ItemID,f.FlavorID,f.FlavorName,f.Sort from Flavor f inner join ItemsFlavorMapping ifm on f.FlavorID = ifm.FlavorID
where ifm.ItemID = @ItemID and f.Active=1 order by f.Sort asc 
end
end
end


GO
/****** Object:  StoredProcedure [dbo].[SP_GetFlavorsForSaleEdit]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetFlavorsForSaleEdit] --91,true
@ItemID int,
@SalesTempID int,
@UserID int
as
begin 

declare @CategoryID int
set @CategoryID = (select CategoryID from Items Where ItemID = @ItemID)

if not exists (select ItemID from ItemsFlavorMapping Where ItemID = @ItemID)
begin
select ItemID=@ItemID,f.FlavorID,f.FlavorName,f.Sort,
ISNULL((select case when sitmp.FlavorID is not null then 1 else 0 end from [SalesItemFlavorTemp] sitmp where sitmp.ItemID = @ItemID and sitmp.SalesTempID = @SalesTempID and sitmp.UserID = @UserID and sitmp.FlavorID = f.FlavorID),0) as [Check]
 from Flavor f inner join CategoryFlavorMapping cf on f.FlavorID = cf.FlavorID
where cf.CategoryID = @CategoryID and f.Active=1 order by f.Sort asc
end

else
begin
if exists (select 1 from ItemsFlavorMapping where ItemID = @ItemID and ShowOnlyItemsFlavor = 0)
begin
select ItemID=@ItemID, f.FlavorID,f.FlavorName,f.Sort,
ISNULL((select case when sitmp.FlavorID is not null then 1 else 0 end from [SalesItemFlavorTemp] sitmp where sitmp.ItemID = @ItemID and sitmp.SalesTempID = @SalesTempID and sitmp.UserID = @UserID and sitmp.FlavorID = f.FlavorID),0) as [Check]
 from Flavor f inner join CategoryFlavorMapping cf on f.FlavorID = cf.FlavorID
where cf.CategoryID = @CategoryID and f.Active=1 
union
select ItemID=@ItemID,f.FlavorID,f.FlavorName,f.Sort,
ISNULL((select case when sitmp.FlavorID is not null then 1 else 0 end from [SalesItemFlavorTemp] sitmp where sitmp.ItemID = @ItemID and sitmp.SalesTempID = @SalesTempID and sitmp.UserID = @UserID and sitmp.FlavorID = f.FlavorID),0) as [Check]
from Flavor f inner join ItemsFlavorMapping ifm on f.FlavorID = ifm.FlavorID
where ifm.ItemID = @ItemID and f.Active=1 order by Sort asc 
end

else
begin
select ItemID=@ItemID,f.FlavorID,f.FlavorName,f.Sort,
ISNULL((select case when sitmp.FlavorID is not null then 1 else 0 end from [SalesItemFlavorTemp] sitmp where sitmp.ItemID = @ItemID and sitmp.SalesTempID = @SalesTempID and sitmp.UserID = @UserID and sitmp.FlavorID = f.FlavorID),0) as [Check]
 from Flavor f inner join ItemsFlavorMapping ifm on f.FlavorID = ifm.FlavorID
where ifm.ItemID = @ItemID and f.Active=1 order by f.Sort asc 
end
end
end


GO
/****** Object:  StoredProcedure [dbo].[SP_GetFlavorsForSaleEditDining]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetFlavorsForSaleEditDining] 
@ItemID int,
@SalesID int
as
begin 

declare @CategoryID int
set @CategoryID = (select CategoryID from Items Where ItemID = @ItemID)

if not exists (select ItemID from ItemsFlavorMapping Where ItemID = @ItemID)
begin
select ItemID=@ItemID,f.FlavorID,f.FlavorName,f.Sort,
ISNULL((select case when sitmp.FlavorID is not null then 1 else 0 end from [SalesItemFlavor] sitmp where sitmp.ItemID = @ItemID and sitmp.SalesID = @SalesID and sitmp.FlavorID = f.FlavorID),0) as [Check]
 from Flavor f inner join CategoryFlavorMapping cf on f.FlavorID = cf.FlavorID
where cf.CategoryID = @CategoryID and f.Active=1 order by f.Sort asc
end

else
begin
if exists (select 1 from ItemsFlavorMapping where ItemID = @ItemID and ShowOnlyItemsFlavor = 0)
begin
select ItemID=@ItemID, f.FlavorID,f.FlavorName,f.Sort,
ISNULL((select case when sitmp.FlavorID is not null then 1 else 0 end from [SalesItemFlavor] sitmp where sitmp.ItemID = @ItemID and sitmp.SalesID = @SalesID and sitmp.FlavorID = f.FlavorID),0) as [Check]
 from Flavor f inner join CategoryFlavorMapping cf on f.FlavorID = cf.FlavorID
where cf.CategoryID = @CategoryID and f.Active=1 
union
select ItemID=@ItemID,f.FlavorID,f.FlavorName,f.Sort,
ISNULL((select case when sitmp.FlavorID is not null then 1 else 0 end from [SalesItemFlavor] sitmp where sitmp.ItemID = @ItemID and sitmp.SalesID = @SalesID and sitmp.FlavorID = f.FlavorID),0) as [Check]
from Flavor f inner join ItemsFlavorMapping ifm on f.FlavorID = ifm.FlavorID
where ifm.ItemID = @ItemID and f.Active=1 order by Sort asc 
end

else
begin
select ItemID=@ItemID,f.FlavorID,f.FlavorName,f.Sort,
ISNULL((select case when sitmp.FlavorID is not null then 1 else 0 end from [SalesItemFlavor] sitmp where sitmp.ItemID = @ItemID and sitmp.SalesID = @SalesID and sitmp.FlavorID = f.FlavorID),0) as [Check]
 from Flavor f inner join ItemsFlavorMapping ifm on f.FlavorID = ifm.FlavorID
where ifm.ItemID = @ItemID and f.Active=1 order by f.Sort asc 
end
end
end




GO
/****** Object:  StoredProcedure [dbo].[SP_getInvoiceNo]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_getInvoiceNo]
as 
begin
 SET NOCOUNT ON;       
select  case when (isnull(min(InvoiceNo),0) - 1 ) = 0 then -1 else (isnull(min(InvoiceNo),0) - 1 ) end from SalePayment 


end













GO
/****** Object:  StoredProcedure [dbo].[SP_GetInvoiceReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetInvoiceReport] --9 -- Delivery TakeAway Dining
@SaleNo int
as    
begin  
select (case when s.TableID is null and s.RiderID is null then 'TakeAway' when s.TableID is not null then 'Dining' when s.RiderID is not null then 'Delivery' else '' end) as SaleType,s.TableID,s.RiderID,r.Name as Rider,ISNULL(s.DeliveryCharges,0) as DeliveryCharges,w.Name as Waiter,di.TableName as TableNo,s.CashReceived,s.SaleNo, s.CreatedDate as SaleDate, i.Name , s.Quantity, s.SalesRate,s.IsPaid as InvoiceStatus,s.Discount, s
.TaxPercentage,
s.TaxName, c.CustomerID, c.Name 
as CustomerName, c.PhoneNo, c.Address,

STUFF((SELECT ', ' + CAST(Convert(varchar(50),d.Quantity)+' ' + itm.Name  AS VARCHAR(max)) + ','+ 
ISNULL(STUFF((SELECT ', ' +'('+ CAST(Convert(varchar(50),sit.Quantity)+' ' + f.FlavorName+')'  AS VARCHAR(max)) FROM  SalesItemFlavor sit
left join Flavor f on sit.FlavorID = f.FlavorID WHERE sit.ItemID =  d.ItemID  and sit.SalesID = s.salesID
FOR XML PATH ('')), 1, 1, ''),'') FROM Items itm
INNER JOIN DealItem d on d.ItemID = itm.ItemID WHERE d.DealID = i.ItemID
FOR XML PATH ('')), 1, 1, '')  AS DealItemList,


STUFF((SELECT ', ' + '('+CAST(Convert(varchar(50),sit.Quantity)+' ' + f.FlavorName+')'  AS VARCHAR(max)) FROM  SalesItemFlavor sit
inner join Flavor f on sit.FlavorID = f.FlavorID WHERE sit.ItemID = s.ItemID and sit.SalesID = s.SalesID
FOR XML PATH ('')), 1, 1, '')  AS FlavorItemList from Sales s
inner join Items i on s.ItemID = i.ItemID
left join Dining di on s.TableID = di.TableID
left join Waiters w on s.WaiterID = w.WaiterID
left join Riders r on s.RiderID = r.RiderID
left join Customers c on s.CustomerID = c.CustomerID
where SaleNo = @SaleNo
end 





GO
/****** Object:  StoredProcedure [dbo].[SP_getitemcategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_getitemcategory] --40
@CategoryID int
as 
begin
select I.Name,I.ItemID,I.SaleRate,i.PicPath from Items I  
where  i.CategoryID = @CategoryID  and I.Active = 1 and I.Type='Item' Order by I.Sort asc
end




GO
/****** Object:  StoredProcedure [dbo].[SP_GetItemCategoryList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetItemCategoryList]            
@CategoryID int      
as          
begin          
Select ROW_NUMBER() OVER(ORDER BY CategoryName ASC) as SrNo,* from [dbo].[ItemCategory]      
    
Where CategoryID = @CategoryID or @CategoryID is null Order by [ItemCategory].Sort asc    
end 



GO
/****** Object:  StoredProcedure [dbo].[SP_GetItemDetailReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetItemDetailReport]    
@CategoryID int      
as    
begin   
select 
ROW_NUMBER() OVER (ORDER BY i.Name) AS SrNo,i.Name as ItemName,i.[PurchaseRate] as PurchasePrice,i.[SaleRate] as SalePrice,ic.CategoryName
 as CategoryName 
 
 from Items i
Left join ItemCategory IC 
on i.CategoryID=IC.[CategoryID] 
Where i.Type='Item' and (IC.CategoryID = @CategoryID or @CategoryID is null)  Order by I.Name asc    
end  










GO
/****** Object:  StoredProcedure [dbo].[SP_GetItemList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetItemList]  --null          
@ItemID int      
as          
begin          
Select I.Sort,ROW_NUMBER() OVER(ORDER BY I.Name ASC) as SrNo,I.*,IC.CategoryName from  Items I        
left Join [dbo].[ItemCategory] IC on IC.CategoryID=I.CategoryID
Where I.ItemID = @ItemID or @ItemID is null Order by I.Sort asc    
end 



GO
/****** Object:  StoredProcedure [dbo].[SP_GetItemORDeal]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetItemORDeal]
@ItemID int 
as 
begin 
declare @Type varchar(50)
set @Type =  (select Type from Items where ItemID = @ItemID)

if (@Type = 'Deal')
begin

declare @T as table
(
ItemID int,
Name varchar(500) null,
Quantity int

)

declare @TOUT as table
(
ItemID int,
Name varchar(500) null,
Num int null
)

insert into @T
 select Items.ItemID,Items.Name,Quantity from DealItem
inner join Items on DealItem.ItemID = Items.ItemID
 where DealID = @ItemID


Declare @nextID int
Declare @quantity int
Declare @I int

Select @nextID=0


While 1=1
begin

Select @NextID=(select min(ItemID) from @T where ItemID>@nextId)
Select @quantity=(select min(Quantity) from @T where ItemID=@nextId)

if @nextId is null
break
else
set @I=1
while @I<=@quantity
	begin
	insert into @TOUT(ItemID,Name,Num) 
	select ItemID,Name,Num = @I from @T where ItemID=@nextID
		set @I=@I +1	
	end
	
continue

end

select *
from @TOUT

end
else
select Items.ItemID,Items.Name,1 as Num from Items where Items.ItemID = @ItemID


end 



GO
/****** Object:  StoredProcedure [dbo].[SP_GetItemsByCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[SP_GetItemsByCategory]            
@CategoryID int      
as          
begin          
Select * from [dbo].[Items]      
    
Where CategoryID = @CategoryID or @CategoryID is null  Order by Name asc    
end  










GO
/****** Object:  StoredProcedure [dbo].[SP_GetJustItem]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[SP_GetJustItem] 
as
begin 
select * from Items
where Type = 'Item'
end



GO
/****** Object:  StoredProcedure [dbo].[SP_GetKey]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetKey]        
 
as      
begin      
select top(1)Licensekey from Company
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetKitchenInvoice]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetKitchenInvoice]
@TableID int,
@UserID int 
as 
begin 
select s.SalesID, i.Name , w.Name as Waiter,di.TableName as TableNo, s.Quantity,s.CreatedDate as SaleDate,s.IsPaid as InvoiceStatus,s.SaleNo,
STUFF(
         (SELECT ', ' + CAST(Convert(varchar(50),d.Quantity)+' ' + itm.Name  AS VARCHAR(max))
		 + ','+
		  STUFF(
         (SELECT ', ' +'('+ CAST(Convert(varchar(50),sit.Quantity)+' ' + f.FlavorName+')'  AS VARCHAR(max))
           FROM  SalesItemFlavor sit
inner join Flavor f on sit.FlavorID = f.FlavorID
         WHERE sit.ItemID =  d.ItemID  and sit.SalesID = s.salesID
          FOR XML PATH ('')), 1, 1, '') 

           FROM Items itm
		 INNER JOIN DealItem d on d.ItemID = itm.ItemID
         WHERE d.DealID = i.ItemID
          FOR XML PATH ('')), 1, 1, '')  AS DealItemList,

		   STUFF(
         (SELECT ', ' + '('+CAST(Convert(varchar(50),sit.Quantity)+' ' + f.FlavorName+')'  AS VARCHAR(max))
           FROM  SalesItemFlavor sit
inner join Flavor f on sit.FlavorID = f.FlavorID
         WHERE sit.ItemID = s.ItemID and sit.SalesID = s.SalesID
          FOR XML PATH ('')), 1, 1, '')  AS FlavorItemList


 from Sales s
 inner join Items i on s.ItemID = i.ItemID
 left join Dining di on s.TableID = di.TableID
 left join waiters w on s.WaiterID = w.WaiterID
 where s.TableID = @TableID and s.CreatedBy = @UserID and s.IsPrint = 0
 end 



GO
/****** Object:  StoredProcedure [dbo].[SP_GetKitchenInvoiceTakeAway]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetKitchenInvoiceTakeAway] --23
@SaleNo int
as 
begin 
select s.SalesID, i.Name , w.Name as Waiter,di.TableName as TableNo, s.Quantity,s.CreatedDate as SaleDate,s.IsPaid as InvoiceStatus,s.SaleNo,
STUFF(
         (SELECT ', ' + CAST(Convert(varchar(50),d.Quantity)+' ' + itm.Name  AS VARCHAR(max))
		 + ','+
		  ISNULL
(STUFF(
         (SELECT ', ' +'('+ CAST(Convert(varchar(50),sit.Quantity)+' ' + f.FlavorName+')'  AS VARCHAR(max))
           FROM  SalesItemFlavor sit
inner join Flavor f on sit.FlavorID = f.FlavorID
         WHERE sit.ItemID =  d.ItemID  and sit.SalesID = s.salesID
          FOR XML PATH ('')), 1, 1, ''),'')

           FROM Items itm
		 INNER JOIN DealItem d on d.ItemID = itm.ItemID
         WHERE d.DealID = i.ItemID
          FOR XML PATH ('')), 1, 1, '')  AS DealItemList,

		   STUFF(
         (SELECT ', ' + '('+CAST(Convert(varchar(50),sit.Quantity)+' ' + f.FlavorName+')'  AS VARCHAR(max))
           FROM  SalesItemFlavor sit
inner join Flavor f on sit.FlavorID = f.FlavorID
         WHERE sit.ItemID = s.ItemID and sit.SalesID = s.SalesID
          FOR XML PATH ('')), 1, 1, '')  AS FlavorItemList


 from Sales s
 inner join Items i on s.ItemID = i.ItemID
 left join Dining di on s.TableID = di.TableID
 left join waiters w on s.WaiterID = w.WaiterID
 where s.SaleNo = @SaleNo 
 end 




GO
/****** Object:  StoredProcedure [dbo].[SP_GetKPIInfo]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_GetKPIInfo]        
          
AS        
BEGIN        
 SET NOCOUNT ON;        

  declare @TodaySalesAmount int  
  declare @TodayItemSales int  
  declare @DiscountToday int 
  declare @TotalSaleAmountToday int 
  declare @YesterdaySalesAmount bigint 
  declare @YesterdayItemSales int
  declare @DiscountYesterday int
  declare @TotalSaleAmountYesterday bigint

  set @TodaySalesAmount = (select ISNULL(sum(SalesRate * Quantity),0) from Sales where cast(CreatedDate as Date) = cast(getdate() as Date))
  set @TodayItemSales = (select ISNULL(count(distinct SaleNo),0) from Sales where cast(CreatedDate as Date) = cast(getdate() as Date))
  set @DiscountToday = (select ISNULL(Sum(Discount),0) from (select  min(Discount) as Discount from Sales where cast(CreatedDate as Date) = cast(getdate() as Date) group by SaleNo) t)
  set @TotalSaleAmountToday = (select ISNULL(sum(SalesRate * Quantity) - @DiscountToday,0) from Sales where cast(CreatedDate as Date) = cast(getdate() as Date))
   
  set @YesterdaySalesAmount = (select ISNULL(sum(SalesRate * Quantity),0) from Sales where cast(CreatedDate as Date) = dateadd(dd,-1, cast(getdate() as date)))
  set @YesterdayItemSales = (select ISNULL(count(distinct SaleNo),0) from Sales where cast(CreatedDate as Date) = dateadd(dd,-1, cast(getdate() as date)))
  set @DiscountYesterday =  (select ISNULL(Sum(Discount),0) from (select  min(Discount) as Discount from Sales where cast(CreatedDate as Date) = dateadd(dd,-1, cast(getdate() as Date)) group by SaleNo) t)
  set @TotalSaleAmountYesterday = (select ISNULL(sum(SalesRate * Quantity) - @DiscountYesterday,0) from Sales where cast(CreatedDate as Date) = dateadd(dd,-1, cast(getdate() as date)))

  select  TodaySalesAmount = @TodaySalesAmount,TodayItemSales = @TodayItemSales,DiscountToday = @DiscountToday,TotalSaleAmountToday = @TotalSaleAmountToday,
  YesterdaySalesAmount = @YesterdaySalesAmount,YesterdayItemSales = @YesterdayItemSales,DiscountYesterday = @DiscountYesterday,TotalSaleAmountYesterday=@TotalSaleAmountYesterday 

END


GO
/****** Object:  StoredProcedure [dbo].[SP_GetMenuByRoleID]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetMenuByRoleID]    
@RoleID int    
as    
begin    
SELECT replace(Me2.MenuName, ' ', '') as MenuID,(Me2.MenuName) as MenuName,Me2.MenuIcon,(Page.PageName) as PageName,Page.PageUrl,Page.PageIcon,Me2.MenuSortedID,     
(SELECT COUNT(replace(Me.MenuName, ' ', '')) AS MenuCount    
FROM UserRolePermission as URPInner                      
inner join Page as PageInner ON PageInner.PageID=URPInner.PageID      
inner join PageDetails as PD on PD.PageID = PageInner.PageID    
inner join Menu as Me on PD.MenuID = Me.MenuID     
WHERE RoleId= @RoleID and PageInner.Active =1 and Me.MenuName=Me2.MenuName) as MenuCount    
FROM UserRolePermission as URP                      
inner join Page as Page ON Page.PageID=URP.PageID      
inner join PageDetails as PD on PD.PageID = Page.PageID    
inner join Module as M on PD.ModuleID = M.ModuleID      
inner join Menu as Me2 on PD.MenuID = Me2.MenuID                          
WHERE RoleId= @RoleID and Page.Active =1             
group by Me2.MenuName,Me2.MenuIcon,Page.PageName,Page.PageUrl,Page.PageIcon,Me2.MenuSortedID,Page.PageSortedID  order by Me2.MenuSortedID,Page.PageSortedID    
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetModuleRights]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_GetModuleRights]                    
@RoleID int                  
AS                    
BEGIN                                  
   SELECT RoleID, ModuleID, Can_View, Can_Insert, Can_Update, Can_Delete         
   FROM ModulePermission Where RoleID = @RoleID                                                          
End
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetPagePermissionPages]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_GetPagePermissionPages]                      
@RoleID int                       
AS                      
BEGIN                                          
SELECT PD.ModuleID,URP.RoleID,URP.PageID,URP.Can_View,URP.Can_Insert,URP.Can_Update,URP.Can_Delete,URP.Active,P.PageUrl,M.ModuleName                    
FROM UserRolePermission as URP                      
inner join Page as P ON P.PageID=URP.PageID      
inner join PageDetails as PD ON PD.PageID=P.PageID      
inner join Module as M on PD.ModuleID = M.ModuleID                            
WHERE URP.RoleID= @RoleID and P.Active =1               
group by URP.RoleID,URP.PageID,URP.Can_View,URP.Can_Insert,URP.Can_Insert,URP.Can_Update,URP.Can_Delete,URP.Active,    
P.PageUrl,M.ModuleName,PD.ModuleID                                                                             
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetRidersList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_GetRidersList]
@RiderID int
as begin
select * from Riders
where RiderID = @RiderID or @RiderID is null
end





GO
/****** Object:  StoredProcedure [dbo].[SP_GetSaleAgainstSN]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[SP_GetSaleAgainstSN] 
 @SaleNo int 
 as
 begin 
select s.SaleNo,i.Name , s.Quantity, s.SalesRate, (SalesRate * Quantity) as Total
 from Sales s
inner join Items i on s.ItemID = i.ItemID
where SaleNo = @SaleNo 
 end 








GO
/****** Object:  StoredProcedure [dbo].[SP_GetSalePaymentList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetSalePaymentList]--  -5,1      
@InvoiceNo int,
@CustomerID varchar(100)    
as        
begin        
select sp.*,c.Name as CustomerName from [dbo].[SalePayment] sp
inner join [dbo].[Customer] c on c.CustomerID =sp.CustomerID
Where (sp.InvoiceNo=@InvoiceNo or  @InvoiceNo is null) and sp.InvoiceNo<0 and (sp.CustomerID=@CustomerID or @CustomerID is null)


end











GO
/****** Object:  StoredProcedure [dbo].[SP_GetSaleRates]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetSaleRates] 
@ItemID int
as
begin 
select SaleRate from Items
where ItemID = @ItemID 
end 






GO
/****** Object:  StoredProcedure [dbo].[SP_GetSalesBySalesNo]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetSalesBySalesNo] --21
@SaleNo int
as
begin
select s.SalesID,s.SaleNo, i.Name, s.Quantity, s.SalesRate, (s.Quantity * s.SalesRate) as TotalAmount
from Sales s
inner join Items i on s.ItemID = i.ItemID
where IsPaid = 1 and SaleNo = @SaleNo
end


GO
/****** Object:  StoredProcedure [dbo].[SP_GetSalesListBySaleID]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetSalesListBySaleID]
@SalesID int 
as 
begin 
select  s.SalesID,s.SaleNo, i.Name, s.Quantity, s.SalesRate, (s.Quantity * s.SalesRate) as TotalAmount
from Sales s
inner join Items i on s.ItemID = i.ItemID
where IsPaid = 1 and SalesID = @SalesID
end 


GO
/****** Object:  StoredProcedure [dbo].[SP_GetSalesListBySearch]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetSalesListBySearch] --null,'2020-08-21',null
@SaleNo varchar(50),
@SaleDate  datetime,
@OrderType varchar(50)
as 
begin
select 
case when s.IsPaid = 1 then 'Paid' else 'UnPaid' end Status
,s.SaleNo,(select top(1) CreatedDate from Sales where Sales.SaleNo = s.SaleNo) as SaleDate, SUM(SalesRate * Quantity) as TotalAmount, s.Discount,
 (SUM(SalesRate * Quantity) - Discount) as NetAmount, case when s.TableID is not null then 'Dining' when s.RiderID is not null then 'Delivery' else 'Take Away' end as OrderType
 from Sales s where 
 (S.SaleNo = @SaleNo or @SaleNo is null)
 and ((case when s.TableID is not null then 'Dining' when s.RiderID is not null then 'Delivery' else 'Take Away' end) like '%'+@OrderType+'%' or @OrderType is null)
 and (((select top(1) CreatedDate from Sales where Sales.SaleNo = s.SaleNo) = @SaleDate) or (@SaleDate  is null or @SaleDate is null))

 group by SaleNo,Discount,TableID,RiderID,IsPaid order by  s.SaleNo desc
 end 



GO
/****** Object:  StoredProcedure [dbo].[SP_GetSalesListBySearcsh]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetSalesListBySearcsh] --null,'2020-08-21',null
@SaleNo varchar(50),
@SaleDate  datetime,
@OrderType varchar(50)
as 
begin
select 
case when s.IsPaid = 1 then 'Paid' else 'UnPaid' end Status
,s.SaleNo,(select top(1) CreatedDate from Sales where Sales.SaleNo = s.SaleNo) as SaleDate, SUM(SalesRate * Quantity) as TotalAmount, s.Discount,
 (SUM(SalesRate * Quantity) - Discount) as NetAmount, case when s.TableID is not null then 'Dining' when s.RiderID is not null then 'Delivery' else 'Take Away' end as OrderType
 from Sales s where 
 (S.SaleNo = @SaleNo or @SaleNo is null)
 and ((case when s.TableID is not null then 'Dining' when s.RiderID is not null then 'Delivery' else 'Take Away' end) like '%'+@OrderType+'%' or @OrderType is null)
 and (((select top(1) CreatedDate from Sales where Sales.SaleNo = s.SaleNo) = @SaleDate) or (@SaleDate  is null or @SaleDate is null))

 group by SaleNo,Discount,TableID,RiderID,IsPaid order by  s.SaleNo desc
 end 



GO
/****** Object:  StoredProcedure [dbo].[SP_GetSalesReturnDetail]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_GetSalesReturnDetail] --'11/17/2020', '11/18/2020'
@Datefrom varchar(50),
@Dateto Varchar (50)
as 
begin
select sr.SaleNo, sr.CreatedDate, i.Name, sr.SalesRate, sr.Quantity, (sr.SalesRate * sr.Quantity) as Amount, 
sum(sr.SalesRate * sr.Quantity) as Total, sr.SaleDate from SalesReturnDetail sr 
inner join Items i on sr.ItemID = i.ItemID 
where sr.CreatedDate between @Datefrom and @Dateto 
group by sr.SaleNo, sr.CreatedDate, i.Name, sr.SalesRate, sr.Quantity, sr.SaleDate
order by sr.SaleDate asc
end 


GO
/****** Object:  StoredProcedure [dbo].[SP_GetSalesTempList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SP_GetSalesTempList] 
@UserID int 
as
begin 
select SalesTempID,Items.ItemID,Items.Name, s.SalesRate as Price, s.Quantity,  (SalesRate * Quantity) as Total from Salestemp s
inner join Items on s.ItemID = Items.ItemID 
where s.UserID = @UserID
end








GO
/****** Object:  StoredProcedure [dbo].[SP_GetShiftList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetShiftList]          
@ShiftID int    
as        
begin        
Select * from  [dbo].[Shift]          
Where ShiftID = @ShiftID or @ShiftID is null    
end


GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockInInfoEdit]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockInInfoEdit]                    
@ChallanNo bigint              
as                  
begin      

INSERT INTO [dbo].[StockInTemp]
           ([ChallanNo]
           ,[RefNo]
           ,[ChallanDate]
           ,[VendorID]
           ,[ItemID]
           ,[Price]
           ,[Stock]
           ,[CreatedDate]
           ,[CreatedBy])

     SELECT 
       [ChallanNo]
      ,[RefNo]
      ,[ChallanDate]
      ,[VendorID]
      ,[ItemID]
      ,[Price]
      ,[Stock]
      ,[CreatedDate]
      ,[CreatedBy]
  FROM [dbo].[StockIn] where ChallanNo = @ChallanNo

   SELECT 
      distinct [ChallanNo]
      ,[RefNo]
      ,[ChallanDate]
      ,[VendorID]
     
  FROM [dbo].[StockIn] where ChallanNo = @ChallanNo
            
end 















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockInList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockInList]                    
@StockInID int              
as                  
begin      
if(@StockInID is null)  
begin              
Select top(500) * from  StockIn O                     
Inner Join Vendors V on O.VendorID = V.VendorID           
Inner Join Items I on O.ItemID = I.ItemID           
Inner Join UnitOfMeasure U on U.UOMID = I.UOMID                
Where (StockInID = @StockInID or @StockInID is null) order by O.StockInID desc 
end  
else  
  begin              
Select * from  StockIn O                  
Inner Join Vendors V on O.VendorID = V.VendorID           
Inner Join Items I on O.ItemID = I.ItemID           
Inner Join UnitOfMeasure U on U.UOMID = I.UOMID                
Where    (StockInID = @StockInID or @StockInID is null) order by O.StockInID desc  
end            
end 















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockInListByDate]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockInListByDate]                  
@Date datetime,
@ChallanNo varchar(50)           
as                
begin                
Select * from  StockIn O                
Inner Join Vendors V on O.VendorID = V.VendorID         
Inner Join Items I on O.ItemID = I.ItemID         
Inner Join UnitOfMeasure U on U.UOMID = I.UOMID              
Where   O.CreatedDate >= @Date  and O.ChallanNo =  @ChallanNo       
end  















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockInListByDateTemp]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockInListByDateTemp]                  
@ChallanNo varchar(50)           
as                
begin                
Select StockInTempID,Name,UOM,Stock,Price, Stock * Price as Amount from  StockInTemp O                
Inner Join Vendors V on O.VendorID = V.VendorID         
Inner Join Items I on O.ItemID = I.ItemID         
Inner Join UnitOfMeasure U on U.UOMID = I.UOMID              
Where  O.ChallanNo =  @ChallanNo  order by    StockInTempID desc
end  















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockInListbySearch]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[SP_GetStockInListbySearch]             
@ChallanNo varchar(max),
@RefNo varchar(max),
@dtFrom varchar(30),   
@dtTo varchar(30),   
@Vendor varchar(max),   
@AmountFrom decimal(18,2),
@AmountTo decimal(18,2)     
as                
begin     

if(@ChallanNo is null and @RefNo is null and @dtFrom is null and @dtTo is null and @Vendor is null and @AmountFrom is null and @AmountTo is null)
Begin
Select  distinct top(500) ChallanNo,RefNo,ChallanDate,V.Company,InvoiceAmount from  StockIn O             
Inner Join Vendors V on O.VendorID = V.VendorID 
inner join PurchasePayment pp on pp.InvoiceNo =  O.ChallanNo and pp.VendorID = O.VendorID                   
Where  (O.ChallanNo = @ChallanNo or @ChallanNo is null) and (V.Company like '%'+@Vendor+'%' or @Vendor is null) 
and (O.RefNo = @RefNo or @RefNo is null) and  
((O.ChallanDate between @dtFrom  and  @dtTo) or (@dtFrom  is null or @dtTo is null)) and 
((pp.InvoiceAmount between @AmountFrom  and  @AmountTo) or (@AmountFrom  is null or @AmountTo is null)) order by ChallanNo desc
end
else
Begin
Select distinct ChallanNo,RefNo,ChallanDate,V.Company,InvoiceAmount from  StockIn O             
Inner Join Vendors V on O.VendorID = V.VendorID 
inner join PurchasePayment pp on pp.InvoiceNo =  O.ChallanNo and pp.VendorID = O.VendorID                   
Where  (O.ChallanNo = @ChallanNo or @ChallanNo is null) and (V.Company like '%'+@Vendor+'%' or @Vendor is null) 
and (O.RefNo = @RefNo or @RefNo is null) and  
((O.ChallanDate between @dtFrom  and  @dtTo) or (@dtFrom  is null or @dtTo is null)) and 
((pp.InvoiceAmount between @AmountFrom  and  @AmountTo) or (@AmountFrom  is null or @AmountTo is null)) order by ChallanNo desc
end
end 















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockInListChallan]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockInListChallan]                  
@ChallanNo varchar(50)           
as                
begin                
Select StockInID,Name,UOM,Stock,Price, Stock * Price as Amount from  StockIn O                
Inner Join Vendors V on O.VendorID = V.VendorID         
Inner Join Items I on O.ItemID = I.ItemID         
Inner Join UnitOfMeasure U on U.UOMID = I.UOMID              
Where  O.ChallanNo =  @ChallanNo  order by    StockInID asc
end  















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockInTempByID]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockInTempByID]                    
@StockInTempID bigint              
as                  
begin      

select * from StockInTemp where StockInTempID= @StockInTempID
            
end 















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockOutInfoEdit]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockOutInfoEdit]                    
@STONo bigint              
as                  
begin      

INSERT INTO [dbo].[StockOutTemp]
           ([StockOutNo]
           ,[StockOutDate]
           ,[CustomerID]
           ,[ItemID]
           ,[Rate]
           ,[Stock]
           ,[CreatedDate]
           ,[CreatedBy]
           ,[PurchasePrice])

     SELECT 
       [StockOutNo]
      ,[StockOutDate]
      ,[CustomerID]      
      ,[ItemID]
      ,[Rate]
      ,[Stock]
      ,[CreatedDate]
      ,[CreatedBy]
	  ,[PurchasePrice]
  FROM [dbo].[StockOut] where StockOutNo = @STONo


  declare @TrAmount decimal(18,2) 
  set @TrAmount = (select top(1) isnull(TransportationCharges,0) from SalePayment where InvoiceNo = @STONo)

   declare @PayAmount decimal(18,2) 
  set @PayAmount = (select top(1) isnull(PayAmount,0) from SalePayment where InvoiceNo = @STONo)

   SELECT 
      distinct [StockOutNo]
      ,[StockOutDate]
      ,[CustomerID]
      ,[ReferenceBy]
     , @TrAmount as TransportationCharges
	 , @PayAmount as PayAmount
  FROM [dbo].[StockOut] where StockOutNo = @STONo
            
end 















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockOutList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetStockOutList]              
@StockOutID int                
as                    
begin    
if(@StockOutID is null)   
begin                 
Select top(500) SO.StockOutID,SO.StockOutDate,SO.StockOutNo,SO.Stock,SO.Rate,I.Name,C.Name as CustomerName,C.BusinessName from  StockOut SO                      

Inner Join Customer C on C.CustomerID = SO.CustomerID             
Inner Join Items I on SO.ItemID = I.ItemID             
Inner Join UnitOfMeasure U on U.UOMID = I.UOMID                  
Where  (StockOutID = @StockOutID or @StockOutID is null)   order by  SO.StockOutNo desc   
end  
else  
    begin                 
Select  SO.StockOutID,SO.StockOutDate,SO.StockOutNo,SO.Stock,SO.Rate,I.Name,C.Name as CustomerName,C.BusinessName from  StockOut SO                      
Inner Join Customer C on C.CustomerID = SO.CustomerID             
Inner Join Items I on SO.ItemID = I.ItemID             
Inner Join UnitOfMeasure U on U.UOMID = I.UOMID                  
Where  (StockOutID = @StockOutID or @StockOutID is null)   order by  SO.StockOutNo desc    
end       
end















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockOutListByDate]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockOutListByDate]                      
@Date datetime ,
@User int               
as                    
begin                    
Select top(500) SO.StockOutID,SO.StockOutDate,SO.StockOutNo,SO.Stock,SO.Rate,I.Name,C.Name as CustomerName,C.BusinessName from  StockOut SO                      

Inner Join Customer C on C.CustomerID = SO.CustomerID             
Inner Join Items I on SO.ItemID = I.ItemID             
Inner Join UnitOfMeasure U on U.UOMID = I.UOMID                    
Where  SO.CreatedDate >= @Date  and SO.CreatedBy = @User           
end 















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockOutListbySearch]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetStockOutListbySearch]             
@STONo varchar(max),
@dtFrom varchar(30),   
@dtTo varchar(30),
@Customer varchar(max),      
@AmountFrom decimal(18,2),
@AmountTo decimal(18,2),
@Status varchar(max)
as                
begin     

if(@STONo is null and @dtFrom is null and @dtTo is null and @Customer is null and @AmountFrom is null and @AmountTo is null)
Begin
Select  distinct top(500) StockOutNo,StockOutDate,V.Name,InvoiceAmount + TransportationCharges as InvoiceAmount,
case when pp.IsPaid= 1 then 'Paid' else 'UnPaid' end as [Status],pp.IsPaid

 from  StockOut O             
Inner Join Customer V on O.CustomerID = V.CustomerID 
inner join SalePayment pp on pp.InvoiceNo =  O.StockOutNo and pp.CustomerID = O.CustomerID                   
Where  (O.StockOutNo = @STONo or @STONo is null) and (V.Name like '%'+@Customer+'%' or @Customer is null) and  
((O.StockOutDate between @dtFrom  and  @dtTo) or (@dtFrom  is null or @dtTo is null)) and 
((pp.InvoiceAmount + TransportationCharges between @AmountFrom  and  @AmountTo) or (@AmountFrom  is null or @AmountTo is null))
and ((case when pp.IsPaid= 1 then 'Paid' else 'UnPaid' end) = @Status or @Status is null) order by StockOutNo desc
end
else
Begin
Select  distinct  StockOutNo,StockOutDate,V.Name,InvoiceAmount + TransportationCharges as InvoiceAmount,
case when pp.IsPaid= 1 then 'Paid' else 'UnPaid' end as [Status],pp.IsPaid from  StockOut O             
Inner Join Customer V on O.CustomerID = V.CustomerID 
inner join SalePayment pp on pp.InvoiceNo =  O.StockOutNo and pp.CustomerID = O.CustomerID                   
Where  (O.StockOutNo = @STONo or @STONo is null) and (V.Name like '%'+@Customer+'%' or @Customer is null) and  
((O.StockOutDate between @dtFrom  and  @dtTo) or (@dtFrom  is null or @dtTo is null)) and 
((pp.InvoiceAmount + TransportationCharges between @AmountFrom  and  @AmountTo) or (@AmountFrom  is null or @AmountTo is null))
and ((case when pp.IsPaid= 1 then 'Paid' else 'UnPaid' end) = @Status or @Status is null)
 order by StockOutNo desc
end
end 















GO
/****** Object:  StoredProcedure [dbo].[SP_getStockOutNo]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[SP_getStockOutNo]                      
               
as                    
begin             
            
select ISNULL(Max(StockOutNo),0) + 1 from StockOut   

delete from [dbo].[StockOutTemp]
end 
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockOutStoNo]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockOutStoNo]                  
@STONo varchar(50)           
as                
begin                
Select StockOutID,Name,UOM,Stock,O.Rate, O.Stock * O.Rate as Amount from  StockOut O                   
Inner Join Items I on O.ItemID = I.ItemID         
Inner Join UnitOfMeasure U on U.UOMID = I.UOMID              
Where  O.StockOutNo =  @STONo  order by    StockOutID asc
end  















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockOutTempByID]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockOutTempByID]                      
@StockOutTempID bigint             
as                    
begin                    
Select  * from  StockOutTemp SO                                                    
Where  SO.StockOutTempID = @StockOutTempID        
end 















GO
/****** Object:  StoredProcedure [dbo].[SP_GetStockOutTempListByDate]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetStockOutTempListByDate]                      
@STONo bigint             
as                    
begin                    
Select  SO.StockOutTempID,I.Name,UOM,SO.Stock,SO.Rate as Price,SO.Stock * SO.Rate  as Amount from  StockOutTemp SO                                 
Inner Join Items I on SO.ItemID = I.ItemID             
Inner Join UnitOfMeasure U on U.UOMID = I.UOMID                    
Where  SO.StockOutNo = @STONo    order by     SO.StockOutTempID desc
end 















GO
/****** Object:  StoredProcedure [dbo].[SP_GetTableList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetTableList]            
@TableID int    
as          
begin          
Select [Dining].Sort,TableID,TableName,Sort,Active,
ISNULL((select Top(1) 1 from Sales where Sales.TableID = [Dining].TableID and Sales.IsPaid = 0),0) as IsUse
 from [Dining]      
    
Where  (TableID = @TableID or @TableID is null) Order by [Dining].Sort asc
end 






GO
/****** Object:  StoredProcedure [dbo].[SP_GetTableListForDinein]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetTableListForDinein]            
@TableID int,
@UserID int      
as          
begin          
Select [Dining].Sort,TableID,TableName,Sort,Active,
ISNULL((select Top(1) 1 from Sales where Sales.TableID = [Dining].TableID and Sales.IsPaid = 0),0) as IsUse
 from [Dining]      
    
Where [Dining].Active=1 and (TableID = @TableID or @TableID is null) 
and ((select Top(1) CreatedBy from Sales where Sales.TableID = [Dining].TableID and Sales.IsPaid = 0) = @UserID or (select Top(1) CreatedBy from Sales where Sales.TableID = [Dining].TableID and Sales.IsPaid = 0) is null) Order by [Dining].Sort asc
end 



GO
/****** Object:  StoredProcedure [dbo].[SP_GetTableSales]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[SP_GetTableSales]
@UserID int ,
@TableID int
as
begin 
select IsPrint,SaleNo,WaiterID,Discount,CashReceived as ReceivedAmount,SalesID,Items.ItemID,Items.Name, ts.SalesRate as Price, ts.Quantity,ts.CustomerID,c.Name as CustomerName, (SalesRate * Quantity) as Total from Sales ts
inner join Items on ts.ItemID = Items.ItemID 
inner join Customers c on ts.CustomerID = c.CustomerID
where ts.CreatedBy = @UserID and ts.TableID = @TableID and ts.IsPaid = 0 
end



GO
/****** Object:  StoredProcedure [dbo].[SP_GetTableSalesList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetTableSalesList] 
@UserID int ,
@SalesID int
as
begin 
select SalesID,Items.ItemID,Items.Name, ts.SalesRate as Price, ts.Quantity,  (SalesRate * Quantity) as Total from Sales ts
inner join Items on ts.ItemID = Items.ItemID 
where ts.CreatedBy = @UserID and SalesID = @SalesID
end









GO
/****** Object:  StoredProcedure [dbo].[SP_GetTaxPercent]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetTaxPercent]
as 
begin 
select concat(c.TaxName, ' ',' ' , c.TaxPercentage ,' ',' % ') as TaxNamePercent, c.TaxPercentage, c.TaxName   from company c
end


GO
/****** Object:  StoredProcedure [dbo].[SP_GetTempSalesFlavorListEdit]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetTempSalesFlavorListEdit] --1,134
@UserID int ,
@SalesTempID int
as
begin 
select s.SalesTempID,s.ItemID,f.FlavorName,s.FlavorID,s.Quantity from SalesItemFlavorTemp s 
inner join Flavor f on f.FlavorID = s.FlavorID
where s.UserID = @UserID and SalesTempID = @SalesTempID
end




GO
/****** Object:  StoredProcedure [dbo].[SP_GetTempSalesList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetTempSalesList] 
@UserID int 
as
begin 
select SalesTempID,Items.ItemID,Items.Name, s.SalesRate as Price, s.Quantity,  (SalesRate * Quantity) as Total from Salestemp s
inner join Items on s.ItemID = Items.ItemID 
where s.UserID = @UserID
end



GO
/****** Object:  StoredProcedure [dbo].[SP_GetTempSalesListEdit]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetTempSalesListEdit] 
@UserID int ,
@SalesTempID int
as
begin 
select SalesTempID,Items.ItemID,Items.Name, s.SalesRate as Price, s.Quantity,  (SalesRate * Quantity) as Total from Salestemp s
inner join Items on s.ItemID = Items.ItemID 
where s.UserID = @UserID and SalesTempID = @SalesTempID
end








GO
/****** Object:  StoredProcedure [dbo].[SP_GetUOM]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_GetUOM]        
 @UOMID int 
          
AS        
BEGIN        
 SET NOCOUNT ON;        

  Select * from  UnitOfMeasure where (UOMID = @UOMID or @UOMID is null)    
 
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserByUserName]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetUserByUserName] --null     
@UserName varchar(50)      
as      
begin      
Select C.VirtualKeyboard,C.CompanyID,U.RoleID,U.UserID,C.IsTax, C.TaxName, C.TaxPercentage, C.CompanyName,C.EmailAddress as CompanyEmail,C.PhoneNo as CompanyPhone,R.RoleName,R.[Status] as RoleStatus,  
c.PicName, c.PicPath, c.PicGuid,  c.Address as CompanyAddress,
U.Name,U.UserName,U.[Password],U.Email as UserEmail,U.[Status] as UserStatus , C.PrintForKitchen, C.EnableTakeAwayOnSale, C.EnableDeliveryOnSale, C.EnableDineInnOnSale     
from [User] as U      
inner join [Role] as R on U.RoleID = R.RoleID        
inner join [Company] as C on R.CompanyID = C.CompanyID      
Where UserName = @UserName      
end


GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetUserList]        
@UserID int  
as      
begin      
Select * from  [User] U    
Inner Join [Role] R on U.RoleID = R.RoleID    
Where U.UserID = @UserID or @UserID is null  
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_getVendorBalance]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_getVendorBalance]                      
@VendorID int              
as                    
begin             
            
select ISNULL(SUM([InvoiceAmount]),0) - ISNULL(SUM([PayAmount]),0) from [dbo].[PurchasePayment] where [VendorID] = @VendorID
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_getVendorBalanceforEdit]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_getVendorBalanceforEdit]                      
@VendorID int,
@ChallanNo bigint              
as                    
begin             
            
select ISNULL(SUM([InvoiceAmount]),0) - ISNULL(SUM([PayAmount]),0) from [dbo].[PurchasePayment] where [VendorID] = @VendorID and InvoiceNo < @ChallanNo
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_GetVendorList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetVendorList]          
@VendorID int    
as        
begin        
Select * from  [Vendors]            
Where VendorID = @VendorID or @VendorID is null    
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_GetWaiterList]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetWaiterList]          
@WaiterID int    
as        
begin        
Select * from  [Waiters]          
Where WaiterID = @WaiterID or @WaiterID is null 
end



GO
/****** Object:  StoredProcedure [dbo].[SP_HighestCustomerProfitReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_HighestCustomerProfitReport] --null,null,null,null,null,null,0

@FromDate datetime  ,
@TODate datetime  ,
@CategoryID int ,
@ItemID int ,
@CustomerID int,
@CustomerCategoryID int,
@Sale bit
as          
begin         

if(@Sale=1)
begin
select  ROW_NUMBER() OVER(ORDER BY c.Name ASC) as SrNo,c.Name as Customer,SUM(sn.Rate * sn.Stock) as Sale,
( SUM(sn.Rate * sn.Stock) - SUM(sn.PurchasePrice * sn.Stock)) as Profit
 from  StockOut  sn 
inner Join Customer c on c.CustomerID=SN.CustomerID 
inner join CustomerCategory cc on cc.[CustomerCategoryID]=c.[CustomerCategoryID]
inner join Items i on i.[ItemID]=sn.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where (cc.[CustomerCategoryID]=@CustomerCategoryID or @CustomerCategoryID is null) and (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( SN.ItemID=@ItemID Or @ItemID is null )and (SN.CustomerID=@CustomerID or @CustomerID is null)
and ((StockOutDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
 group by c.Name order by Sale desc
 end
 else
 begin

 select  ROW_NUMBER() OVER(ORDER BY c.Name ASC) as SrNo,c.Name as Customer,SUM(sn.Rate * sn.Stock) as Sale,
( SUM(sn.Rate * sn.Stock) - SUM(sn.PurchasePrice * sn.Stock)) as Profit
 from  StockOut  sn 
inner Join Customer c on c.CustomerID=SN.CustomerID 
inner join CustomerCategory cc on cc.[CustomerCategoryID]=c.[CustomerCategoryID]
inner join Items i on i.[ItemID]=sn.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where (cc.[CustomerCategoryID]=@CustomerCategoryID or @CustomerCategoryID is null) and (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( SN.ItemID=@ItemID Or @ItemID is null )and (SN.CustomerID=@CustomerID or @CustomerID is null)
and ((StockOutDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
 group by c.Name order by Profit desc
	 end
	 
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_HighestCustomerSaleReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_HighestCustomerSaleReport] --null,null,null,null,null,null,1

@FromDate datetime  ,
@TODate datetime  ,
@CategoryID int ,
@ItemID int ,
@CustomerID int,
@CustomerCategoryID int,
@Qty bit
as          
begin         

if(@Qty=1)
begin
select  ROW_NUMBER() OVER(ORDER BY c.Name ASC) as SrNo,c.Name as Customer,SUM(sn.Rate * sn.Stock) as Sale,
SUM(sn.Stock) as Qty
 from  StockOut  sn 
inner Join Customer c on c.CustomerID=SN.CustomerID 
inner join CustomerCategory cc on cc.[CustomerCategoryID]=c.[CustomerCategoryID]
inner join Items i on i.[ItemID]=sn.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where (cc.[CustomerCategoryID]=@CustomerCategoryID or @CustomerCategoryID is null) and (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( SN.ItemID=@ItemID Or @ItemID is null )and (SN.CustomerID=@CustomerID or @CustomerID is null)
and ((StockOutDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
 group by c.Name order by Qty desc
 end
 else
 begin

 select  ROW_NUMBER() OVER(ORDER BY c.Name ASC) as SrNo,c.Name as Customer,SUM(sn.Rate * sn.Stock) as Sale,
SUM(sn.Stock) as Qty
 from  StockOut  sn 
inner Join Customer c on c.CustomerID=SN.CustomerID 
inner join CustomerCategory cc on cc.[CustomerCategoryID]=c.[CustomerCategoryID]
inner join Items i on i.[ItemID]=sn.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where (cc.[CustomerCategoryID]=@CustomerCategoryID or @CustomerCategoryID is null) and (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( SN.ItemID=@ItemID Or @ItemID is null )and (SN.CustomerID=@CustomerID or @CustomerID is null)
and ((StockOutDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
 group by c.Name order by Sale desc
	 end
	 
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_HighestItemProfitReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_HighestItemProfitReport] --null,null,null,null,0

@FromDate datetime  ,
@TODate datetime  ,
@CategoryID int ,
@ItemID int ,
@Quantity int
as          
begin         

if(@Quantity = 1)
begin
select  ROW_NUMBER() OVER(ORDER BY i.Name ASC) as SrNo, i.Name as Item,SUM(s.SalesRate * s.Quantity) as Sale,
( SUM(s.SalesRate * s.Quantity) - SUM(s.PurchaseRate * s.Quantity)) as Profit
 from  Sales  s 

inner join Items i on i.[ItemID] = s.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where s.IsPaid=1 and (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( s.ItemID=@ItemID Or @ItemID is null )
and ((s.CreatedDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
 group by i.Name order by Sale desc
 end
 else
 begin

 select ROW_NUMBER() OVER(ORDER BY i.Name ASC) as SrNo, i.Name as Item,SUM(s.SalesRate * s.Quantity) as Sale,
( SUM(s.SalesRate * s.Quantity) - SUM(s.PurchaseRate * s.Quantity)) as Profit
 from  Sales  s 

inner join Items i on i.[ItemID]=s.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where s.IsPaid=1 and (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( s.ItemID=@ItemID Or @ItemID is null )
and ((s.CreatedDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
 group by i.Name order by Profit desc
	 end
	 
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_HighestItemSaleReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_HighestItemSaleReport] --null,null,null,null,0
@FromDate datetime  ,
@TODate datetime  ,
@CategoryID int ,
@ItemID int  ,
@Quantity int
as 
begin         

if(@Quantity = 1)         
begin          
select  ROW_NUMBER() OVER(ORDER BY i.Name ASC) as SrNo,  i.Name as Item, sum(s.Quantity) as SaleQuantity ,
SUM(s.SalesRate * s.Quantity) as Sale 
from Sales s
inner join Items i on i.[ItemID]= s.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where s.IsPaid=1 and (ic.CategoryID=@CategoryID or @CategoryID is null) and ( s.ItemID=@ItemID Or @ItemID is null )
and ((s.CreatedDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
group by i.Name 
order by SaleQuantity desc
end
else
begin

select  ROW_NUMBER() OVER(ORDER BY i.Name ASC) as SrNo,  i.Name as Item, sum(s.Quantity) as SaleQuantity ,
SUM(s.SalesRate * s.Quantity) as Sale 
from Sales s
inner join Items i on i.[ItemID]= s.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where s.IsPaid=1 and (ic.CategoryID=@CategoryID or @CategoryID is null) and ( s.ItemID=@ItemID Or @ItemID is null )
and ((s.CreatedDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
group by i.Name 
order by Sale desc

end 
end 	 
	 









GO
/****** Object:  StoredProcedure [dbo].[SP_InsertFinalSales]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertFinalSales] 
 @UserID int,
 @Discount decimal(18,2),
 @CashReceived decimal(18,2),
 @DeliveryCharges decimal(18,2),
 @RiderID int,
 @IsPaid bit,
 @PaidBy int,
 @PaidDate datetime,
 @ShiftID int,
 @CustomerID int,
 @TaxPercentage decimal,
 @TaxName varchar(50),
 @FlavorID int
AS        
BEGIN        
 SET NOCOUNT ON;   
 
 
  BEGIN TRY 
      
  declare @SaleNo int
  --declare @CustomerID int
 set @SaleNo = (select (ISNULL(MAX(SaleNo),0) + 1) from [Sales])
 --set @CustomerID = (select (ISNULL(MAX(CustomerID), 0) + 1) from Customers)
 DECLARE @SalesTempID int
 DECLARE sales_cursor CURSOR FOR     
SELECT 
      
      [SalesTempID]
	   
  FROM [dbo].[Salestemp]  
   where [UserID]  = @UserID  
  
OPEN sales_cursor    
  
FETCH NEXT FROM sales_cursor     
INTO @SalesTempID       
  
WHILE @@FETCH_STATUS = 0    
BEGIN    

 INSERT INTO [dbo].[Sales] 
SELECT 
      
       [ItemID]
	    ,[SalesRate]
       ,[Quantity]
       ,Discount = @Discount
      ,[PurchaseRate]
	  ,getdate()	  
	   ,[UserID]
	   ,null,null
	   ,@SaleNo
	   ,@CashReceived
	   ,null
	   ,IsPaid=@IsPaid
	   ,null
	   ,RiderID = @RiderID
	   ,1,DeliveryCharges=@DeliveryCharges,@PaidBy,@PaidDate,  
	    @ShiftID, 
	    @CustomerID,
		TaxPercentage = @TaxPercentage,
		TaxName = @TaxName,
		FlavorID =@FlavorID
	   
  FROM [dbo].[Salestemp]  
   where SalesTempID  = @SalesTempID

   declare @SalesID int

   set @SalesID = IDENT_CURRENT('Sales')

   Insert into SalesItemFlavor
   SELECT 
       [SalesID] = @SalesID
      ,[ItemID]
      ,[FlavorID]
      ,[Quantity]
	  ,[UserID]
  FROM [SalesItemFlavorTemp] where SalesTempID  = @SalesTempID


    FETCH NEXT FROM sales_cursor     
INTO @SalesTempID
   
END     
CLOSE sales_cursor;    
DEALLOCATE sales_cursor;   

  delete from [dbo].[Salestemp]  where [UserID]  = @UserID
  delete from [dbo].SalesItemFlavorTemp  where [UserID]  = @UserID
   select @SaleNo
 
 END TRY 
 BEGIN CATCH 
 SET @SaleNo=0; 
 END CATCH 


 END

          






		 


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertFlavorAgainstCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_InsertFlavorAgainstCategory]
@CategoryID int,
@FlavorID int 
as 
begin 
set nocount on 
 --set @CategoryID = (select (ISNULL(MAX(CategoryID),0) + 1) from [ItemCategory])
 IF (@CategoryID = 0)
 select CategoryID from Items  
 insert into CategoryFlavorMapping
 (
 [CategoryID] 
 ,[FlavorID]
 )
 Values
 (
 @CategoryID
 ,@FlavorID
 )

 end 






GO
/****** Object:  StoredProcedure [dbo].[SP_InsertFlavorAgainstItems]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[SP_InsertFlavorAgainstItems]
@ItemID int,
@FlavorID int ,
@ShowOnlyItemsFlavor bit
as 
begin 
set nocount on 
 --set @CategoryID = (select (ISNULL(MAX(CategoryID),0) + 1) from [ItemCategory])
 IF (@ItemID = 0)
 select ItemID from Items  
 insert into ItemsFlavorMapping
 (
 [ItemID] 
 ,[FlavorID]
 ,[ShowOnlyItemsFlavor]
 )
 Values
 (
 @ItemID
 ,@FlavorID
 ,@ShowOnlyItemsFlavor
 )

 end 


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertRole]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_InsertRole]  
@CompanyID int,
@RoleName varchar(50),      
@Description varchar(max),            
@Status bit,      
@CreatedDate datetime,      
@CreatedBy int    
as  
begin  
INSERT INTO [Role]      
([CompanyID],[RoleName],[Description],[Status],[CreatedDate],[CreatedBy])      
VALUES (@CompanyID,@RoleName,@Description,@Status,@CreatedDate,@CreatedBy)      
SELECT @@IDENTITY  
end
















GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertSalesItemFlavor]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_InsertSalesItemFlavor]
@SalesID int,
@ItemID int,
@FlavorID int ,
@Quantity decimal(18,2),
@UserID int
as
begin
set nocount on;
insert into SalesItemFlavor
(
[SalesID]
,[ItemID]
,[FlavorID]
,[Quantity]
,[UserID]
)
values 
(
@SalesID,@ItemID,@FlavorID,@Quantity,@UserID
)

end 


GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertSalesItemFlavorTemp]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_InsertSalesItemFlavorTemp]
@SalesTempID int,
@ItemID int,
@FlavorID int,
@Quantity decimal (18,2),
@UserID int
as
begin 
set nocount on;
Insert into SalesItemFlavorTemp
(SalesTempID,ItemID,FlavorID,Quantity,UserID)
values
(@SalesTempID,@ItemID,@FlavorID,@Quantity,@UserID)
end 



GO
/****** Object:  StoredProcedure [dbo].[SP_InsertStockIn]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertStockIn]                           
 @ChallanNo int,    
 @PayAmount decimal(18,2),           
 @Date datetime,            
 @User int
                      
AS                    
BEGIN                    
 SET NOCOUNT ON;                    
 BEGIN TRAN

BEGIN TRY

 declare @VendorID int
  declare @InvoiceDate datetime
   declare @InvoiceAmount decimal(18,2)

set @VendorID = (select top(1)VendorID from [dbo].[StockInTemp] where ChallanNo = @ChallanNo)
set @InvoiceDate = (select top(1)ChallanDate from [dbo].[StockInTemp] where ChallanNo = @ChallanNo)
set @InvoiceAmount = (select ISNULL(SUM(Price * Stock),0) from [dbo].[StockInTemp] where ChallanNo = @ChallanNo)

INSERT INTO [dbo].StockIn SELECT 
      [ChallanNo]
      ,[RefNo]
      ,[ChallanDate]
      ,[VendorID]
      ,[ItemID]
      ,[Price]
      ,[Stock]
      ,[CreatedDate]
      ,[CreatedBy]
  FROM [dbo].[StockInTemp] where ChallanNo = @ChallanNo

  
  INSERT INTO [dbo].[PurchasePayment]
           ([InvoiceNo]
           ,[VendorID]
           ,[InvoiceDate]
           ,[InvoiceAmount]
           ,[PayAmount]
           ,[Created]
           ,[CreatedBy])
     VALUES
           (@ChallanNo
           ,@VendorID
           ,@InvoiceDate
           ,@InvoiceAmount
           ,@PayAmount
           ,@Date
           ,@User)

         COMMIT TRAN
    SELECT '1';
END TRY
BEGIN CATCH

  ROLLBACK TRAN  
        SELECT '0';
END CATCH  
             
END 















GO
/****** Object:  StoredProcedure [dbo].[SP_InsertStockOut]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertStockOut]                           
 @StockOutNo bigint,    
 @PayAmount decimal(18,2),            
 @Date datetime,            
 @User int
                      
AS                    
BEGIN                    
 SET NOCOUNT ON;                    
 BEGIN TRAN

BEGIN TRY

 
  declare @InvoiceDate datetime
   declare @InvoiceAmount decimal(18,2)


set @InvoiceDate = (select top(1)StockOutDate from [dbo].[StockOutTemp] where StockOutNo = @StockOutNo)
set @InvoiceAmount = (select ISNULL(SUM(Rate * Stock),0) from [dbo].[StockOutTemp] where StockOutNo = @StockOutNo)

INSERT INTO [dbo].StockOut SELECT 
      [StockOutNo]     
      ,[StockOutDate]      
      ,[ItemID]
      ,[Rate]
      ,[Stock]
      ,[CreatedDate]
      ,[CreatedBy],[PurchasePrice]
  FROM [dbo].[StockOutTemp] where StockOutNo = @StockOutNo

  
  INSERT INTO [dbo].[SalePayment]
           ([InvoiceNo]           
           ,[InvoiceDate]
           ,[InvoiceAmount]		   
           ,[PayAmount]
           ,[Created]
           ,[CreatedBy])
     VALUES
           (@StockOutNo           
           ,@InvoiceDate
           ,@InvoiceAmount		  
           ,@PayAmount
           ,@Date
		   ,@User
           )

         COMMIT TRAN
    SELECT '1';
END TRY
BEGIN CATCH

  ROLLBACK TRAN  
        SELECT '0';
END CATCH  
             
END 















GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateCompany]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateCompany]           
 @CompanyID int,    
 @CompanyName varchar(200),  
 @PhoneNo varchar(100),
 @EmailAddress varchar(100),
 @Address varchar(500), 
 @Date datetime,  
 @User int,
 @PicName varchar(100),
 @PicGuid varchar(MAX),
 @PicPath varchar(MAX),
 @VirtualKeyboard bit,
 @PrintForKitchen bit,
 @IsTax bit,
 @TaxName varchar(50),
 @TaxPercentage decimal(18,2),
 @EnableTakeAwayOnSale bit,
 @EnableDeliveryOnSale bit,
 @EnableDineInnOnSale bit
AS          
BEGIN          
 SET NOCOUNT ON;          
 IF (@CompanyID = 0)  
 BEGIN  
 INSERT INTO [Company]  
           ([CompanyName] 
		   ,[PhoneNo] 
		   ,[EmailAddress]
		   ,[Address]
           ,[CreatedDate]  
           ,[CreatedBy]
		   ,[PicName]
		   ,[PicGuid]
		   ,[PicPath],[VirtualKeyboard],[PrintForKitchen],[IsTax],[TaxName],[TaxPercentage],[EnableTakeAwayOnSale],[EnableDeliveryOnSale],[EnableDineInnOnSale])  
             
     VALUES  
           (@CompanyName, @PhoneNo, @EmailAddress, @Address  
           ,@Date  
           ,@User
		   ,@PicName
		   ,@PicGuid
		   ,@PicPath,@VirtualKeyboard,@PrintForKitchen,@IsTax,@TaxName,@TaxPercentage,@EnableTakeAwayOnSale,@EnableDeliveryOnSale,@EnableDineInnOnSale)  
             
             
 END  
 ELSE  
  BEGIN    
       
  UPDATE [Company]  
   SET [CompanyName] = @CompanyName   
	   ,[PhoneNo] = @PhoneNo
	   ,[EmailAddress] = @EmailAddress
	   ,[Address] = @Address  
      ,[UpdatedDate] = @Date  
      ,[UpdatedBy] = @User   
		,[PicName] = @PicName
		,[PicGuid] = @PicGuid
		,[PicPath] = @PicPath
		,[VirtualKeyboard] = @VirtualKeyboard
		,[PrintForKitchen] = @PrintForKitchen
		,[IsTax] = @IsTax
		,[TaxName] = @TaxName
		,[TaxPercentage] = @TaxPercentage
		,[EnableTakeAwayOnSale] = @EnableTakeAwayOnSale
		,[EnableDeliveryOnSale] = @EnableDeliveryOnSale
		,[EnableDineInnOnSale] = @EnableDineInnOnSale
				
 WHERE CompanyID = @CompanyID  
    
    
  END            
   
END  














GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateCompanyInfo]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_InsertUpdateCompanyInfo]         
 @CompanyID int,
 @Company varchar(100),
 @Date datetime,
 @User int           
AS        
BEGIN        
 SET NOCOUNT ON;        
 IF (@CompanyID = 0)
 BEGIN
 INSERT INTO [dbo].[CompanyInfo]
           ([Company]                  
           ,[CreateDate]
           ,[CreatedBy])
           
     VALUES
           (@Company             
           ,@Date
           ,@User)
           
           
 END
 ELSE
  BEGIN  
     
  UPDATE [dbo].[CompanyInfo]
   SET [Company] = @Company
       
      ,[UpdateDate] = @Date
      ,[UpdatedBy] = @User
 WHERE CompanyID = @CompanyID
  
  
  END          
 
END













GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateCustomer]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_InsertUpdateCustomer]            
			@CustomerID int      
		   ,@Name varchar(200)                      
           ,@PhoneNo varchar(20)                      
           ,@Address varchar(max)     		                       
           ,@Date datetime            
           ,@User int   
		   ,@Active bit		  
                    
AS            
BEGIN            
 SET NOCOUNT ON;            
 IF (@CustomerID = 0)           
  BEGIN            
  INSERT INTO [dbo].[Customers]      
           (
           [Name]                      
           ,[PhoneNo]              
           ,[Address] 
           ,[CreatedDate]      
           ,[CreatedBy]	
		   ,[Active]	       
           )      
     VALUES      
           (     
           @Name                    
           ,@PhoneNo                      
           ,@Address      
           ,@Date      
           ,@User
		   ,@Active		   
           )      
		   set @CustomerID = IDENT_CURRENT('Customers')    
		   select @CustomerID
  END     
 ELSE            
  BEGIN            
        
  UPDATE [dbo].[Customers]      
   SET 
      [Name] = @Name           
      ,[PhoneNo] = @PhoneNo         
      ,[Address] = @Address      
      ,[UpdateDate] = @Date      
      ,[UpdateBy] = @User 	
	  ,[Active] = @Active     
 WHERE CustomerID = @CustomerID      
        
  END     
    
END














GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateCustomerCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_InsertUpdateCustomerCategory]         
 @CustomerCategoryID int,
 @CategoryName varchar(100),
 @Date datetime,
 @User int           
AS        
BEGIN        
 SET NOCOUNT ON;        
 IF (@CustomerCategoryID = 0)
 BEGIN
 INSERT INTO [dbo].[CustomerCategory]
           ([CategoryName]
                  
           ,[CreatedDate]
           ,[CreatedBy])
           
     VALUES
           (@CategoryName
             
           ,@Date
           ,@User)
           
           
 END
 ELSE
  BEGIN  
     
  UPDATE [dbo].[CustomerCategory]
   SET [CategoryName] = @CategoryName
       
      ,[UpdatedDate] = @Date
      ,[UpdatedBy] = @User
 WHERE CustomerCategoryID = @CustomerCategoryID
  
  
  END          
 
END












GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateDealItems]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertUpdateDealItems]       
@DealID int,       
@Quantity int,
@ItemID int,
@Date datetime,  
@User int

              
AS                    
BEGIN                    
        INSERT INTO [dbo].[DealItem]
           ([DealID],[Quantity],[ItemID],[CreatedDate],[CreatedBy])
     VALUES
           (
		   @DealID,		   
          @Quantity,
		  @ItemID,
		  @Date,
		  @User
           )      
           
       
             
END 






GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdateExpense]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertUpdateExpense]
@expenseid int,
@expensetypeid int,
@discription varchar(250),
@amount decimal(18,2),
@expensedate date,
@userid int,
@date datetime
as
begin
if(@expenseid=0)
begin
insert into tblExpense
(ExpenseTypeID,Discription,amount,expensedate,createdby,CreatedDate)
values (@expensetypeid,@discription,@amount,@expensedate,@userid,@date)
end
else
begin
update tblExpense set
expensetypeid=@expensetypeid,
Discription=@discription,
Amount=@amount,
ExpenseDate=@expensedate,
UpdatedBy=@userid,
UpdatedDate=@date
where ExpenseID = @expenseid
end

end


GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdateExpenseType]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_InsertUpdateExpenseType]
@expensetypeid int,
@expensetype nvarchar(50),
@userid int,
@date datetime
as
begin
if(@expensetypeid=0)
begin
insert into tblExpenseType
(expensetype,CreatedBy,CreatedDate)
values (@expensetype,@userid,@date)
end
else
begin
update tblExpenseType set
ExpenseType=@expensetype,
UpdatedBy=@userid,
UpdatedDate=@date
where ExpenseTypeID=@expensetypeid
end

end


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateFlavor]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_InsertUpdateFlavor]           
 @FlavorID int,  
 @FlavorName varchar(100),
 @Sort int  ,
 @Date datetime,  
 @User int,
 @Active bit

AS          
BEGIN          
 SET NOCOUNT ON;          
 IF (@FlavorID = 0)  
 BEGIN  
 INSERT INTO [Flavor]  
           ([FlavorName]
           ,[CreateDate]  
           ,[CreatedBy],[Sort],[Active])  
             
     VALUES  
           (@FlavorName             		   
           ,@Date  
           ,@User,@Sort,@Active)   
             
 END  
 ELSE  
  BEGIN    
       
  UPDATE [Flavor]  
   SET [FlavorName] = @FlavorName            
      ,[UpdateDate] = @Date  
      ,[UpdateBy] = @User  	  
	  ,[Sort] = @Sort
	  ,[Active] = @Active
 		
 WHERE FlavorID = @FlavorID 
    
    
  END            
   
END  





GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateItemCategory]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_InsertUpdateItemCategory]         
 @CategoryID int,
 @CategoryName varchar(100),
 @Date datetime,
 @User int  ,
 @PicName varchar(MAX),
 @PicGuid varchar(100),
 @PicPath varchar(100)   ,
 @Sort int ,
 @Active bit     
AS        
BEGIN        
 SET NOCOUNT ON;        
 IF (@CategoryID = 0)
 BEGIN
 INSERT INTO [dbo].[ItemCategory]
           ([CategoryName]
                  
           ,[CreateDate]
           ,[CreatedBy],[PicName],[PicGuid],[PicPath],[Sort],[Active])
           
     VALUES
           (@CategoryName
             
           ,@Date
           ,@User
		   ,@PicName
		   ,@PicGuid
		   ,@PicPath
		   ,@Sort
		   ,@Active)
           
           
 END
 ELSE
  BEGIN  
     
  UPDATE [dbo].[ItemCategory]
   SET [CategoryName] = @CategoryName
       
      ,[UpdateDate] = @Date
      ,[UpdatedBy] = @User
	  ,[PicName] = @PicName
	  ,[PicGuid] = @PicGuid
	  ,[PicPath] = @PicPath
	  ,[Sort] = @Sort
	  ,[Active] = @Active
 WHERE CategoryID = @CategoryID

 if(@Active = 0)
 begin
 update Items set CategoryID = NULL where CategoryID = @CategoryID 

 end
  
  
  END          
 
END













GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateItems]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_InsertUpdateItems]           
 @ItemID int,  
 @Name varchar(200),  
 @Active bit,  
 @CategoryID int,
 @Date datetime,  
 @User int,
 @PurchaseRate decimal(18,2),
 @SaleRate decimal(18,2)  ,
 @PicName varchar(100),
 @PicGuid varchar(MAX),
 @PicPath varchar(MAX) ,
 @Sort int   ,
 @Type varchar(50)
AS          
BEGIN          
 SET NOCOUNT ON;          
 IF (@ItemID = 0)  
 BEGIN  
 INSERT INTO [Items]  
           ([Name]  
           ,[Active]  
		   ,[CategoryID]
           ,[CreatedDate]  
           ,[CreatedBy],[PurchaseRate],[SaleRate],[PicName],[PicGuid],[PicPath],[Sort],[Type])  
             
     VALUES  
           (@Name  
           ,@Active  
		   ,@CategoryID
           ,@Date  
           ,@User,@PurchaseRate,@SaleRate,@PicName,@PicGuid,@PicPath,@Sort,@Type)  
  
  select ident_current('Items')           
             
 END  
 ELSE  
  BEGIN    
       
  UPDATE [Items]  
   SET [Name] = @Name       
      ,[Active] = @Active  
      ,[UpdatedDate] = @Date  
      ,[UpdatedBy] = @User  
	  ,[CategoryID]=@CategoryID
	   ,[PurchaseRate] = @PurchaseRate  
	    ,[SaleRate] = @SaleRate 
		,[PicName] = @PicName
		,[PicGuid] = @PicGuid
		,[PicPath] = @PicPath
		,[Sort] = @Sort
		,[Type] = @Type
 		
 WHERE ItemID = @ItemID  
    
    
  END            
   
END  















GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateModulPermissionByRoleID]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateModulPermissionByRoleID]                    
 -- Add the parameters for the stored procedure here                    
   @ModulePermissionID int=0                    
   ,@RoleID int                    
   ,@ModuleID int                   
   ,@Can_View bit                   
   ,@Can_Insert bit                   
   ,@Can_Update bit                    
   ,@Can_Delete bit                   
   ,@Active tinyint                    
   ,@CreateBy int                   
   ,@CreateDate datetime                    
AS                   
BEGIN                   
 -- SET NOCOUNT ON added to prevent extra result sets from                    
 -- interfering with SELECT statements.                    
 SET NOCOUNT ON;                    
 if not exists(SELECT 1 FROM ModulePermission WHERE RoleID=@RoleID and ModuleID=@ModuleID)                    
  BEGIN                    
   INSERT INTO ModulePermission                   
        (RoleID                   
        ,ModuleID                    
        ,Can_View                    
        ,Can_Insert                    
        ,Can_Update                   
        ,Can_Delete                    
        ,Active                    
        ,CreatedBy                    
        ,CreatedDate)                    
     VALUES                    
        (@RoleID                
        ,@ModuleID                    
        ,@Can_View                    
        ,@Can_Insert                    
        ,@Can_Update                    
        ,@Can_Delete                    
        ,@Active                    
        ,@CreateBy                   
        ,@CreateDate)                    
  END                    
    ELSE                   
  BEGIN                  
   UPDATE ModulePermission                   
      SET RoleID = @RoleID                   
      ,ModuleID = @ModuleID                    
      ,Can_View = @Can_View                    
      ,Can_Insert = @Can_Insert                   
      ,Can_Update = @Can_Update                  
      ,Can_Delete = @Can_Delete                   
      ,Active = @Active                  
      ,UpdatedBy = @CreateBy                   
      ,UpdatedDate = @CreateDate                
    WHERE RoleID=@RoleID and ModuleID=@ModuleID                    
  END                    
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdatePagePermission]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdatePagePermission]              
-- Add the parameters for the stored procedure here              
@UserRolePermissionID int=0              
,@RoleID int                   
,@PageID int            
,@Can_View bit              
,@Can_Insert bit              
,@Can_Update bit              
,@Can_Delete bit              
,@Active tinyint              
,@CreatedBy int              
,@CreatedDate datetime              
AS              
    
BEGIN                    
   INSERT INTO UserRolePermission              
           (RoleID              
           ,PageID              
           ,Can_View              
           ,Can_Insert              
           ,Can_Update              
           ,Can_Delete              
           ,Active              
           ,CreatedBy             
           ,CreatedDate)              
     VALUES              
           (@RoleID             
           ,@PageID               
           ,@Can_View               
           ,@Can_Insert               
           ,@Can_Update               
           ,@Can_Delete                     
           ,@Active               
           ,@CreatedBy               
           ,@CreatedDate)                        
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateRiders]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateRiders]            
			@RiderID int      
		   ,@Name varchar(100)                      
           ,@PhoneNo varchar(100)
		   ,@CNIC varchar (100)                      
           ,@Address varchar(100)     		                  
           ,@Date datetime            
           ,@User int   
		   ,@Active bit
		  
AS            
BEGIN            
 SET NOCOUNT ON;            
 IF (@RiderID = 0)           
  BEGIN            
  INSERT INTO [dbo].[Riders]      
           (
           [Name]                     
           ,[PhoneNo]
		   ,[CNIC]             
           ,[Address] 
           ,[CreatedDate]      
           ,[CreatedBy]	
		   ,[Active]	       
           )      
     VALUES      
           (     
           @Name     
           ,@PhoneNo
		   ,@CNIC                        
           ,@Address      
           ,@Date      
           ,@User	
		   ,@Active	  
           )      
  END            
 ELSE            
  BEGIN            
        
  UPDATE [dbo].[Riders]      
   SET 
      [Name] = @Name         
      ,[PhoneNo] = @PhoneNo
	  ,[CNIC] = @CNIC            
      ,[Address] = @Address      
      ,[UpdatedDate] = @Date      
      ,[UpdatedBy] = @User 	
	  ,[Active] = @Active
 WHERE RiderID = @RiderID      
        
  END            
END






GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateSalePayment]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procEDURE [dbo].[SP_InsertUpdateSalePayment]-- 1,-3,'2018-05-10 00:00:00.000',0,0,2,1,'2018-05-10 00:00:00.000',1           
			@InvoiceNo int
			,@CustomerID int      
		   ,@InvoiceDate Datetime          
   
           ,@InvoiceAmount decimal(18,2)      
           ,@TransportationCharges decimal(18,2)    
           ,@PayAmount varchar(20)
           ,@IsPaid bit                           
           ,@Date datetime            
           ,@User int   
		      
                    
AS            
BEGIN            
 SET NOCOUNT ON;            
 IF  exists( select * from SalePayment where CustomerID=@CustomerID and InvoiceNo=@InvoiceNo)           
  BEGIN            
      
  UPDATE [dbo].[SalePayment]      
   SET 
       
      [InvoiceDate] = @InvoiceDate
      ,[InvoiceAmount] = @InvoiceAmount      
      ,[PayAmount] = @PayAmount      
      ,[TransportationCharges] = @TransportationCharges      
      ,[IsPaid] = @IsPaid      
          
      ,[UpdatedDate] = @Date      
      ,[UpdatedBy] = @User 
	  
 WHERE CustomerID = @CustomerID  and InvoiceNo=@InvoiceNo      
        
  END            
 ELSE            
  BEGIN            
  INSERT INTO [dbo].[SalePayment]      
           (
           [InvoiceNo]      
           ,[CustomerID]      
           ,[InvoiceDate]      
           ,[InvoiceAmount]      
           ,[TransportationCharges] 
           ,[PayAmount]      
           ,[IsPaid]   
            
           ,[Created]      
           ,[CreatedBy]
		      
           )      
     VALUES      
           (     
           @InvoiceNo     
           ,@CustomerID      
           ,@InvoiceDate      
           ,@InvoiceAmount      
           ,@TransportationCharges 
           ,@PayAmount     
           ,@IsPaid            
           ,@Date      
                 
           ,@User
		   
           )        
  END            
END













GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateSalestemp]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateSalestemp]           
 @SalesTempID int,  
 @UserID int,  
 @ItemID int,
 @Quantity int,
 @FlavorID int

AS          
BEGIN          
 SET NOCOUNT ON; 

 declare  @SalesRate decimal(18,2) 
 declare @PurchaseRate decimal (18,2) 

 set @SalesRate = (select top(1)SaleRate from Items Where ItemID = @ItemID)
 set @PurchaseRate = (select top(1)PurchaseRate from Items Where ItemID = @ItemID)
     
 IF (@SalesTempID = 0)  
 BEGIN  
 INSERT INTO [Salestemp]  
             ([UserID],[ItemID],[Quantity],[SalesRate],[PurchaseRate],[FlavorID])  
             
      VALUES  
             (@UserID,@ItemID,@Quantity,@SalesRate,@PurchaseRate,@FlavorID)  
             
		     set @SalesTempID = ident_current('Salestemp');
             
 END  
 ELSE  
  BEGIN    
       
  UPDATE [Salestemp]  
   SET [UserID] = @UserID 
      ,[ItemID] = @ItemID       
      ,[Quantity] = @Quantity  
      ,[SalesRate] = @SalesRate  
	  ,[PurchaseRate] = @PurchaseRate 
		
 WHERE SalesTempID = @SalesTempID  
    
END     
  
select SalesTempID=@SalesTempID      
   
END 


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateShift]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateShift]            
			@ShiftID int      
		   ,@Name varchar(100)                      
           ,@ShiftTimeFrom varchar(100)   
		   ,@ShiftTimeTo varchar(100)    		                       
           ,@Date datetime            
           ,@User int   
		   ,@Active bit		  
                    
AS            
BEGIN            
 SET NOCOUNT ON;            
 IF (@ShiftID = 0)           
  BEGIN            
  INSERT INTO  [dbo].[Shift]    
           (
           [Name]                      
           ,[ShiftTimeFrom]  
		   ,[ShiftTimeTo]      
           ,[CreatedDate]      
           ,[CreatedBy]	
		   ,[Active]	       
           )      
     VALUES      
           (     
           @Name                    
           ,@ShiftTimeFrom 
		   ,@ShiftTimeTo     
           ,@Date      
           ,@User
		   ,@Active		   
           )      
  END     
 ELSE            
  BEGIN            
        
  UPDATE  [dbo].[Shift]  
   SET 
       [Name] = @Name           
      ,[ShiftTimeFrom] = @ShiftTimeFrom
	  ,[ShiftTimeTo]   = @ShiftTimeTo
      ,[UpdatedDate] = @Date      
      ,[Updatedby] = @User 	
	  ,[Active] = @Active     
 WHERE ShiftID = @ShiftID     
        
  END     
    
END














GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateStockIn]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateStockIn]                           
 @ChallanNo varchar(50),          
 @ChallanDate datetime,                         
 @VendorID int,            
 @ItemID int,                 
 @Price decimal(18,3),            
 @Stock bigint,             
 @Date datetime,            
 @User int
                      
AS                    
BEGIN                    
 SET NOCOUNT ON;                    
            
 INSERT INTO [StockIn]          
           ([ChallanNo]          
           ,[ChallanDate]                  
           ,[VendorID]          
           ,[ItemID]       
           ,[Price]          
           ,[Stock]          
           ,[CreatedDate]          
           ,[CreatedBy]          
            
           )          
     VALUES          
           (@ChallanNo        
           ,@ChallanDate                  
           ,@VendorID          
           ,@ItemID         
           ,@Price          
           ,@Stock          
           ,@Date          
           ,@User        
           
          )          
           
    select SCOPE_IDENTITY()                
             
END 















GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateStockInTemp]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateStockInTemp]                           
 @StockInTempID bigint, 
 @ChallanNo int,    
 @RefNo Varchar(50),        
 @ChallanDate datetime,                         
 @VendorID int,            
 @ItemID int,                 
 @Price decimal(18,2),            
 @Stock decimal(18,1),             
 @Date datetime,            
 @User int
                      
AS                    
BEGIN                    
 SET NOCOUNT ON;                    
 IF(@StockInTempID = 0)
 Begin
 INSERT INTO [StockInTemp]          
           ([ChallanNo]     
		     ,[RefNo]     
           ,[ChallanDate]                  
           ,[VendorID]          
           ,[ItemID]       
           ,[Price]          
           ,[Stock]          
           ,[CreatedDate]          
           ,[CreatedBy]          
            
           )          
     VALUES          
           (@ChallanNo 
		   ,@RefNo        
           ,@ChallanDate                  
           ,@VendorID          
           ,@ItemID         
           ,@Price          
           ,@Stock          
           ,@Date          
           ,@User        
           
          )          
           
   end
   else
   begin
   
   UPDATE [dbo].[StockInTemp]
   SET [ChallanNo] = @ChallanNo
      ,[RefNo] = @RefNo
      ,[ChallanDate] = @ChallanDate
      ,[VendorID] = @VendorID
      ,[ItemID] = @ItemID
      ,[Price] = @Price
      ,[Stock] = @Stock
     
 WHERE StockInTempID = @StockInTempID


   end                
             
END 















GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateStockOutTemp]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertUpdateStockOutTemp]       
@StockOutTempID bigint,       
@StockOutNo bigint,   
@StockOutDate datetime,      
@ItemID int,    
@Rate decimal(18,2),         
@Stock decimal(18,1),        
@Date datetime,         
@User int,
@PurchasePrice decimal(18,2)                    
AS                    
BEGIN                    
 SET NOCOUNT ON;                    
            
   if(@StockOutTempID = 0)
   Begin
        INSERT INTO [dbo].[StockOutTemp]
           ([StockOutNo]
           ,[StockOutDate]
           ,[ItemID]
           ,[Rate]
           ,[Stock]
           ,[CreatedDate]
           ,[CreatedBy],[PurchasePrice])
     VALUES
           (@StockOutNo
           ,@StockOutDate
           ,@ItemID
           ,@Rate
           ,@Stock
           ,@Date
           ,@User,@PurchasePrice)      
           
          END 
		  else
		     Begin


			 UPDATE [dbo].[StockOutTemp]
   SET [StockOutNo] = @StockOutNo
      ,[StockOutDate] = @StockOutDate      
      ,[ItemID] = @ItemID
      ,[Rate] = @Rate
      ,[Stock] = @Stock
	  ,[PurchasePrice] = @PurchasePrice
     
 WHERE StockOutTempID = @StockOutTempID


END 
           
             
END 














GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateTable]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_InsertUpdateTable]           
 @TableID int,  
 @TableName varchar(100),
 @Sort int   ,
 @Date datetime,  
 @User int,
 @Active bit

AS          
BEGIN          
 SET NOCOUNT ON;          
 IF (@TableID = 0)  
 BEGIN  
 INSERT INTO [Dining]  
           ([TableName]
           ,[CreateDate]  
           ,[CreatedBy],[Sort],[Active])  
             
     VALUES  
           (@TableName             		   
           ,@Date  
           ,@User,@Sort,@Active)   
             
 END  
 ELSE  
  BEGIN    
       
  UPDATE [Dining]  
   SET [TableName] = @TableName            
      ,[UpdateDate] = @Date  
      ,[UpdateBy] = @User  	  
	  ,[Sort] = @Sort
	  ,[Active] = @Active
 		
 WHERE TableID = @TableID 
    
    
  END            
   
END  





GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateTable_Delivery_Sales]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateTable_Delivery_Sales]           
 @SaleID int,
 @ItemID int,
 @Quantity int, 
 @Discount decimal(18,2), 
 @UserID int, 
 @SaleNo int,
 @CashReceived decimal(18,2),
 @TableID int, 
 @WaiterID int,
 @IsPrint bit, 
 @FlavorID int,
 @ShiftID int,
 @CustomerID int,
 @TaxPercentage decimal(18,2),
 @TaxName varchar(50)
AS          
BEGIN          
 SET NOCOUNT ON; 

 declare  @SalesRate decimal(18,2) 
 declare @PurchaseRate decimal (18,2) 
   
 set @SalesRate = (select top(1)SaleRate from Items Where ItemID = @ItemID)
  set @PurchaseRate = (select top(1)PurchaseRate from Items Where ItemID = @ItemID)  
  if(@SaleNo = 0)
   BEGIN 
 set @SaleNo = (select (ISNULL(MAX(SaleNo),0) + 1) from [Sales])
 end
 
 IF (@SaleID = 0)  
 BEGIN  
 INSERT INTO [Sales]  
([ItemID],[SalesRate],[Quantity],[Discount],[PurchaseRate],[CreatedDate],[CreatedBy],[UpdatedDate],[UpdatedBy],[SaleNo],[CashReceived],[TableID],[IsPaid],[WaiterID],[IsPrint],[PaidBy],[PaidDate],[ShiftID],[CustomerID],[TaxPercentage],[TaxName])  
VALUES  
(@ItemID,@SalesRate,@Quantity,@Discount,@PurchaseRate,getdate(),@UserID,null,null,@SaleNo,@CashReceived,@TableID,0,@WaiterID,@IsPrint,null,null,@ShiftID,@CustomerID,@TaxPercentage,@TaxName) 
   
	IF (@FlavorID > 0) 
	BEGIN     
	Insert into [SalesItemFlavor] select  
       [SalesID] = @SaleID,
	   [ItemID],
	   [FlavorID] = @FlavorID,
	   [Quantity],
	   [CreatedBy] 
	   from [Sales] where SalesID = @SaleID	
	   END 
	    set @SaleID = IDENT_CURRENT('Sales')          
 END  
 ELSE  
  BEGIN   
       
  UPDATE [Sales]  
     SET 
       [ItemID] = @ItemID 
      ,[SalesRate] = @SalesRate      
      ,[Quantity] = @Quantity    
	  ,[PurchaseRate] = @PurchaseRate		
     WHERE SalesID = @SaleID 

END   
select SaleNo=@SaleNo,SalesID=@SaleID
END 




GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateUOM]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateUOM]         
 @UOMID int,
 @UOM varchar(50),
 @Date datetime,
 @User int           
AS        
BEGIN        
 SET NOCOUNT ON;        
 IF NOT EXISTS(SELECT 1 FROM UnitOfMeasure WHERE UOMID = @UOMID)
 BEGIN
 INSERT INTO [UnitOfMeasure]
           ([UOM]
           
           ,[CreateDate]
           ,[CreateBy])
           
     VALUES
           (@UOM
          
           ,@Date
           ,@User)
           
           
 END
 ELSE
  BEGIN  
     
  UPDATE [UnitOfMeasure]
   SET [UOM] = @UOM
     
      ,[UpdateDate] = @Date
      ,[UpdateBy] = @User
 WHERE UOMID = @UOMID
  
  
  END          
 
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateUser]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateUser]          
   @UserID int    
     ,@RoleID int    
     ,@Name varchar(50)         
           ,@UserName varchar(50)      
           ,@Password varchar(max)      
           ,@Phone varchar(20)      
           ,@Email varchar(50)     
           ,@Address varchar(200)                           
           ,@Status bit          
           ,@Date datetime          
           ,@User int          
                  
AS          
BEGIN          
 SET NOCOUNT ON;          
 IF (@UserID = 0)         
  BEGIN          
  INSERT INTO [dbo].[User]    
           ([RoleID]    
           ,[Name]    
           ,[UserName]    
           ,[Password]    
           ,[Address]    
           ,[Phone]    
           ,[Email]    
           ,[Status]    
           ,[CreatedDate]    
           ,[CreatedBy]    
           )    
     VALUES    
           (@RoleID    
           ,@Name    
           ,@UserName    
           ,@Password    
           ,@Address    
           ,@Phone    
           ,@Email    
           ,@Status    
           ,@Date    
           ,@User    
           )    
  END          
 ELSE          
  BEGIN          
      
  UPDATE [User]    
   SET [RoleID] = @RoleID    
      ,[Name] = @Name    
      ,[UserName] = @UserName    
      ,[Password] = @Password    
      ,[Address] = @Address    
      ,[Phone] = @Phone    
      ,[Email] = @Email    
      ,[Status] = @Status    
      ,[UpdatedDate] = @Date    
      ,[UpdatedBy] = @User    
 WHERE UserID = @UserID    
      
  END          
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateVendor]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateVendor]            
			@VendorID int      
		   ,@Company varchar(200)           
           ,@ContactPerson varchar(200)        
           ,@Landline varchar(20)        
           ,@Fax varchar(20)
           ,@Cell varchar(20)
           ,@Email varchar(50)  
           ,@City varchar(50)                
           ,@Address varchar(max)                                 
           ,@Date datetime            
           ,@User int            
                    
AS            
BEGIN            
 SET NOCOUNT ON;            
 IF (@VendorID = 0)           
  BEGIN            
  INSERT INTO [dbo].[Vendors]      
           ([Company]      
           ,[ContactPerson]      
           ,[Landline]      
           ,[Fax]      
           ,[Cell] 
           ,[EmailAddress]      
           ,[City]   
           ,[Address] 
           ,[CreatedDate]      
           ,[CreatedBy]      
           )      
     VALUES      
           (@Company      
           ,@ContactPerson      
           ,@Landline      
           ,@Fax      
           ,@Cell 
           ,@Email     
           ,@City            
           ,@Address      
           ,@Date      
           ,@User      
           )      
  END            
 ELSE            
  BEGIN            
        
  UPDATE [Vendors]      
   SET
       [Company] = @Company      
      ,[ContactPerson] = @ContactPerson      
      ,[Landline] = @Landline      
      ,[Fax] = @Fax      
      ,[Cell] = @Cell      
      ,[EmailAddress] = @Email      
      ,[City] = @City
      ,[Address] = @Address      
      ,[UpdatedDate] = @Date      
      ,[UpdatedBy] = @User      
 WHERE VendorID = @VendorID      
        
  END            
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUpdateWaiters]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_InsertUpdateWaiters]            
			@WaiterID int      
		   ,@Name varchar(100)                      
           ,@PhoneNo varchar(100)
		   ,@CNIC varchar (100)                      
           ,@Address varchar(100)     		                  
           ,@Date datetime            
           ,@User int   
		   ,@Active bit
		  
AS            
BEGIN            
 SET NOCOUNT ON;            
 IF (@WaiterID = 0)           
  BEGIN            
  INSERT INTO [dbo].[Waiters]      
           (
           [Name]                     
           ,[PhoneNo]
		   ,[CNIC]             
           ,[Address] 
           ,[CreatedDate]      
           ,[CreatedBy]	
		   ,[Active]	       
           )      
     VALUES      
           (     
           @Name     
           ,@PhoneNo
		   ,@CNIC                        
           ,@Address      
           ,@Date      
           ,@User
		   ,@Active		  
           )      
  END            
 ELSE            
  BEGIN            
        
  UPDATE [dbo].[Waiters]      
   SET 
      [Name] = @Name         
      ,[PhoneNo] = @PhoneNo
	  ,[CNIC] = @CNIC            
      ,[Address] = @Address      
      ,[UpdatedDate] = @Date      
      ,[UpdatedBy] = @User 	
	  ,[Active] = @Active 
 WHERE WaiterID = @WaiterID      
        
  END            
END






GO
/****** Object:  StoredProcedure [dbo].[SP_OrderBookerSaleReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_OrderBookerSaleReport] --null,null,null,null,null,null,94

@FromDate datetime  ,
@TODate datetime  ,
@CategoryID int ,
@ItemID int ,
@CustomerID int,
@CustomerCategoryID int,
@OrderBookerID int
as          
begin         

select  ROW_NUMBER() OVER(ORDER BY c.Name ASC) as SrNo,c.Name as Customer,SUM(sn.Rate * sn.Stock) as Sale,
( SUM(sn.Rate * sn.Stock) - SUM(sn.PurchasePrice * sn.Stock)) as Profit,sn.StockOutDate as Date,sn.StockOutNo as InvoiceNo
 from  StockOut  sn 
inner Join Customer c on c.CustomerID=SN.CustomerID 
inner join CustomerCategory cc on cc.[CustomerCategoryID]=c.[CustomerCategoryID]
inner join Items i on i.[ItemID]=sn.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where (cc.[CustomerCategoryID]=@CustomerCategoryID or @CustomerCategoryID is null) and (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( SN.ItemID=@ItemID Or @ItemID is null )and (SN.CustomerID=@CustomerID or @CustomerID is null)
and ((StockOutDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null)) and ReferenceBy = @OrderBookerID
 group by c.Name,StockOutDate,StockOutNo order by Sale desc
	 
end 












GO
/****** Object:  StoredProcedure [dbo].[SP_ProfitCustomerWiseReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_ProfitCustomerWiseReport] --null,null,null,null,null,null

@FromDate datetime  ,
@TODate datetime  ,
@CategoryID int ,
@ItemID int ,
@CustomerID int,
@CustomerCategoryID int
as          
begin         


select  ROW_NUMBER() OVER(ORDER BY c.Name ASC) as SrNo,c.Name as Customer,SUM(sn.Rate * sn.Stock) as Sale,
( SUM(sn.Rate * sn.Stock) - SUM(sn.PurchasePrice * sn.Stock)) as Profit
 from  StockOut  sn 
inner Join Customer c on c.CustomerID=SN.CustomerID 
inner join CustomerCategory cc on cc.[CustomerCategoryID]=c.[CustomerCategoryID]
inner join Items i on i.[ItemID]=sn.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where (cc.[CustomerCategoryID]=@CustomerCategoryID or @CustomerCategoryID is null) and (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( SN.ItemID=@ItemID Or @ItemID is null )and (SN.CustomerID=@CustomerID or @CustomerID is null)
and ((StockOutDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
 group by c.Name

	 
	 
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_ProfitDateWiseReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_ProfitDateWiseReport] --null,null,null,null

@FromDate datetime  ,
@TODate datetime  ,
@CategoryID int ,
@ItemID int 
as          
begin         


select  ROW_NUMBER() OVER(ORDER BY s.CreatedDate ASC) as SrNo,s.CreatedDate as Date,SUM(s.SalesRate * s.Quantity) as Sale,
( SUM(s.SalesRate * s.Quantity) - SUM(s.PurchaseRate * s.Quantity)) as Profit
 from  Sales  s
inner join Items i on i.[ItemID]= s.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where s.IsPaid=1 and (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( s.ItemID = @ItemID Or @ItemID is null )
and ((s.CreatedDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
 group by s.CreatedDate

	 
	 
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_ProfitMonthWiseReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_ProfitMonthWiseReport]-- null,null,null,null,null,null

@FromDate datetime  ,
@TODate datetime  ,
@CategoryID int ,
@ItemID int ,
@CustomerID int,
@CustomerCategoryID int
as          
begin         


select  ROW_NUMBER() OVER(ORDER BY DATENAME(MM, sn.StockOutDate)+ ' ' + DATENAME(YY, sn.StockOutDate) ASC) as SrNo,DATENAME(MM, sn.StockOutDate) + ' ' + DATENAME(YY, sn.StockOutDate)  as Date,SUM(sn.Rate * sn.Stock) as Sale,
( SUM(sn.Rate * sn.Stock) - SUM(sn.PurchasePrice * sn.Stock)) as Profit
 from  StockOut  sn 
inner Join Customer c on c.CustomerID=SN.CustomerID 
inner join CustomerCategory cc on cc.[CustomerCategoryID]=c.[CustomerCategoryID]
inner join Items i on i.[ItemID]=sn.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where (cc.[CustomerCategoryID]=@CustomerCategoryID or @CustomerCategoryID is null) and (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( SN.ItemID=@ItemID Or @ItemID is null )and (SN.CustomerID=@CustomerID or @CustomerID is null)
and ((StockOutDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
 group by DATENAME(MM, sn.StockOutDate)+ ' ' + DATENAME(YY, sn.StockOutDate)

	 
	 
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_PurchaseReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[SP_PurchaseReport]  --null ,null,null,null,null

@FromDate datetime  ,
@TODate datetime  ,
@CategoryID int ,
@ItemID int ,
@VendorID int 
as          
begin          

select ROW_NUMBER() OVER(ORDER BY SN.StockInID ASC) as SrNo,SN.ChallanNo as InvoiceNo,UOM.UOM,sn.Stock as PurchaseQuantity,sn.RefNo  ,sn.ChallanDate,sn.Price as Price,SN.ChallanNo ,i.Name as item,ic.[CategoryName] as Category,
V.Company as Supplier,Amount=cast (sn.Stock*sn.Price as float) from StockIN  sn
inner join Items i on i.[ItemID]=sn.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
inner Join Vendors v on v.VendorID=SN.[VendorID]
inner Join UnitOfMeasure UOM on UOM.UOMID=i.UOMID
where (ic.CategoryID=@CategoryID or @CategoryID is null) 
and ( SN.ItemID=@ItemID Or @ItemID is null ) and
 (SN.VendorID=@VendorID or @VendorID is null)
and ((ChallanDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))



	 
	 
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_SaleReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_SaleReport]-- null,null,null,null
@FromDate datetime  ,
@TODate datetime  ,
@CategoryID int ,
@ItemID int  
as          
begin          
select ROW_NUMBER() OVER(ORDER BY s.SalesID ASC) as SrNo, s.SalesID, s.CreatedDate as InvoiceDate,s.SaleNo as InvoiceNo,
 ic.[CategoryName] as Category, i.Name as Item,s.Quantity as SaleQuantity , s.PurchaseRate as PurchasePrice ,s.SalesRate as Price ,
 (s.SalesRate*s.Quantity ) as Amount ,((s.SalesRate - s.PurchaseRate) * s.Quantity) as Profit, sum(s.SalesRate*s.Quantity ) as Total
 ,'Paid' as [Status],(select SUM(ss.Quantity * ss.SalesRate) +(max(ISNULL(ss.DeliveryCharges,0)))- (max(ss.Discount)) from Sales ss where s.SaleNo = ss.SaleNo and ss.IsPaid = 1) as BillTotal,s.Discount,s.DeliveryCharges
 from Sales s

inner join Items i on i.[ItemID]= s.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
where s.IsPaid = 1 and (ic.CategoryID=@CategoryID or @CategoryID is null) and ( s.ItemID=@ItemID Or @ItemID is null )
and ((s.CreatedDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))
group by s.SalesID, s.CreatedDate, s.SaleNo,ic.CategoryName,i.Name,s.Quantity, s.PurchaseRate,s.Discount,s.DeliveryCharges
, s.SalesRate



	 
	 
end 


select * from Items









GO
/****** Object:  StoredProcedure [dbo].[SP_SalesFlavorDelete]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_SalesFlavorDelete]
@SalesID int,
@UserID int
as Begin 
set nocount on ;
delete from [dbo].[SalesItemFlavor] where [SalesID] = @SalesID and UserID = @UserID
end 



GO
/****** Object:  StoredProcedure [dbo].[SP_SalesTempDelete]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_SalesTempDelete]
@UserID int 
as Begin 
set nocount on ;
delete from Salestemp where UserID = @UserID
delete from [dbo].SalesItemFlavorTemp  where [UserID]  = @UserID
end 








GO
/****** Object:  StoredProcedure [dbo].[SP_ShiftNameForCash]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ShiftNameForCash]
@ShiftID int 
as
begin
select top(1)* from Shift
where ShiftID = @ShiftID or @ShiftID is null 
end




GO
/****** Object:  StoredProcedure [dbo].[SP_StockDetailReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_StockDetailReport] --null,null,null,null,null

@FromDate datetime  ,
@TODate datetime  ,
@ItemID int 
as          
begin          
select ROW_NUMBER() OVER(ORDER BY SN.StockOUtId ASC) as SrNo,StockOutDate as InvoiceDate,SN.StockOutNo as InvoiceNo,UOM.UOM 
 ,SN.Stock as SaleQuantity ,sn.Rate as Price ,i.Name as item,ic.[CategoryName] as Category,
C.Name as Customer ,Amount=cast (sn.Stock*sn.Rate as float),
(select TransportationCharges from SalePayment where InvoiceNo = SN.StockOutNo and CustomerID = c.CustomerID) as TransportationCharges,
 (select InvoiceAmount from SalePayment where InvoiceNo = SN.StockOutNo and CustomerID = c.CustomerID) as Total,
 (select InvoiceAmount from SalePayment where InvoiceNo = SN.StockOutNo and CustomerID = c.CustomerID)
  + (select TransportationCharges from SalePayment where InvoiceNo = SN.StockOutNo and CustomerID = c.CustomerID) as BillTotal,
(select case when IsPaid= 1 then 'Paid' else 'UnPaid' end from SalePayment where InvoiceNo = SN.StockOutNo and CustomerID = c.CustomerID) as [Status],
sn.PurchasePrice as PurchasePrice

  
 from StockOut  sn 
inner join Items i on i.[ItemID]=sn.ItemID
inner join ItemCategory ic on ic.[CategoryID]=i.[CategoryID]
inner Join Customer c on c.CustomerID=SN.CustomerID
inner Join UnitOfMeasure UOM on UOM.UOMID=i.UOMID
where ( SN.ItemID=@ItemID Or @ItemID is null ) 
and ((StockOutDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))



	 
	 
end 










GO
/****** Object:  StoredProcedure [dbo].[SP_StockDetailsReport]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_StockDetailsReport] 
@FromDate datetime  ,
@TODate datetime  ,
@ItemID int 
as          
begin          
 
 select 1 as Rowno,'-' as Item,'-' as Date,'-' as BillNo,
 (select isnull(sum(stock),0) from StockIn where  ItemID=@ItemID and (ChallanDate < @FromDate or @FromDate  is null)) - 
 (select isnull(sum(stock),0) from StockOut where  ItemID=@ItemID and (StockOutDate < @FromDate or @FromDate  is null))
   + (select ISNULL(SUM(Stock),0) from [dbo].[StockIn] where ItemID = @ItemID and 
 ((ChallanDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null)))  as Qty,
 (select ISNULL(SUM(Stock),0) from [dbo].[StockIn] where ItemID = @ItemID and 
 ((ChallanDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null))) as Purchase
 union 

select (ROW_NUMBER() OVER(ORDER BY so.[StockOutID] ASC)+1) as Rowno,I.Name as Item,Convert(varchar,StockOutDate,101) as Date,Convert(varchar,StockOutNo) as BillNo,Stock as Qty,

 0 as Purchase from [dbo].[StockOut] SO Inner join Items I On 
 SO.ItemID = I.ItemID where SO.ItemID = @ItemID and ((SO.StockOutDate between @FromDate  and  @TODate) or (@FromDate  is null or @TODate is null)) 

 order by Rowno asc
end 












GO
/****** Object:  StoredProcedure [dbo].[SP_STOGetStockInInfo]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procEDURE [dbo].[SP_STOGetStockInInfo]  
 @ItemID int              
AS              
BEGIN              
 SET NOCOUNT ON;        
        
  
    
    select StockInID,[IN] - [OUT] as Stock from 
(select ItemID, Stock as [IN],(select ISNULL(Sum(Stock),0) from stockout  where StockInID = I.StockInID) 
as [OUT],StockInID,I.ChallanDate,Price,VendorID from StockIn I

 ) t where t.ItemID = @ItemID And t.[IN] - t.[OUT] <> 0
  order by t.StockInID asc
    
      
      
END
















GO
/****** Object:  StoredProcedure [dbo].[SP_TempSalesFlavorDelete]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_TempSalesFlavorDelete]
@UserID int,
@SalesTempID int
as Begin 
set nocount on ;
delete from [dbo].SalesItemFlavorTemp  where [UserID]  = @UserID and [SalesTempID] = @SalesTempID
end 








GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCustomer]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_UpdateCustomer]
@TableID int,
@CustomerID int
as
begin
update Sales
set 
CustomerID = @CustomerID
where TableID = @TableID and IsPaid= 0
end 


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateDiscountReceived]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_UpdateDiscountReceived]
@TableID int,
@Discount decimal(18,2),
@ReceivedAmount decimal(18,2)
as 
begin
update Sales
set 
	[Discount] = @Discount
    ,[CashReceived] = @ReceivedAmount
where TableID = @TableID and IsPaid=0
end 





GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateDiscountReceivedDelivery]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[SP_UpdateDiscountReceivedDelivery]
@SaleNo int,
@Discount decimal(18,2),
@ReceivedAmount decimal(18,2)
as 
begin
update Sales
set 
	[Discount] = @Discount
    ,[CashReceived] = @ReceivedAmount
where SaleNo = @SaleNo and IsPaid=0
end 





GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateInvoiceStatus]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_UpdateInvoiceStatus]
@SaleNo int,
@PaidBy int,
@PaidDate datetime
as Begin 

update Sales 
set 
	IsPaid = 1,
	PaidBy = @PaidBy,
	PaidDate = @PaidDate
 where SaleNo = @SaleNo 
end 


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateIsPrint]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_UpdateIsPrint]
@SalesID int 
as
begin
update Sales set IsPrint = 1
where SalesID = @SalesID
end 


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateRider]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UpdateRider]
@SaleNo int,
@RiderID int
as 
begin
update Sales
set 
	RiderID = @RiderID
where SaleNo = @SaleNo and IsPaid=0
end 





GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateRole]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UpdateRole]  
@RoleID int,
@CompanyID int,
@RoleName varchar(50),      
@Description varchar(max),            
@Status bit,      
@UpdatedDate datetime,      
@UpdatedBy int    
as  
begin  
 UPDATE [Role]                   
      SET CompanyID = @CompanyID                    
      ,RoleName = @RoleName                    
      ,[Description] = @Description                   
      ,[Status] = @Status                  
      ,UpdatedDate = @UpdatedDate                   
      ,UpdatedBy = @UpdatedBy                                 
    WHERE RoleID=@RoleID
end
















GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateSalesReturn]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UpdateSalesReturn]
@SalesID int ,
@Quantity int,
@UserID int
as
begin

Insert into SalesReturnDetail
select 
SaleNo ,
ItemID ,
SalesRate, 
Quantity = Quantity - @Quantity, 
getdate(), 
CreatedBy = @UserID ,
CreatedDate
from Sales where SalesID = @SalesID 

update Sales 
set 
 [IsPaid] = 1
,[Quantity] = @Quantity
where SalesID = @SalesID 
end 




GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateSTOReturnPayment]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_UpdateSTOReturnPayment]          
 @InvoiceNo bigint,
 @ReturnAmount  decimal(18,2)
            
AS          
BEGIN          
 SET NOCOUNT ON;          
  
  declare @InvoiceAmount decimal(18,2)
  set @InvoiceAmount = (select ISNULL(Sum(Rate * Stock),0) from StockOut where StockOutNo = @InvoiceNo)
Update [dbo].[SalePayment] set PayAmount = (PayAmount - @ReturnAmount), InvoiceAmount = @InvoiceAmount  where InvoiceNo = @InvoiceNo
  
END  











GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateSTOReturnQty]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procEDURE [dbo].[SP_UpdateSTOReturnQty]          
 @StockOutID bigint,
 @ReturnQty  decimal(18,1)
            
AS          
BEGIN          
 SET NOCOUNT ON;          
  
Update [dbo].[StockOut] set Stock = (Stock - @ReturnQty)  where StockOutID = @StockOutID
 delete from [dbo].[StockOut]  where StockOutID = @StockOutID and Stock = 0
  
END  











GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateWaiter]    Script Date: 6/18/2021 2:25:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UpdateWaiter]
@TableID int,
@WaiterID int
as 
begin
update Sales
set 
	[WaiterID] = @WaiterID
where TableID = @TableID and IsPaid=0
end 





GO
