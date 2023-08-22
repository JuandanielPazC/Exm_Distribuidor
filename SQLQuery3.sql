create procedure _BusquedaA(
@idProducto int,
@tipoProducto varchar(250),
@claveProducto int
)
as
begin 
select * from Productos where Tipodeproducto = @tipoProducto AND Clavedeproducto = @claveProducto;
end
