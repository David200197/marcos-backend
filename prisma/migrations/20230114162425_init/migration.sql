/*
  Warnings:

  - The primary key for the `administrador` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Apellido1` on the `administrador` table. All the data in the column will be lost.
  - You are about to drop the column `Apellido2` on the `administrador` table. All the data in the column will be lost.
  - You are about to drop the column `Nombre` on the `administrador` table. All the data in the column will be lost.
  - The primary key for the `artistasaficionados` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Activo` on the `artistasaficionados` table. All the data in the column will be lost.
  - You are about to drop the column `Anno` on the `artistasaficionados` table. All the data in the column will be lost.
  - You are about to drop the column `Apellido1` on the `artistasaficionados` table. All the data in the column will be lost.
  - You are about to drop the column `Apellido2` on the `artistasaficionados` table. All the data in the column will be lost.
  - You are about to drop the column `Carrera` on the `artistasaficionados` table. All the data in the column will be lost.
  - You are about to drop the column `Facultadid` on the `artistasaficionados` table. All the data in the column will be lost.
  - You are about to drop the column `ManifestacionidManifestacion` on the `artistasaficionados` table. All the data in the column will be lost.
  - You are about to drop the column `Nombre` on the `artistasaficionados` table. All the data in the column will be lost.
  - You are about to drop the column `Premios` on the `artistasaficionados` table. All the data in the column will be lost.
  - You are about to drop the column `ResponsableidResponsable` on the `artistasaficionados` table. All the data in the column will be lost.
  - The primary key for the `artistasaficionados_trabajos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `ArtistasAficionadosidArtista` on the `artistasaficionados_trabajos` table. All the data in the column will be lost.
  - You are about to drop the column `TrabajosidTrabajo` on the `artistasaficionados_trabajos` table. All the data in the column will be lost.
  - The primary key for the `eventos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Fecha` on the `eventos` table. All the data in the column will be lost.
  - You are about to drop the column `Institucion` on the `eventos` table. All the data in the column will be lost.
  - You are about to drop the column `Nombre` on the `eventos` table. All the data in the column will be lost.
  - You are about to drop the column `Tipo` on the `eventos` table. All the data in the column will be lost.
  - The primary key for the `eventos_manifestacion` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `EventosidEvento` on the `eventos_manifestacion` table. All the data in the column will be lost.
  - You are about to drop the column `ManifestacionidManifestacion` on the `eventos_manifestacion` table. All the data in the column will be lost.
  - The primary key for the `facultad` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `manifestacion` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Genero` on the `manifestacion` table. All the data in the column will be lost.
  - You are about to drop the column `Nombre` on the `manifestacion` table. All the data in the column will be lost.
  - The primary key for the `noticiasculturales` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Autor` on the `noticiasculturales` table. All the data in the column will be lost.
  - You are about to drop the column `Fecha_Publicacion` on the `noticiasculturales` table. All the data in the column will be lost.
  - You are about to drop the column `ResponsableidResponsable` on the `noticiasculturales` table. All the data in the column will be lost.
  - You are about to drop the column `Titulo` on the `noticiasculturales` table. All the data in the column will be lost.
  - The primary key for the `responsable` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Apellido1` on the `responsable` table. All the data in the column will be lost.
  - You are about to drop the column `Apellido2` on the `responsable` table. All the data in the column will be lost.
  - You are about to drop the column `ManifestacionidManifestacion2` on the `responsable` table. All the data in the column will be lost.
  - You are about to drop the column `Nombre` on the `responsable` table. All the data in the column will be lost.
  - You are about to drop the column `Procedencia` on the `responsable` table. All the data in the column will be lost.
  - The primary key for the `role` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Tipo` on the `role` table. All the data in the column will be lost.
  - The primary key for the `trabajos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Anno` on the `trabajos` table. All the data in the column will be lost.
  - You are about to drop the column `Autor` on the `trabajos` table. All the data in the column will be lost.
  - You are about to drop the column `Lugar_Obtenido` on the `trabajos` table. All the data in the column will be lost.
  - You are about to drop the column `Titulo` on the `trabajos` table. All the data in the column will be lost.
  - You are about to drop the column `Trabajos` on the `trabajos` table. All the data in the column will be lost.
  - The primary key for the `usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `AdministradoridAdministrador` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `ArtistasAficionadosidArtista` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `Contrasena` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `Correo` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `Nombre` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `ResponsableidResponsable` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `Roleid` on the `usuario` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[titulo]` on the table `trabajos` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[correo]` on the table `usuario` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `apellido1` to the `administrador` table without a default value. This is not possible if the table is not empty.
  - Added the required column `apellido2` to the `administrador` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre` to the `administrador` table without a default value. This is not possible if the table is not empty.
  - Added the required column `activo` to the `artistasaficionados` table without a default value. This is not possible if the table is not empty.
  - Added the required column `apellido1` to the `artistasaficionados` table without a default value. This is not possible if the table is not empty.
  - Added the required column `apellido2` to the `artistasaficionados` table without a default value. This is not possible if the table is not empty.
  - Added the required column `facultadid` to the `artistasaficionados` table without a default value. This is not possible if the table is not empty.
  - Added the required column `manifestacionidManifestacion` to the `artistasaficionados` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre` to the `artistasaficionados` table without a default value. This is not possible if the table is not empty.
  - Added the required column `responsableidResponsable` to the `artistasaficionados` table without a default value. This is not possible if the table is not empty.
  - Added the required column `artistasAficionadosidArtista` to the `artistasaficionados_trabajos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `trabajosidTrabajo` to the `artistasaficionados_trabajos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fecha` to the `eventos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `institucion` to the `eventos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre` to the `eventos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipo` to the `eventos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `eventosidEvento` to the `eventos_manifestacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `manifestacionidManifestacion` to the `eventos_manifestacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `genero` to the `manifestacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre` to the `manifestacion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `autor` to the `noticiasculturales` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fecha_Publicacion` to the `noticiasculturales` table without a default value. This is not possible if the table is not empty.
  - Added the required column `responsableidResponsable` to the `noticiasculturales` table without a default value. This is not possible if the table is not empty.
  - Added the required column `titulo` to the `noticiasculturales` table without a default value. This is not possible if the table is not empty.
  - Added the required column `apellido1` to the `responsable` table without a default value. This is not possible if the table is not empty.
  - Added the required column `apellido2` to the `responsable` table without a default value. This is not possible if the table is not empty.
  - Added the required column `manifestacionidManifestacion2` to the `responsable` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre` to the `responsable` table without a default value. This is not possible if the table is not empty.
  - Added the required column `procedencia` to the `responsable` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipo` to the `role` table without a default value. This is not possible if the table is not empty.
  - Added the required column `anno` to the `trabajos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `autor` to the `trabajos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `titulo` to the `trabajos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `trabajos` to the `trabajos` table without a default value. This is not possible if the table is not empty.
  - Added the required column `contrasena` to the `usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `correo` to the `usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre` to the `usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `roleid` to the `usuario` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `artistasaficionados` DROP FOREIGN KEY `FKArtistasAf154326`;

-- DropForeignKey
ALTER TABLE `artistasaficionados` DROP FOREIGN KEY `FKArtistasAf543529`;

-- DropForeignKey
ALTER TABLE `artistasaficionados` DROP FOREIGN KEY `FKArtistasAf936665`;

-- DropForeignKey
ALTER TABLE `artistasaficionados_trabajos` DROP FOREIGN KEY `FKArtistasAf889729`;

-- DropForeignKey
ALTER TABLE `artistasaficionados_trabajos` DROP FOREIGN KEY `FKArtistasAf93177`;

-- DropForeignKey
ALTER TABLE `eventos_manifestacion` DROP FOREIGN KEY `FKEventos_Ma312847`;

-- DropForeignKey
ALTER TABLE `eventos_manifestacion` DROP FOREIGN KEY `FKEventos_Ma844416`;

-- DropForeignKey
ALTER TABLE `noticiasculturales` DROP FOREIGN KEY `FKNoticiasCu824988`;

-- DropForeignKey
ALTER TABLE `responsable` DROP FOREIGN KEY `FKResponsabl466609`;

-- DropForeignKey
ALTER TABLE `usuario` DROP FOREIGN KEY `FKUsuario10775`;

-- DropForeignKey
ALTER TABLE `usuario` DROP FOREIGN KEY `FKUsuario183683`;

-- DropForeignKey
ALTER TABLE `usuario` DROP FOREIGN KEY `FKUsuario842133`;

-- DropIndex
DROP INDEX `Titulo` ON `trabajos`;

-- DropIndex
DROP INDEX `Correo` ON `usuario`;

-- AlterTable
ALTER TABLE `administrador` DROP PRIMARY KEY,
    DROP COLUMN `Apellido1`,
    DROP COLUMN `Apellido2`,
    DROP COLUMN `Nombre`,
    ADD COLUMN `apellido1` VARCHAR(25) NOT NULL,
    ADD COLUMN `apellido2` VARCHAR(25) NOT NULL,
    ADD COLUMN `nombre` VARCHAR(25) NOT NULL,
    MODIFY `idAdministrador` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idAdministrador`);

-- AlterTable
ALTER TABLE `artistasaficionados` DROP PRIMARY KEY,
    DROP COLUMN `Activo`,
    DROP COLUMN `Anno`,
    DROP COLUMN `Apellido1`,
    DROP COLUMN `Apellido2`,
    DROP COLUMN `Carrera`,
    DROP COLUMN `Facultadid`,
    DROP COLUMN `ManifestacionidManifestacion`,
    DROP COLUMN `Nombre`,
    DROP COLUMN `Premios`,
    DROP COLUMN `ResponsableidResponsable`,
    ADD COLUMN `activo` VARCHAR(5) NOT NULL,
    ADD COLUMN `anno` INTEGER NULL,
    ADD COLUMN `apellido1` VARCHAR(25) NOT NULL,
    ADD COLUMN `apellido2` VARCHAR(25) NOT NULL,
    ADD COLUMN `carrera` VARCHAR(50) NULL,
    ADD COLUMN `facultadid` VARCHAR(191) NOT NULL,
    ADD COLUMN `manifestacionidManifestacion` VARCHAR(191) NOT NULL,
    ADD COLUMN `nombre` VARCHAR(25) NOT NULL,
    ADD COLUMN `premios` BLOB NULL,
    ADD COLUMN `responsableidResponsable` VARCHAR(191) NOT NULL,
    MODIFY `idArtista` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idArtista`);

-- AlterTable
ALTER TABLE `artistasaficionados_trabajos` DROP PRIMARY KEY,
    DROP COLUMN `ArtistasAficionadosidArtista`,
    DROP COLUMN `TrabajosidTrabajo`,
    ADD COLUMN `artistasAficionadosidArtista` VARCHAR(191) NOT NULL,
    ADD COLUMN `trabajosidTrabajo` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`artistasAficionadosidArtista`, `trabajosidTrabajo`);

-- AlterTable
ALTER TABLE `eventos` DROP PRIMARY KEY,
    DROP COLUMN `Fecha`,
    DROP COLUMN `Institucion`,
    DROP COLUMN `Nombre`,
    DROP COLUMN `Tipo`,
    ADD COLUMN `fecha` DATETIME(0) NOT NULL,
    ADD COLUMN `institucion` VARCHAR(255) NOT NULL,
    ADD COLUMN `nombre` VARCHAR(25) NOT NULL,
    ADD COLUMN `tipo` VARCHAR(25) NOT NULL,
    MODIFY `idEvento` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idEvento`);

-- AlterTable
ALTER TABLE `eventos_manifestacion` DROP PRIMARY KEY,
    DROP COLUMN `EventosidEvento`,
    DROP COLUMN `ManifestacionidManifestacion`,
    ADD COLUMN `eventosidEvento` VARCHAR(191) NOT NULL,
    ADD COLUMN `manifestacionidManifestacion` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`eventosidEvento`, `manifestacionidManifestacion`);

-- AlterTable
ALTER TABLE `facultad` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `manifestacion` DROP PRIMARY KEY,
    DROP COLUMN `Genero`,
    DROP COLUMN `Nombre`,
    ADD COLUMN `genero` VARCHAR(25) NOT NULL,
    ADD COLUMN `nombre` VARCHAR(25) NOT NULL,
    MODIFY `idManifestacion` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idManifestacion`);

-- AlterTable
ALTER TABLE `noticiasculturales` DROP PRIMARY KEY,
    DROP COLUMN `Autor`,
    DROP COLUMN `Fecha_Publicacion`,
    DROP COLUMN `ResponsableidResponsable`,
    DROP COLUMN `Titulo`,
    ADD COLUMN `autor` VARCHAR(25) NOT NULL,
    ADD COLUMN `fecha_Publicacion` DATETIME(0) NOT NULL,
    ADD COLUMN `responsableidResponsable` VARCHAR(191) NOT NULL,
    ADD COLUMN `titulo` VARCHAR(25) NOT NULL,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `responsable` DROP PRIMARY KEY,
    DROP COLUMN `Apellido1`,
    DROP COLUMN `Apellido2`,
    DROP COLUMN `ManifestacionidManifestacion2`,
    DROP COLUMN `Nombre`,
    DROP COLUMN `Procedencia`,
    ADD COLUMN `apellido1` VARCHAR(25) NOT NULL,
    ADD COLUMN `apellido2` VARCHAR(25) NOT NULL,
    ADD COLUMN `manifestacionidManifestacion2` VARCHAR(191) NOT NULL,
    ADD COLUMN `nombre` VARCHAR(25) NOT NULL,
    ADD COLUMN `procedencia` VARCHAR(25) NOT NULL,
    MODIFY `idResponsable` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idResponsable`);

-- AlterTable
ALTER TABLE `role` DROP PRIMARY KEY,
    DROP COLUMN `Tipo`,
    ADD COLUMN `tipo` VARCHAR(25) NOT NULL,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `trabajos` DROP PRIMARY KEY,
    DROP COLUMN `Anno`,
    DROP COLUMN `Autor`,
    DROP COLUMN `Lugar_Obtenido`,
    DROP COLUMN `Titulo`,
    DROP COLUMN `Trabajos`,
    ADD COLUMN `anno` YEAR NOT NULL,
    ADD COLUMN `autor` VARCHAR(25) NOT NULL,
    ADD COLUMN `lugar_Obtenido` VARCHAR(25) NULL,
    ADD COLUMN `titulo` VARCHAR(255) NOT NULL,
    ADD COLUMN `trabajos` BLOB NOT NULL,
    MODIFY `idTrabajo` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idTrabajo`);

-- AlterTable
ALTER TABLE `usuario` DROP PRIMARY KEY,
    DROP COLUMN `AdministradoridAdministrador`,
    DROP COLUMN `ArtistasAficionadosidArtista`,
    DROP COLUMN `Contrasena`,
    DROP COLUMN `Correo`,
    DROP COLUMN `Nombre`,
    DROP COLUMN `ResponsableidResponsable`,
    DROP COLUMN `Roleid`,
    ADD COLUMN `administradoridAdministrador` VARCHAR(191) NULL,
    ADD COLUMN `artistasAficionadosidArtista` VARCHAR(191) NULL,
    ADD COLUMN `contrasena` VARCHAR(255) NOT NULL,
    ADD COLUMN `correo` VARCHAR(25) NOT NULL,
    ADD COLUMN `nombre` VARCHAR(25) NOT NULL,
    ADD COLUMN `responsableidResponsable` INTEGER NULL,
    ADD COLUMN `roleid` VARCHAR(191) NOT NULL,
    MODIFY `idUsuario` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`idUsuario`);

-- CreateIndex
CREATE INDEX `FKArtistasAf154326` ON `artistasaficionados`(`facultadid`);

-- CreateIndex
CREATE INDEX `FKArtistasAf543529` ON `artistasaficionados`(`responsableidResponsable`);

-- CreateIndex
CREATE INDEX `FKArtistasAf936665` ON `artistasaficionados`(`manifestacionidManifestacion`);

-- CreateIndex
CREATE INDEX `FKArtistasAf889729` ON `artistasaficionados_trabajos`(`trabajosidTrabajo`);

-- CreateIndex
CREATE INDEX `FKArtistasAf93177` ON `artistasaficionados_trabajos`(`artistasAficionadosidArtista`);

-- CreateIndex
CREATE INDEX `FKEventos_Ma312847` ON `eventos_manifestacion`(`manifestacionidManifestacion`);

-- CreateIndex
CREATE INDEX `FKEventos_Ma844416` ON `eventos_manifestacion`(`eventosidEvento`);

-- CreateIndex
CREATE INDEX `FKNoticiasCu824988` ON `noticiasculturales`(`responsableidResponsable`);

-- CreateIndex
CREATE INDEX `FKResponsabl466609` ON `responsable`(`manifestacionidManifestacion2`);

-- CreateIndex
CREATE UNIQUE INDEX `Titulo` ON `trabajos`(`titulo`);

-- CreateIndex
CREATE UNIQUE INDEX `Correo` ON `usuario`(`correo`);

-- CreateIndex
CREATE INDEX `FKUsuario10775` ON `usuario`(`administradoridAdministrador`);

-- CreateIndex
CREATE INDEX `FKUsuario183683` ON `usuario`(`roleid`);

-- CreateIndex
CREATE INDEX `FKUsuario842133` ON `usuario`(`artistasAficionadosidArtista`);

-- AddForeignKey
ALTER TABLE `artistasaficionados` ADD CONSTRAINT `FKArtistasAf154326` FOREIGN KEY (`facultadid`) REFERENCES `facultad`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `artistasaficionados` ADD CONSTRAINT `FKArtistasAf543529` FOREIGN KEY (`responsableidResponsable`) REFERENCES `responsable`(`idResponsable`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `artistasaficionados` ADD CONSTRAINT `FKArtistasAf936665` FOREIGN KEY (`manifestacionidManifestacion`) REFERENCES `manifestacion`(`idManifestacion`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `artistasaficionados_trabajos` ADD CONSTRAINT `FKArtistasAf889729` FOREIGN KEY (`trabajosidTrabajo`) REFERENCES `trabajos`(`idTrabajo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `artistasaficionados_trabajos` ADD CONSTRAINT `FKArtistasAf93177` FOREIGN KEY (`artistasAficionadosidArtista`) REFERENCES `artistasaficionados`(`idArtista`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `eventos_manifestacion` ADD CONSTRAINT `FKEventos_Ma312847` FOREIGN KEY (`manifestacionidManifestacion`) REFERENCES `manifestacion`(`idManifestacion`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `eventos_manifestacion` ADD CONSTRAINT `FKEventos_Ma844416` FOREIGN KEY (`eventosidEvento`) REFERENCES `eventos`(`idEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `noticiasculturales` ADD CONSTRAINT `FKNoticiasCu824988` FOREIGN KEY (`responsableidResponsable`) REFERENCES `responsable`(`idResponsable`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `responsable` ADD CONSTRAINT `FKResponsabl466609` FOREIGN KEY (`manifestacionidManifestacion2`) REFERENCES `manifestacion`(`idManifestacion`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `FKUsuario10775` FOREIGN KEY (`administradoridAdministrador`) REFERENCES `administrador`(`idAdministrador`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `FKUsuario183683` FOREIGN KEY (`roleid`) REFERENCES `role`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `FKUsuario842133` FOREIGN KEY (`artistasAficionadosidArtista`) REFERENCES `artistasaficionados`(`idArtista`) ON DELETE RESTRICT ON UPDATE RESTRICT;
