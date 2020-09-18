<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel_administrador.aspx.cs" Inherits="TiendaVirtual.panel_administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Panel Administrador</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet" />

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/estilos_paneladministrador.css" />
    <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery-3.5.1.js" type="text/javascript"></script>
     
    <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>


</head>
<body>
    <script type="text/javascript">
        var micuenta;
        var clientes;
        var articulos;
        var pedidos;
        var usuarios;

        var tablaMiCuenta;
        var tablaClientes;
        var tablaArticulos;
        var tablaPedidos;
        var tablaUsuarios;

        function cerrarSesion() {
            document.getElementById("lnkCerrarSesion").click();
        }

        function mostrarMiCuenta() {
            document.getElementById("micuenta").style.display = "block";

            document.getElementById("clientes").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            micuenta();
        }

        function mostrarClientes() {
            document.getElementById("clientes").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            clientes();
        }

        function mostrarArticulos() {
            document.getElementById("articulos").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("clientes").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            articulos();
        }

        function mostrarPedidos() {
            document.getElementById("pedidos").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("clientes").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            pedidos();
        }

        function mostrarUsuarios() {
            document.getElementById("usuarios").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("clientes").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            usuarios();
        }

        $(document).ready(function () {

            usuarios = function () {
                tablaUsuarios = $('#tblUsuarios').DataTable({
                    ajax: {
                        url: '<%= ResolveUrl("panel_administrador.aspx/obtenerUsuarios") %>',
                        type: 'POST',
                        contentType: "application/json",
                        dataSrc: function (data) {
                            return $.parseJSON(data.d);
                        }
                    },
                    destroy: true,
                    columns: [
                        { "data": "idUSUARIO" },
                        { "data": "descripcion" },
                        { "data": 'correo' },
                        { "data": 'estado' },
                    ],
                    "columnDefs": [
                        {
                            targets: [1],
                            orderable: false,
                            title: "Usuario",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.idUSUARIO + "</span>";
                            },
                        },

                        {
                            targets: [2],
                            orderable: false,
                            title: "Tipo Cliente",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.descripcion + "</span>";
                            },
                        },
                        {
                            "targets": [3],
                            orderable: false,
                            title: "Correo",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.correo + "</span>";
                            },
                        },
                        {
                            "targets": [4],
                            orderable: false,
                            title: "Estado",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.estado + "</span>";
                            },
                        },
                        {
                            "targets": [5],
                            orderable: false,

                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span><a href='#'>Editar</a></span>";
                            },
                        },
                        {
                            targets: [1, 2, 3, 4],
                            visible: true,
                        },
                        {
                            targets: '_all',
                            visible: false
                        },

                    ]
                });
            };

            micuenta = function () {
                alert("mi cuenta");
            };

            clientes = function () {
                tablaClientes = $('#tblClientes').DataTable({
                    ajax: {
                        url: '<%= ResolveUrl("panel_administrador.aspx/obtenerClientes") %>',
                        type: 'POST',
                        contentType: "application/json",
                        dataSrc: function (data) {
                            return $.parseJSON(data.d);
                        }
                    },
                    destroy: true,
                    columns: [
                        { "data": "idcliente" },
                        { "data": "nombre" },
                        { "data": 'apellido' },
                        { "data": 'telefono' },
                        { "data": 'email' },
                        { "data": 'estado' },
                    ],
                    "columnDefs": [
                        {
                            targets: [1],
                            orderable: false,
                            title: "Id Cliente",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.idcliente + "</span>";
                            },
                        },

                        {
                            targets: [2],
                            orderable: false,
                            title: "Nombre",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.nombre + "</span>";
                            },
                        },
                        {
                            "targets": [3],
                            orderable: false,
                            title: "Apellido",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.apellido + "</span>";
                            },
                        },
                        {
                            "targets": [4],
                            orderable: false,
                            title: "Telefono",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.telefono + "</span>";
                            },
                        },
                        {
                            "targets": [5],
                            orderable: false,
                            title: "Email",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.email + "</span>";
                            },
                        },
                        {
                            "targets": [6],
                            orderable: false,
                            title: "Estado",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.estado + "</span>";
                            },
                        },
                        {
                            "targets": [7],
                            orderable: false,

                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span><a href='#'>Editar</a></span>";
                            },
                        },
                        {
                            targets: [1, 2, 3, 4, 5, 6, 7],
                            visible: true,
                        },
                        {
                            targets: '_all',
                            visible: false
                        },

                    ]
                });
            };

            articulos = function () {
                tablaArticulos = $('#tblArticulos').DataTable({
                    ajax: {
                        url: '<%= ResolveUrl("panel_administrador.aspx/obtenerArticulos") %>',
                        type: 'POST',
                        contentType: "application/json",
                        dataSrc: function (data) {
                            return $.parseJSON(data.d);
                        }
                    },
                    destroy: true,
                    columns: [
                        { "data": "idarticulo" },
                        { "data": "nombre" },
                        { "data": 'descripcion' },
                        { "data": 'ruta_imagen' },
                        { "data": 'stock' },
                        { "data": 'estado' },
                    ],
                    "columnDefs": [
                        {
                            targets: [1],
                            orderable: false,
                            title: "Id Articulo",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.idarticulo + "</span>";
                            },
                        },

                        {
                            targets: [2],
                            orderable: false,
                            title: "Nombre",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.nombre + "</span>";
                            },
                        },
                        {
                            "targets": [3],
                            orderable: false,
                            title: "Descripcion",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.descripcion + "</span>";
                            },
                        },
                        {
                            "targets": [4],
                            orderable: false,
                            title: "Ruta Imagen",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.ruta_imagen + "</span>";
                            },
                        },
                        {
                            "targets": [5],
                            orderable: false,
                            title: "Stock",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.stock + "</span>";
                            },
                        },
                        {
                            "targets": [6],
                            orderable: false,
                            title: "Estado",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.estado + "</span>";
                            },
                        },
                        {
                            "targets": [7],
                            orderable: false,

                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span><a href='#'>Editar</a></span>";
                            },
                        },
                        {
                            targets: [1, 2, 3, 4, 5, 6, 7],
                            visible: true,
                        },
                        {
                            targets: '_all',
                            visible: false
                        },

                    ]
                });
            };

            pedidos = function () {
                tablaPedidos = $('#tblPedidos').DataTable({
                    ajax: {
                        url: '<%= ResolveUrl("panel_administrador.aspx/obtenerPedidos") %>',
                        type: 'POST',
                        contentType: "application/json",
                        dataSrc: function (data) {
                            return $.parseJSON(data.d);
                        }
                    },
                    destroy: true,
                    columns: [
                        { "data": "idPEDIDO" },
                        { "data": "fechaPedido" },
                        { "data": 'nombre' },
                        { "data": 'direccion' },
                    ],
                    "columnDefs": [
                        {
                            targets: [1],
                            orderable: false,
                            title: "No. Pedido",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.idPEDIDO + "</span>";
                            },
                        },

                        {
                            targets: [2],
                            orderable: false,
                            title: "Fecha Pedido",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.fechaPedido + "</span>";
                            },
                        },
                        {
                            "targets": [3],
                            orderable: false,
                            title: "Nombre",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.nombre + "</span>";
                            },
                        },
                        {
                            "targets": [4],
                            orderable: false,
                            title: "Direccion",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.direccion + "</span>";
                            },
                        },
                        {
                            "targets": [5],
                            orderable: false,

                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span><a href='#'>Editar</a></span>";
                            },
                        },
                        {
                            targets: [1, 2, 3, 4],
                            visible: true,
                        },
                        {
                            targets: '_all',
                            visible: false
                        },

                    ]
                });
            };

        });
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
                        <a href="#" onclick="mostrarMiCuenta();"><span class="fa fa-user-circle-o"></span>   Mi Cuenta</a>
                    </li>
                    <li>
                        <a href="#" onclick="mostrarClientes();"><span class="fa fa-address-book"></span>    Clientes</a>
                    </li>
                    <li>
                        <a href="#" onclick="mostrarArticulos();"><span class="fa fa-gift"></span>    Articulos</a>
                    </li>
                    <li>
                        <a href="#" onclick="mostrarPedidos();"><span class="fa fa-shopping-cart"></span>   Pedidos</a>
                    </li>
                    <%--<li>
            <a href="#"><span class="fa fa-cog mr-3"></span> Settings</a>
          </li>--%>
                    <li>
                        <a href="#" onclick="mostrarUsuarios();"><span class="fa fa-users"></span>   Usuarios</a>
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
                 <div id="micuenta" style="display:none">
                    <h1>Mi Cuenta</h1>
                    <%--<table id="tblUsuarios">
                    </table>--%>
                </div>

                 <div id="clientes" style="display:none">
                    <h1>Mantenimiento de Clientes</h1>
                    <table id="tblClientes">
                    </table>
                </div>

                 <div id="articulos" style="display:none">
                    <h1>Mantenimiento de Articulos</h1>
                    <table id="tblArticulos">
                    </table>
                </div>

                <div id="pedidos" style="display:none">
                    <h1>Pedidos</h1>
                    <table id="tblPedidos">
                    </table>
                </div>

                <div id="usuarios" style="display:none">
                    <h1>Mantenimiento de Usuarios</h1>
                    <table id="tblUsuarios">
                    </table>
                </div>
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



</body>
</html>
