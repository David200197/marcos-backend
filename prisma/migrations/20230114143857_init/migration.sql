-- CreateTable
CREATE TABLE `administrador` (
    `idAdministrador` INTEGER NOT NULL,
    `Nombre` VARCHAR(25) NOT NULL,
    `Apellido1` VARCHAR(25) NOT NULL,
    `Apellido2` VARCHAR(25) NOT NULL,

    PRIMARY KEY (`idAdministrador`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `artistasaficionados` (
    `idArtista` INTEGER NOT NULL,
    `Nombre` VARCHAR(25) NOT NULL,
    `Apellido1` VARCHAR(25) NOT NULL,
    `Apellido2` VARCHAR(25) NOT NULL,
    `Carrera` VARCHAR(50) NULL,
    `Anno` INTEGER NULL,
    `Activo` VARCHAR(5) NOT NULL,
    `Premios` BLOB NULL,
    `ManifestacionidManifestacion` INTEGER NOT NULL,
    `ResponsableidResponsable` INTEGER NOT NULL,
    `Facultadid` INTEGER NOT NULL,

    INDEX `FKArtistasAf154326`(`Facultadid`),
    INDEX `FKArtistasAf543529`(`ResponsableidResponsable`),
    INDEX `FKArtistasAf936665`(`ManifestacionidManifestacion`),
    PRIMARY KEY (`idArtista`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `artistasaficionados_trabajos` (
    `ArtistasAficionadosidArtista` INTEGER NOT NULL,
    `TrabajosidTrabajo` INTEGER NOT NULL,

    INDEX `FKArtistasAf889729`(`TrabajosidTrabajo`),
    INDEX `FKArtistasAf93177`(`ArtistasAficionadosidArtista`),
    PRIMARY KEY (`ArtistasAficionadosidArtista`, `TrabajosidTrabajo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `eventos` (
    `idEvento` INTEGER NOT NULL,
    `Tipo` VARCHAR(25) NOT NULL,
    `Nombre` VARCHAR(25) NOT NULL,
    `Institucion` VARCHAR(255) NOT NULL,
    `Fecha` DATETIME(0) NOT NULL,

    PRIMARY KEY (`idEvento`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `eventos_manifestacion` (
    `EventosidEvento` INTEGER NOT NULL,
    `ManifestacionidManifestacion` INTEGER NOT NULL,

    INDEX `FKEventos_Ma312847`(`ManifestacionidManifestacion`),
    INDEX `FKEventos_Ma844416`(`EventosidEvento`),
    PRIMARY KEY (`EventosidEvento`, `ManifestacionidManifestacion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `facultad` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `manifestacion` (
    `idManifestacion` INTEGER NOT NULL,
    `Nombre` VARCHAR(25) NOT NULL,
    `Genero` VARCHAR(25) NOT NULL,

    PRIMARY KEY (`idManifestacion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `noticiasculturales` (
    `id` INTEGER NOT NULL,
    `Titulo` VARCHAR(25) NOT NULL,
    `Autor` VARCHAR(25) NOT NULL,
    `Fecha_Publicacion` DATETIME(0) NOT NULL,
    `ResponsableidResponsable` INTEGER NOT NULL,

    INDEX `FKNoticiasCu824988`(`ResponsableidResponsable`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `responsable` (
    `idResponsable` INTEGER NOT NULL,
    `Nombre` VARCHAR(25) NOT NULL,
    `Apellido1` VARCHAR(25) NOT NULL,
    `Apellido2` VARCHAR(25) NOT NULL,
    `Procedencia` VARCHAR(25) NOT NULL,
    `ManifestacionidManifestacion2` INTEGER NOT NULL,

    INDEX `FKResponsabl466609`(`ManifestacionidManifestacion2`),
    PRIMARY KEY (`idResponsable`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `role` (
    `id` INTEGER NOT NULL,
    `Tipo` VARCHAR(25) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trabajos` (
    `idTrabajo` INTEGER NOT NULL,
    `Autor` VARCHAR(25) NOT NULL,
    `Titulo` VARCHAR(255) NOT NULL,
    `Anno` YEAR NOT NULL,
    `Lugar_Obtenido` VARCHAR(25) NULL,
    `Trabajos` BLOB NOT NULL,

    UNIQUE INDEX `Titulo`(`Titulo`),
    PRIMARY KEY (`idTrabajo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario` (
    `idUsuario` INTEGER NOT NULL,
    `Nombre` VARCHAR(25) NOT NULL,
    `Correo` VARCHAR(25) NOT NULL,
    `Contrasena` VARCHAR(255) NOT NULL,
    `ArtistasAficionadosidArtista` INTEGER NULL,
    `ResponsableidResponsable` INTEGER NULL,
    `AdministradoridAdministrador` INTEGER NULL,
    `Roleid` INTEGER NOT NULL,

    UNIQUE INDEX `Correo`(`Correo`),
    INDEX `FKUsuario10775`(`AdministradoridAdministrador`),
    INDEX `FKUsuario183683`(`Roleid`),
    INDEX `FKUsuario842133`(`ArtistasAficionadosidArtista`),
    PRIMARY KEY (`idUsuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `artistasaficionados` ADD CONSTRAINT `FKArtistasAf154326` FOREIGN KEY (`Facultadid`) REFERENCES `facultad`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `artistasaficionados` ADD CONSTRAINT `FKArtistasAf543529` FOREIGN KEY (`ResponsableidResponsable`) REFERENCES `responsable`(`idResponsable`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `artistasaficionados` ADD CONSTRAINT `FKArtistasAf936665` FOREIGN KEY (`ManifestacionidManifestacion`) REFERENCES `manifestacion`(`idManifestacion`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `artistasaficionados_trabajos` ADD CONSTRAINT `FKArtistasAf889729` FOREIGN KEY (`TrabajosidTrabajo`) REFERENCES `trabajos`(`idTrabajo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `artistasaficionados_trabajos` ADD CONSTRAINT `FKArtistasAf93177` FOREIGN KEY (`ArtistasAficionadosidArtista`) REFERENCES `artistasaficionados`(`idArtista`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `eventos_manifestacion` ADD CONSTRAINT `FKEventos_Ma312847` FOREIGN KEY (`ManifestacionidManifestacion`) REFERENCES `manifestacion`(`idManifestacion`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `eventos_manifestacion` ADD CONSTRAINT `FKEventos_Ma844416` FOREIGN KEY (`EventosidEvento`) REFERENCES `eventos`(`idEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `noticiasculturales` ADD CONSTRAINT `FKNoticiasCu824988` FOREIGN KEY (`ResponsableidResponsable`) REFERENCES `responsable`(`idResponsable`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `responsable` ADD CONSTRAINT `FKResponsabl466609` FOREIGN KEY (`ManifestacionidManifestacion2`) REFERENCES `manifestacion`(`idManifestacion`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `FKUsuario10775` FOREIGN KEY (`AdministradoridAdministrador`) REFERENCES `administrador`(`idAdministrador`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `FKUsuario183683` FOREIGN KEY (`Roleid`) REFERENCES `role`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `FKUsuario842133` FOREIGN KEY (`ArtistasAficionadosidArtista`) REFERENCES `artistasaficionados`(`idArtista`) ON DELETE RESTRICT ON UPDATE RESTRICT;
