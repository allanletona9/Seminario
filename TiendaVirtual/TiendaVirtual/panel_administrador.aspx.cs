using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaVirtual
{
    public partial class panel_administrador : System.Web.UI.Page
    {
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
    }
}