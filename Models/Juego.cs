public class Juego{

   static public string username {get;set;}
   static public int puntajeActual {get;set;}
   static public int cantidadPreguntasCorrectas {get;set;}
   static public List<Preguntas> lstPreguntas {get;set;}
   static public List<Respuestas> lstRespuestas {get;set;}

    static public void InicializarJuego(){
    username="";
    puntajeActual=0;
    cantidadPreguntasCorrectas=0; 
   }
   
   static public List<Categoria> ObtenerCategorias(){
    return BD.ObtenerCategorias();
   }

   static public List<Dificultades> ObtenerDificultades(){
    return BD.ObtenerDificultades();
   }

   static public void CargarPartida(string username, int dificultad, int categoria){
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


   static public bool ComprobarRespuesta(int IdPregunta, int IdRespuesta){

      int dificultad;
      foreach (Preguntas p in lstPreguntas)
      {
         if (IdPregunta == p.IdPregunta)
         {
            lstPreguntas.Remove(p);
         }
      }
      foreach (Respuestas r in lstRespuestas)
      {
         if (IdRespuesta == r.IdRespuesta && r.correcta == true)
         {
            Console.WriteLine("true");
            return true;
         }
      }
      return false;
   }


}

