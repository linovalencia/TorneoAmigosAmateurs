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
<<<<<<< HEAD
        public int idCampeonato { get; set; }        
        public DateTime fechaInscripcion { get; set; }
        
=======
        public int idCampeonato { get; set; }
        public int idInscripcion { get; set; }
        public DateTime fechaInscripcion { get; set; }
>>>>>>> b9b52fa4f5e28334a237e5ec7e8e9dd81a262fbe

        public InscripcionDTO()
        {
            idClub = int_NullValue;
            idCampeonato = int_NullValue;
            idInscripcion = int_NullValue;
<<<<<<< HEAD
            fechaInscripcion = dateTime_NullValue;        
=======
            fechaInscripcion = dateTime_NullValue;
>>>>>>> b9b52fa4f5e28334a237e5ec7e8e9dd81a262fbe
            IsNew = true;
        }
    }
}
