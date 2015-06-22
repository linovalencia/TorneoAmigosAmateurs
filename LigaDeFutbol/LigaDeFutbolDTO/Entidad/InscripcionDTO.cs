using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
    public class InscripcionDTO:DTOBase
    {
        public int idInscripcion { get; set; }
        public int idClub { get; set; }
        public int idCampeonato { get; set; }        
        public DateTime fechaInscripcion { get; set; }
        

        public InscripcionDTO()
        {
            idClub = int_NullValue;
            idCampeonato = int_NullValue;
            idInscripcion = int_NullValue;
            fechaInscripcion = dateTime_NullValue;        
            IsNew = true;
        }
    }
}
