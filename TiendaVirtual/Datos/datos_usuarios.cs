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
                    obtencion_usuario.correo = Convert.ToString(usuario.Rows[0]["correo"]);
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

        public static bool insertar_usuario(conexion_entidad cn_conexion ,usuarios user, cliente clientes)
        {
            SqlConnection sqlConexion = new SqlConnection("server = "+ cn_conexion.server+";database="+ cn_conexion.database+";Integrated Security=True");

            SqlCommand sqlInsertar = new SqlCommand("sp_insertarUsuario", sqlConexion);
            sqlInsertar.CommandType = CommandType.StoredProcedure;

            sqlInsertar.Parameters.AddWithValue("@idusuario", user.usuario);
            sqlInsertar.Parameters.AddWithValue("@idtipousuario", user.tipousuario);
            sqlInsertar.Parameters.AddWithValue("@correo", user.correo);
            sqlInsertar.Parameters.AddWithValue("@password", user.password);

            string sCliente = "INSERT INTO CLIENTE(idUSUARIO, nombre, apellido,telefono,identificacion, email, fechaInicio,nit, estado) VALUES('" + clientes.idusuario+ "', " +
                "'" + clientes.nombre + "', '" + clientes.apellido + "', '"+clientes.telefono+"','"+clientes.identificacion+"'," +
                "'" + clientes.email + "', '" + DateTime.Now + "','"+clientes.nit+"', 1)";
            SqlCommand sqlInsertCliente = new SqlCommand(sCliente, sqlConexion);

            sqlConexion.Open();
            sqlInsertar.Connection = sqlConexion;

            try
            {
                sqlInsertar.ExecuteNonQuery();
                sqlInsertCliente.ExecuteNonQuery();
                if (sqlConexion.State == ConnectionState.Open)
                {
                    sqlConexion.Close();
                }
                return true;
            }
            catch(Exception ex)
            {
                if (sqlConexion.State == ConnectionState.Open)
                {
                    sqlConexion.Close();
                }
                throw new Exception(ex.Message, ex.InnerException);
            }
        }

        public static bool actualizar_usuario(conexion_entidad cn_conexion, usuarios user, cliente clientes)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");

            string sUsuario = "UPDATE USUARIO SET correo = '"+user.correo+ "', password = ENCRYPTBYPASSPHRASE('password', '" + user.password + "') WHERE idUSUARIO = '" + user.usuario+"' ";
            SqlCommand sqlUpdateClient = new SqlCommand(sUsuario, sqlConexion);

            string sCliente = "UPDATE CLIENTE SET nombre = '"+clientes.nombre+"', apellido = '"+clientes.apellido+"', " +
                "telefono = '"+clientes.telefono+"', identificacion = '"+clientes.identificacion+"', email = '"+clientes.email+"', " +
                "nit = '"+clientes.nit+"',estado = '"+Convert.ToBoolean(clientes.estado)+ "' WHERE idUSUARIO = '"+user.usuario.ToString()+"' ";
            SqlCommand sqlInsertCliente = new SqlCommand(sCliente, sqlConexion);

            sqlConexion.Open();
            sqlUpdateClient.Connection = sqlConexion;

            try
            {
                sqlInsertCliente.ExecuteNonQuery();
                sqlUpdateClient.ExecuteNonQuery();
                
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

        public static DataTable obtieneUsuarios(conexion_entidad cn_conexion, Int32 parametro)
        {
            SqlConnection sqlConexion = new SqlConnection("server = " + cn_conexion.server + ";database=" + cn_conexion.database + ";Integrated Security=True");
            SqlCommand sqlObtieneUsuarios;
            if (parametro == 1)
            {
                 sqlObtieneUsuarios = new SqlCommand("sp_obtieneUsuarios", sqlConexion);
                sqlObtieneUsuarios.CommandType = CommandType.StoredProcedure;

                sqlObtieneUsuarios.Parameters.AddWithValue("@idusuario", Convert.IsDBNull(cn_conexion.usuario) ? Convert.DBNull : cn_conexion.usuario);
            }
            else
            {
                string sUsuCliente = "SELECT c.nombre, c.apellido, u.idUSUARIO, u.correo ,CAST(DECRYPTBYPASSPHRASE('password', u.password) AS VARCHAR(8000)) AS password FROM USUARIO u WITH(NOLOCK) INNER JOIN CLIENTE c WITH(NOLOCK) ON u.idUSUARIO = c.idUSUARIO WHERE u.idUSUARIO = '"+ cn_conexion.usuario + "'";
                 sqlObtieneUsuarios = new SqlCommand(sUsuCliente, sqlConexion);
            }
            

            try
            {
                DataTable dtUsers = new DataTable("obtiene_usuarios");
                SqlDataAdapter sqlUsuarios = new SqlDataAdapter();
                sqlUsuarios.SelectCommand = sqlObtieneUsuarios;
                sqlUsuarios.Fill(dtUsers);

                sqlConexion.Close();

                return dtUsers;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
    }
}
