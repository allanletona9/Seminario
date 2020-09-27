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

        public static DataTable obtieneClienteIndividual(conexion_entidad cn_conexion, cliente clientes)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

            string sCliente = "SELECT * FROM CLIENTE WHERE idCLIENTE = '"+clientes.idcliente+"'";
            SqlCommand sqlObtieneClientes = new SqlCommand(sCliente, sqlConexion);

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

        public static bool actualizar_cliente(conexion_entidad cn_conexion, cliente clientes)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

            string sCliente = "";
            if (clientes.telefono == "" || clientes.identificacion == "" || clientes.nit == "")
            {
                sCliente = "UPDATE CLIENTE SET nombre = '" + clientes.nombre + "', apellido = '" + clientes.apellido + "', " +
                "email = '" + clientes.email + "', " +
                "estado = '" + clientes.estado + "' WHERE idCLIENTE = '" + clientes.idcliente + "' ";
            }
            else
            {
                sCliente = "UPDATE CLIENTE SET nombre = '" + clientes.nombre + "', apellido = '" + clientes.apellido + "', " +
                "telefono = '" + clientes.telefono + "', identificacion = '" + clientes.identificacion + "', email = '" + clientes.email + "', " +
                "nit = '" + clientes.nit + "',estado = '" + clientes.estado + "' WHERE idCLIENTE = '" + clientes.idcliente + "' ";
            }
            
            SqlCommand sqlInsertCliente = new SqlCommand(sCliente, sqlConexion);

            sqlConexion.Open();
            //sqlInsertCliente.Connection = sqlConexion;

            try
            {
                sqlInsertCliente.ExecuteNonQuery();

                if (sqlConexion.State == ConnectionState.Open)
                {
                    sqlConexion.Close();
                }
                return true;
            }
            catch (Exception ex)
            {
                if (sqlConexion.State == ConnectionState.Open)
                {
                    sqlConexion.Close();
                }
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
    }
}
