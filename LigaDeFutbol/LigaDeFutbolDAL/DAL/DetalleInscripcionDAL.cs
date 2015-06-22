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
    public class DetalleInscripcionDAL
    {
        internal static void Insertar(DetalleInscripcionDTO detalle, SqlConnection cn, SqlTransaction tran)
        {
            string sql = @"INSERT INTO detalle_inscripcion (idInscripcion, idJugador)
                          VALUES (@idIns, @idJug)";
            try{

            
            SqlCommand cmd = new SqlCommand(sql, cn, tran);

            cmd.Parameters.AddWithValue("@idIns", detalle.idInscripcion);
            cmd.Parameters.AddWithValue("@idJug", detalle.idJugador);
            cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                
            }
        }
    }
}
