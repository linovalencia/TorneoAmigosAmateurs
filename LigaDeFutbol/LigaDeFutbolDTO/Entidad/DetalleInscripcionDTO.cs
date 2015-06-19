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
        public int idTipoDocumento { get; set; }
        public int numeroDocumento { get; set; }

        public DetalleInscripcionDTO() 
        {
            idDetalleInscripcion = int_NullValue;
            idTipoDocumento = int_NullValue;
            numeroDocumento = int_NullValue;
            IsNew=true;
        }
    }
}
