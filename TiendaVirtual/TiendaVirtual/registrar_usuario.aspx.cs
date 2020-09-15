﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Logica;

namespace TiendaVirtual
{
    public partial class registrar_usuario : System.Web.UI.Page
    {
        conexion_entidad cn = new conexion_entidad();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarUser_Click(object sender, EventArgs e)
        {
            usuarios user = new usuarios();

            if(txtPassword.Text != txtConfirmarPassword.Text)
            {
                return;
            }

            string nombre_usuario = txtNombre.Text + "." + txtApellido.Text;

            user.usuario = nombre_usuario;
            user.correo = txtEmail.Text;
            user.password = txtPassword.Text;
            user.tipousuario = "2";

            string database = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvbd"]);
            string server = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["tdvsrv"]);

            cn.database = database;
            cn.server = server;

            logica_usuarios.insertar_usuario(cn, user);

        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {

        }

        protected void lnkIniciarSesion_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}