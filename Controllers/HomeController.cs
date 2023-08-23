using Microsoft.AspNetCore.Mvc;

namespace TP07.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        Console.WriteLine(Categoria.categoriaSeleccionada);
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
    public IActionResult Comenzar(string username){
        Console.WriteLine(Dificultades.dificultadSeleccionada);
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
        Console.WriteLine(prox.IdPregunta);
        List<Respuestas> listaRespuestas=Juego.ObtenerProximasRespuestas(prox.IdPregunta);
        ViewBag.preg=prox;
        ViewBag.resp=listaRespuestas;
        Console.WriteLine(listaRespuestas.Count());
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
        return View();
    }

    public IActionResult Puntajes(){


        return View();
    }


}
