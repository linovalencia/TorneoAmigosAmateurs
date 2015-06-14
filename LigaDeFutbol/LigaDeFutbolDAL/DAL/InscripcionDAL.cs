using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using LigaDeFutbolDTO;

namespace LigaDeFutbolDAL.DAL
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
                    i.idClub = int.Parse(dr["idClub"].ToString());
                    i.idCampeonato = int.Parse(dr["idCampeonato"].ToString());
                    i.numeroInscripcion = int.Parse(dr["numeroInscripcion"].ToString());
                    i.fechaInscripcion = DateTime.Parse(dr["fechaInscripcion"].ToString());
                    i.idDetalleInscripcion = int.Parse(dr["idDetalleInscripcion"].ToString());
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

        public static void insertarInscripcion(InscripcionDTO i)
        {
            string consultaSql = @"INSERT INTO inscripcion (idClub, idCampeonato, numeroInscripcion, fechaInscripcion, idDetalleInscripcion)
                                  VALUES (@idCl, @idCa, @num, @fecha, @idDe)";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);

                cmd.Parameters.AddWithValue("@idCl", i.idClub);
                cmd.Parameters.AddWithValue("@idCa", i.idCampeonato);
                cmd.Parameters.AddWithValue("@num", i.numeroInscripcion);
                cmd.Parameters.AddWithValue("@fecha", i.fechaInscripcion);
                cmd.Parameters.AddWithValue("@idDe", i.idDetalleInscripcion);

                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
        }

        public static void eliminarInscripcion(int numeroInscripcion)
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
    }
}
