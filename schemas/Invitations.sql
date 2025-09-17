SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invitations](
	[GuestId] [bigint] NOT NULL,
	[EventId] [bigint] NOT NULL,
	[Invited] [bit] NOT NULL,
	[AllowedExtraGuests] [int] NOT NULL,
	[Notes] [nvarchar](500) NULL,
	[CreatedUtc] [datetime2](0) NOT NULL,
	[UpdatedUtc] [datetime2](0) NOT NULL,
	[InviteSentUtc] [datetime2](0) NULL,
	[InvitedBy] [nvarchar](100) NULL,
	[InviteMethod] [tinyint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invitations] ADD  CONSTRAINT [PK_Invitations] PRIMARY KEY CLUSTERED 
(
	[GuestId] ASC,
	[EventId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invitations] ADD  CONSTRAINT [DF_Inv_Invited]  DEFAULT ((1)) FOR [Invited]
GO
ALTER TABLE [dbo].[Invitations] ADD  CONSTRAINT [DF_Inv_Allowed]  DEFAULT ((0)) FOR [AllowedExtraGuests]
GO
ALTER TABLE [dbo].[Invitations] ADD  CONSTRAINT [DF_Inv_CreatedUtc]  DEFAULT (sysutcdatetime()) FOR [CreatedUtc]
GO
ALTER TABLE [dbo].[Invitations] ADD  CONSTRAINT [DF_Inv_UpdatedUtc]  DEFAULT (sysutcdatetime()) FOR [UpdatedUtc]
GO
ALTER TABLE [dbo].[Invitations]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Invitations] CHECK CONSTRAINT [FK_Inv_Event]
GO
ALTER TABLE [dbo].[Invitations]  WITH CHECK ADD  CONSTRAINT [FK_Inv_Guest] FOREIGN KEY([GuestId])
REFERENCES [dbo].[Guests] ([Id])
GO
ALTER TABLE [dbo].[Invitations] CHECK CONSTRAINT [FK_Inv_Guest]
GO
ALTER TABLE [dbo].[Invitations]  WITH CHECK ADD  CONSTRAINT [CK_Invitations_InviteMethod] CHECK  (([InviteMethod]=(9) OR [InviteMethod]=(5) OR [InviteMethod]=(4) OR [InviteMethod]=(3) OR [InviteMethod]=(2) OR [InviteMethod]=(1) OR [InviteMethod] IS NULL))
GO
ALTER TABLE [dbo].[Invitations] CHECK CONSTRAINT [CK_Invitations_InviteMethod]
GO
