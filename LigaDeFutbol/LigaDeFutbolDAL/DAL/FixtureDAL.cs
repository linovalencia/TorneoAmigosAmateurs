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
        public static List<ClubDTO> buscarInscripcionesPorCampeonato(int idCampeonato)
        {
            string consultaSql = @"SELECT i.idClub, c.nombreClub FROM inscripcion i JOIN club c ON i.idClub=c.idClub
                                WHERE i.idCampeonato=@idCampeonato";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);
            List<ClubDTO> clubes = new List<ClubDTO>();
            try
            {

                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue(@"idCampeonato", idCampeonato);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    ClubDTO c = new ClubDTO();
                    c.idClub = int.Parse(dr["idClub"].ToString());
                    c.nombreClub = dr["nombreClub"].ToString();
                    clubes.Add(c);
                }
                cnn.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return clubes;
        }
    }
}
