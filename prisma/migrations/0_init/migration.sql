-- CreateTable
CREATE TABLE `abono_credito` (
    `idabono` INTEGER NOT NULL AUTO_INCREMENT,
    `idcredito` INTEGER NULL,
    `abono` DECIMAL(12, 2) NULL,
    `fecha` DATE NULL,
    `tipopago` VARCHAR(30) NULL,
    `numcaja` VARCHAR(10) NULL,

    INDEX `fk_abonocredito`(`idcredito`),
    PRIMARY KEY (`idabono`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `abono_proveedor` (
    `idabono` INTEGER NOT NULL AUTO_INCREMENT,
    `idcuenta` INTEGER NULL,
    `abono` DECIMAL(12, 2) NULL,
    `fecha` DATE NULL,
    `tipopago` VARCHAR(60) NULL,

    INDEX `fk_abono`(`idcuenta`),
    PRIMARY KEY (`idabono`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ajuste` (
    `id` INTEGER NOT NULL,
    `nombre` VARCHAR(100) NULL,
    `descripcion` VARCHAR(100) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cliente` (
    `idcliente` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(45) NULL,
    `apellido` VARCHAR(45) NULL,
    `telefono` INTEGER NULL,
    `direccion` VARCHAR(60) NULL,
    `sexo` VARCHAR(15) NULL,
    `nit` VARCHAR(16) NULL,
    `estado` VARCHAR(10) NULL,

    PRIMARY KEY (`idcliente`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `colocacion` (
    `idColocacion` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(45) NULL,
    `estado` VARCHAR(12) NULL,

    PRIMARY KEY (`idColocacion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `credito` (
    `idcredito` INTEGER NOT NULL AUTO_INCREMENT,
    `idfactura` INTEGER NULL,
    `abono` DECIMAL(12, 2) NULL,
    `estado` VARCHAR(20) NULL,

    PRIMARY KEY (`idcredito`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cuenta_proveedor` (
    `idcuenta` INTEGER NOT NULL AUTO_INCREMENT,
    `idproveedor` INTEGER NULL,
    `fecha` DATETIME(0) NULL,
    `total` DECIMAL(12, 2) NULL,
    `total_abono` DECIMAL(12, 2) NULL,
    `saldo` DECIMAL(12, 2) NULL,
    `estado` VARCHAR(10) NULL,

    INDEX `fk_cprov`(`idproveedor`),
    PRIMARY KEY (`idcuenta`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `detalle_factura` (
    `iddetalle` INTEGER NOT NULL AUTO_INCREMENT,
    `id_factura` INTEGER NULL,
    `id_producto` INTEGER NULL,
    `cantidad` INTEGER NULL,
    `precio` DECIMAL(8, 2) NULL,
    `subtotal` DECIMAL(8, 2) NULL,
    `idlote` DECIMAL(16, 0) NULL,

    INDEX `fk_factura_idx`(`id_factura`),
    INDEX `fk_producto_idx`(`id_producto`),
    PRIMARY KEY (`iddetalle`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `empleado` (
    `idempleado` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(100) NULL,
    `apellido` VARCHAR(100) NULL,
    `direccion` VARCHAR(100) NULL,
    `dpi` VARCHAR(13) NULL,
    `telefono` INTEGER NULL,
    `estado` VARCHAR(12) NULL,
    `roles` VARCHAR(50) NULL,

    PRIMARY KEY (`idempleado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `factura` (
    `idfactura` INTEGER NOT NULL AUTO_INCREMENT,
    `idcliente` INTEGER NULL,
    `fecha` DATETIME(0) NULL,
    `estado` VARCHAR(20) NULL,
    `motivo_anulacion` VARCHAR(45) NULL,
    `total` DECIMAL(12, 2) NULL,
    `idempleado` INTEGER NULL,
    `idvendedor` INTEGER NULL,

    INDEX `fk_clilente_idx`(`idcliente`),
    PRIMARY KEY (`idfactura`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lote` (
    `idlote` INTEGER NOT NULL AUTO_INCREMENT,
    `idproducto` INTEGER NULL,
    `cantidad` INTEGER NULL,
    `precio_compra` DECIMAL(8, 2) NULL,
    `precio_mayorista` DECIMAL(8, 2) NULL,
    `precio_unidad` DECIMAL(8, 2) NULL,
    `estado` VARCHAR(16) NULL,
    `vence` DATE NULL,

    INDEX `fk_loteproducto_idx`(`idproducto`),
    PRIMARY KEY (`idlote`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `modulo` (
    `idmodulo` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(20) NULL,

    PRIMARY KEY (`idmodulo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permiso` (
    `idpermiso` INTEGER NOT NULL AUTO_INCREMENT,
    `idempleado` INTEGER NULL,
    `idmodulo` INTEGER NULL,
    `permiso` INTEGER NULL,

    INDEX `fk_modulo`(`idmodulo`),
    INDEX `fk_permiso`(`idempleado`),
    PRIMARY KEY (`idpermiso`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `producto` (
    `idproducto` INTEGER NOT NULL AUTO_INCREMENT,
    `codbarr` VARCHAR(25) NULL,
    `idproveedor` INTEGER NULL,
    `nombre` VARCHAR(60) NULL,
    `presentacion` VARCHAR(45) NULL,
    `especificacion` VARCHAR(60) NULL,
    `stock` INTEGER NULL,
    `cantidad_maxima` INTEGER NULL,
    `cantidad_minima` INTEGER NULL,
    `estado` VARCHAR(16) NULL,

    INDEX `fk_prove`(`idproveedor`),
    PRIMARY KEY (`idproducto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `proveedor` (
    `idProveedor` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(45) NULL,
    `apellido` VARCHAR(45) NULL,
    `telefono` INTEGER NULL,
    `empresa` VARCHAR(45) NULL,
    `direccion` VARCHAR(60) NULL,
    `estado` VARCHAR(16) NULL,

    PRIMARY KEY (`idProveedor`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuario` (
    `idusuario` INTEGER NOT NULL AUTO_INCREMENT,
    `idempleado` INTEGER NULL,
    `usuario` VARCHAR(100) NULL,
    `pass` VARCHAR(115) NULL,

    INDEX `fk_usuario`(`idempleado`),
    PRIMARY KEY (`idusuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `abono_credito` ADD CONSTRAINT `fk_abonocredito` FOREIGN KEY (`idcredito`) REFERENCES `credito`(`idcredito`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `abono_proveedor` ADD CONSTRAINT `fk_abono` FOREIGN KEY (`idcuenta`) REFERENCES `cuenta_proveedor`(`idcuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cuenta_proveedor` ADD CONSTRAINT `fk_cprov` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor`(`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `detalle_factura` ADD CONSTRAINT `fk_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura`(`idfactura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `detalle_factura` ADD CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto`(`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `factura` ADD CONSTRAINT `fk_clilente` FOREIGN KEY (`idcliente`) REFERENCES `cliente`(`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `lote` ADD CONSTRAINT `fk_loteproducto` FOREIGN KEY (`idproducto`) REFERENCES `producto`(`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `permiso` ADD CONSTRAINT `fk_modulo` FOREIGN KEY (`idmodulo`) REFERENCES `modulo`(`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `permiso` ADD CONSTRAINT `fk_permiso` FOREIGN KEY (`idempleado`) REFERENCES `empleado`(`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `producto` ADD CONSTRAINT `fk_prove` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor`(`idProveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `usuario` ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`idempleado`) REFERENCES `empleado`(`idempleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

