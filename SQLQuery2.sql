
create procedure _AGREGAR(
@tipoProducto varchar(250),
@NombreProducto varchar(250),
@claveProducto int,
@precioProducto int,
@razonSocialProvedor varchar(250)
)
as
begin 
insert into Productos(Tipodeproducto, Nombre, Clavedeproducto, Precio, Razón_social_proveedor) values (@tipoProducto, @NombreProducto, @claveProducto, @precioProducto, @razonSocialProvedor)
end

create procedure _CONSULTAR
as
begin
select * from Productos;
end