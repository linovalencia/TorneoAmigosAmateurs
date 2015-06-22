using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LigaDeFutbolDTO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace LigaDeFutbolDAL
{
    public class ResultadoPartidoDAL
    {
        public static List<FechaCampeonato> obtenerFechas()
        {
            List<FechaCampeonato> fechas = new List<FechaCampeonato>();
            string consultaSql=@"SELECT * FROM fecha_campeonato";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                FechaCampeonato f = new FechaCampeonato();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    f.idFechaCampeonato = int.Parse(dr["idFechaCampeonato"].ToString());
                    f.numeroFecha = int.Parse(dr["numeroFecha"].ToString());
                    f.idCampeonato = int.Parse(dr["idCampeonato"].ToString());
                    f.fechaComienzo = DateTime.Parse(dr["fechaComienzo"].ToString());
                    f.idEstado = int.Parse(dr["idEstado"].ToString());

                    fechas.Add(f);
                }
                cnn.Close();



            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return fechas;
        }

        public static void insertarResultados(FechaCampeonato fecha, List<PartidoDTO> Partidos)
        {
            string sqlConsulta = @"UPDATE fecha_campeonato
                                   SET idEstado=@idEstado
                                    WHERE idFechaCampeonato=@idFecha";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);
            SqlTransaction tran = null;
           

           try 
           {
               cnn.Open();
               tran = cnn.BeginTransaction();

               SqlCommand cmd = new SqlCommand(sqlConsulta, cnn, tran);
               cmd.Parameters.AddWithValue("@idEstado", fecha.idEstado);
               cmd.ExecuteNonQuery();
               
               foreach (PartidoDTO pa in Partidos)
               {
                   pa.idFechaCampeonato = fecha.idFechaCampeonato;
                   actualizarResultado(pa, cnn);                   
               }

               tran.Commit();
               cnn.Close();

             
           }
           catch (SqlException ex)
           {
               tran.Rollback();
               cnn.Close();     
               ex.ToString();
           }
       }

        public static void actualizarResultado(PartidoDTO partido, SqlConnection cnn)
        {
            string sqlConsulta = @"UPDATE partido
                                    SET idEstado=@estado
                                    , golesLocal=@local
                                    , golesVisitante=@visitante
                                    WHERE idPartido=@idPartido";


            try
            {
                cnn.Open();
                
                SqlCommand cmd = new SqlCommand(sqlConsulta, cnn);
                cmd.Parameters.AddWithValue(@"estado", partido.idPartido);
                cmd.Parameters.AddWithValue(@"local", partido.golesLocal);
                cmd.Parameters.AddWithValue(@"visitante", partido.golesVisitante);
                cnn.Close();
            }catch (Exception ex)
            {
                ex.ToString();
            }
        }
    }
}

