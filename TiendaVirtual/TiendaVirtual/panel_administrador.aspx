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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <script src="js/jquery-3.5.1.js" type="text/javascript"></script>
     
    <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>



    <style type="text/css">
        .padre {

  height: 500px;
  /*IMPORTANTE*/
  display: flex;
  justify-content: center;
  align-items: center;
}

.hijo {

  width: 100%;
  height: 500px;
}

.header {
    color: #36A0FF;
    font-size: 27px;
    padding: 10px;
}

.bigicon {
    font-size: 35px;
    color: #36A0FF;
}
    </style>
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

        var refreshUsuarios;
        var identificador_usuario = 0;

        function cerrarSesion() {
            document.getElementById("lnkCerrarSesion").click();
        }

        function mostrarMiCuenta() {
            document.getElementById("micuenta").style.display = "block";

            document.getElementById("clientes").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            document.getElementById("edicioncliente").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            micuenta();
        }

        function mostrarClientes() {
            document.getElementById("clientes").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("edicionmicuenta").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("edicioncliente").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            clientes();
        }

        function mostrarArticulos() {
            document.getElementById("articulos").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("edicionmicuenta").style.display = "none";
            document.getElementById("clientes").style.display = "none";
            document.getElementById("edicioncliente").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            articulos();
        }

        function mostrarPedidos() {
            document.getElementById("pedidos").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("edicionmicuenta").style.display = "none";
            document.getElementById("edicioncliente").style.display = "none";
            document.getElementById("clientes").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            pedidos();
        }

        function mostrarUsuarios() {
            document.getElementById("usuarios").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("edicionmicuenta").style.display = "none";
            document.getElementById("edicioncliente").style.display = "none";
            document.getElementById("clientes").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            usuarios();
        }

        function nuevoUsuario() {
            document.getElementById("usuarios").style.display = "none";
            document.getElementById("edicion_usuario").style.display = "block";
        }

        function mi_cuenta() {
            document.getElementById("edicionmicuenta").style.display = "block"; 
            document.getElementById("lnkObtnerMiCuenta").click();

            
        }

        function datosMicuenta() {
            document.getElementById("txtIdUsuarioM").value = document.getElementById("hdIdUsuario").value;
            document.getElementById("txtNombreUsuarioM").value = document.getElementById("hdNombreUsuario").value;
            document.getElementById("txtApellidoUsuarioM").value = document.getElementById("hdApellidoUsuario").value;
            document.getElementById("txtCorreoUsuarioM").value = document.getElementById("hdCorreoUsuario").value;
            document.getElementById("txtPasswordUsuarioM").value = document.getElementById("hdPasswordUsuario").value;
            document.getElementById("txtPasswordUsuario2M").value = document.getElementById("hdPasswordUsuario2").value;
        }

        function cancelarUsuario() {
            document.getElementById("usuarios").style.display = "block";
            document.getElementById("edicion_usuario").style.display = "none";
            refreshUsuarios();
        }
        function guardarUsuario() {
            if (identificador_usuario == 0) {
                document.getElementById("hdNombreUsuario").value = document.getElementById("txtNombreUsuario").value;
                document.getElementById("hdApellidoUsuario").value = document.getElementById("txtApellidoUsuario").value;
                document.getElementById("hdCorreoUsuario").value = document.getElementById("txtCorreoUsuario").value;
                document.getElementById("hdPasswordUsuario").value = document.getElementById("txtPasswordUsuario").value;
                
                
                document.getElementById("lnkGuardarUsuario").click();
                document.getElementById("usuarios").style.display = "block";
                document.getElementById("edicion_usuario").style.display = "none";


                document.getElementById("txtNombreUsuario").value = "";
                document.getElementById("txtApellidoUsuario").value = "";
                document.getElementById("txtCorreoUsuario").value = "";
                document.getElementById("txtPasswordUsuario").value = "";


            } else {
                alert("Edicion");
                //document.getElementById("lnkGuardarUsuario").click();
                //document.getElementById("usuarios").style.display = "block";
                //document.getElementById("edicion_usuario").style.display = "none";
            }
        }

        function actualizarMiCuenta() {
            document.getElementById("hdIdUsuario").value = document.getElementById("txtIdUsuarioM").value;
            document.getElementById("hdNombreUsuario").value = document.getElementById("txtNombreUsuarioM").value;
            document.getElementById("hdApellidoUsuario").value = document.getElementById("txtApellidoUsuarioM").value;
            document.getElementById("hdCorreoUsuario").value = document.getElementById("txtCorreoUsuarioM").value;
            document.getElementById("hdPasswordUsuario").value = document.getElementById("txtPasswordUsuarioM").value;
            document.getElementById("hdPasswordUsuario2").value = document.getElementById("txtPasswordUsuario2M").value;

            document.getElementById("lnkActualizarMiCuenta").click();
        }

        function actualizarCliente() {
            document.getElementById("hdIdCliente").value = document.getElementById("txtIdCliente").value;
            document.getElementById("hdIdUserCliente").value = document.getElementById("txtIdUsuarioCliente").value;
            document.getElementById("hdNombreCliente").value = document.getElementById("txtNombreCliente").value;
            document.getElementById("hdApellidoCliente").value = document.getElementById("txtApellidoCliente").value;
            document.getElementById("hdTelefonoCliente").value = document.getElementById("txtTelefonoCliente").value;
            document.getElementById("hdIdentificacionCliente").value = document.getElementById("txtIdentificacionCliente").value;
            document.getElementById("hdCorreoCliente").value = document.getElementById("txtEmailCliente").value;
            document.getElementById("hdNITCliente").value = document.getElementById("txtNitCliente").value;

            document.getElementById("lnkActualizarCliente").click();
        }

        
        function editarClientes(id) {
            document.getElementById("clientes").style.display = "none";
            document.getElementById("edicioncliente").style.display = "block";

            try {
                $.ajax({
                    url: '<%= ResolveUrl("panel_administrador.aspx/obtenerClienteIndividual") %>',
                            method: 'post',
                            contentType: "application/json",
                            dataType: "json",
                            async: false,
                             data: '{"idcliente":"' + id + '"'
                                + '}',
                            success: function (data) {

                                if (data.d) {
                                    console.log(data.d);
                                    var client = $.parseJSON(data.d);
                                    console.log(client);
                                    //console.log(user[0].nombre);
                                    document.getElementById("txtIdCliente").value = client[0].idCLIENTE;
                                    document.getElementById("txtIdUsuarioCliente").value = client[0].idUSUARIO;
                                    document.getElementById("txtNombreCliente").value = client[0].nombre;
                                    document.getElementById("txtApellidoCliente").value = client[0].apellido;
                                    document.getElementById("txtTelefonoCliente").value = client[0].telefono;
                                    document.getElementById("txtIdentificacionCliente").value = client[0].identificacion;
                                    document.getElementById("txtEmailCliente").value = client[0].email;
                                    document.getElementById("txtNitCliente").value = client[0].nit;
                                }
                            },
                            error: function (err) {
                                console.error(err);
                            }
                        });
            } catch (error) {
                console.error(error);
            }
        }
        function editarUsuarios(id) {

                    identificador_usuario = 1;
                    document.getElementById("clientes").style.display = "none";
                    document.getElementById("edicioncliente").style.display = "block";

                    try {
                        $.ajax({
                            url: '<%= ResolveUrl("panel_administrador.aspx/obtenerUsuarioIndividual") %>',
                    method: 'post',
                    contentType: "application/json",
                            dataType: "json",
                    async: false,
                    data: '{"idusuario":"' + id + '"'
                        + '}',
                    success: function (data) {

                        if (data.d) {
                            console.log(data.d);
                            var user = $.parseJSON(data.d);
                            console.log(user[0].nombre);
                            document.getElementById("txtIdUsuario").value = user[0].idUSUARIO;
                            document.getElementById("txtNombreUsuario").value = user[0].nombre;
                            document.getElementById("txtApellidoUsuario").value = user[0].apellido;
                            document.getElementById("txtCorreoUsuario").value = user[0].correo;
                            document.getElementById("txtPasswordUsuario").value = user[0].password;
                        }
                    },
                    error: function (err) {
                        console.error(err);
                    }
                });
                    } catch (error) {
                        console.error(error);
                    }
                }

        $(document).ready(function () {

            refreshUsuarios = function () {
                $('#tblUsuarios').DataTable().ajax.reload();
            }

           

            usuarios = function () {
                tablaUsuarios = $('#tblUsuarios').DataTable({
                    ajax: {
                        url: '<%= ResolveUrl("panel_administrador.aspx/obtenerUsuarios") %>',
                        method: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        dataSrc: function (data) {
                            return $.parseJSON(data.d);
                        }
                    },
                    rowId: 'idUSUARIO',
                    processing: true,
                    destroy: true,
                    paginate: false,
                    scrollY: window.innerHeight - 300 + 'px',
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
                                return "<span><a href='#' onclick='editarUsuarios(\"" + row.idUSUARIO + "\");'>Editar</a></span>";
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
                
                mi_cuenta();
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
                                return "<span><a href='#' onclick='editarClientes("+row.idcliente+")'>Editar</a></span>";
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

                    <%--<table id="tblUsuarios">
                    </table>--%>
                </div>

                 <div id="clientes" style="display:none">
                     <asp:Button runat="server" id="btnNuevoCliente" Text="Nuevo Cliente"/>
                    <h1>Mantenimiento de Clientes</h1>
                    <table id="tblClientes">
                    </table>
                </div>

                 <div id="articulos" style="display:none">
                     <asp:Button runat="server" id="btnNuevoArticulo" Text="Nuevo Articulo"/>
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
                    <input type="button" onclick="nuevoUsuario()" value="Nuevo Usuario"/>
                    <h1>Mantenimiento de Usuarios</h1>
                    <table id="tblUsuarios">
                    </table>
                </div>

                <div class="padre" style="display:none" id="edicion_usuario">
                  <div class="hijo">                    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                    <fieldset>
                        <legend class="text-center header">Nuevo Usuario</legend>

                        <div class="form-group" style="display:none">
                            <div class="col-md-12">
                                <input type="text" id="txtIdUsuario" class="form-control" placeholder="Nombre"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <input type="text" id="txtNombreUsuario" class="form-control" placeholder="Nombre"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                   <input type="text" id="txtApellidoUsuario" class="form-control" placeholder="Apellido"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                 <input type="text" id="txtCorreoUsuario" class="form-control" placeholder="Correo Electronico"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <input type="password" id="txtPasswordUsuario" class="form-control" placeholder="Contraseña"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:DropDownList runat="server" ID="dlTipoUsuario" CssClass="form-control">
                                    <asp:ListItem Value="0">Seleccione tipo de usuario</asp:ListItem>
                                    <asp:ListItem Value="1">Administrador</asp:ListItem>
                                    <asp:ListItem Value="2">Cliente</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <input type="button" class="btn btn-primary btn-lg" onclick="guardarUsuario()" value="Guardar" />
      <%--                          <asp:Button runat="server" ID="btnRegistrarUser" Text="Guardar" CssClass="btn btn-primary btn-lg" OnClick="btnRegistrarUser_Click" OnClientClick="cancelarUsuario()"/>--%>
                                <input type="button" class="btn btn-primary btn-lg" onclick="cancelarUsuario()" value="Cancelar" />
                            </div>
                        </div>
                    </fieldset>
            </div>
        </div>
    </div>
</div></div>

                </div>

                <div class="padre" style="display:none" id="edicionmicuenta">
                  <div class="hijo">                    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                    <fieldset>
                        <legend class="text-center header">Mi Cuenta</legend>

                        <div class="form-group" style="display:block">
                            <div class="col-md-12">
                                 <label>ID Usuario</label>
                                <input type="text" id="txtIdUsuarioM" class="form-control" placeholder="Nombre Usuario" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Nombre</label>
                                <input type="text" id="txtNombreUsuarioM" class="form-control" placeholder="Nombre"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Apellido</label>
                                   <input type="text" id="txtApellidoUsuarioM" class="form-control" placeholder="Apellido"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Correo Electronico</label>
                                 <input type="text" id="txtCorreoUsuarioM" class="form-control" placeholder="Correo Electronico"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Contraseña</label>
                                <input type="password" id="txtPasswordUsuarioM" class="form-control" placeholder="Contraseña"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Contraseña</label>
                                <input type="password" id="txtPasswordUsuario2M" class="form-control" placeholder="Contraseña"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <input type="button" class="btn btn-primary btn-lg" onclick="actualizarMiCuenta()" value="Actualizar" />
                            </div>
                        </div>
                    </fieldset>
            </div>
        </div>
    </div>
</div></div>

                </div>

                <div class="padre" style="display:none" id="edicioncliente">
                  <div class="hijo">                    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                    <fieldset>
                        <legend class="text-center header">Edicion de Clientes</legend>

                        <div class="form-group" style="display:block">
                            <div class="col-md-12">
                                 <label>ID Cliente</label>
                                <input type="text" id="txtIdCliente" class="form-control" placeholder="Cliente" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>ID Usuario</label>
                                <input type="text" id="txtIdUsuarioCliente" class="form-control" placeholder="Usuario" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Nombre</label>
                                   <input type="text" id="txtNombreCliente" class="form-control" placeholder="Nombre"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Apellido</label>
                                 <input type="text" id="txtApellidoCliente" class="form-control" placeholder="Apellido"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Telefono</label>
                                <input type="password" id="txtTelefonoCliente" class="form-control" placeholder="Telefono"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Identificacion</label>
                                <input type="password" id="txtIdentificacionCliente" class="form-control" placeholder="Identificacion"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Correo Electronico</label>
                                <input type="text" id="txtEmailCliente" class="form-control" placeholder="Correo Electronico"/>
                            </div>
                        </div>


                         <div class="form-group">
                            <div class="col-md-12">
                                <label>NIT</label>
                                <input type="password" id="txtNitCliente" class="form-control" placeholder="NIT"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Estado</label>
                                <asp:DropDownList runat="server" ID="dpEstadoCliente" CssClass="form-control">
                                    <asp:ListItem Value="1">Activo</asp:ListItem>
                                    <asp:ListItem Value="0">Inactivo</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <input type="button" class="btn btn-primary btn-lg" onclick="actualizarCliente()" value="Actualizar" />
                            </div>
                        </div>
                    </fieldset>
            </div>
        </div>
    </div>
</div></div>

                </div>
                <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>--%>
            </div>


         

        </div>


        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:LinkButton runat="server" ID="lnkCerrarSesion" ClientIDMode="Static" OnClick="lnkCerrarSesion_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkGuardarUsuario" ClientIDMode="Static" OnClick="btnRegistrarUser_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkObtenerEditarUsuario" ClientIDMode="Static" OnClick="lnkObtenerEditarUsuario_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkObtnerMiCuenta" ClientIDMode="Static" OnClick="lnkObtnerMiCuenta_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkActualizarMiCuenta" ClientIDMode="Static" OnClick="lnkActualizarMiCuenta_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkActualizarCliente" ClientIDMode="Static" OnClick="lnkActualizarCliente_Click"></asp:LinkButton>
                
                 <asp:HiddenField runat="server" ID="hdIdUsuario" ClientIDMode="Static" value=""/>
                <asp:HiddenField runat="server" ID="hdNombreUsuario" ClientIDMode="Static" value=""/>
                 <asp:HiddenField runat="server" ID="hdApellidoUsuario" ClientIDMode="Static" value=""/>
                 <asp:HiddenField runat="server" ID="hdCorreoUsuario" ClientIDMode="Static" value=""/>
                 <asp:HiddenField runat="server" ID="hdPasswordUsuario" ClientIDMode="Static" value=""/>
                <asp:HiddenField runat="server" ID="hdPasswordUsuario2" ClientIDMode="Static" value=""/>

                <asp:HiddenField runat="server" ID="hdIdCliente" ClientIDMode="Static" value=""/>
                <asp:HiddenField runat="server" ID="hdIdUserCliente" ClientIDMode="Static" value=""/>
                 <asp:HiddenField runat="server" ID="hdNombreCliente" ClientIDMode="Static" value=""/>
                 <asp:HiddenField runat="server" ID="hdApellidoCliente" ClientIDMode="Static" value=""/>
                 <asp:HiddenField runat="server" ID="hdTelefonoCliente" ClientIDMode="Static" value=""/>
                <asp:HiddenField runat="server" ID="hdIdentificacionCliente" ClientIDMode="Static" value=""/>
                <asp:HiddenField runat="server" ID="hdCorreoCliente" ClientIDMode="Static" value=""/>
                 <asp:HiddenField runat="server" ID="hdNITCliente" ClientIDMode="Static" value=""/>


            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script type="text/javascript">

    </script>

</body>
</html>
