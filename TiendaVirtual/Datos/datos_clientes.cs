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
    public class datos_clientes
    {
        public static DataTable obtieneClientes(conexion_entidad cn_conexion)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

            SqlCommand sqlObtieneClientes = new SqlCommand("sp_ObtieneClientes", sqlConexion);
            sqlObtieneClientes.CommandType = CommandType.StoredProcedure;

            try
            {
                DataTable dtClients = new DataTable("obtiene_clientes");
                SqlDataAdapter sqlClientes = new SqlDataAdapter();
                sqlClientes.SelectCommand = sqlObtieneClientes;
                sqlClientes.Fill(dtClients);

                sqlConexion.Close();

                return dtClients;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
    }
}
