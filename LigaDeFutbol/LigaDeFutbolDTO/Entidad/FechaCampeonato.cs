using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
    public class FechaCampeonato:DTOBase
    {
        public int idFechaCampeonato { get; set; }
        public int numeroFecha { get; set; }
        public int idCampeonato { get; set; }
        public DateTime fechaComienzo { get; set; }
        public int idEstado { get; set; }

        public FechaCampeonato()
        {
            idFechaCampeonato = int_NullValue;
            numeroFecha = int_NullValue;
            idCampeonato = int_NullValue;
            fechaComienzo = dateTime_NullValue;
            idEstado = int_NullValue;
            IsNew = true;
        }
    }
}
