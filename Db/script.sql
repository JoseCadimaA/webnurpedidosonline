USE [bdTienda]
GO
/****** Object:  Table [dbo].[tblPermiso]    Script Date: 09/08/2017 20:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermiso](
	[permisoId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](250) NULL,
	[url] [nvarchar](250) NULL,
	[posicion] [nchar](10) NULL,
	[estado] [nchar](18) NULL,
 CONSTRAINT [XPKtblPermiso] PRIMARY KEY CLUSTERED 
(
	[permisoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuario]    Script Date: 09/08/2017 20:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsuario](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[correo] [nvarchar](50) NULL,
	[contraseña] [char](16) NOT NULL,
	[tipoUsuario] [nvarchar](50) NULL,
 CONSTRAINT [XPKtblUsuario] PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRol]    Script Date: 09/08/2017 20:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRol](
	[rolId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](250) NULL,
	[estado] [nchar](18) NULL,
 CONSTRAINT [XPKtblRol] PRIMARY KEY CLUSTERED 
(
	[rolId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_UpdateUsuario]    Script Date: 09/08/2017 20:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Actualizar un Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_USUARIO_UpdateUsuario] 
	@varNombre		nvarchar(50),
	@apellido		nvarchar(50),
	@intUsuarioId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE [bdTienda].[dbo].[tblUsuario]
	SET [nombre] = @varNombre
		,[apellido] = @apellido      
	WHERE [usuarioId] = @intUsuarioId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_InsertarUsuario]    Script Date: 09/08/2017 20:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Insertar un Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_USUARIO_InsertarUsuario] 
	@varNombre		nvarchar(50),
	@apellido		nvarchar(50),
	@correo			nvarchar(50),
	@varContraseña	char(16),
	@varTipoUsuario	nvarchar(50),
	@intUsuarioId	int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO [bdTienda].[dbo].[tblUsuario]
           (
				[nombre]
				,[apellido]
				,[correo]
				,[contraseña]
				,[tipoUsuario]
			)
     VALUES
           (
			   @varNombre,
			   @apellido,
			   @correo,
			   @varContraseña,
			   @varTipoUsuario
           )           
	 SET	@intUsuarioId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[usp_USUARIO_EliminarUsuario]    Script Date: 09/08/2017 20:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Julio Agreda
-- Create date: 08-09-2016
-- Description:	Eliminar un Usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_USUARIO_EliminarUsuario] 
	@intUsuarioId	int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- i50n,terfering with SELECT statements.
	SET NOCOUNT ON;
	
	DELETE FROM [dbo].[tblUsuario]
    WHERE [usuarioId] = @intUsuarioId
END
GO
/****** Object:  Table [dbo].[tblUsuarioRol]    Script Date: 09/08/2017 20:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarioRol](
	[idUsuarioRol] [int] IDENTITY(1,1) NOT NULL,
	[usuarioId] [int] NOT NULL,
	[rolId] [int] NOT NULL,
	[estado] [nchar](18) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuarioPermiso]    Script Date: 09/08/2017 20:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarioPermiso](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[permisoId] [int] NOT NULL,
	[estado] [nchar](18) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRecuperacion]    Script Date: 09/08/2017 20:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblRecuperacion](
	[recuperacionId] [int] IDENTITY(1,1) NOT NULL,
	[usuarioId] [int] NOT NULL,
	[codigoGenerado] [char](10) NULL,
	[fechaGenerado] [datetime] NULL,
	[fechaActual] [datetime] NULL,
	[tiempo] [int] NULL,
	[estado] [char](15) NULL,
 CONSTRAINT [XPKtblRecuperacion] PRIMARY KEY CLUSTERED 
(
	[recuperacionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblRolPermiso]    Script Date: 09/08/2017 20:50:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRolPermiso](
	[idRolPermiso] [int] NOT NULL,
	[rolId] [int] NOT NULL,
	[permisoId] [int] NOT NULL,
	[estado] [nchar](18) NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_tblRecuperacion_tblUsuario]    Script Date: 09/08/2017 20:50:49 ******/
ALTER TABLE [dbo].[tblRecuperacion]  WITH CHECK ADD  CONSTRAINT [FK_tblRecuperacion_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblRecuperacion] CHECK CONSTRAINT [FK_tblRecuperacion_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblRolPermiso_tblPermiso]    Script Date: 09/08/2017 20:50:49 ******/
ALTER TABLE [dbo].[tblRolPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblRolPermiso_tblPermiso] FOREIGN KEY([permisoId])
REFERENCES [dbo].[tblPermiso] ([permisoId])
GO
ALTER TABLE [dbo].[tblRolPermiso] CHECK CONSTRAINT [FK_tblRolPermiso_tblPermiso]
GO
/****** Object:  ForeignKey [FK_tblRolPermiso_tblRol]    Script Date: 09/08/2017 20:50:49 ******/
ALTER TABLE [dbo].[tblRolPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblRolPermiso_tblRol] FOREIGN KEY([rolId])
REFERENCES [dbo].[tblRol] ([rolId])
GO
ALTER TABLE [dbo].[tblRolPermiso] CHECK CONSTRAINT [FK_tblRolPermiso_tblRol]
GO
/****** Object:  ForeignKey [FK_tblUsuarioPermiso_tblPermiso]    Script Date: 09/08/2017 20:50:49 ******/
ALTER TABLE [dbo].[tblUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermiso_tblPermiso] FOREIGN KEY([permisoId])
REFERENCES [dbo].[tblPermiso] ([permisoId])
GO
ALTER TABLE [dbo].[tblUsuarioPermiso] CHECK CONSTRAINT [FK_tblUsuarioPermiso_tblPermiso]
GO
/****** Object:  ForeignKey [FK_tblUsuarioPermiso_tblUsuario]    Script Date: 09/08/2017 20:50:49 ******/
ALTER TABLE [dbo].[tblUsuarioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioPermiso_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblUsuarioPermiso] CHECK CONSTRAINT [FK_tblUsuarioPermiso_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblUsuarioRol_tblRol1]    Script Date: 09/08/2017 20:50:49 ******/
ALTER TABLE [dbo].[tblUsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioRol_tblRol1] FOREIGN KEY([rolId])
REFERENCES [dbo].[tblRol] ([rolId])
GO
ALTER TABLE [dbo].[tblUsuarioRol] CHECK CONSTRAINT [FK_tblUsuarioRol_tblRol1]
GO
/****** Object:  ForeignKey [FK_tblUsuarioRol_tblUsuario]    Script Date: 09/08/2017 20:50:49 ******/
ALTER TABLE [dbo].[tblUsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_tblUsuarioRol_tblUsuario] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[tblUsuario] ([usuarioId])
GO
ALTER TABLE [dbo].[tblUsuarioRol] CHECK CONSTRAINT [FK_tblUsuarioRol_tblUsuario]
GO
