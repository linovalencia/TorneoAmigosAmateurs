using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
    public class ResultadoPartidoDTO:PartidoDTO
    {
        public string nombreClubLocal { get; set; }
        public string nombreClubVisitante { get; set; }

        public ResultadoPartidoDTO()
        {
            nombreClubLocal = string_NullValue;
            nombreClubVisitante = string_NullValue;
            IsNew = true;
        }
    }
}
