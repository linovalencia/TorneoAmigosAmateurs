using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LigaDeFutbolDTO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace LigaDeFutbolDAL
{
    public class EstadoFechaDAL
    {

        public static List<EstadoDTO> obtenerEstadoFecha()
        {
            List<EstadoDTO> estados = new List<EstadoDTO>();
            string consultaSql = "SELECT * FROM estado_fecha";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);




            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                SqlDataReader dr = cmd.ExecuteReader();



                while (dr.Read())
                {
                    EstadoDTO e = new EstadoDTO();
                    e.idEstado = int.Parse(dr["idEstadoFecha"].ToString());
                    e.descripcion = dr["descripcion"].ToString();
                    estados.Add(e);
                }
                cnn.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return estados;
        }

    


    }
}
