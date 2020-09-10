<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TiendaVirtual.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Login</title>
    <!-- meta tags -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="Art Sign Up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, 
		Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
    />
    <!-- /meta tags -->
    <!-- custom style sheet -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <!-- /custom style sheet -->
    <!-- fontawesome css -->
    <link href="css/fontawesome-all.css" rel="stylesheet" />
    <!-- /fontawesome css -->
    <!-- google fonts-->
    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <!-- /google fonts-->
</head>
<body>
    <form id="form1" runat="server">
<h1>Arcadia SportsWear</h1>
    <div class=" w3l-login-form">
        <h2>Iniciar Sesion</h2>
            <div class=" w3l-form-group">
                <label>Usuario:</label>
                
                <div class="group">
                    <i class="fas fa-user"></i>
                    <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" placeholder="Usuario"></asp:TextBox>
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
                <a href="#">Forgot Password?</a>
                <p><input type="checkbox">Remember Me</p>
            </div>
            <button type="submit">Login</button>
            <asp:Button runat="server" Text="Ingresar" ID="btnIngresar" OnClick="btnIngresar_Click"/>
        <p class=" w3l-register-p">No tienes una cuenta?<a href="#" class="register"> Registrate</a></p>
    </div>
    <footer>
        <p class="copyright-agileinfo"> &copy; 2018 Material Login Form. All Rights Reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
    </footer>
    </form>
</body>
</html>
