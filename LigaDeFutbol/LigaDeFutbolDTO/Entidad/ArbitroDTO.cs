using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LigaDeFutbolDTO
{
    public class ArbitroDTO:DTOBase
    {
        public int idArbitro { get; set; }
        public int idTipoDocumento { get; set; }
        public int numeroDocumento { get; set; }
        public string apellido { get; set; }
        public string nombre { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public bool disponibleParaFecha { get; set; }

        public ArbitroDTO()
        {
            idArbitro = int_NullValue;
            idTipoDocumento = int_NullValue;
            numeroDocumento = int_NullValue;
            apellido = string_NullValue;
            nombre = string_NullValue;
            fechaNacimiento = dateTime_NullValue;
            disponibleParaFecha = bool_NullValue;
            IsNew = true;
        }
         
    }
}
