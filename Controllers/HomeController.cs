using Microsoft.AspNetCore.Mvc;

namespace TP07.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        Juego.InicializarJuego();
        return View();
    }

    public IActionResult ModificarCategoria(int cat){
        Categoria.categoriaSeleccionada=cat;
        List<Categoria> listaCategorias=BD.ObtenerCategorias();
        ViewBag.categorias = listaCategorias;
        List<Dificultades> listaDificultades=BD.ObtenerDificultades();
        ViewBag.dificultades = listaDificultades;
        return View("Configuracion");
        
    }

    public IActionResult ModificarDificultad(int dif){
        Dificultades.dificultadSeleccionada=dif;
        List<Categoria> listaCategorias=BD.ObtenerCategorias();
        ViewBag.categorias = listaCategorias;
        List<Dificultades> listaDificultades=BD.ObtenerDificultades();
        ViewBag.dificultades = listaDificultades;
        return View("Configuracion");

    }

    public IActionResult Configuracion()
    {
        List<Categoria> listaCategorias=BD.ObtenerCategorias();
        ViewBag.categorias = listaCategorias;
        List<Dificultades> listaDificultades=BD.ObtenerDificultades();
        ViewBag.dificultades = listaDificultades;
        return View();
    }
    public IActionResult Comenzar(string nombre){
        Juego.CargarPartida(nombre,Dificultades.dificultadSeleccionada,Categoria.categoriaSeleccionada);
        Console.WriteLine(nombre);

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
    public IActionResult Fin(){
        BD.AgregarPuntaje(Juego.puntajeActual,Juego.username);
        return View();
    }

    public IActionResult Puntajes(){
        int ultimoPuntaje = BD.ObtenerUltimoPuntaje();
        ViewBag.lstPuntajes = BD.ObtenerPuntajes();
        if (ultimoPuntaje != null)
        {
            ViewBag.ultimoPuntaje = ultimoPuntaje;
        }
        return View();
    }


}
