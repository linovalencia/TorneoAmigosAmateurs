using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO.Entidad
{
    public class PartidoDTO:DTOBase
    {
        public int idPartido { get; set; }
        public DateTime fechaPartido { get; set; }
        public DateTime horaPartido { get; set; }
        public int idEstado { get; set; }
        public int idClubLocal { get; set; }
        public int idClubVisitante { get; set; }
        public int golesLocal { get; set; }
        public int golesVisitante { get; set; }
        public int numeroFecha { get; set; }
        public int idCampeonato { get; set; }
        public string descripcion { get; set; }

        public PartidoDTO() 
        {
            idPartido = int_NullValue;
            fechaPartido = dateTime_NullValue;
            horaPartido = dateTime_NullValue;
            idEstado = int_NullValue;
            idClubLocal = int_NullValue;
            idClubVisitante = int_NullValue;
            golesLocal = int_NullValue;
            golesVisitante = int_NullValue;
            numeroFecha = int_NullValue;
            idCampeonato = int_NullValue;
            descripcion = string_NullValue;
            IsNew = true;
        }
    }
}
