<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TiendaVirtual.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Login</title>
    <meta charset="UTF-8" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/fontawesome-all.css" rel="stylesheet" />
    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
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
        function registrarUsuario() {
            document.getElementById("lnkRegistrarUsuario").click();
        }
    </script>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<h1>Arcadia SportsWear</h1>
    <div class=" w3l-login-form">
        <h2>Iniciar Sesion</h2>
            <div class=" w3l-form-group">
                <label>Usuario:</label>
                
                <div class="group">
                    <i class="fas fa-user"></i>
                    <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" placeholder="Usuario o Correo Electronico"></asp:TextBox>
                </div>
            </div>
            <div class=" w3l-form-group">
                <label>Contrasena:</label>
                <div class="group">
                    <i class="fas fa-unlock"></i>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword" placeholder="Contrasena" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="forgot">
                <%--<a href="#">Forgot Password?</a>--%>
                <%--<p><input type="checkbox">Remember Me</p>--%>
            </div>
            <asp:Button runat="server" Text="Ingresar" ID="btnIngresar" OnClick="btnIngresar_Click" CssClass="btnIngresar"/>
        <p class=" w3l-register-p">No tienes una cuenta?<a href="#" class="register" onclick="registrarUsuario();"> Registrate</a></p>
    </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:LinkButton runat="server" ID="lnkRegistrarUsuario" ClientIDMode="Static" OnClick="lnkRegistrarUsuario_Click"></asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
