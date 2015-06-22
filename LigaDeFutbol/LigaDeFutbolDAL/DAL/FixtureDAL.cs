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

        public static void insertarFecha(FechaCampeonato fechaCampeonato)
        {
            string consultaSql = @"INSERT INTO fecha_campeonato(idFechaCampeonato,numeroFecha,idCampeonato,fechaComienzo,idEstado)
                                VALUES(@idFecha,@num,@idCam,@fechaCom,@idEstado)";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue("@idFecha", fechaCampeonato.idFechaCampeonato);
                cmd.Parameters.AddWithValue("@num", fechaCampeonato.numeroFecha);
                cmd.Parameters.AddWithValue("@idCam", fechaCampeonato.idCampeonato);
                cmd.Parameters.AddWithValue("@fechaComienzo", fechaCampeonato.fechaComienzo);
                cmd.Parameters.AddWithValue("@idEstado", fechaCampeonato.idEstado);

                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            catch (Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al insertar una FechaCampeonato " + ex.ToString());
            }
        }

        //        public static void insertarPartido(PartidoDTO partido)
        //        {
        //            string consultaSql = @"INSERT INTO partido(idPartido,fechaPartido,horaPartido,idEstado,idClubLocal,idClubVisitante,golesLocal,golesVisitante,idFechaCa)
        //                                VALUES(@nomClub,@calle,@nroCalle,@fechaFun,@partAntes,@idCancha)";
        //            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

        //            try
        //            {
        //                cnn.Open();
        //                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
        //                //cmd.Parameters.AddWithValue("@idClub", club.idClub);
        //                cmd.Parameters.AddWithValue("@nomClub", partido.nombreClub);
        //                cmd.Parameters.AddWithValue("@calle", partido.calle);
        //                cmd.Parameters.AddWithValue("@nroCalle", partido.numeroCalle);
        //                cmd.Parameters.AddWithValue("@fechaFun", partido.fechaFundacion);
        //                cmd.Parameters.AddWithValue("@partAntes", Convert.ToInt32(partido.participoAntesEnLiga));
        //                cmd.Parameters.AddWithValue("@idCancha", partido.idCancha);

        //                cmd.ExecuteNonQuery();
        //                cnn.Close();
        //            }
        //            catch (Exception ex)
        //            {
        //                if (cnn.State == ConnectionState.Open)
        //                    cnn.Close();
        //                throw new ApplicationException("Error al insertar un Club " + ex.ToString());
        //            }
        //        }
    }
}
