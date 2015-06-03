using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using LigaDeFutbolDTO;

namespace LigaDeFutbolDAL.DAL
{
    public class TipoDocumentoDAL
    {
        //public static string conexion = "Data Source=MARCIO-PC/SQLEXPRESS;Initial Catalog=LigaDeFutbol;Integrated Security=True";
        
        public static List<TipoDocumentoDTO> ObtenerTodo()
        {
            List<TipoDocumentoDTO> listTipoDocumentos = new List<TipoDocumentoDTO>();
            string sql = "SELECT * FROM tipo_documento";
            SqlConnection cn = new SqlConnection(DALBase.StringConexion);
            //cn.ConnectionString = conexion;

            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand(sql, cn);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    TipoDocumentoDTO tipoDocumento = new TipoDocumentoDTO();                    
                    tipoDocumento.idTipoDocumento = (int)dr["idTipoDocumento"];
                    tipoDocumento.descripcion = dr["descripcion"].ToString();

                    listTipoDocumentos.Add(tipoDocumento);

                }
                dr.Close();
                cn.Close();


            }
            catch (SqlException ex)
            {
                if (cn.State == ConnectionState.Open)
                    cn.Close();
                throw new ApplicationException("Error al buscar las provincias");

            }
            return listTipoDocumentos;
        }

    }
}
