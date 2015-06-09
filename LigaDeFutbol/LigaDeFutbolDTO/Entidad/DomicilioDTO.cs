using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
    public class DomicilioDTO:DTOBase
    {
        public string calle { get; set; }
        public int numeroCalle { get; set; }
        public string descripcion { get; set; }

        public DomicilioDTO ()
        {
            calle = string_NullValue;
            numeroCalle = int_NullValue;
            descripcion = string_NullValue;
            IsNew = true;
        }
    }
}
