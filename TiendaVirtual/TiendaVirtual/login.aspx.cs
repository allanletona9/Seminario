using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TiendaVirtual
{
    public partial class login : System.Web.UI.Page
    {
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

            }catch(Exception ex)
            {
                return;
            }
        }
    }
}