CREATE DATABASE IF NOT EXISTS DB_PurinaProgram;
USE DB_PurinaProgram;

CREATE TABLE IF NOT EXISTS Producto (
	codigoProducto INT NOT NULL,
    nombreProducto VARCHAR(100) NOT NULL,
	descripcionProducto VARCHAR(100) NOT NULL,
	precioUnitario DECIMAL(10,2) NOT NULL,
	precioDocena DECIMAL(10,2) NOT NULL,
	precioMayor DECIMAL(10,2) NOT NULL,
	cantidadDisponible INT NOT NULL,
	PRIMARY KEY PK_codigoProducto(codigoProducto)
);

CREATE TABLE IF NOT EXISTS DetalleVenta (
	codigoDetalleVenta INT NOT NULL,
	cantidadVender INT NOT NULL,
	Ventas_idVenta INT NOT NULL,
	codigoProducto INT NOT NULL,
	PRIMARY KEY PK_codigoDetalleVenta(codigoDetalleVenta),
	CONSTRAINT fk_DetalleVenta_Producto FOREIGN KEY (codigoProducto)
		REFERENCES Producto (codigoProducto) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Compra (
	numeroDocumento INT NOT NULL,
	fechaCompra DATE NOT NULL,
	tipoDeProducto VARCHAR(45) NOT NULL,
	totalCompra DECIMAL(10,2) NOT NULL,
	PRIMARY KEY PK_numeroDocumento(numeroDocumento)
);

CREATE TABLE IF NOT EXISTS DetalleCompra (
	codigoDetalleCompra INT NOT NULL,
	cantidad INT NOT NULL,
	precio DECIMAL(10,2) NOT NULL,
	numeroDocumento INT NOT NULL,
	codigoDetalleVenta INT NOT NULL,
	PRIMARY KEY PK_codigoDetalleCompra(codigoDetalleCompra),
	CONSTRAINT fk_DetalleCompra_Compra FOREIGN KEY (numeroDocumento)
		REFERENCES Compra (numeroDocumento) ON DELETE CASCADE,
	CONSTRAINT fk_DetalleCompra_DetalleVenta FOREIGN KEY (codigoDetalleVenta)
		REFERENCES DetalleVenta (codigoDetalleVenta)ON DELETE CASCADE
);	
 	
-- ----------------------------------------------PROCEDIMIENTOS ALMACENADOS----------------------------------------------
-- ---------------------------------------------- Producto
-- agregar
delimiter //
create procedure sp_AgregarProducto(in nombre varchar(100), in descripcion varchar(100), in precio decimal(10,2), in cantidad int)
begin 
	insert into Producto (nombreProducto, descripcionProducto, precioUnitario, cantidadDisponible)
		values (nombre,descripcion,precio,cantidad);
end //
delimiter ;
-- mostrar
-- modificar 
-- eliminar