﻿CREATE TABLE [dbo].[Carts] (
    [ID] [int] NOT NULL IDENTITY,
    [CartId] [nvarchar](max),
    [ItemId] [int] NOT NULL,
    [Count] [int] NOT NULL,
    [DateCreated] [datetime] NOT NULL,
    CONSTRAINT [PK_dbo.Carts] PRIMARY KEY ([ID])
)
CREATE TABLE [dbo].[Items] (
    [ID] [int] NOT NULL IDENTITY,
    [CatagorieId] [int] NOT NULL,
    [Name] [nvarchar](160) NOT NULL,
    [Price] [decimal](18, 2) NOT NULL,
    [InternalImage] [varbinary](max),
    [ItemPictureUrl] [nvarchar](1024),
    CONSTRAINT [PK_dbo.Items] PRIMARY KEY ([ID])
)
CREATE TABLE [dbo].[Catagories] (
    [ID] [int] NOT NULL IDENTITY,
    [Name] [nvarchar](max),
    CONSTRAINT [PK_dbo.Catagories] PRIMARY KEY ([ID])
)
CREATE TABLE [dbo].[OrderDetails] (
    [OrderDetailId] [int] NOT NULL IDENTITY,
    [OrderId] [int] NOT NULL,
    [ItemId] [int] NOT NULL,
    [Quantity] [int] NOT NULL,
    [UnitPrice] [decimal](18, 2) NOT NULL,
    CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY ([OrderDetailId])
)
CREATE TABLE [dbo].[Orders] (
    [OrderId] [int] NOT NULL IDENTITY,
    [OrderDate] [datetime] NOT NULL,
    [Username] [nvarchar](max),
    [FirstName] [nvarchar](160) NOT NULL,
    [LastName] [nvarchar](160) NOT NULL,
    [Address] [nvarchar](70) NOT NULL,
    [City] [nvarchar](40) NOT NULL,
    [State] [nvarchar](40) NOT NULL,
    [PostalCode] [nvarchar](10) NOT NULL,
    [Country] [nvarchar](40) NOT NULL,
    [Phone] [nvarchar](24) NOT NULL,
    [Experation] [datetime] NOT NULL,
    [SaveInfo] [bit] NOT NULL,
    [Email] [nvarchar](max),
    [Total] [decimal](18, 2) NOT NULL,
    CONSTRAINT [PK_dbo.Orders] PRIMARY KEY ([OrderId])
)
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] [nvarchar](128) NOT NULL,
    [Name] [nvarchar](256) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] [nvarchar](128) NOT NULL,
    [RoleId] [nvarchar](128) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId])
)
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] [nvarchar](128) NOT NULL,
    [FirstName] [nvarchar](max),
    [LastName] [nvarchar](max),
    [Address] [nvarchar](max),
    [City] [nvarchar](max),
    [State] [nvarchar](max),
    [PostalCode] [nvarchar](max),
    [Country] [nvarchar](max),
    [Phone] [nvarchar](max),
    [Email] [nvarchar](256),
    [EmailConfirmed] [bit] NOT NULL,
    [PasswordHash] [nvarchar](max),
    [SecurityStamp] [nvarchar](max),
    [PhoneNumber] [nvarchar](max),
    [PhoneNumberConfirmed] [bit] NOT NULL,
    [TwoFactorEnabled] [bit] NOT NULL,
    [LockoutEndDateUtc] [datetime],
    [LockoutEnabled] [bit] NOT NULL,
    [AccessFailedCount] [int] NOT NULL,
    [UserName] [nvarchar](256) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] [int] NOT NULL IDENTITY,
    [UserId] [nvarchar](128) NOT NULL,
    [ClaimType] [nvarchar](max),
    [ClaimValue] [nvarchar](max),
    CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] [nvarchar](128) NOT NULL,
    [ProviderKey] [nvarchar](128) NOT NULL,
    [UserId] [nvarchar](128) NOT NULL,
    CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey], [UserId])
)
CREATE INDEX [IX_ItemId] ON [dbo].[Carts]([ItemId])
CREATE INDEX [IX_CatagorieId] ON [dbo].[Items]([CatagorieId])
CREATE INDEX [IX_OrderId] ON [dbo].[OrderDetails]([OrderId])
CREATE INDEX [IX_ItemId] ON [dbo].[OrderDetails]([ItemId])
CREATE UNIQUE INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]([Name])
CREATE INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]([UserId])
CREATE INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]([RoleId])
CREATE UNIQUE INDEX [UserNameIndex] ON [dbo].[AspNetUsers]([UserName])
CREATE INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]([UserId])
CREATE INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]([UserId])
ALTER TABLE [dbo].[Carts] ADD CONSTRAINT [FK_dbo.Carts_dbo.Items_ItemId] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Items] ([ID]) ON DELETE CASCADE
ALTER TABLE [dbo].[Items] ADD CONSTRAINT [FK_dbo.Items_dbo.Catagories_CatagorieId] FOREIGN KEY ([CatagorieId]) REFERENCES [dbo].[Catagories] ([ID]) ON DELETE CASCADE
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_dbo.OrderDetails_dbo.Items_ItemId] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Items] ([ID]) ON DELETE CASCADE
ALTER TABLE [dbo].[OrderDetails] ADD CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([OrderId]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserRoles] ADD CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserClaims] ADD CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserLogins] ADD CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201607231642256_AutomaticMigration', N'ShopFramework2.Migrations.Configuration',  0x1F8B0800000000000400ED5D5B6FDCB8157E2FD0FF20E8A92DBC1E5F926C1AD8BBF08EE3ADD15CDC8CB3E85B404BF458585D66254DD646D15FD687FEA4FE85921225F12E52F7044180C04391E71C1E9EC3C3EBC7FFFDE7BF673F3E46A1F319A65990C4E7EEF1E191EBC0D84BFC20DE9EBBFBFCFEBB97EE8F3FFCF10F67AFFDE8D1F9A5CA778AF3A1927176EE3EE4F9EED56A95790F3002D9611478699225F7F9A197442BE027AB93A3A3BFAE8E8F57109170112DC739FBB08FF32082C50FF4739DC41EDCE57B10BE4D7C1866241D7DD914549D772082D90E78F0DCDD3C24BBAB14FDFE3D497F3D392C0BB8CE45180024CC0686F7AE03E238C9418E447DF531839B3C4DE2ED6687124078FBB48328DF3D083348AAF0AAC96E5A9BA3135C9B5553B022E5EDB33C892C091E9F12F5ACF8E29D94ECD6EA430A7C8D149D3FE15A174A3C77D720CD5D8767F46A1DA6389342BF87B8D481C37E3BA8ED01990DFE77E0ACF761BE4FE1790CF7790AC203E7667F1706DEDFE1D36DF22B8CCFE37D18D2E22101D137260125DDA4C90EA6F9D307784F84BEBE749D155B6EC517AC8B5165CA2A5DC7F9E989EBBC43CCC15D08EBD6A7AABFC99314FE0C6398821CFA3720CF618A1AEFDA8785FE04EE1C2FAC9E6BBFE2870C0EB98FEBBC058F6F60BCCD1FCE5DF4A7EB5C058FD0AF52880C1FE300791B2A94A77BD8C6E63A8751C34655AD165113E47BFD485C221DAD5388355511C249B7C8A3DB69BD039F836DA17449E55CE7030C8B8FD943B02BDDB9B0BD4FE5D7AB34893E2421D17891F86993EC530FF1B94DF82FB720DDC29C95E06CD57884D64F4A86B67E824B7DF3138D9FE4609BA401EC6BC5F87F8DBB1DBF383272374BAE3769E0D56C2FA1174420749D9B14FD45E2E74BD7D9780013B4AF13D204522608AF23B0ADB9FC14C4207D32EB4BDA3B8F9BC0C376F7310D75CA3B3A79D6A5B3527A76DDEA0AF7265F0BA7CD5827673ED50EDDB83AFBBDEA0A4C057B9FFA30BD843908F01042221B9541E881F86F827442069978C6FD11A544FBE04D8A7EEB99BA76281DE3B736D8C94DCEC21DC4C82777974EF64659AFBDC5518567B4394A0A1C6F6CCD8F2B3E9525166CFBC6C721468AFFD80322701F2AC841F281E3A6FD10D2AA1FE7DD4AD9D15B8519B55C9FD830C449C67C95C718364BAF284344EDE4EF737B7A671F9FDCBBF16CC97EE6C43B5686478B63442D8ED1559066F93C03EE37602ECE17BE9FC22CD330FE7E14BE6BAAC395307D360AD34D4E19E4645C6F922C07E11A11D04E4646D1325E0449A757F4CD4312EB6A6B38F1B2E4FAFA71877BAB623DB167A7B3019FE1757C9FD4D3D304852110DB8B1415E3CA917BAE5BD46987138C3BCCE69136715E3A06910F05BAAD6E917085A9EBC2FDDB7AA1F922DBBD83F96155F0B0245947FB439AE281635CAE19249C980E124E8FEFEE4F5F3E7F01FCD317CFE0E9F34ED3D10E6305ED02EFF1C9CB315CB725F89D3C7F310857A565E34186DCA4E9F6FE44B235262D7E154C5A92651093C6A48637EB8AEAF24D1B4B2A9AB7342BAE50174FA8584CED0D95BCE3F235B6B88BDD0E355E615A5823F6D3268EC09CCB735F487F6832171966EC6030F5188651FB4C63183E2D338B6198B4CD2486E162347318486BAD338581AAD4323318864BDBB0DB743C61C0659DC4F7411A355BC45DA70A3720CB5077E8FF0D640FE3DB2FF4F629721464C7D16E9A467FB78FEE70F0988ED7604D73FB7B7205BC3C495FC7B8546F7A6F12EFD7649FBF8E7D3C41FD987BE27CD590C020E25C781EEA98AF9031437F80631338C4CF3D9E5F8720506C3C7183914F55D666502FCF210CEC15D96C57CDDF24DB203613B5CAAA16B5CCD12A2AC9662B2A26662629C9A916B4C8D02A67996BB0E952D142C3CF970AB2CB9F30F51BFB8EBF6530D76CAB683ECC74FC4116E6F40B08F743B3EAE40D452730BC37146497EF0D859828F97350EC041AAC2254991179A3FCF2058A769FE3249BDA1D986A4ECD7C9A3E40E52E1759967841E105FC6924724A85151E0DE09C96232B653D98032FA83EC8BE031CE9900CA84A2E6F4BEFE34B18C21C3A175E79B87A0D320FF8A2F6503D7C5391EA2DF546A4F288002BCD5F0426C8A2618A7D174F45E30C796410E7A2F907B117EC40A8570857CCF00815AE69CD80FF72097730C67D8BBEDE269C99639BA2083527AE11DA1474B6A20C4B6F6FC2010E55EBAA4F7334CDCB1C6D6A6B650D6943CB19D48E3B199D4AF209AC4ED51E46ACC921A6F92C8EDDB2D31A8662FF8EB3BA89FA38DDC9A18E7ED0DDF0A49A31697FC5A91E7BFB936AA2A70413986073F1411DCB845B107460C5377DCCFB37F1E2C4E23B3641E449E228A7F3C5776592AD5A950DE8F66D2963604E0F4CD2A369768B2582357BC0A3746B6A2D19D942BF1E4DAD0913E6F22DDF890C51B1C4A86AF3B6F5C6A6DD859DD8496CB265A153619764B16D14C3D46B6C02E3D4ABC44400E5F185390C942C2C9B1A00BFCABC3403E596B715064AD6BF2631505663331828AB922FCE40CBFD04D3F6E7361796669EECAEC6F4615DABAE196C93D1C7C24CB35C284465D09C2A86A9689E9777F8237C94810D2039C9627A46D6257913C1C43730A7264299EB348B93CC0C4798D0B085C9353AA17039A369295CAF7CC9D9D72B972D64D893BF022166226E424A49A4B538D98014B5C10CE9DB54CAF9A38E60E3B32D44C919528190D037590857ED616BA52303320BB2D57EB3962C09A31C59CA9D245656DDF9A47229AE85F21EDEBEE45E5788B56AA1AF685F29A7281179F94E9FADA58106C40B7AA20AF46BC066ABC094E8AC4F6AD4A05CF71D4B0FDC45018526346B93A6AB93BC360CF4205F5434546B078550E01F32A7902E90B52C91318E500416AD0FF08B6223B4BAEC2CBD58DBB6651CD3851CAA02A4F3D6D45FB3EE422B420C08BD95A23A8F242AC66459C1666181AA18690C8D825A1601144AAA2A33B896AAD0D4AE25D9DCD66676DB4B4BDC4C54A1A5AA32836B89D868BB9224F32B8B19562F15B1B3A1819CADDAE1AF07EEF5B7B35589B54612CE560A50B6B3B760B70BE22D05D246529C4D89D0B6FE6E638F5B169534561EA36D7E9A5173CA93146C21F7159FD6F6617145E0120D5DEE003EDFB0F623219B749AA218FE552CE99988D888D538B0CA8DFF26278A95786A92291D298EF26F233C2F2C4E8E71F14A2CE6609C3C108254829FB24EC27D14AB373ED4A52B4C339A4295664EA5DAF860E4506C866864294FDF32A29449E63418D4329A12F341A477B6E25A45985C0BCD2F2C81B0B6646469AA61BEADA5C986470696262F3696A551C74B5873D39C3B51D32B0F59D384CA14730A04B0842641922C2C9F85F362D4C37EB2F3261AC38BF72AFADB622C999A6D0ED171566B2E5D7A4F65D9710CDBDC10676A9A9629A46DE3D0EB58F6CDA32DAD523107D244EB5A0BFFD44A534A6D8ED8D7C030D1749A54734A1414134D8A4A5E96610E66925D8DD1D20C0730190A1E4834E522D9A2B96B8020A6B5EB54734AD4AD5B9A14956C4EABB9574B936A52CD29D51767694275A2C5F04370AEB5A563915BAF3409926431E4A0EEB432E30E2ADD72C09CF2D5AA122DA42AAFA532029549E63468F8199A109D6EA1EB1A818651779D6A21577919961129926CC1E8681084199A06495A4C57AA5AC2B09E48D03B441D2614DAE2CA10CA87CF912602734DF284A59CE1DAA9DE78EBDE566A12BA98C3B7996A575A4DA53AA44653511D5C9BADED542BF0B6EDC5EF6FDA37572B8571BCEBDBA8404FE1DBA840476388E8CB034D08C4A86F16B5630027984A325F2C2C814595602C82FD64D906157684D012D5874EF4141A95E7B0182B096811CCB049F86AD17B88B8114C37227EEE405B2233FFCDA29712A12598FE4AFC6C37EF13FBD22675311154B2213AECF0A73CD9D36FFCA3A0314E481D66F8445DDC673AFA26D99216B99A2F1023E98B3428E5F6761F832ACF74F53328050D75FFC3DC7A67BB1FED557D354DE62A3BBBC9A1B9CAAFA66767B6A31A87B0C1CD67A9B99394FA77BDC14D3697DB9F2213769BCB2C1861B6542332A9A72C87D121CE70B8F92D5C8701C49D7995E12D88837B98E5257C837B72747CC23D65B69C67C55659E68792CD790A4543DC9E9EE27190006BB41563C516FC8479D12BFE0C52EF01A47F8AC0E39F695AF6AF7615D20A27A2AF631F3E9EBBFF2A8ABC72AEFFF9A92C75E0144BBFAF9C23E7DFFD9EFA2AF8F67FE8CB473FF276E468BB67B6BE1693111EB7326D6CAA68AF162F0778ACCD8A68F97D5EBDF22779F50A897E573C7CD5D9E1C497AEE4FA28DEBAD291EFF040D3D761CE325B32688E4E0F0C75D0D8188FFB8CA247EE8911D32E8114EBD51DCC1679F8A783BA041FE1E1A09E5D8FE51B385D4D72805768C63343FAE119C3482E6918EEE1995E832301D079B0B0C503380F4698036C96D2FDDE9E2C8DCF2CA5F9CC9E2603C73C1451117D59115AFB3ECB3298C034B6B294283B08E8F8A84A6787E21F55B90BEC7B4B06D9B99747328FA64CD5E7AA7787A7C0F094DB2F46D41B64FCDD167371A5F15F45F281739DA1D0F7DB1E7DB845CD85A32F8F103CACCEE5BBBC0B7D6CC25CAB682453166547323D5B987D82C24A9AB2680F693A3F4CF1E53A947278D0A96B530D093A11530C033AD192C5FE4E84A401BF13257594EF56437968EF269A2C9E77A2248D9ABAFEB6FBF3075D82BAECE9837EE6217BDEA07F5BB04F180C456F1015AA9E28E8424BF93C816CE467D41F499F2BE8229AF2A9824E336FEEA102F32857959C712423D9AF9D22E28D32675FD6D047C083EF171004CCF73116195B365EBF4A48F4C1065F3722E2F960B4E734ED1161CE6745362F61320488A37171CCA7805C55DC6115F97C4140E5468D35263C748537A5C2A11A0739D5B42587831D5F3E3EAF2DD4F8BCB0E2B3D88DEA1A9FF126CCA8D6B37498F039FB9A12A38F898A26B0E48BEE5D14E81D0BEB563AC27E2F05E9BB010E5400EC4D04F03D25A6B7E6CE96E982FA44C6D50FCA7B01E0B3120448859D4D08D83DB5ADA90EC85B6CF42C1F967B61C646704115C63621F8F6D4C6A63A3CBF7063B382D85E98ADCD153F67B634E3103A3B60B60858C7372BB9E9409FB057016197D70FCE5DFF0E1F252997BFA408A7528C6C2544B68CAC1CF95494B65E0093885C7F93CBAD8228D6816BB7616BCB3869016BA5BCD4E0DB4AFA064DC08CB4C5A6603ECBF894CF89CA012155CC9A6E40C9B0C9A266AA46A2E4190B5DA2C057C8A1676B57573294D35696E4D1B355E0B7EA7893C8AEE54DF2E8792B50512744169783894BBA517E0982BE122783DF9F1D38DC484CF59A18555087E9BF1C5C7051E40554B637E6B77D2BD271B5415AED5F959191BDA5B8C0B2D7165A46888AABAAD2771B968CE4CDD4A4E5E188B6D500854EE4AF452C19B87B10A530D14B71A77978A58C85D33D884A86741D0B5C6EF17A329A95EC637CFEA8FC7509B360DB9038433463E831F3913A0F3E765E4D8B3889AA2CDCC6FD5BD4CBFB28E45FA479700FBC1C7DC6478F8AF7C88BE31CF800DC1DF4AFE3F7FB7CB7CF519561741732E720F0F44AC7BF001F67653E7BBFC3BFB221AA80C40CF091ADF7F14FFB20F46BB9AF2447051424F0BC8D1CF4C16D99E3033FDBA79AD23B010C474588A8AF9E6EDEC268172262D9FB185F0BE8221B32BF37700BBCA7E660888A487B43B06A3FBB0CC0360551466834E5D14F64C37EF4F8C3FF01BC48AA5156AC0000 , N'6.1.3-40302')

