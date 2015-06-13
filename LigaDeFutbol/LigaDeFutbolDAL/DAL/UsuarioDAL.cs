using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace LigaDeFutbolDAL
{
    public class UsuarioDAL
    {
        public static bool validarUsuario(string nom, string pass)
        {
  
            string consultaSql = @"SELECT COUNT(*) AS count FROM usuario
                                    WHERE nombre=@nomb and password=@pass";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue(@"nomb", nom);
                cmd.Parameters.AddWithValue(@"pass", pass);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    if (int.Parse(dr["count"].ToString()) == 1)
                    {
                       return true;

                    }
                    else
                    {
                        return false;
                    }
                }

                cnn.Close();
            }catch (Exception ex)
            {
                ex.ToString();
            }
            return false; 
        }

        public static string buscarRol(string nom, string pass) 
        {
            string consultaSql = @"SELECT rol.nombreRol as Rol
                                FROM usuario INNER JOIN rol ON usuario.idRol=rol.idRol
                                WHERE usuario.nombre=@nom
                                AND usuario.password=@pass";
            SqlConnection cnn = new SqlConnection(DALBase.StringConexion);

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(consultaSql, cnn);
                cmd.Parameters.AddWithValue("@nom", nom);
                cmd.Parameters.AddWithValue("@pass", pass);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    return dr["Rol"].ToString();
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
            return "Anonimo";
        }


    }
}
