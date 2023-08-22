using Microsoft.AspNetCore.Mvc;
using System.Data;
using Examen_Distribuidora.ConexionBD;
using Examen_Distribuidora.Models;

namespace Examen_Distribuidora.Controllers
{
    public class EventosUsuariosController : Controller
    {
        Conection _Conection = new Conection();
        public IActionResult Consultar()
        {
            var spC = _Conection.Consultar();
            return View(spC);
        }

       
        public IActionResult Agregar()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Agregar(Parametros_Entrada sP_02)
        {
            if (!ModelState.IsValid)
                return View();
            var ans = _Conection.Agregar(sP_02);
            if (ans)
                return RedirectToAction("Consultar");
            else
                return View();
        }
        public IActionResult Editar(int idProducto)
        {
            var edt = _Conection.Obtener(idProducto);
            return View(edt);
        }

        [HttpPost]
        public IActionResult Editar(Parametros_Entrada edt)
        {
            if (!ModelState.IsValid)
                return View();
            var ans = _Conection.Editar(edt);
            if (ans)
                return RedirectToAction("Consultar");
            else
                return View();
        }


        public IActionResult Eliminar(int idProducto)
        {
            var eliM = _Conection.Eliminar(idProducto);
            return RedirectToAction("Consultar");
        }

    }
}
