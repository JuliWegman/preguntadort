public class Juego{

   static public string username {get;set;}
   static public int puntajeActual {get;set;}
   static public List<Preguntas> lstPreguntas {get;set;}
   static public List<Respuestas> lstRespuestas {get;set;}

    static public void InicializarJuego(){
    username="";
    puntajeActual=0;
   }
   
   static public List<Categoria> ObtenerCategorias(){
    return BD.ObtenerCategorias();
   }

   static public List<Dificultades> ObtenerDificultades(){
    return BD.ObtenerDificultades();
   }

   static public void CargarPartida(string User, int dificultad, int categoria){
      username=User;
    lstPreguntas=BD.ObtenerPreguntas(categoria,dificultad);
    lstRespuestas=BD.ObtenerRespuestas(lstPreguntas);
   }

   static public Preguntas ObtenerProximaPregunta(){
    
        Random rnd = new Random();
        int randIndex = rnd.Next(lstPreguntas.Count);
        Preguntas proxima=lstPreguntas[randIndex];
            
    return proxima;
   }
   
   static public List<Respuestas> ObtenerProximasRespuestas(int IdPregunta){
      List <Respuestas> proximasRespuestas = new List<Respuestas>();
      
      foreach (Respuestas respuesta in lstRespuestas)
      {
         if (IdPregunta == respuesta.IdPregunta)
         {
            proximasRespuestas.Add(respuesta);
         }
      }
      return proximasRespuestas;
   }


   static public bool ComprobarRespuesta(int preg, int resp){

    Preguntas x=null;
      foreach(Preguntas p in lstPreguntas)
      {
         if (preg == p.IdPregunta)
         {
            x=p;
            
         }
      }
      lstPreguntas.Remove(x);
      foreach(Respuestas r in lstRespuestas)
      {
         if (resp == r.IdRespuesta && r.correcta == true)
         {
            Juego.puntajeActual +=5;
            Console.WriteLine("true");
            return true;
         }
      }
      return false;
   }


}

