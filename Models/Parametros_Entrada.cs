using System.ComponentModel.DataAnnotations;

namespace Examen_Distribuidora.Models
{
    public class Parametros_Entrada
    {
        public int idProducto { get; set; }

        public string? tipoProducto { get; set; }

        public string? NombreProducto { get; set; }

        public int claveProducto { get; set; }

        public int precioProducto { get; set; }

        public string? razonSocialProvedor { get; set; }
    }
}
