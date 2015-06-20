using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
    public class EstadoDTO : DTOBase
    {
        public int idEstado { get; set; }
        public string descripcion { get; set; }


        public EstadoDTO()
        {
            idEstado = int_NullValue;
            descripcion = string_NullValue;
            IsNew = true;
        }
    }
}
