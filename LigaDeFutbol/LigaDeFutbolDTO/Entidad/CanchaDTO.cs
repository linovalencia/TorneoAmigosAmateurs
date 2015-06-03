using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO.Entidad
{
   public class CanchaDTO: DTOBase
    {
        public int idCancha { get; set; }
        public string calle { get; set; }
        public int numeroCalle { get; set; }
        public string nombreCancha { get; set; }
        public bool habilitada { get; set; }
        public DateTime fechaInaguracion { get; set; }

        public CanchaDTO ()
        {
            idCancha = int_NullValue;
            calle = string_NullValue;
            numeroCalle = int_NullValue;
            nombreCancha = string_NullValue;
            habilitada = bool_NullValue;
            fechaInaguracion = dateTime_NullValue;
            IsNew = true;
        }
    }

}
