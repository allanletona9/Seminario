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

        public static DataTable obtenerPedidoIndividual(conexion_entidad cn_conexion, pedidos ped)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

            string sPedido = "SELECT * FROM PEDIDO WHERE idPEDIDO = '"+ped.idpedido+"' ";
            SqlCommand sqlPedido = new SqlCommand(sPedido, sqlConexion);

            try
            {
                DataTable dtPed = new DataTable("obtiene_articulos");
                SqlDataAdapter sqlPedidos = new SqlDataAdapter();
                sqlPedidos.SelectCommand = sqlPedido;
                sqlPedidos.Fill(dtPed);

                sqlConexion.Close();

                return dtPed;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public static bool actualizar_pedido(conexion_entidad cn_conexion, pedidos ped)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

           

            string sPedido = "UPDATE PEDIDO SET estado = '"+ped.estado+"' where idPEDIDO = '"+ped.idpedido+"'";
            SqlCommand sqlUpdatePedido = new SqlCommand(sPedido, sqlConexion);

            sqlConexion.Open();
            sqlUpdatePedido.Connection = sqlConexion;

            try
            {
                sqlUpdatePedido.ExecuteNonQuery();

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
