using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class datos_pedidos
    {
        public static DataTable obtienePedidos(conexion_entidad cn_conexion)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

            SqlCommand sqlObtienePedidos = new SqlCommand("sp_ObtienePedidos", sqlConexion);
            sqlObtienePedidos.CommandType = CommandType.StoredProcedure;

            try
            {
                DataTable dtPedidos = new DataTable("obtiene_pedidos");
                SqlDataAdapter sqlPedidos = new SqlDataAdapter();
                sqlPedidos.SelectCommand = sqlObtienePedidos;
                sqlPedidos.Fill(dtPedidos);

                sqlConexion.Close();

                return dtPedidos;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
    }
}
