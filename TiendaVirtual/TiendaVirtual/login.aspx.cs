using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Logica;

namespace TiendaVirtual
{
    public partial class login : System.Web.UI.Page
    {
        conexion_entidad cn = new conexion_entidad();
        logica_usuarios lg_usuario = new logica_usuarios();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtUsuario.Text.Length == 0)
                {
                    txtUsuario.Focus();
                    return;
                }

                if(txtPassword.Text.Length == 0)
                {
                    txtPassword.Focus();
                    return;
                }

                string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
                string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);

                cn = logica_usuarios.obtenerUsuario(new conexion_entidad {database= database, server = server, usuario = txtUsuario.Text, password = txtPassword.Text });

                if(cn.password == txtPassword.Text && cn.usuario == txtUsuario.Text)
                {
                    if(Convert.ToInt32(cn.estado) != 0)
                    {
                        if (Convert.ToInt32(cn.tipousuario) == 1)
                        {
                            Session["sesion_usuario"] = cn.usuario;
                            Session["tipo_usuario"] = cn.tipousuario;
                            Response.Redirect("panel_administrador.aspx");
                        }
                        else
                        {
                            Session["sesion_usuario"] = cn.usuario;
                            Session["tipo_usuario"] = cn.tipousuario;
                            Response.Redirect("index.aspx");
                        }
                    }
                    else
                    {
                        Console.WriteLine("Usuario desactivado");
                    }
                    
                }
                else
                {
                    Console.WriteLine("Error");
                    return;
                }


            }
            catch(Exception ex)
            {
                return;
            }
        }
    }
}