using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LigaDeFutbolDTO;
using System.Data;
using System.Data.SqlClient;
using LigaDeFutbolDTO.Entidad;
using LigaDeFutbolDAL;


namespace LigaDeFutbolDAL.DAL
{
    public class CanchaDAL
    {
        public static List<CanchaDTO> obtenerCancha()
        {
            List<CanchaDTO> cancha = new List<CanchaDTO>();
            string consultaSql = @"SELECT * FROM cancha";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try 
            {
                cnn.Open();
                SqlCommand cmd=new SqlCommand(consultaSql,cnn);
                SqlDataReader dr=cmd.ExecuteReader();

                while(dr.Read())
                {
                    CanchaDTO c= new CanchaDTO();
                    c.idCancha=int.Parse(dr["idCancha"].ToString());
                    c.calle=dr["calle"].ToString();
                    c.numeroCalle = int.Parse(dr["numeroCalle"].ToString());
                    c.nombreCancha = dr["nombreCancha"].ToString();
                //    c.habilitada = bool.Parse(dr["habilitada"].ToString());
                    c.fechaInaguracion=DateTime.Parse(dr["fechaInaguracion"].ToString());
                    cancha.Add(c);
                }
                cnn.Close();
            }
            catch(Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al buscar las Canchas " + ex.ToString());
            }
            return cancha;
        }

        public static int buscarIDCancha()
        {
            string buscarIdCancha = "SELECT MAX(idCancha) as id FROM cancha";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            cnn.Open();

            SqlCommand cmd = new SqlCommand(buscarIdCancha, cnn);
            int idCancha = Convert.ToInt32(cmd.ExecuteScalar());
            
            cnn.Close();

            return idCancha + 1;

        }
        public static void insertarCancha(CanchaDTO cancha) 
        {
            string consultaSql = @"INSERT INTO cancha(calle,numeroCalle,nombreCancha,fechaInaguracion)
                                   VALUES(@calle,@nroCalle,@nomCancha,@fechaInag)";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try 
            { 
                cnn.Open();
                SqlCommand cmd=new SqlCommand(consultaSql,cnn);

                cmd.Parameters.AddWithValue("@id",cancha.idCancha);
                cmd.Parameters.AddWithValue("@calle",cancha.calle);
                cmd.Parameters.AddWithValue("@nroCalle",cancha.numeroCalle);
                cmd.Parameters.AddWithValue("@nomCancha",cancha.nombreCancha);
             //   cmd.Parameters.AddWithValue("@habilitada", cancha.habilitada);
                cmd.Parameters.AddWithValue("@fechaInag",cancha.fechaInaguracion);

                cmd.ExecuteNonQuery();
                cnn.Close();

            }catch(Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al insertar una Cancha " + ex.ToString());
            }

        }

        public static void eliminarCancha(int idCancha)
        {
            string consultaSql = @"DELETE FROM cancha
                                 WHERE idCancha=@idCancha";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try 
            {
                cnn.Open();
                SqlCommand cmd= new SqlCommand(consultaSql,cnn);
                cmd.Parameters.AddWithValue("@idCancha",idCancha);
                cmd.ExecuteNonQuery();
                cnn.Close();

            }catch(Exception ex)
            {
            if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al eliminar una Cancha " + ex.ToString());
            }
        }

        public static void actualizarCancha(CanchaDTO cancha)
        { 
        string consultaSql =
                @"UPDATE cancha 
                 SET calle=@calle
                    , numeroCalle=@nroCalle
                    , nombreCancha=@nomCancha
                    , habilitada=@habilitada
                    , fechaInaguracion=@fechaInag
                 WHERE  idCancha=@idCancha";

            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try {
                cnn.Open();
                SqlCommand cmd= new SqlCommand(consultaSql,cnn);
//                cmd.Parameters.AddWithValue("@idCancha", cancha.idCancha); 
                cmd.Parameters.AddWithValue("@calle",cancha.calle);
                cmd.Parameters.AddWithValue("@nroCalle",cancha.numeroCalle);
                cmd.Parameters.AddWithValue("@nomCancha", cancha.nombreCancha);
                cmd.Parameters.AddWithValue("@habilitada", Convert.ToInt32(cancha.habilitada));
                cmd.Parameters.AddWithValue("@fechaInag", cancha.fechaInaguracion);
               
                cmd.ExecuteNonQuery();
                cnn.Close();

            }
            catch(Exception ex)
            {
                if (cnn.State == ConnectionState.Open)
                    cnn.Close();
                throw new ApplicationException("Error al modificar la Cancha "+ ex.ToString());
            }
        }
        
        
    }
}
