drop database if exists vic;
create database vic;
use vic;

CREATE TABLE clientes (

    Id_clien INT AUTO_INCREMENT PRIMARY KEY,

    Nom VARCHAR(50),

    Tel INT

);


CREATE TABLE stock (

    Id_stock INT AUTO_INCREMENT PRIMARY KEY,

    Producto VARCHAR(50),

    Cantidad INT

);


CREATE TABLE pedidos (

    Id_pedido INT AUTO_INCREMENT,

    Producto VARCHAR(50),

    Cantidad INT,

    Fecha DATE,

    Id_stock INT,

    Id_clien INT,

    PRIMARY KEY(Id_pedido, Id_clien, Id_stock),

    FOREIGN KEY (Id_clien) REFERENCES clientes(Id_clien),

    FOREIGN KEY (Id_stock) REFERENCES stock(Id_stock)

);


CREATE TABLE facturas (

    Id_fac INT AUTO_INCREMENT PRIMARY KEY,

    Monto INT,

    Fecha DATE,

    Id_pedido INT,

    FOREIGN KEY (Id_pedido) REFERENCES pedidos(Id_pedido)

);


CREATE TABLE recibos (

    Id_rec INT AUTO_INCREMENT PRIMARY KEY,

    Monto INT,

    Fecha DATE,

    Id_fac INT,

    FOREIGN KEY (Id_fac) REFERENCES facturas(Id_fac)

);


CREATE TABLE remitos (

    Id_rem INT AUTO_INCREMENT PRIMARY KEY,

    Fecha DATE,

    Id_fac INT,

    Id_rec INT,

    Id_stock INT,

    FOREIGN KEY (Id_fac) REFERENCES facturas(Id_fac),

    FOREIGN KEY (Id_rec) REFERENCES recibos(Id_rec),

    FOREIGN KEY (Id_stock) REFERENCES stock(Id_stock)

);