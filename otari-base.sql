drop database if exists otariB;
create database otariB;
use otariB;

create table Usuario(idUsuario int(6) auto_increment primary key, tipo varchar(20), nombre varchar(20), edad varchar(2), direccion varchar(30), 
contra varchar(50), correo varchar(40));

create table Menu(idMe int(3) auto_increment primary key, entrada varchar(20), aperitivo varchar(20)
, principal varchar(20), postre varchar(20), bebidas varchar(20));

create table Musica(idMu int(3) auto_increment primary key, genero varchar(20), personal varchar(20));

create table Decoracion(idProd int(4) auto_increment primary key, nombre varchar(50), precio float(6), descripcion varchar(50));

create table OtrosServicos(idOS int(4) auto_increment primary key, nombre varchar(50), precio float(6), descripción varchar(100));
 
create table Evento(idEvento int(4) auto_increment primary key, idUcreador int(6), fechaRegistro TIMESTAMP 
DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, nombre varchar(30),
fechaEvento datetime, lugar varchar(50), tipo varchar(20), invitados int(4), idMenu int(3), Hora nvarchar(5), 
idMusica int(3), foreign key (idMenu) references Menu(idMe), foreign key(idMusica) 
references Musica(idMu));

drop procedure if exists AgregarUsuario;
delimiter //
create procedure AgregarUsuario(
in tip varchar(20), nom varchar(20), año varchar(2), direc varchar(30), con varchar(50), cor varchar(40))
begin
/*if(nom=" " ||*/
insert into Usuario(tipo, nombre, edad, direccion, contra, correo) values (tip, nom, año, direc, md5(con), cor);
end //
delimiter ;

drop procedure if exists AgregarOtrosSercicios;
delimiter //
create procedure AgregarOS(nom varchar(50),prec float(6), descri varchar(100) )
begin
insert into OtrosServicios(mombre, precio, descripcion) values (nom, prec, descri);
end//
delimiter;

drop procedure if exists AgregarEvento;
delimiter //
create procedure AgregarEvento(nombre varchar(30),lug varchar(50), tip varchar(20), inv int(4) , fechaEvento datetime , Hora nvarchar (5) )
begin
insert into Evento(nombre,lugar, tipo, invitados , fechaEvento ,  Hora ) values (nombre,lug, tip, inv , fechaEvento , Hora);
end //
delimiter ;

drop procedure if exists AgregarMusica;
delimiter //
create procedure AgregarMusica(gen varchar(20), per varchar(20))
begin
insert into Musica(genero, personal) values (gen, per);
end //

delimiter ;

drop procedure if exists AgregarMenu;
delimiter //
create procedure AgregarMenu(ent varchar(20), ape varchar(20), prin varchar(20), pos varchar(20), beb varchar(20))
begin
insert into Menu(entrada, aperitivo, principal, postre, bebidas) values (ent, ape, prin, pos, beb);
end //
delimiter ;
 
drop procedure if exists AgregarProd;
delimiter //
create procedure AgregarProd(nom varchar(50), pres float(6), descr varchar(50))
begin
insert into Decoracion(nombre, precio, descripcion) values (nom, pres, descr);
end //
delimiter ;

call AgregarUsuario('Administrador','Edgar',17,'Av. 679 no. 65', 'wasa', 'edgar_a_villa@hotmail.com');
call AgregarUsuario('Administrador','Diego',17,'no se','wase','no se');
call AgregarUsuario('Administrador','Ximi',17,'no se','wasi','no se');
call AgregarUsuario('Administrador','Raul',17,'no se','waso','no se');
call AgregarUsuario('Cliente','Chucho', 19,'Av. de los prados', 'wasu','chucho678@hotmail.com');

call AgregarMusica('bachata', 'un wey');
call AgregarMusica('Rock', 'otro wey');
call AgregarMusica('Banda', 'ese wey');
call AgregarMusica('Electronica', 'ese otro wey');

call AgregarMenu('ensalada', 'canapes', 'pavo', 'pastel', 'vino');
call AgregarMenu('sopa', 'mini-sanwiches', 'res', 'fruta en almivar', 'Agua');
call AgregarMenu('fruta', 'rollitos de jamon', 'huevo', 'yougurt', 'jugo');

select * from Usuario;
select * from Evento;


call AgregarUsuario('tipo','nombre','d', 'd','d', 'd');

select * from Menu;
select * from Decoracion;