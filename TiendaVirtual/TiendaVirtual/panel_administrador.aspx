<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_administrador.aspx.cs" Inherits="TiendaVirtual.panel_administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Panel Administrador</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/estilos_paneladministrador.css" />
    <link rel="stylesheet" type="text/css" href="css/css_formularios.css" />
</head>
<body>
    <script type="text/javascript">
        function cerrarSesion() {
            document.getElementById("lnkCerrarSesion").click();
        }
    </script>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="wrapper d-flex align-items-stretch">
            <nav id="sidebar">
                <div class="custom-menu">
                    <button type="button" id="sidebarCollapse" class="btn btn-primary">
                    </button>
                </div>
                <div class="img bg-wrap text-center py-4" style="background-image: url(images/bg_1.jpg);">
                    <div class="user-logo">
                        <div class="img" style="background-image: url(images/logo.jpg);"></div>
                        <asp:Label ID="NombreUsuario" runat="server"></asp:Label>
                    </div>
                </div>
                <ul class="list-unstyled components mb-5">
                    <li class="active">
                        <a href="#"><span class="fa fa-user-circle-o"></span>   Mi Cuenta</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa fa-address-book"></span>    Clientes</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa fa-gift"></span>    Articulos</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa fa-shopping-cart"></span>   Pedidos</a>
                    </li>
                    <%--<li>
            <a href="#"><span class="fa fa-cog mr-3"></span> Settings</a>
          </li>--%>
                    <li>
                        <a href="#"><span class="fa fa-users"></span>   Usuarios</a>
                    </li>
                    <li>
                        <a href="#" onclick="cerrarSesion();"><span class="fa fa-sign-out"></span>  Salir</a>
                    </li>
                </ul>

            </nav>

            <!-- Page Content  -->

            <asp:Panel runat="server">

            </asp:Panel>

            <div id="content" class="p-4 p-md-5 pt-5">
                <h2 class="mb-4">Sidebar #09</h2>
                <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>--%>
            </div>


         

        </div>


        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:LinkButton runat="server" ID="lnkCerrarSesion" ClientIDMode="Static" OnClick="lnkCerrarSesion_Click"></asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
