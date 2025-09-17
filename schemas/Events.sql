SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartUtc] [datetime2](0) NULL,
	[EndUtc] [datetime2](0) NULL,
	[VenueName] [nvarchar](200) NOT NULL,
	[AddressLine1] [nvarchar](200) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [nvarchar](100) NOT NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[GoogleUrl] [nvarchar](600) NULL,
	[AppleUrl] [nvarchar](600) NULL,
	[RsvpDeadlineUtc] [datetime2](0) NULL,
	[CreatedUtc] [datetime2](0) NOT NULL,
	[UpdatedUtc] [datetime2](0) NOT NULL,
	[Type] [tinyint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Events] ADD PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Events_StartUtc] ON [dbo].[Events]
(
	[StartUtc] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_Events_CreatedUtc]  DEFAULT (sysutcdatetime()) FOR [CreatedUtc]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_Events_UpdatedUtc]  DEFAULT (sysutcdatetime()) FOR [UpdatedUtc]
GO
ALTER TABLE [dbo].[Events]  WITH NOCHECK ADD  CONSTRAINT [CK_Events_Type_Valid] CHECK  (([Type]=(7) OR [Type]=(6) OR [Type]=(5) OR [Type]=(4) OR [Type]=(3) OR [Type]=(2) OR [Type]=(1) OR [Type]=(0)))
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [CK_Events_Type_Valid]
GO

Insert into Events(Name, StartUtc, EndUtc, VenueName, 
AddressLine1, City, [State], PostalCode, Country, 
GoogleUrl, AppleUrl, RsvpDeadlineUtc, [Type])
VALUEs('Wedding Ceremony', '2025-12-05 10:00:00','2025-12-05 17:00:00', 
'Hidden Gardens Venue', '8229 Jacksboro Hwy', 'Lakeside', 'TX','76135','USA',
'https://maps.app.goo.gl/W5EwWLyNvJJZ5bgUA',
'https://maps.apple.com/?q=Hidden%20Gardens%20Venue%208229%20Jacksboro%20Hwy%20Lakeside%20TX%2076135',
'2025-10-20 23:59:59', 0);

Insert into Events(Name, StartUtc, EndUtc, VenueName, 
AddressLine1, City, [State], PostalCode, Country, 
GoogleUrl, AppleUrl, RsvpDeadlineUtc, [Type])
VALUES('Reception','2025-12-06 18:00:00','2025-12-06 23:00:00','Lakeview Event & Conference Center',
'1200 Viridian Park Ln Bldg A','Arlington','TX','76005', 'USA',
'https://maps.app.goo.gl/zdVJSZ8FKhkyaQCv7','https://maps.apple.com/?q=Lakeview%20Event%20%26%20Conference%20Center%20Arlington%20TX',
'2025-10-20 23:59:59', 1)