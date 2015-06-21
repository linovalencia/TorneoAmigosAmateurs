using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
    public class DetalleInscripcionDTO:DTOBase
    {
        public int idDetalleInscripcion { get; set; }
        public int idInscripcion { get; set; }
        public int idJugador { get; set; }

        public DetalleInscripcionDTO() 
        {
            idDetalleInscripcion = int_NullValue;
            idInscripcion = int_NullValue;
            idJugador = int_NullValue;
            IsNew=true;
        }
    }
}
