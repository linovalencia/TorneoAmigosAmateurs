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

        public static List<PartidoDTO> obtenerPartidosDeFechaXPorId(int id)
        {
            List<PartidoDTO> partidos = new List<PartidoDTO>();
            //            string consultaSql = @"SELECT fc.numeroFecha,p.idPartido,p.idEstado,cl.nombreClub as 'nombreLocal', cv.nombreClub as 'nombreVisitante' 
            //                                 FROM fecha_campeonato fc INNER JOIN partido p ON fc.idFechaCampeonato=p.idFechaCampeonato
            //                                 INNER JOIN club cl ON p.idClubLocal=cl.idClub INNER JOIN club cv ON p.idClubVisitante=cv.idClub
            //                                        WHERE fc.idFechaCampeonato=@id";
            string consultaSql = @"SELECT * partido
                                WHERE idFechaCampeonato=@id";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();

                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue(@"idFechaCampeonato", id);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    PartidoDTO p = new PartidoDTO();
                    p.idPartido = int.Parse(dr["idPartido"].ToString());
                    p.fechaPartido = DateTime.Parse(dr["fechaPartido"].ToString());
                    p.horaPartido = DateTime.Parse(dr["horaPartido"].ToString());
                    p.idEstado = int.Parse(dr["idEstado"].ToString());
                    p.idClubLocal = int.Parse(dr["idClubLocal"].ToString());
                    p.idClubVisitante = int.Parse(dr["idClubVisitante"].ToString());
                    p.golesLocal = int.Parse(dr["golesLocal"].ToString());
                    p.golesVisitante = int.Parse(dr["golesVisitante"].ToString());
                    p.idFechaCampeonato = int.Parse(dr["idFechaCampeonato"].ToString());
                    p.descripcion = dr["descripcion"].ToString();
                    p.idCampeonato = int.Parse(dr["idCampeonato"].ToString());
                    partidos.Add(p);
                }
                cnn.Close();



            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return partidos;
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

