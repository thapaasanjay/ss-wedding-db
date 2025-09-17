SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RsvpGuests](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RsvpId] [bigint] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Relationship] [nvarchar](100) NULL,
	[Email] [nvarchar](256) NULL,
	[MealPreference] [tinyint] NULL,
	[MealNotes] [nvarchar](500) NULL,
	[CreatedUtc] [datetime2](0) NOT NULL,
	[UpdatedUtc] [datetime2](0) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RsvpGuests] ADD PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RsvpGuests] ADD  CONSTRAINT [DF_RsvpGuests_CreatedUtc]  DEFAULT (sysutcdatetime()) FOR [CreatedUtc]
GO
ALTER TABLE [dbo].[RsvpGuests] ADD  CONSTRAINT [DF_RsvpGuests_UpdatedUtc]  DEFAULT (sysutcdatetime()) FOR [UpdatedUtc]
GO
ALTER TABLE [dbo].[RsvpGuests]  WITH CHECK ADD  CONSTRAINT [FK_RsvpGuests_Rsvp] FOREIGN KEY([RsvpId])
REFERENCES [dbo].[Rsvps] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RsvpGuests] CHECK CONSTRAINT [FK_RsvpGuests_Rsvp]
GO
