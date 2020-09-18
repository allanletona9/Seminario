using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Logica
{
    public class logica_pedidos
    {
        public static DataTable obtienePedidos(conexion_entidad cn_conexion)
        {
            try
            {
                return datos_pedidos.obtienePedidos(cn_conexion);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
    }
}
