using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
    public class InscripcionDTO:DTOBase
    {
        public int idClub { get; set; }
        public int idCampeonato { get; set; }
        public int numeroInscripcion { get; set; }
        public DateTime fechaInscripcion { get; set; }
        public int idDetalleInscripcion { get; set; }

        public InscripcionDTO()
        {
            idClub = int_NullValue;
            idCampeonato = int_NullValue;
            numeroInscripcion = int_NullValue;
            fechaInscripcion = dateTime_NullValue;
            idDetalleInscripcion = int_NullValue;
            IsNew = true;
        }
    }
}
