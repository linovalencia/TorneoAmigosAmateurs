using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using LigaDeFutbolDTO;

namespace LigaDeFutbolDAL
{
    public class InscripcionDAL
    {
        public static List<InscripcionDTO> obtenerInscripcion()
        {
            List<InscripcionDTO> inscripciones=new List<InscripcionDTO>();
            string consultaSql = "SELECT * FROM inscripcion";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                SqlDataReader dr = cmd.ExecuteReader();
                

                while (dr.Read())
                {
                    InscripcionDTO i=new InscripcionDTO();

                    i.idInscripcion = int.Parse(dr["idInscripcion"].ToString());
                    i.idClub = int.Parse(dr["idClub"].ToString());
                    i.idCampeonato = int.Parse(dr["idCampeonato"].ToString());
                    
                    i.fechaInscripcion = DateTime.Parse(dr["fechaInscripcion"].ToString());

                    inscripciones.Add(i);
                }
                cnn.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return inscripciones;
        }

        public static void insertarInscripcion(InscripcionDTO i, List<DetalleInscripcionDTO> detalles, List<JugadorDTO> jugadores)
        {
            string consultaSql = @"INSERT INTO inscripcion (idInscripcion, idClub, idCampeonato, fechaInscripcion)

                                  VALUES (@idIns, @idCl, @idCa, @fecha)";

            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);
            SqlTransaction tran = null;

            try
            {
                cnn.Open();
                tran = cnn.BeginTransaction();

                SqlCommand cmd = new SqlCommand(consultaSql, cnn, tran);

                actualizarNroInscripcion(cnn, tran);
                i.idInscripcion = obtenerID(cnn, tran);
                cmd.Parameters.AddWithValue("@idIns", i.idInscripcion);

                cmd.Parameters.AddWithValue("@idCl", i.idClub);
                cmd.Parameters.AddWithValue("@idCa", i.idCampeonato);
                cmd.Parameters.AddWithValue("@fecha", i.fechaInscripcion);
                cmd.ExecuteNonQuery();

                foreach (DetalleInscripcionDTO de in detalles)
                {
                    de.idInscripcion = i.idInscripcion;
                    DetalleInscripcionDAL.Insertar(de, cnn, tran);               
                    
                }
                foreach (JugadorDTO j in jugadores)
                {
                    JugadorDAL.InsertarJugador(j);
                

                }
                tran.Commit();
                cnn.Close();
            }
            catch (SqlException ex)
            {
                if (cnn.State == ConnectionState.Open)
                {
                    tran.Rollback();
                    cnn.Close();
                }

                throw new ApplicationException("Error al realizar la inscripción");

            }
            
        }

        public static void actualizarNroInscripcion(SqlConnection cn, SqlTransaction tran)
        {
            string sql = @"UPDATE idInscripcion 
                         SET idInscripcion = idInscripcion +1";
            SqlCommand cmd = new SqlCommand(sql, cn, tran);
            cmd.ExecuteNonQuery();
        }

        public static int obtenerID(SqlConnection cn, SqlTransaction tran)
        {
            int numero = 0;

            string sql = "SELECT idInscripcion FROM idInscripcion";

            SqlCommand cmd = new SqlCommand(sql, cn, tran);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
                numero = (int)dr["idInscripcion"];

            dr.Close();
            cmd.ExecuteNonQuery();


            return numero;
        }

      

        /*public static void eliminarInscripcion(int numeroInscripcion)
        {
            string consultaSql = "DELETE FROM inscripcion WHERE numeroInscripcion=@num";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);

                cmd.Parameters.AddWithValue("@num", numeroInscripcion);

                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }
        */
    }
}
