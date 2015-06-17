using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
    public class EstadoFecha : DTOBase
    {
        public int idEstadoFecha { get; set; }
        public string descripcion { get; set; }


        public EstadoFecha()
        {
            idEstadoFecha = int_NullValue;
            descripcion = string_NullValue;
            IsNew = true;
        }
    }
}
