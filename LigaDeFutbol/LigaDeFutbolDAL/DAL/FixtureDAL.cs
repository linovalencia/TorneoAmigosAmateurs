using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LigaDeFutbolDTO;
using System.Data;
using System.Data.SqlClient;

namespace LigaDeFutbolDAL
{
    public class FixtureDAL
    {
        public static List<InscripcionDTO> buscarInscripcionesPorCampeonato(int idCampeonato)
        {
            string consultaSql = @"SELECT * FROM inscripcion
                                WHERE idCampeonato=@idCampeonato";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);
            List<InscripcionDTO> inscripciones = new List<InscripcionDTO>();
            try
            {

                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue(@"idCampeonato", idCampeonato);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    InscripcionDTO ins = new InscripcionDTO();
                    ins.idInscripcion = int.Parse(dr["idInscripcion"].ToString());
                    ins.idClub = int.Parse(dr["idClub"].ToString());
                    ins.idCampeonato = int.Parse(dr["idCampeonato"].ToString());
                    ins.fechaInscripcion = DateTime.Parse(dr["fechaInscripcion"].ToString());
                    inscripciones.Add(ins);
                }
                cnn.Close();

            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return inscripciones;
        }
    }
}
