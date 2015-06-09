using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
   public class CampeonatoDTO:DTOBase
    {
        public int idCampeonato { get; set; }
        public string nombre { get; set; }
        public DateTime fechaInicio { get; set; }
        public DateTime fechaFin { get; set; }
        public int idEstadoCampeonato { get; set; }
        public int puntosPartidoGanado { get; set; }
        public int puntosPartidoEmpatado { get; set; }
        public DateTime fechaLimiteInscripcion { get; set; }
    
        public CampeonatoDTO ()
        {
            idCampeonato = int_NullValue;
            nombre = string_NullValue;
            fechaInicio = dateTime_NullValue;
            fechaFin = dateTime_NullValue;
            idEstadoCampeonato = int_NullValue;
            puntosPartidoGanado = int_NullValue;
            puntosPartidoEmpatado = int_NullValue;
            fechaLimiteInscripcion = dateTime_NullValue;
            IsNew = true;

        }
    }

    
}
