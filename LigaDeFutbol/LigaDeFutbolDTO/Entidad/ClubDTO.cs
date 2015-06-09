using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
    public class ClubDTO:DTOBase
    {
        public int idClub { get; set; }
        public string nombreClub { get; set; }
        public string calle { get; set; }
        public int numeroCalle { get; set; }
        public DateTime fechaFundacion { get; set; }
        public bool participoAntesEnLiga { get; set; }
        public int idCancha { get; set; }

        public ClubDTO()
        {
            idClub = int_NullValue;
            nombreClub = string_NullValue;
            calle = string_NullValue;
            numeroCalle = int_NullValue;
            fechaFundacion = dateTime_NullValue;
            participoAntesEnLiga = bool_NullValue;
            idCancha = int_NullValue;
            IsNew = true;
        }

    }
}
