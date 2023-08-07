using System.Data.SqlClient;
using Dapper;

public class BD{
    public static string _connectionString = @"Server=localhost;DataBase=PreguntadORT;Trusted_Connection=true;";

    public static List<Categoria> ObtenerCategorias(){
        using (SqlConnection BD = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Categorias";
            return BD.Query<Categoria>(query).ToList();
        }
    }

        public static List<Dificultades> ObtenerDificultades(){
        using (SqlConnection BD = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Dificultades";
            return BD.Query<Dificultades>(query).ToList();
        }
        }
        public static List<Preguntas> ObtenerPreguntas(int IdCategoria, int IdDificultad){
        using (SqlConnection BD = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Preguntas";
            if(IdCategoria != -1 && IdDificultad == -1 ){
                query += "WHERE idCategoria = @zIdCategoria";
            }
            else if(IdCategoria == -1 && IdDificultad != -1 ){
                query += "WHERE idDificultad = @zIdDificultad";
            } else if (IdCategoria != -1 && IdDificultad != -1){
                query += "WHERE idCategoria = @zIdCategoria AND idDificultad = @zIdDificultad";
            }

            return BD.Query<Preguntas>(query,new{zIdCategoria=IdCategoria , zIdDificultad=IdDificultad}).ToList();
        }
    }

    public static List<Respuestas> ObtenerRespuestas(List<Preguntas> preguntas){
        List<Respuestas> respuestas= new List<Respuestas>();
        using (SqlConnection BD = new SqlConnection(_connectionString)){
        string query = "SELECT * FROM Respuestas WHERE idPregunta=@zidPregunta";
        foreach (Preguntas a in preguntas)
        {
            respuestas.AddRange(BD.Query<Respuestas>(query,new{zidPregunta=a.IdPregunta}).ToList());
        }
        }
        return respuestas;
    }

}