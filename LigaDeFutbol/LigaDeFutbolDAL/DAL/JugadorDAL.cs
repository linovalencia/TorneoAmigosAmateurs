using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LigaDeFutbolDTO;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LigaDeFutbolDAL
{
    public class JugadorDAL
    {

        public static List<JugadorDTO> obtenerJugadores()
        {
            List<JugadorDTO> jugadores = new List<JugadorDTO>();
            string consultaSQL = "SELECT * FROM Jugador";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSQL, cnn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    JugadorDTO j = new JugadorDTO();

                    j.idJugador = int.Parse(dr["idJugador"].ToString());
                    j.idTipoDocumento = int.Parse(dr["idTipoDocumento"].ToString());
                    j.numeroDocumento = int.Parse(dr["numeroDocumento"].ToString());
                    j.nombre = dr["nombre"].ToString();
                    j.apellido = dr["apellido"].ToString();
                    j.fechaNacimiento = DateTime.Parse(dr["fechaNacimiento"].ToString());
                    j.disponibleParaFecha = bool.Parse(dr["disponibleParaFecha"].ToString());

                    jugadores.Add(j);
                }
                cnn.Close();
            }


            catch (SqlException ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al buscar los Jugadores " + ex.ToString());

            }
            return jugadores;
        }

        public static JugadorDTO buscarJugadorPorId(int idJugador)
        {
            string consultaSql = @"SELECT * FROM Jugador
                                WHERE idJugador=@idJugador";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);
            JugadorDTO j = new JugadorDTO();
            try
            {

                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue(@"idJugador", idJugador);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    j.idJugador = int.Parse(dr["idJugador"].ToString());
                    j.idTipoDocumento = int.Parse(dr["idTipoDocumento"].ToString());
                    j.numeroDocumento = int.Parse(dr["numeroDocumento"].ToString());
                    j.nombre = dr["nombre"].ToString();
                    j.apellido = dr["apellido"].ToString();
                    j.fechaNacimiento = DateTime.Parse(dr["fechaNacimiento"].ToString());
                    j.disponibleParaFecha = bool.Parse(dr["disponibleParaFecha"].ToString());
                }
                cnn.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return j;
        }

        public static void InsertarJugador(JugadorDTO jugador)
        {
            string consultaSql = @"INSERT INTO jugador(idTipoDocumento,numeroDocumento,nombre,apellido,fechaNacimiento,disponibleParaFecha)
                                VALUES(@idTipoDoc,@nroDoc,@nombre,@apellido,@fechaNac,@dispParaFecha)";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);

                //cmd.Parameters.AddWithValue("@idJugador", jugador.idJugador);
                cmd.Parameters.AddWithValue("@idTipoDoc", jugador.idTipoDocumento);
                cmd.Parameters.AddWithValue("@nroDoc", jugador.numeroDocumento);
                cmd.Parameters.AddWithValue("@nombre", jugador.nombre);
                cmd.Parameters.AddWithValue("@apellido", jugador.apellido);
                cmd.Parameters.AddWithValue("@fechaNac", jugador.fechaNacimiento);
                cmd.Parameters.AddWithValue("@dispParaFecha", jugador.disponibleParaFecha);


                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            catch (Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al insertar un Jugador " + ex.ToString());
            }
        }

        public static void eliminarJugador(int idJugador)
        {
            string consultaSql = @"DELETE FROM jugador
                                    WHERE idJugador=@idJugador";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue("@idJugador", idJugador);
                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            catch (Exception e)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al eliminar el Jugador " + e.ToString());
            }
        }

        public static void actualizarJugador(JugadorDTO jugador)
        {
            string consultaSql =
                @"UPDATE jugador 
                 SET idTipoDocumento=@idTipoDoc
                    , numeroDocumento=@nroDoc
                    , nombre=@nom
                    , apellido=@ape
                    , fechaNacimiento=@fechaNac                    
                    , disponibleParaFecha=@dispParaFecha
                 WHERE idJugador=@idJugador";

            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);


                cmd.Parameters.AddWithValue("@idTipoDoc", jugador.idTipoDocumento);
                cmd.Parameters.AddWithValue("@nroDoc", jugador.numeroDocumento);
                cmd.Parameters.AddWithValue("@nom", jugador.nombre);
                cmd.Parameters.AddWithValue("@ape", jugador.apellido);
                cmd.Parameters.AddWithValue("@fechaNac", jugador.fechaNacimiento);
                cmd.Parameters.AddWithValue("@dispParaFecha", jugador.disponibleParaFecha);
                cmd.Parameters.AddWithValue("@idJugador", jugador.idJugador);

                cmd.ExecuteNonQuery();
                cnn.Close();

            }
            catch (Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al modificar el Jugador " + ex.ToString());
            }
        }

        public static int obtenerIdJugador()
        {
            int idJugador = 0;
            string consultaSql = "SELECT MAX(idJugador) as id FROM jugador";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();

                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                idJugador = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return idJugador;
        }









       /* internal static void Insertar(JugadorDTO jugador, SqlConnection cn, SqlTransaction tran)
        {
            string consultaSql = @"INSERT INTO jugador(idTipoDocumento,numeroDocumento,nombre,apellido,fechaNacimiento)
                                   VALUES(@idTipo,@nroDoc,@nomJug,@apeJug,@fechaNac)";

            SqlCommand cmd = new SqlCommand(consultaSql, cn, tran);

            cmd.Parameters.AddWithValue("@idTipo", jugador.idTipoDocumento);
            cmd.Parameters.AddWithValue("@nroDoc", jugador.numeroDocumento);
            cmd.Parameters.AddWithValue("@nomJug", jugador.nombre);
            cmd.Parameters.AddWithValue("@apeJug", jugador.apellido);
            cmd.Parameters.AddWithValue("@fechaNac", jugador.fechaNacimiento);
            

            //jugador.idInscripcion = Convert.ToInt32(cmd.ExecuteScalar());
        }*/
    }
}
