using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO.Entidad
{
    public class ArbitroDTO: JugadorDTO
    {
        public int legajo { get; set; }

        public ArbitroDTO()
        {
            legajo = int_NullValue;
            IsNew = true;
        }

    }
}
