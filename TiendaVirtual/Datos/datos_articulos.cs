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
    public class datos_articulos
    {
        public static DataTable obtieneArticulos(conexion_entidad cn_conexion)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

            SqlCommand sqlObtieneArticulos = new SqlCommand("sp_ObtieneArticulos", sqlConexion);
            sqlObtieneArticulos.CommandType = CommandType.StoredProcedure;

            try
            {
                DataTable dtArt = new DataTable("obtiene_articulos");
                SqlDataAdapter sqlArticulos = new SqlDataAdapter();
                sqlArticulos.SelectCommand = sqlObtieneArticulos;
                sqlArticulos.Fill(dtArt);

                sqlConexion.Close();

                return dtArt;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public static bool insertar_articulo(conexion_entidad cn_conexion, producto eProducto)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");


            string sArticulo = "INSERT INTO ARTICULO(nombre, descripcion, ruta_imagen, stock, otro, idCategoria ,estado) " +
                "VALUES('"+eProducto.nombre+"','"+eProducto.descripcion+"','"+eProducto.ruta+"','"+eProducto.stock+"','"+eProducto.otro+"','"+eProducto.idcategoria+"', '"+eProducto.estado+"')";
            SqlCommand sqlInsertarArticulo = new SqlCommand(sArticulo, sqlConexion);

            sqlConexion.Open();
            sqlInsertarArticulo.Connection = sqlConexion;

            try
            {
                sqlInsertarArticulo.ExecuteNonQuery();
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

        public static DataTable obtieneArticuloIndividual(conexion_entidad cn_conexion, producto eProducto)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

            string sCliente = "SELECT * FROM ARTICULO WHERE idARTICULO = '" + eProducto.idarticulo + "' OR ruta_imagen = '"+eProducto.ruta+"'";
            SqlCommand sqlObtieneClientes = new SqlCommand(sCliente, sqlConexion);

            try
            {
                DataTable dtClients = new DataTable("obtiene_articulos");
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

        public static DataTable obtenerCategorias(conexion_entidad cn_conexion)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

            string sCategoria = "SELECT * FROM CATEGORIA";
            SqlCommand sqObtieneCategorias = new SqlCommand(sCategoria, sqlConexion);

            try
            {
                DataTable dtClients = new DataTable("obtiene_categorias");
                SqlDataAdapter sqlClientes = new SqlDataAdapter();
                sqlClientes.SelectCommand = sqObtieneCategorias;
                sqlClientes.Fill(dtClients);

                sqlConexion.Close();

                return dtClients;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public static bool actualizar_articulo(conexion_entidad cn_conexion, producto eProducto)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

            string sArticulo = "UPDATE ARTICULO SET nombre = '"+eProducto.nombre+"', descripcion = '"+ eProducto.descripcion + "', ruta_imagen = '"+ eProducto.ruta + "', stock = '"+ eProducto.stock + "', otro = '"+ eProducto.otro+ "', idCategoria = '"+eProducto.idcategoria+"', estado = '"+ eProducto.estado+ "' " +
                "WHERE idARTICULO = '"+eProducto.idarticulo+"'";
            SqlCommand sqlUpdateArticulo = new SqlCommand(sArticulo, sqlConexion);

           

            sqlConexion.Open();
            sqlUpdateArticulo.Connection = sqlConexion;

            try
            {
                sqlUpdateArticulo.ExecuteNonQuery();

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
