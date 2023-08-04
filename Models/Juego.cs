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
    
   }
}