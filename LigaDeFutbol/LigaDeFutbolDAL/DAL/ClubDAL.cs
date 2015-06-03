using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LigaDeFutbolDTO.Entidad;
using System.Data;
using System.Data.SqlClient;

namespace LigaDeFutbolDAL.DAL
{
    public class ClubDAL
    {
        public static List<ClubDTO> obtenerClubes() 
        { 
            List<ClubDTO> club= new List<ClubDTO>();
            string consultaSql = "SELECT * FROM club";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try 
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read()) 
                {
                    ClubDTO c = new ClubDTO();
                    c.idClub = int.Parse(dr["idClub"].ToString());
                    c.nombreClub = dr["nombreClub"].ToString();
                    c.calle = dr["calle"].ToString();
                    c.numeroCalle = int.Parse(dr["numeroCalle"].ToString());
                    c.fechaFundacion = DateTime.Parse(dr["fechaFundacion"].ToString());
                    c.participoAntesEnLiga = bool.Parse(dr["participoAntesEnLiga"].ToString());
                    c.idCancha = int.Parse(dr["idCancha"].ToString());

                    club.Add(c);   
                }
                cnn.Close();
            }catch(Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al buscar los Clubes " + ex.ToString());
            }
            
            
            return club;
        }

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

            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return club;
        }

        public static void insertarClub(ClubDTO club) 
        {
            string consultaSql = @"INSERT INTO club(nombreClub,calle,numeroCalle,fechaFundacion,participoAntesEnLiga,idCancha)
                                VALUES(@nomClub,@calle,@nroCalle,@fechaFun,@partAntes,@idCancha)";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                //cmd.Parameters.AddWithValue("@idClub", club.idClub);
                cmd.Parameters.AddWithValue("@nomClub", club.nombreClub);
                cmd.Parameters.AddWithValue("@calle", club.calle);
                cmd.Parameters.AddWithValue("@nroCalle", club.numeroCalle);
                cmd.Parameters.AddWithValue("@fechaFun", club.fechaFundacion);
                cmd.Parameters.AddWithValue("@partAntes", Convert.ToInt32(club.participoAntesEnLiga));
                cmd.Parameters.AddWithValue("@idCancha", club.idCancha);

                cmd.ExecuteNonQuery();
                cnn.Close(); 
            }
            catch (Exception ex) 
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al insertar un Club " + ex.ToString());
            }
        }

        public static void eliminarClub(int idClub) 
        {
            string consultaSql = @"DELETE FROM club
                                 WHERE idClub=@idClub";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue("@idClub", idClub);
                cmd.ExecuteNonQuery();
                cnn.Close();

            }
            catch (Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al eliminar un Club " + ex.ToString());
            }
        }

        public static void actualizarClub(ClubDTO club)
        {
            string consultaSql =
                @"UPDATE club 
                 SET nombreClub=@nom
                    , calle=@calle
                    , numeroCalle=@nroCalle
                    , fechaFundacion=@fechaFun
                    , participoAntesEnLiga=@participoAntes
                    , idCancha=@idCancha
                 WHERE  idClub=@idClub";

            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                //cmd.Parameters.AddWithValue("@idClub", club.idClub);
                cmd.Parameters.AddWithValue("@nom", club.nombreClub);
                cmd.Parameters.AddWithValue("@calle", club.calle);
                cmd.Parameters.AddWithValue("@nroCalle",club.numeroCalle);
                cmd.Parameters.AddWithValue("@fechaFun", club.fechaFundacion);
                cmd.Parameters.AddWithValue("@participoAntes", Convert.ToInt32(club.participoAntesEnLiga));
                cmd.Parameters.AddWithValue("@idCancha", club.idCancha);

                cmd.ExecuteNonQuery();
                cnn.Close();

            }
            catch (Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al modificar el Club " + ex.ToString());
            }
        }
    }
}
