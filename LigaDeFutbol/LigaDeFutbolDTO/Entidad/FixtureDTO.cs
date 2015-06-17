using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO.Entidad
{
    public class FixtureDTO:DTOBase
    {
        public int numeroFecha { get; set; }
        public int idCampeonato { get; set; }
        public DateTime fechaComienzo { get; set; }
        public int idEstadoFecha { get; set; }
        
        public FixtureDTO()
        {
            numeroFecha = int_NullValue;
            idCampeonato = int_NullValue;
            fechaComienzo = dateTime_NullValue;
            idEstadoFecha = int_NullValue;
            IsNew = true;
        }

    }
}
