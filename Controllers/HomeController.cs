using Microsoft.AspNetCore.Mvc;

namespace TP07.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ModificarCategoria(int cat){
        Categoria.categoriaSeleccionada=cat;
        return RedirectToAction("Configuracion");
        Console.WriteLine(cat);
    }

    public IActionResult ModificarDificultad(int dif){
        Dificultades.dificultadSeleccionada=dif;
        return RedirectToAction("Configuracion");
        Console.WriteLine(dif);

    }

    public IActionResult Configuracion()
    {
        Juego.InicializarJuego();
        List<Categoria> listaCategorias=BD.ObtenerCategorias();
        ViewBag.categorias = listaCategorias;
        foreach (Categoria item in listaCategorias)
        {
            Console.WriteLine(item.Nombre);
        }
        return View();
    }
    public IActionResult Comenzar(string username){
        Juego.CargarPartida(username,Dificultades.dificultadSeleccionada,Categoria.categoriaSeleccionada);

        if(Juego.lstPreguntas.Count()!=0){
        return RedirectToAction("Jugar");
        }else{
        return RedirectToAction("Configuracion");
        }
    }
    public IActionResult Jugar(){

        if(Juego.lstPreguntas.Count()!=0){
        Preguntas prox =Juego.ObtenerProximaPregunta();
        List<Respuestas> listaRespuestas=Juego.ObtenerProximasRespuestas(prox.IdPregunta);
        ViewBag.preg=prox;
        ViewBag.resp=listaRespuestas;
        return View();
        }else{
        return RedirectToAction("Fin");
        }
    }
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
        ViewBag.gano=Juego.ComprobarRespuesta(idPregunta,idRespuesta);
        return View("Respuesta");
    }

    public IActionResult IngresarNombre(){
        return View("");
    }


}
