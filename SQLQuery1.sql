create procedure _Editar(
@idProducto int,
@tipoProducto varchar(250),
@NombreProducto varchar(250),
@claveProducto int,
@precioProducto int,
@razonSocialProvedor varchar(250)
)
as
begin 
update Productos set Tipodeproducto = @tipoProducto, Nombre = @NombreProducto, Clavedeproducto = @claveProducto, Precio = @precioProducto, Razón_social_proveedor = @razonSocialProvedor;
end