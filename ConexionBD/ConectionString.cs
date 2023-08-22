using System.Data.SqlClient;

namespace Examen_Distribuidora.ConexionBD
{
    public class ConectionString
    {
        private string conexionAsql = string.Empty;
        public ConectionString()
        {
            var builder = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();

            conexionAsql = builder.GetSection("ConnectionStrings:conexionAbasededatos").Value;

        }
        public string getconexionAsql()
        {
            return conexionAsql;
        }



    }
}
