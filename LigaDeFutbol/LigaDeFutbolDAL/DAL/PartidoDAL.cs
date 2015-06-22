using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDAL
{
    public class PartidoDAL
    {
        public static ClubDTO buscarClubPorId(int idClub)
        {
            string consultaSql = @"SELECT * FROM club
                                WHERE idClub=@idClub";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);
            ClubDTO club = new ClubDTO();
            try
            {

                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue(@"idClub", idClub);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    club.idClub = int.Parse(dr["idClub"].ToString());
                    club.nombreClub = dr["nombreClub"].ToString();
                    club.calle = dr["calle"].ToString();
                    club.numeroCalle = int.Parse(dr["numeroCalle"].ToString());
                    club.fechaFundacion = DateTime.Parse(dr["fechaFundacion"].ToString());
                    club.participoAntesEnLiga = bool.Parse(dr["participoAntesEnLiga"].ToString());
                    club.idCancha = int.Parse(dr["idCancha"].ToString());
                }
                cnn.Close();

            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return club;
        }

    }
}
