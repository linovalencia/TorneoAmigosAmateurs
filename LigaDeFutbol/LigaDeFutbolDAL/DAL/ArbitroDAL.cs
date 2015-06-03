using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LigaDeFutbolDTO.Entidad;
using LigaDeFutbolDTO.Util;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace LigaDeFutbolDAL.DAL
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
                    ar.idTipoDocumento = int.Parse(dr["idTipoDocumento"].ToString());
                    ar.numeroDocumento = int.Parse(dr["numeroDocumento"].ToString());
                    ar.nombre = dr["nombre"].ToString();
                    ar.apellido = dr["apellido"].ToString();
                    ar.fechaNacimiento = DateTime.Parse(dr["nroDoc"].ToString());
                    ar.legajo = int.Parse(dr["legajo"].ToString());
                    if (int.Parse(dr["disponibleParaFecha"].ToString()) == 0)
                        ar.disponibleParaFecha = false;
                    else
                        ar.disponibleParaFecha = true;
                    arbitros.Add(ar);
                }
                cnn.Close();
            }
            catch (SqlException ex)
            {
                 if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al buscar los Arbitros "+ ex.ToString());
                
            }
            return arbitros;
        }

        public static void InsertarArbitro(ArbitroDTO arbitro)
        { 
            string consultaSql=@"INSERT INTO arbitro(idTipoDocumento,numeroDocumento,nombre,apellido,fechaNacimiento,legajo,disponibleParaFecha)
                                VALUES(@idTipoDoc,@nroDoc,@nombre,@apellido,@fechaNac,@legajo,@dispParaFecha)";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);
            
            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql,cnn);
                cmd.Parameters.AddWithValue("@idTipoDoc", arbitro.idTipoDocumento); 
                cmd.Parameters.AddWithValue("@nroDoc",arbitro.numeroDocumento);
                cmd.Parameters.AddWithValue("@nombre", arbitro.nombre);
                cmd.Parameters.AddWithValue("@apellido", arbitro.apellido);
                cmd.Parameters.AddWithValue("@fechaNac", arbitro.fechaNacimiento);
                cmd.Parameters.AddWithValue("@legajo", arbitro.legajo);
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

        public static void eliminarArbitro(int legajo)
        {
            string consultaSql = @"DELETE FROM arbitro
                                    WHERE legajo=@legajo";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            { 
                cnn.Open();
                SqlCommand cmd= new SqlCommand(consultaSql,cnn);
                cmd.Parameters.AddWithValue("@legajo",legajo);
                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            catch(Exception e)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al eliminar el Arbitro " +e.ToString());
            }
        }

        public static void actualizarArbitro(ArbitroDTO arbitro)
        {
            string consultaSql =
                @"UPDATE arbitro 
                 SET idTipoDocumenot=@idTipoDoc
                    , numeroDocumento=@nroDoc
                    , nombre=@nom
                    , apellido=@ape
                    , fechaNacimiento=@fechaNac
                    , legajo=@legajo
                    , disponibleParaFecha=@dispParaFecha
                 WHERE legajo=@legajo";

            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try {
                cnn.Open();
                SqlCommand cmd= new SqlCommand(consultaSql,cnn);
                cmd.Parameters.AddWithValue("@idTipoDoc", arbitro.idTipoDocumento); 
                cmd.Parameters.AddWithValue("@nroDoc",arbitro.numeroDocumento);
                cmd.Parameters.AddWithValue("@nom", arbitro.nombre);
                cmd.Parameters.AddWithValue("@ape", arbitro.apellido);
                cmd.Parameters.AddWithValue("@fechaNac", arbitro.fechaNacimiento);
                cmd.Parameters.AddWithValue("@legajo", arbitro.legajo);
                cmd.Parameters.AddWithValue("@dispParaFecha", arbitro.disponibleParaFecha);

                cmd.ExecuteNonQuery();
                cnn.Close();

            }
            catch(Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al modificar el Arbitro "+ ex.ToString());
            }
        }
    }
}
