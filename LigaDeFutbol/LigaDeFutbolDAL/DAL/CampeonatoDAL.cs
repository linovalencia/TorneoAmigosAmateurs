using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LigaDeFutbolDTO;
using System.Data.SqlClient;
using System.Data;

namespace LigaDeFutbolDAL
{
    public class CampeonatoDAL
    {
        public static List<CampeonatoDTO> obtenerCampeonatos()
        {
            List<CampeonatoDTO> campeonatos = new List<CampeonatoDTO>();
            string consultaSQL = "SELECT * FROM campeonato";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSQL, cnn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    CampeonatoDTO c = new CampeonatoDTO();
                    c.idCampeonato = int.Parse(dr["idCampeonato"].ToString());
                    c.nombre = dr["nombre"].ToString();
                    c.fechaInicio = DateTime.Parse(dr["fechaInicio"].ToString());
                    c.fechaFin = DateTime.Parse(dr["fechaFin"].ToString());
                    c.idEstadoCampeonato = int.Parse(dr["idEstadoCampeonato"].ToString());
                    c.puntosPartidoGanado = int.Parse(dr["puntosPartidoGanado"].ToString());
                    c.puntosPartidoEmpatado = int.Parse(dr["puntosPartidoEmpatado"].ToString());
                    c.fechaLimiteInscripcion = DateTime.Parse(dr["fechaLimiteInscripcion"].ToString());
                    
                   

                    campeonatos.Add(c);
                }
                cnn.Close();
            }


            catch (SqlException ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al buscar los campeonatos " + ex.ToString());

            }
            return campeonatos;
        }

        public static CampeonatoDTO buscarCampeonatosPorId(int idCampeonato)
        {
            string consultaSql = @"SELECT * FROM campeonato
                                WHERE idCampeonato=@idCampeonato";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);
            CampeonatoDTO camp = new CampeonatoDTO();
            try
            {

                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue(@"idCampeonato", idCampeonato);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    camp.idCampeonato = int.Parse(dr["idCampeonato"].ToString());
                    camp.nombre = dr["nombre"].ToString();
                    camp.fechaInicio = DateTime.Parse(dr["fechaInicio"].ToString());
                    camp.fechaFin = DateTime.Parse(dr["fechaFin"].ToString());
                    camp.idEstadoCampeonato = int.Parse(dr["idEstadoCampeonato"].ToString());
                    camp.puntosPartidoGanado = int.Parse(dr["puntosPartidoGanado"].ToString());
                    camp.puntosPartidoEmpatado = int.Parse(dr["puntosPartidoEmpatado"].ToString());
                    camp.fechaLimiteInscripcion = DateTime.Parse(dr["fechaLimiteInscripcion"].ToString());
                }
                cnn.Close();

            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return camp;
        }
    }
}
