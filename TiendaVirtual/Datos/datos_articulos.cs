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
    }
}
