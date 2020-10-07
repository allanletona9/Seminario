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
using System.Drawing;

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
        public static string obtenerClienteIndividual(string idcliente)
        {

            try
            {
                conexion_entidad cn = new conexion_entidad();



                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                cn.database = database;
                cn.server = server;

                cliente clientes = new cliente();
                clientes.idcliente = idcliente;

                DataTable dt = logica_clientes.obtieneClienteIndividual(cn, clientes);

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
        public static string obtenerArticuloIndividual(string idarticulo)
        {

            try
            {
                conexion_entidad cn = new conexion_entidad();



                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                cn.database = database;
                cn.server = server;

                Entidades.producto eProducto = new Entidades.producto();
                eProducto.idarticulo = idarticulo;

                DataTable dt = logica_articulos.obtieneArticuloIndividual(cn, eProducto);

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

            if (hdPasswordUsuario.Value != hdPasswordUsuario.Value)
            {
                return;
            }

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
                hdPasswordUsuario2.Value = dt.Rows[0]["password"].ToString();
                hdCorreoUsuario.Value = dt.Rows[0]["correo"].ToString();

                string javaScript = "datosMicuenta();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
                
            }
        }

        protected void lnkActualizarMiCuenta_Click(object sender, EventArgs e)
        {
            usuarios user = new usuarios();
            cliente clientes = new cliente();

            conexion_entidad cn = new conexion_entidad();

            string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
            string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
            cn.database = database;
            cn.server = server;
            //cn.usuario = Session["sesion_usuario"].ToString();

            if (hdPasswordUsuario.Value != hdPasswordUsuario2.Value)
            {
                return;
            }

            if(Convert.ToInt32(dpEstadoUsuario.SelectedValue) == 0)
            {
                clientes.estado = "0";
            }
            else
            {
                clientes.estado = dpEstadoUsuario.SelectedValue;
            }

            clientes.idusuario = hdIdUsuario.Value;
            clientes.nombre = hdNombreUsuario.Value;
            clientes.apellido = hdApellidoUsuario.Value;
            clientes.email = hdCorreoUsuario.Value;

            user.usuario = hdIdUsuario.Value;
            user.correo = hdCorreoUsuario.Value;
            user.password = hdPasswordUsuario.Value;

            bool update = logica_usuarios.actualizar_usuario(cn, user, clientes);

            if (update)
            {
                string javaScript = "refreshUsuarios();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
            }
        }

        protected void lnkActualizarCliente_Click(object sender, EventArgs e)
        {
            cliente clientes = new cliente();

            conexion_entidad cn = new conexion_entidad();

            string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
            string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
            cn.database = database;
            cn.server = server;
            cn.usuario = Session["sesion_usuario"].ToString();

            clientes.idcliente = hdIdCliente.Value;
            clientes.idusuario = hdIdUserCliente.Value;
            clientes.nombre = hdNombreCliente.Value;
            clientes.apellido = hdApellidoCliente.Value;
            clientes.telefono = hdTelefonoCliente.Value;
            clientes.identificacion = hdIdentificacionCliente.Value;
            clientes.email = hdCorreoCliente.Value;
            clientes.nit = hdNITCliente.Value;

            if (Convert.ToInt32(dpEstadoCliente.SelectedValue) == 0)
            {
                clientes.estado = "0";
            }
            else
            {
                clientes.estado = dpEstadoCliente.SelectedValue;
            }

            bool update = logica_clientes.actualizar_cliente(cn, clientes);

            if (update)
            {
                string javaScript = "refreshClientes();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
            }
        }

        protected void lnkActualizarArticulo_Click(object sender, EventArgs e)
        {
            bool insert;
            if (idCargarImagen.HasFile)
            {

                Entidades.producto eProducto = new Entidades.producto();

                conexion_entidad cn = new conexion_entidad();

                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                cn.database = database;
                cn.server = server;
                cn.usuario = Session["sesion_usuario"].ToString();

                eProducto.nombre = hdNombreArticulo.Value;
                eProducto.descripcion = hdDescripcionArticulo.Value;
                eProducto.stock = hdStock.Value;
                eProducto.otro = hdOtro.Value;

                String fileName = idCargarImagen.FileName;
                //String ruta = Server.MapPath("~/images/") + fileName;
                String ruta = "/images/" + fileName;
                //idImagenCargada.ImageUrl = "../images/" + fileName;
                idCargarImagen.SaveAs(Server.MapPath("~/images/") + fileName);

                eProducto.ruta = ruta;

                DataTable dt = logica_articulos.obtieneArticuloIndividual(cn, eProducto); 

                if(dt.Rows.Count > 0)
                {
                    return;
                }
                else
                {
                    insert = logica_articulos.insertar_articulo(cn, eProducto);
                }

                
            }
            else
            {
                return;
            }

            if (insert)
            {
                idCargarImagen.Attributes.Clear();
                idCargarImagen.PostedFile.InputStream.Dispose();
                idCargarImagen.Dispose();

            }

        }

        protected void lnkLimpiarFotos_Click(object sender, EventArgs e)
        {
            idCargarImagen.Attributes.Clear();
            //idCargarImagen.PostedFile.InputStream.Dispose();
            idCargarImagen.Dispose();

            
        }

        protected void lnkActualizarArticuloExistente_Click(object sender, EventArgs e)
        {
            bool insert;
            if (idCargarImagen.HasFile)
            {

                Entidades.producto eProducto = new Entidades.producto();

                conexion_entidad cn = new conexion_entidad();

                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);
                cn.database = database;
                cn.server = server;

                eProducto.idarticulo = hdIdArticulo.Value;
                eProducto.nombre = hdNombreArticulo.Value;
                eProducto.descripcion = hdDescripcionArticulo.Value;
                eProducto.stock = hdStock.Value;
                eProducto.otro = hdOtro.Value;

                String fileName = idCargarImagen.FileName;
                //String ruta = Server.MapPath("~/images/") + fileName;
                String ruta = "/images/" + fileName;
                //idImagenCargada.ImageUrl = "../images/" + fileName;
                idCargarImagen.SaveAs(Server.MapPath("~/images/") + fileName);

                eProducto.ruta = ruta;

                insert = logica_articulos.actualizar_articulo(cn, eProducto);


            }
            else
            {
                return;
            }

            if (insert)
            {
                idCargarImagen.Attributes.Clear();
                idCargarImagen.PostedFile.InputStream.Dispose();
                idCargarImagen.Dispose();
                string javaScript = "mostrarArticulos();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);


            }
        }
    }
}