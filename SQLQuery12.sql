create procedure _Eliminar(
@idProducto int
)
as
begin 
DELETE FROM  Productos WHERE idProducto = @idProducto;
end

