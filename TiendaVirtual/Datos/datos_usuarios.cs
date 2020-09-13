using System.Data;
using Entidades;
using System.Data.SqlClient;
using System;

namespace Datos
{
    public class datos_usuarios
    {
        public static conexion_entidad obtenerUsuario(conexion_entidad cn_entidad)
        {
            SqlConnection sqlConexion = new SqlConnection("server = "+cn_entidad.server+";database="+cn_entidad.database+";Integrated Security=True");

            SqlCommand sqlObtenerUsuario = new SqlCommand("sp_obtieneLogin", sqlConexion);
            sqlObtenerUsuario.CommandType = CommandType.StoredProcedure;

            sqlObtenerUsuario.Parameters.AddWithValue("@usuario", Convert.IsDBNull(cn_entidad.usuario) ? Convert.DBNull : cn_entidad.usuario);
            sqlObtenerUsuario.Parameters.AddWithValue("@password", Convert.IsDBNull(cn_entidad.password) ? Convert.DBNull : cn_entidad.password);

            try
            {
                DataTable usuario = new DataTable("dtUsuarios");
                SqlDataAdapter usuario_obtenido = new SqlDataAdapter();
                usuario_obtenido.SelectCommand = sqlObtenerUsuario;
                usuario_obtenido.Fill(usuario);

                conexion_entidad obtencion_usuario = new conexion_entidad();

                if (usuario.Rows.Count > 0)
                {
                    obtencion_usuario.usuario = Convert.ToString(usuario.Rows[0]["usuario"]);
                    obtencion_usuario.password = Convert.ToString(usuario.Rows[0]["password"]);
                    obtencion_usuario.tipousuario = Convert.ToString(usuario.Rows[0]["tipousuario"]);
                    obtencion_usuario.estado = Convert.ToString(usuario.Rows[0]["estado"]);
                }

                sqlConexion.Close();

                return obtencion_usuario;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
    }
}
