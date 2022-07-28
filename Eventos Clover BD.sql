
--------------------------------------------------------------------------------
-------------------------- Proveedor -------------------------------------------
CREATE TABLE proveedor(
id_proveedor NUMBER(5) PRIMARY KEY NOT NULL,
nombre VARCHAR(30) NOT NULL,
direccion VARCHAR(50) NOT NULL,
descripcion VARCHAR(30) NOT NULL);

--------------------------------------------------------------------------------
-------------------------- Cliente ---------------------------------------------
CREATE TABLE cliente(
id_cliente NUMBER(5) PRIMARY KEY NOT NULL,
nombre VARCHAR(20) NOT NULL,
prim_apellido VARCHAR(20) NOT NULL,
seg_apellido VARCHAR(20) NOT NULL,
telefono number(8) NOT NULL,
correo VARCHAR(30),
fecha_nacimiento DATE NOT NULL,
direccion VARCHAR(50) NOT NULL);

--------------------------------------------------------------------------------
-------------------------- Metodo Pago -----------------------------------------
CREATE TABLE metodopago(
id_metodopago NUMBER(5) PRIMARY KEY NOT NULL,
tipo_metodo VARCHAR(15) NOT NULL,
descripcion VARCHAR(20) NOT NULL,
num_tarjeta NUMBER(18) NOT NULL,
fecha_venc  VARCHAR(5) NOT NULL,
cod_seguridad NUMBER(3) NOT NULL);

--------------------------------------------------------------------------------
-------------------------- Horario ---------------------------------------------
CREATE TABLE horario(
id_horario NUMBER(5) PRIMARY KEY NOT NULL,
descripcion VARCHAR(10) NOT NULL);

--------------------------------------------------------------------------------
-------------------------- Sucursal --------------------------------------------
CREATE TABLE sucursal(
id_sucursal NUMBER(5) PRIMARY KEY NOT NULL,
provincia VARCHAR(15) NOT NULL,
canton VARCHAR(15) NOT NULL,
distrito NUMBER(15) NOT NULL,
id_horario  NUMBER(5) NOT NULL,
FOREIGN KEY(id_horario) REFERENCES horario(id_horario));

--------------------------------------------------------------------------------
-------------------------- Empleado --------------------------------------------
CREATE TABLE empleado(
id_empleado NUMBER(5) PRIMARY KEY NOT NULL,
nombre VARCHAR(20) NOT NULL,
prim_apellido VARCHAR(20) NOT NULL,
seg_apellido VARCHAR(20) NOT NULL,
telefono number(8) NOT NULL,
correo VARCHAR(30),
fecha_nacimiento DATE NOT NULL,
direccion VARCHAR(50) NOT NULL,
salario NUMBER(7) NOT NULL,
id_sucursal NUMBER(5) NOT NULL,
FOREIGN KEY(id_sucursal) REFERENCES sucursal(id_sucursal));

--------------------------------------------------------------------------------
-------------------------- Reservaciones ---------------------------------------
CREATE TABLE reservacion(
id_reservacion NUMBER(5) PRIMARY KEY NOT NULL,
nombre VARCHAR(20) NOT NULL,
prim_apellido VARCHAR(20) NOT NULL,
seg_apellido VARCHAR(20) NOT NULL,
telefono NUMBER(8) NOT NULL,
correo VARCHAR(30),
fecha_nacimiento DATE NOT NULL,
direccion VARCHAR(50) NOT NULL,
salario NUMBER(7) NOT NULL,
id_cliente NUMBER(5) NOT NULL,
id_metodopago NUMBER(5) NOT NULL,
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY(id_metodopago) REFERENCES metodopago(id_metodopago));

--------------------------------------------------------------------------------
-------------------------- Evento ----------------------------------------------
CREATE TABLE evento(
id_evento NUMBER(5) PRIMARY KEY NOT NULL,
tipo VARCHAR(15) NOT NULL,
descripcion VARCHAR(15) NOT NULL,
precio NUMBER(10) NOT NULL,
id_reservacion  NUMBER(5) NOT NULL,
id_sucursal NUMBER(5) NOT NULL,
FOREIGN KEY(id_reservacion) REFERENCES reservacion(id_reservacion),
FOREIGN KEY(id_sucursal) REFERENCES sucursal(id_sucursal));

--------------------------------------------------------------------------------
-------------------------- Evento Proveedor ------------------------------------
CREATE TABLE evento_proveedor(
id_eventoproveedor NUMBER(5) NOT NULL,
id_evento NUMBER(5) NOT NULL,
id_proveedor NUMBER(5) NOT NULL,
FOREIGN KEY(id_evento) REFERENCES evento(id_evento),
FOREIGN KEY(id_proveedor) REFERENCES proveedor(id_proveedor),
PRIMARY KEY (id_evento, id_proveedor));

--------------------------------------------------------------------------------
-------------------------- Bitacora --------------------------------------------
CREATE TABLE bitacora(
id_bitacora NUMBER(5) NOT NULL,
fecha DATE NOT NULL,
id_evento NUMBER(5) NOT NULL,
id_empleado NUMBER(5) NOT NULL,
FOREIGN KEY(id_evento) REFERENCES evento(id_evento),
FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado));

--------------------------------------------------------------------------------
-------------------------- Reservaciones Clientes -------------------------------
CREATE TABLE reservaciones_clientes(
id_reservacion_cliente NUMBER(5) NOT NULL,
id_reservacion NUMBER(5) NOT NULL,
id_cliente NUMBER(5) NOT NULL,
FOREIGN KEY(id_reservacion) REFERENCES reservacion(id_reservacion),
FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
PRIMARY KEY (id_reservacion, id_cliente));










