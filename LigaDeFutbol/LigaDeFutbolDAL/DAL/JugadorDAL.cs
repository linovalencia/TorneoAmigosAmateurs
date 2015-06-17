using LigaDeFutbolDTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace LigaDeFutbolDAL.DAL
{
    public class JugadorDAL
    {
        internal static void Insertar(JugadorDTO jugador, SqlConnection cn, SqlTransaction tran)
        {
            string consultaSql = @"INSERT INTO jugador(idTipoDocumento,numeroDocumento,nombre,apellido,fechaNacimiento)
                                   VALUES(@idTipo,@nroDoc,@nomJug,@apeJug,@fechaNac)";

            SqlCommand cmd = new SqlCommand(consultaSql, cn, tran);

            cmd.Parameters.AddWithValue("@idTipo", jugador.idTipoDocumento);
            cmd.Parameters.AddWithValue("@nroDoc", jugador.numeroDocumento);
            cmd.Parameters.AddWithValue("@nomJug", jugador.nombre);
            cmd.Parameters.AddWithValue("@apeJug", jugador.apellido);
            cmd.Parameters.AddWithValue("@fechaNac", jugador.fechaNacimiento);
            

            jugador.idInscripcion = Convert.ToInt32(cmd.ExecuteScalar());
        }
    }
}
