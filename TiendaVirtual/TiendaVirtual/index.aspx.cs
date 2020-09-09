using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace TiendaVirtual
{
    public partial class index : System.Web.UI.Page
    {
        conexion_entidad cn = new conexion_entidad();
        protected void Page_Load(object sender, EventArgs e)
        {
            cn = obtener_conexion.obtenerConexion();
        }
    }
}