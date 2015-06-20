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
    }
}
