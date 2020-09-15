<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrar_usuario.aspx.cs" Inherits="TiendaVirtual.registrar_usuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro de Usuarios</title>
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet" />
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css" />
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css" />
	<link rel="stylesheet" type="text/css" href="css/util_registrouser.css" />
	<link rel="stylesheet" type="text/css" href="css/main_registrouser.css" />
	<style type="text/css">
        .btnIngresar{
            background: #fc3955;
            color: #ffffff;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: none;
            padding: 12px 60px;
            cursor: pointer;
            width: 100%;
            border-radius: 6px;
        }
    </style>
</head>
<body>
	<script type="text/javascript">
        function iniciarSesion() {
            document.getElementById("lnkIniciarSesion").click();
        }
    </script>
    <form id="form1" runat="server">
		<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <div class="limiter">
		<div class="container-login100">
			<div class="login100-more" style="background-image: url('images/cover4.jpg');"></div>

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
					<span class="login100-form-title p-b-59">
						Registrate
					</span>

					<div class="wrap-input100 validate-input" data-validate="Name is required">
						<asp:TextBox runat="server" ID="txtNombre" CssClass="input100" placeholder="Nombre"></asp:TextBox>	
					</div>

					<div class="wrap-input100 validate-input" data-validate="Username is required">
						<asp:TextBox runat="server" ID="txtApellido" CssClass="input100" placeholder="Apellido"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<asp:TextBox runat="server" ID="txtEmail" CssClass="input100" placeholder="Email"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>

				

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<asp:TextBox runat="server" ID="txtPassword" CssClass="input100" placeholder="Contraseña"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Repeat Password is required">
						<asp:TextBox runat="server" ID="txtConfirmarPassword" CssClass="input100" placeholder="Confirmar Contraseña"></asp:TextBox>
						<span class="focus-input100"></span>
					</div>

				

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<asp:Button runat="server" ID="btnRegistrarUser" Text="Aceptar" CssClass="btnIngresar" OnClick="btnRegistrarUser_Click"/>
							
						</div>

						<a href="#" class="dis-block txt3 hov1 p-r-30 p-t-10 p-b-10 p-l-30" onclick="iniciarSesion();">
							Iniciar Sesion
							<i class="fa fa-long-arrow-right m-l-5"></i>
						</a>
					</div>
			</div>
		</div>
	</div>
        </div>
		<asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:LinkButton runat="server" ID="lnkIniciarSesion" ClientIDMode="Static" OnClick="lnkIniciarSesion_Click"></asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
