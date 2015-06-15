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
    public class ArbitroDAL
    {

        public static List<ArbitroDTO> obtenerArbitro()
        {
            List<ArbitroDTO> arbitros = new List<ArbitroDTO>();
            string consultaSQL = "SELECT * FROM Arbitro";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);


            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSQL, cnn);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    ArbitroDTO ar = new ArbitroDTO();
                    ar.idArbitro = int.Parse(dr["idArbitro"].ToString());
                    ar.idTipoDocumento = int.Parse(dr["idTipoDocumento"].ToString());
                    ar.numeroDocumento = int.Parse(dr["numeroDocumento"].ToString());
                    ar.nombre = dr["nombre"].ToString();
                    ar.apellido = dr["apellido"].ToString();
                    ar.fechaNacimiento = DateTime.Parse(dr["fechaNacimiento"].ToString());
                    ar.disponibleParaFecha = bool.Parse(dr["disponibleParaFecha"].ToString());

                    arbitros.Add(ar);
                }
                cnn.Close();
            }


            catch (SqlException ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al buscar los Arbitros " + ex.ToString());

            }
            return arbitros;
        }

        public static ArbitroDTO buscarArbitroPorId(int idArbitro)
        {
            string consultaSql = @"SELECT * FROM arbitro
                                WHERE idArbitro=@idArbitro";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);
            ArbitroDTO a = new ArbitroDTO();
            try
            {

                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue(@"idArbitro", idArbitro);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    a.idArbitro = int.Parse(dr["idArbitro"].ToString());
                    a.idTipoDocumento = int.Parse(dr["idTipoDocumento"].ToString());
                    a.numeroDocumento = int.Parse(dr["numeroDocumento"].ToString());
                    a.nombre = dr["nombre"].ToString();
                    a.apellido = dr["apellido"].ToString();
                    a.fechaNacimiento = DateTime.Parse(dr["fechaNacimiento"].ToString());
                    a.disponibleParaFecha = bool.Parse(dr["disponibleParaFecha"].ToString());
                }
                cnn.Close();
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return a;
        }

        public static void InsertarArbitro(ArbitroDTO arbitro)
        {
            string consultaSql = @"INSERT INTO arbitro(idTipoDocumento,numeroDocumento,nombre,apellido,fechaNacimiento,disponibleParaFecha)
                                VALUES(@idTipoDoc,@nroDoc,@nombre,@apellido,@fechaNac,@dispParaFecha)";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);


                cmd.Parameters.AddWithValue("@idTipoDoc", arbitro.idTipoDocumento);
                cmd.Parameters.AddWithValue("@nroDoc", arbitro.numeroDocumento);
                cmd.Parameters.AddWithValue("@nombre", arbitro.nombre);
                cmd.Parameters.AddWithValue("@apellido", arbitro.apellido);
                cmd.Parameters.AddWithValue("@fechaNac", arbitro.fechaNacimiento);
                cmd.Parameters.AddWithValue("@dispParaFecha", arbitro.disponibleParaFecha);


                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            catch (Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al insertar un Arbitro " + ex.ToString());
            }
        }

        public static void eliminarArbitro(int idArbitro)
        {
            string consultaSql = @"DELETE FROM arbitro
                                    WHERE idArbitro=@idArbitro";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue("@idArbitro", idArbitro);
                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            catch (Exception e)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al eliminar el Arbitro " + e.ToString());
            }
        }

        public static void actualizarArbitro(ArbitroDTO arbitro)
        {
            string consultaSql =
                @"UPDATE arbitro 
                 SET idTipoDocumento=@idTipoDoc
                    , numeroDocumento=@nroDoc
                    , nombre=@nom
                    , apellido=@ape
                    , fechaNacimiento=@fechaNac                    
                    , disponibleParaFecha=@dispParaFecha
                 WHERE idArbitro=@idArbitro";

            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);


                cmd.Parameters.AddWithValue("@idTipoDoc", arbitro.idTipoDocumento);
                cmd.Parameters.AddWithValue("@nroDoc", arbitro.numeroDocumento);
                cmd.Parameters.AddWithValue("@nom", arbitro.nombre);
                cmd.Parameters.AddWithValue("@ape", arbitro.apellido);
                cmd.Parameters.AddWithValue("@fechaNac", arbitro.fechaNacimiento);
                cmd.Parameters.AddWithValue("@dispParaFecha", arbitro.disponibleParaFecha);
                cmd.Parameters.AddWithValue("@idArbitro", arbitro.idArbitro);

                cmd.ExecuteNonQuery();
                cnn.Close();

            }
            catch (Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al modificar el Arbitro " + ex.ToString());
            }
        }

        public static int obtenerIdArbitro()
        {
            int idArbitro = 0;
            string consultaSql = "SELECT MAX(idArbitro) as id FROM arbitro";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();

                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                idArbitro = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return idArbitro;
        }
    }
}
