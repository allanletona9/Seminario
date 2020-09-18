using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class logica_clientes
    {
        public static DataTable obtieneClientes(conexion_entidad cn_conexion)
        {
            try
            {
                return datos_clientes.obtieneClientes(cn_conexion);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
    }
}
