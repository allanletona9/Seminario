using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Logica;
using System.Data;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace TiendaVirtual
{
    public partial class panel_administrador : System.Web.UI.Page
    {
        conexion_entidad cn = new conexion_entidad();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session.IsNewSession)
                {
                    Session.Clear();
                    Session.Abandon();
                    Session.RemoveAll();
                    Response.Redirect("login.aspx");
                }

                NombreUsuario.Text = Session["sesion_usuario"].ToString();

            }
            catch (Exception err)
            {
                Console.WriteLine("Sesion expirada: " + err.Message);
                Response.Redirect("login.aspx");
            }
        }

        protected void lnkCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();
            Response.Redirect("login.aspx");
        }

        [WebMethod]
        public static string obtenerUsuarios()
        {

            try
            {
                conexion_entidad cn = new conexion_entidad();
                

                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                cn.database = database;
                cn.server = server;
                

                DataTable dt = logica_usuarios.obtieneUsuarios(cn, 1);

                List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                Dictionary<string, object> row = null;

                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }

                JavaScriptSerializer js = new JavaScriptSerializer();
                string json = js.Serialize(rows);

                return json;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
                return null;
            }

        }
          
        [WebMethod]
        public static string obtenerUsuarioIndividual(string idusuario)
        {

            try
            {
                conexion_entidad cn = new conexion_entidad();
                


                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                cn.database = database;
                cn.server = server;
                cn.usuario = idusuario;


                DataTable dt = logica_usuarios.obtieneUsuarios(cn, 2);

                List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                Dictionary<string, object> row = null;

                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }

                JavaScriptSerializer js = new JavaScriptSerializer();
                string json = js.Serialize(rows);

                return json;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
                return null;
            }

        }

        [WebMethod]
        public static string obtenerClientes()
        {

            try
            {
                conexion_entidad cn = new conexion_entidad();


                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                cn.database = database;
                cn.server = server;

                DataTable dt = logica_clientes.obtieneClientes(cn);

                List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                Dictionary<string, object> row = null;

                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }

                JavaScriptSerializer js = new JavaScriptSerializer();
                string json = js.Serialize(rows);

                return json;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
                return null;
            }

        }

        [WebMethod]
        public static string obtenerArticulos()
        {

            try
            {
                conexion_entidad cn = new conexion_entidad();


                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                cn.database = database;
                cn.server = server;

                DataTable dt = logica_articulos.obtieneArticulos(cn);

                List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                Dictionary<string, object> row = null;

                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }

                JavaScriptSerializer js = new JavaScriptSerializer();
                string json = js.Serialize(rows);

                return json;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
                return null;
            }

        }

        [WebMethod]
        public static string obtenerPedidos()
        {

            try
            {
                conexion_entidad cn = new conexion_entidad();


                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                cn.database = database;
                cn.server = server;

                DataTable dt = logica_pedidos.obtienePedidos(cn);

                List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                Dictionary<string, object> row = null;

                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }

                JavaScriptSerializer js = new JavaScriptSerializer();
                string json = js.Serialize(rows);

                return json;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
                return null;
            }

        }

        protected void btnRegistrarUser_Click(object sender, EventArgs e)
        {
            usuarios user = new usuarios();
            cliente clientes = new cliente();

            string nombre_usuario = (hdNombreUsuario.Value + "." + hdApellidoUsuario.Value).ToLower();

            clientes.idusuario = nombre_usuario;
            clientes.nombre = hdNombreUsuario.Value;
            clientes.apellido = hdApellidoUsuario.Value;
            clientes.email = hdCorreoUsuario.Value;
            clientes.fechaInicio = Convert.ToString(DateTime.Now);

            user.usuario = nombre_usuario;
            user.correo = hdCorreoUsuario.Value;
            user.password = hdPasswordUsuario.Value;

            if (Convert.ToInt32(dlTipoUsuario.SelectedValue) == 0)
            {
                user.tipousuario = "2";
            }
            else
            {
                user.tipousuario = dlTipoUsuario.SelectedValue;
            }

            string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
            string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);

            cn.database = database;
            cn.server = server;

            bool insert = logica_usuarios.insertar_usuario(cn, user, clientes);

            if (insert)
            {
                string javaScript = "refreshUsuarios();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
            }
        }

        protected void lnkObtenerEditarUsuario_Click(object sender, EventArgs e)
        {
        }

        protected void lnkObtnerMiCuenta_Click(object sender, EventArgs e)
        {
            try
            {
                conexion_entidad cn = new conexion_entidad();

                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                cn.database = database;
                cn.server = server;
                cn.usuario = Session["sesion_usuario"].ToString();


                DataTable dt = logica_usuarios.obtieneUsuarios(cn, 2);

                hdIdUsuario.Value = dt.Rows[0]["idUSUARIO"].ToString();
                hdNombreUsuario.Value = dt.Rows[0]["nombre"].ToString();
                hdApellidoUsuario.Value = dt.Rows[0]["apellido"].ToString();
                hdPasswordUsuario.Value = dt.Rows[0]["password"].ToString();
                hdCorreoUsuario.Value = dt.Rows[0]["correo"].ToString();

                string javaScript = "datosMicuenta();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
                
            }
        }
    }
}