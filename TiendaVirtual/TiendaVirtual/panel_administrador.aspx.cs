﻿using System;
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
                //if (Session.IsNewSession)
                //{
                //    Session.Clear();
                //    Session.Abandon();
                //    Session.RemoveAll();
                //    Response.Redirect("login.aspx");
                //}

                //NombreUsuario.Text = Session["sesion_usuario"].ToString();

                

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

                DataTable dt = logica_usuarios.obtieneUsuarios(cn);

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
    }
}