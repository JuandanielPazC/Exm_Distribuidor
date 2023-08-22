using Examen_Distribuidora.Models;
using System.Data.SqlClient;
using Examen_Distribuidora.ConexionBD;
using System.Data;



namespace Examen_Distribuidora.ConexionBD
{
    public class Conection
    {
        public List<Parametros_Entrada> Consultar()
        {
            var lect = new List<Parametros_Entrada>();

            var conecT = new ConectionString();

            using (var conex = new SqlConnection(conecT.getconexionAsql()))
            {
                conex.Open();

                SqlCommand cmd = new SqlCommand("_CONSULTAR", conex);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var lecturaLista = cmd.ExecuteReader())
                {
                    while (lecturaLista.Read())
                    {
                        lect.Add(new Parametros_Entrada()
                        {
                            idProducto = Convert.ToInt32(lecturaLista["idProducto"]),
                            tipoProducto = lecturaLista["Tipodeproducto"].ToString(),
                            NombreProducto = lecturaLista["Nombre"].ToString(),
                            claveProducto = Convert.ToInt32(lecturaLista["Clavedeproducto"]),
                            precioProducto = Convert.ToInt32(lecturaLista["Precio"]),
                            razonSocialProvedor = lecturaLista["Razón_social_proveedor"].ToString(),
                        });
                    }
                }

            }
            return lect;
        }

        public bool Agregar(Parametros_Entrada parametros_Entrada)
        {
            bool a;
            try
            {
                var conecT = new ConectionString();

                using (var conex = new SqlConnection(conecT.getconexionAsql()))
                {
                    conex.Open();

                    SqlCommand cmd = new SqlCommand("_AGREGAR", conex);
                    cmd.Parameters.AddWithValue("tipoProducto", parametros_Entrada.tipoProducto);
                    cmd.Parameters.AddWithValue("NombreProducto", parametros_Entrada.NombreProducto);
                    cmd.Parameters.AddWithValue("claveProducto", parametros_Entrada.claveProducto);
                    cmd.Parameters.AddWithValue("precioProducto", parametros_Entrada.precioProducto);
                    cmd.Parameters.AddWithValue("razonSocialProvedor", parametros_Entrada.razonSocialProvedor);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();

                }
                a = true;

            }
            catch (Exception e)
            {
                string ermsg = e.Message;
                a = false;
            }

            return a;

        }

        public Parametros_Entrada Obtener(int idProducto)
        {
            var nuevo = new Parametros_Entrada();

            var conecT = new ConectionString();

            using (var conex = new SqlConnection(conecT.getconexionAsql()))
            {
                conex.Open();

                SqlCommand cmd = new SqlCommand("_Obtener", conex);
                cmd.Parameters.AddWithValue("idProducto", idProducto);
                cmd.CommandType = CommandType.StoredProcedure;

                using (var lecturaLista = cmd.ExecuteReader())
                {
                    while (lecturaLista.Read())
                    {
                        nuevo.idProducto = Convert.ToInt32(lecturaLista["idProducto"]);
                        nuevo.tipoProducto = lecturaLista["Tipodeproducto"].ToString();
                        nuevo.NombreProducto = lecturaLista["Nombre"].ToString();
                        nuevo.claveProducto = Convert.ToInt32(lecturaLista["Clavedeproducto"]);
                        nuevo.precioProducto = Convert.ToInt32(lecturaLista["Precio"]);
                        nuevo.razonSocialProvedor = lecturaLista["Razón_social_proveedor"].ToString();

                    }
                }

            }
            return nuevo;
        }

        public bool Eliminar(int idProducto)
        {
            bool a;
            try
            {
                var conecT = new ConectionString();

                using (var conex = new SqlConnection(conecT.getconexionAsql()))
                {
                    conex.Open();

                    SqlCommand cmd = new SqlCommand("_Eliminar", conex);
                    cmd.Parameters.AddWithValue("idProducto", idProducto);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();

                }
                a = true;

            }
            catch (Exception e)
            {
                string ermsg = e.Message;
                a = false;
            }

            return a;
        }

        public bool Editar(Parametros_Entrada parametros)
        {
            bool a;
            try
            {
                var conecT = new ConectionString();

                using (var conex = new SqlConnection(conecT.getconexionAsql()))
                {
                    conex.Open();

                    SqlCommand cmd = new SqlCommand("_Editar", conex);
                    cmd.Parameters.AddWithValue("idProducto", parametros.idProducto);
                    cmd.Parameters.AddWithValue("tipoProducto", parametros.tipoProducto);
                    cmd.Parameters.AddWithValue("NombreProducto", parametros.NombreProducto);
                    cmd.Parameters.AddWithValue("claveProducto", parametros.claveProducto);
                    cmd.Parameters.AddWithValue("precioProducto", parametros.precioProducto);
                    cmd.Parameters.AddWithValue("razonSocialProvedor", parametros.razonSocialProvedor);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.ExecuteNonQuery();

                }
                a = true;

            }
            catch (Exception e)
            {
                string ermsg = e.Message;
                a = false;
            }

            return a;
        }



    }
}
