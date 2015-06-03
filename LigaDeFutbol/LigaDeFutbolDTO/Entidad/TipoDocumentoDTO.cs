using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO.Entidad
{
    public class TipoDocumentoDTO:DTOBase
    {
        public int idTipoDocumento { get; set; }
        public string descripcion { get; set; }

        public TipoDocumentoDTO()
        {
            idTipoDocumento = int_NullValue;
            descripcion = string_NullValue;
            IsNew = true;
        }
    }
}
