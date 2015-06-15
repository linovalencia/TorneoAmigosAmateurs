using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using LigaDeFutbolDTO;



namespace LigaDeFutbolDAL
{
    public class DALBase
    {
        public static string StringConexion
        {

            get { return ConfigurationManager.ConnectionStrings["LigaDeFutbolConnectionString2"].ConnectionString; }
          

        }
    }
}
