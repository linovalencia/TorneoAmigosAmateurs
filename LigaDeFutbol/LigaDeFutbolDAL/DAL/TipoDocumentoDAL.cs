using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using LigaDeFutbolDTO;

namespace LigaDeFutbolDAL
{
    public class TipoDocumentoDAL
    {
       
        
        public static List<TipoDocumentoDTO> ObtenerTodo()
        {
            List<TipoDocumentoDTO> listTipoDocumentos = new List<TipoDocumentoDTO>();
            string sql = "SELECT * FROM tipo_documento";
            SqlConnection cn = new SqlConnection(DALBase.StringConexion);
       

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
                throw new ApplicationException("Error al buscar los tipos");

            }
            return listTipoDocumentos;
        }

    }
}
