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

        .dataTables_filter {
            float: left !important;
              
        }

        .dataTables_filter  input {
            border-radius: 5px !important; 
            font-family: Roboto, Arial, Helvetica, sans-serif;
            font-size: 16px;
            width: 400px;

            margin: 2px;
            text-align: left;
           }
    </style>
</head>
<body>
    <script type="text/javascript">
        var micuenta;
        var clientes;
        var articulo;
        var pedidos;
        var usuarios;

        var tablaMiCuenta;
        var tablaClientes;
        var tablaArticulos;
        var tablaPedidos;
        var tablaUsuarios;

        var refreshUsuarios;
        var refreshClientes;
        var refreshArticulos;
        var identificador_usuario = 0;
        var identificador_articulo = 0;

        function cerrarSesion() {
            document.getElementById("lnkCerrarSesion").click();
        }

        function mostrarMiCuenta() {
            document.getElementById("micuenta").style.display = "block";

            document.getElementById("clientes").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            document.getElementById("edicioncliente").style.display = "none";
            document.getElementById("edicion_usuario").style.display = "none";
            document.getElementById("edicionarticulo").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            micuenta();
        }

        function mostrarClientes() {
            document.getElementById("clientes").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("edicionmicuenta").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("edicioncliente").style.display = "none";
            document.getElementById("edicion_usuario").style.display = "none";
            document.getElementById("edicionarticulo").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            clientes();

        }
        var i = 0;

        function mostrarArticulos() {
            localStorage.setItem("item", "1");
            i = 1;
            document.getElementById("articulos").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("edicionmicuenta").style.display = "none";
            document.getElementById("clientes").style.display = "none";
            document.getElementById("edicion_usuario").style.display = "none";
            document.getElementById("edicionarticulo").style.display = "none";
            document.getElementById("edicioncliente").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            document.getElementById("usuarios").style.display = "none";
            articulo();
        }

        function mostrarPedidos() {
            document.getElementById("pedidos").style.display = "block";

            document.getElementById("micuenta").style.display = "none";
            document.getElementById("edicionmicuenta").style.display = "none";
            document.getElementById("edicioncliente").style.display = "none";
            document.getElementById("edicion_usuario").style.display = "none";
            document.getElementById("edicionarticulo").style.display = "none";
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
            document.getElementById("edicion_usuario").style.display = "none";
            document.getElementById("edicionarticulo").style.display = "none";
            document.getElementById("clientes").style.display = "none";
            document.getElementById("articulos").style.display = "none";
            document.getElementById("pedidos").style.display = "none";
            usuarios();
            refreshUsuarios();
        }

        window.onload = function () {
            if (this.localStorage.getItem("item") == "1") {
                mostrarArticulos();
                this.localStorage.clear();
            }
            
        }

        function nuevoUsuario() {
            document.getElementById("usuarios").style.display = "none";
            document.getElementById("edicion_usuario").style.display = "block";
        }

        function nuevoArticulo() {

            document.getElementById("articulos").style.display = "none";
            document.getElementById("edicionarticulo").style.display = "block";
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

        function cancelarArticulo() {
            document.getElementById("articulos").style.display = "block";
            document.getElementById("edicionarticulo").style.display = "none";
            refreshArticulos();
        }

        function cancelarPedido() {
            document.getElementById("pedidos").style.display = "block";
            document.getElementById("edicionPedido").style.display = "none";
            refreshArticulos();
        }

        function guardarUsuario() {
            if (identificador_usuario == 0) {
                document.getElementById("hdNombreUsuario").value = document.getElementById("txtNombreUsuario").value;
                document.getElementById("hdApellidoUsuario").value = document.getElementById("txtApellidoUsuario").value;
                document.getElementById("hdCorreoUsuario").value = document.getElementById("txtCorreoUsuario").value;
                document.getElementById("hdPasswordUsuario").value = document.getElementById("txtPasswordUsuario").value;
                document.getElementById("hdPasswordUsuario2").value = document.getElementById("txtPasswordUsuario2").value;
                
                
                document.getElementById("lnkGuardarUsuario").click();
                document.getElementById("usuarios").style.display = "block";
                document.getElementById("edicion_usuario").style.display = "none";


                document.getElementById("txtNombreUsuario").value = "";
                document.getElementById("txtApellidoUsuario").value = "";
                document.getElementById("txtCorreoUsuario").value = "";
                document.getElementById("txtPasswordUsuario").value = "";


            } else {
                document.getElementById("hdIdUsuario").value = document.getElementById("txtIdUsuario").value;
                document.getElementById("hdNombreUsuario").value = document.getElementById("txtNombreUsuario").value;
                document.getElementById("hdApellidoUsuario").value = document.getElementById("txtApellidoUsuario").value;
                document.getElementById("hdCorreoUsuario").value = document.getElementById("txtCorreoUsuario").value;
                document.getElementById("hdPasswordUsuario").value = document.getElementById("txtPasswordUsuario").value;
                document.getElementById("hdPasswordUsuario2").value = document.getElementById("txtPasswordUsuario2").value;

                document.getElementById("usuarios").style.display = "block";
                document.getElementById("edicion_usuario").style.display = "none";


                document.getElementById("txtNombreUsuario").value = "";
                document.getElementById("txtApellidoUsuario").value = "";
                document.getElementById("txtCorreoUsuario").value = "";
                document.getElementById("txtPasswordUsuario").value = "";

                document.getElementById("lnkActualizarMiCuenta").click();
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

            document.getElementById("clientes").style.display = "block";
            document.getElementById("edicioncliente").style.display = "none";

            document.getElementById("txtIdCliente").value ="";
            document.getElementById("txtIdUsuarioCliente").value = "";
            document.getElementById("txtNombreCliente").value = ""; 
            document.getElementById("txtApellidoCliente").value = "";
            document.getElementById("txtTelefonoCliente").value = ""; 
            document.getElementById("txtIdentificacionCliente").value = "";
            document.getElementById("txtEmailCliente").value = "";
            document.getElementById("txtNitCliente").value = "";
        }

        function actualizarArticulo() {
            if (identificador_articulo == 0) {
                document.getElementById("hdNombreArticulo").value = document.getElementById("txtNombreArticulo").value;
                document.getElementById("hdDescripcionArticulo").value = document.getElementById("txtDescripcionArticulo").value;
                document.getElementById("hdStock").value = document.getElementById("txtStock").value;
                document.getElementById("hdOtro").value = document.getElementById("txtOtro").value;

                document.getElementById("lnkActualizarArticulo").click();

                document.getElementById("articulos").style.display = "block";
                document.getElementById("edicionarticulo").style.display = "none";

                document.getElementById("txtNombreArticulo").value = "";
                document.getElementById("txtDescripcionArticulo").value = "";
                document.getElementById("txtStock").value = "";
                document.getElementById("txtOtro").value = "";

                document.getElementById("lnkLimpiarFotos").click();
                
            } else {
                document.getElementById("hdNombreArticulo").value = document.getElementById("txtNombreArticulo").value;
                document.getElementById("hdIdArticulo").value = document.getElementById("txtIdArticulo").value;
                document.getElementById("hdDescripcionArticulo").value = document.getElementById("txtDescripcionArticulo").value;
                document.getElementById("hdStock").value = document.getElementById("txtStock").value;
                document.getElementById("hdOtro").value = document.getElementById("txtOtro").value;

                document.getElementById("lnkActualizarArticuloExistente").click();

                document.getElementById("articulos").style.display = "block";
                document.getElementById("edicionarticulo").style.display = "none";

                document.getElementById("txtIdArticulo").value = "";
                document.getElementById("txtNombreArticulo").value = "";
                document.getElementById("txtDescripcionArticulo").value = "";
                document.getElementById("txtStock").value = "";
                document.getElementById("txtOtro").value = "";
            }
            
        }

        function actualizarPedido() {
            document.getElementById("hdIdPedido").value = document.getElementById("txtIDpedido").value;
            document.getElementById("lnkActualizarPedido").click();

            document.getElementById("txtIDpedido").value = "";
            document.getElementById("txtFechaPedido").value = "";
            document.getElementById("txtNombrePedido").value = "";
            document.getElementById("txtDireccionPedido").value = "";
            
        }


        function showimagepreview(input) {
            document.getElementById("imagen_cargada").style.display = "block";
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementsByTagName("img")[0].setAttribute("src", e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function editarPedido(id) {
            document.getElementById("pedidos").style.display = "none";
            document.getElementById("edicionPedido").style.display = "block";

            try {
                $.ajax({
                    url: '<%= ResolveUrl("panel_administrador.aspx/obtenerPedidoIndividual") %>',
                    method: 'post',
                    contentType: "application/json",
                    dataType: "json",
                    async: false,
                    data: '{"idpedido":"' + id + '"'
                        + '}',
                    success: function (data) {

                        if (data.d) {
                            console.log(data.d);
                            var ped = $.parseJSON(data.d);
                            console.log(ped);
                            //console.log(user[0].nombre);
                            var fecha = new Date(parseInt(ped[0].fechaPedido.replace("/Date(", "").replace(")/", ""), 10))
                            document.getElementById("txtIDpedido").value = ped[0].idPEDIDO;
                            document.getElementById("txtFechaPedido").value = fecha;
                            document.getElementById("txtNombrePedido").value = ped[0].nombre;
                            document.getElementById("txtDireccionPedido").value = ped[0].direccion;
                            var r1 = document.getElementById("rdbPendiente");
                            var r2 = document.getElementById("rdbEnProceso");
                            var r3 = document.getElementById("rdbFinalizado");
                            if (ped[0].estado == "Pendiente" || ped[0].estado == "pendiente") {
                                r1.checked = true;
                            } else if (ped[0].estado == "En proceso" || ped[0].estado == "en proceso") {
                                r2.checked = true;
                            } else{
                                r3.checked = true;
                            }

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
                    document.getElementById("usuarios").style.display = "none";
            document.getElementById("edicion_usuario").style.display = "block";

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
                            document.getElementById("txtPasswordUsuario2").value = user[0].password;
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


        function editarArticulo(id) {

            identificador_articulo = 1;
            document.getElementById("articulos").style.display = "none";
            document.getElementById("edicionarticulo").style.display = "block";

            try {
                $.ajax({
                    url: '<%= ResolveUrl("panel_administrador.aspx/obtenerArticuloIndividual") %>',
                            method: 'post',
                            contentType: "application/json",
                            dataType: "json",
                            async: false,
                    data: '{"idarticulo":"' + id + '"'
                                + '}',
                            success: function (data) {

                                if (data.d) {
                                    console.log(data.d);
                                    var articulo = $.parseJSON(data.d);
                                    document.getElementById("txtIdArticulo").value = articulo[0].idARTICULO;
                                    document.getElementById("txtNombreArticulo").value = articulo[0].nombre;
                                    document.getElementById("txtDescripcionArticulo").value = articulo[0].descripcion;
                                    document.getElementById("txtStock").value = articulo[0].stock;
                                    document.getElementById("txtOtro").value = articulo[0].otro;
                                    document.getElementById("imagen_cargada").style.display = "block";
                                    document.getElementById("imagen_cargada").src = articulo[0].ruta_imagen;
                                    
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

            refreshArticulos = function () {
                $('#tblArticulos').DataTable().ajax.reload();
            }

            refreshClientes = function () {
                $('#tblClientes').DataTable().ajax.reload();
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
                    "language": {
                        "loadingRecords": "Cargando...",
                        "processing": "Cargando...",
                        "emptyTable": "No Hay Informacion de usuarios",
                        "paginate": {
                            "first": "Primera",
                            "previous": "Anterior",
                            "next": "Siguiente",
                            "last": "Ultimo"
                        }
                        , "search": "", "searchPlaceholder": "Buscar",
                        "lengthMenu": "No. de registros por Página _MENU_ ",
                    },
                    columns: [
                        { "data": "idUSUARIO" },
                        { "data": "descripcion" },
                        { "data": 'correo' },
                        { "data": 'estado' },
                    ],
                    "columnDefs": [
                        {
                            targets: [1],
                            orderable: true,
                            title: "<p style='align:left'>Usuario</p>",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.idUSUARIO + "</span>";
                            },
                        },

                        {
                            targets: [2],
                            orderable: true,
                            title: "<p style='align:left'>Tipo Cliente</p>",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.descripcion + "</span>";
                            },
                        },
                        {
                            "targets": [3],
                            orderable: true,
                            title: "<p style='align:left'>Correo</p>",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.correo + "</span>";
                            },
                        },
                        {
                            "targets": [4],
                            orderable: true,
                            title: "<p style='align:left'>Estado</p>",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.estado + "</span>";
                            },
                        },
                        {
                            "targets": [5],
                            orderable: true,

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
                    processing: true,
                    destroy: true,
                    paginate: false,
                    scrollY: window.innerHeight - 300 + 'px',
                    "language": {
                        "loadingRecords": "Cargando...",
                        "processing": "Cargando...",
                        "emptyTable": "No Hay Informacion de clientes",
                        "paginate": {
                            "first": "Primera",
                            "previous": "Anterior",
                            "next": "Siguiente",
                            "last": "Ultimo"
                        }
                        , "search": "", "searchPlaceholder": "Buscar",
                        "lengthMenu": "No. de registros por Página _MENU_ ",
                    },
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
                            title: "<p style='align:left'>Id Cliente</p>",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.idcliente + "</span>";
                            },
                        },

                        {
                            targets: [2],
                            orderable: false,
                            title: "<p style='align:left'>Nombre</p>",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.nombre + "</span>";
                            },
                        },
                        {
                            "targets": [3],
                            orderable: false,
                            title: "<p style='align:left'>Apellido</p>",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.apellido + "</span>";
                            },
                        },
                        {
                            "targets": [4],
                            orderable: false,
                            title: "<p style='align:left'>Telefono</p>",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.telefono + "</span>";
                            },
                        },
                        {
                            "targets": [5],
                            orderable: false,
                            title: "<p style='align:left'>Email</p>",
                            width: "15%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.email + "</span>";
                            },
                        },
                        {
                            "targets": [6],
                            orderable: false,
                            title: "<p style='align:left'>Estado</p>",
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

            articulo = function () {
                tablaArticulos = $('#tblArticulos').DataTable({
                    ajax: {
                        url: '<%= ResolveUrl("panel_administrador.aspx/obtenerArticulos") %>',
                        type: 'POST',
                        contentType: "application/json",
                        dataSrc: function (data) {
                            return $.parseJSON(data.d);
                        }
                    },
                    processing: true,
                    destroy: true,
                    paginate: false,
                    scrollY: window.innerHeight - 300 + 'px',
                    "language": {
                        "loadingRecords": "Cargando...",
                        "processing": "Cargando...",
                        "emptyTable": "No Hay Informacion de articulos",
                        "paginate": {
                            "first": "Primera",
                            "previous": "Anterior",
                            "next": "Siguiente",
                            "last": "Ultimo"
                        }
                        , "search": "", "searchPlaceholder": "Buscar",
                        "lengthMenu": "No. de registros por Página _MENU_ ",
                    },
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
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.idarticulo + "</span>";
                            },
                        },

                        {
                            targets: [2],
                            orderable: false,
                            title: "Nombre",
                            width: "10%",
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
                                return "<center><span>" + row.stock + "</span></center>";
                            },
                        },
                        {
                            "targets": [6],
                            orderable: false,
                            title: "Estado",
                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<center><span>" + row.estado + "</span></center>";
                            },
                        },
                        {
                            "targets": [7],
                            orderable: false,

                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span><a href='#' onclick='editarArticulo("+row.idarticulo+")'>Editar</a></span>";
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
                    processing: true,
                    destroy: true,
                    paginate: false,
                    scrollY: window.innerHeight - 300 + 'px',
                    "language": {
                        "loadingRecords": "Cargando...",
                        "processing": "Cargando...",
                        "emptyTable": "No Hay Informacion de pedidos",
                        "paginate": {
                            "first": "Primera",
                            "previous": "Anterior",
                            "next": "Siguiente",
                            "last": "Ultimo"
                        }
                        , "search": "", "searchPlaceholder": "Buscar",
                        "lengthMenu": "No. de registros por Página _MENU_ ",
                    },
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
                            width: "5%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.idPEDIDO + "</span>";
                            },
                        },

                        {
                            targets: [2],
                            orderable: false,
                            title: "Fecha Pedido",
                            width: "15%",
                            render: function (data, type, row, meta) {
                                var fecha = new Date(parseInt(row.fechaPedido.replace("/Date(", "").replace(")/", ""), 10))
                                
                                return "<span>" + fecha  + "</span>";
                            },
                        },
                        {
                            "targets": [3],
                            orderable: false,
                            title: "Nombre",
                            width: "20%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.nombre + "</span>";
                            },
                        },
                        {
                            "targets": [4],
                            orderable: false,
                            title: "Direccion",
                            width: "30%",
                            render: function (data, type, row, meta) {
                                return "<span>" + row.direccion + "</span>";
                            },
                        },
                        {
                            "targets": [5],
                            orderable: false,

                            width: "10%",
                            render: function (data, type, row, meta) {
                                return "<span><a href='#' onclick='editarPedido(" + row.idPEDIDO + ")'>Editar</a></span>";
                            },
                        },
                        {
                            targets: [1, 2, 3, 4,5],
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
                       
                        <asp:Label ID="NombreUsuario" runat="server" Font-Size="Large" Font-Bold="true"></asp:Label>
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
                    <h1><center><legend class="text-center header">Listado de Clientes</legend></center></h1>
                     <br />
                    <table id="tblClientes" class="table ">
                    </table>
                </div>

                 <div id="articulos" style="display:none">
                     <input type="button" onclick="nuevoArticulo()" value="Nuevo Articulo" class="btn btn-info" style="float:right"/>
                    <h1><center><legend class="text-center header">Listado de articulos</legend></center></h1>
                    <table id="tblArticulos" class="table">
                    </table>
                </div>

                <div id="pedidos" style="display:none">
                    <h1><center><legend class="text-center header">Pedidos</legend></center></h1>
                     <br />
                    <table id="tblPedidos" class="table">
                    </table>
                </div>

                <div id="usuarios" style="display:none">
                    <input type="button" onclick="nuevoUsuario()" value="Nuevo Usuario" class="btn btn-info" style="float:right"/>
                     <h1><center><legend class="text-center header">Listado de usuarios</legend></center></h1>
                     <br />
                    <table id="tblUsuarios" class="table">
                    </table>
                </div>

                <div class="padre" style="display:none" id="edicion_usuario">
                  <div class="hijo">                    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                    <fieldset>
                        <h1><legend class="text-center header">Nuevo Usuario</legend></h1>

                        <div class="form-group" style="display:none">
                            <div class="col-md-12">
                                <label>Id Usuario</label>
                                <input type="text" id="txtIdUsuario" class="form-control" placeholder="Nombre"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Nombre</label>
                                <input type="text" id="txtNombreUsuario" class="form-control" placeholder="Nombre"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Apellido</label>
                                   <input type="text" id="txtApellidoUsuario" class="form-control" placeholder="Apellido"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Correo Electronico</label>
                                 <input type="text" id="txtCorreoUsuario" class="form-control" placeholder="Correo Electronico"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Contraseña</label>
                                <input type="password" id="txtPasswordUsuario" class="form-control" placeholder="Contraseña"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Confirmar Contraseña</label>
                                <input type="password" id="txtPasswordUsuario2" class="form-control" placeholder="Contraseña"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Tipo de Usuario</label>
                                <asp:DropDownList runat="server" ID="dlTipoUsuario" CssClass="form-control">
                                    <asp:ListItem Value="0">Seleccione tipo de usuario</asp:ListItem>
                                    <asp:ListItem Value="1">Administrador</asp:ListItem>
                                    <asp:ListItem Value="2">Cliente</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Estado</label>
                                <asp:DropDownList runat="server" ID="dpEstadoUsuario" CssClass="form-control">
                                    <asp:ListItem Value="1">Activo</asp:ListItem>
                                    <asp:ListItem Value="0">Inactivo</asp:ListItem>
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

                <div class="padre" style="                        display: none
                " id="edicionmicuenta">
                  <div class="hijo">                    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                    <fieldset>
                        <h1><center><legend class="text-center header">Mi Cuenta</legend></center></h1>

                        <div class="form-group" style=" display: block">
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

                 <div class="padre" style="display:none" id="edicionarticulo">
                  <div class="hijo">                    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                    <fieldset>
                        <legend class="text-center header">Edicion de Articulos</legend>

                        <div class="form-group" style="display:block">
                            <div class="col-md-12">
                                 <label>ID Articulo</label>
                                <input type="text" id="txtIdArticulo" class="form-control" placeholder="Id Articulo" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Nombre</label>
                                <input type="text" id="txtNombreArticulo" class="form-control" placeholder="Nombre"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Descripcion</label>
                                   <input type="text" id="txtDescripcionArticulo" class="form-control" placeholder="Descripcion"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                               
                            </div>
                        </div>

                        

                         <div class="form-group">
                            <div class="col-md-12">
                                <label>Foto</label>
                                <br />
                                   <asp:FileUpload ID="idCargarImagen" runat="server" onchange="showimagepreview(this)"/>
                                <br />
                                <br />
   
                                <img src="" alt="Sample Photo" id="imagen_cargada" width="400" height="250" style="display:none" />
                            </div>
                        </div>

                         <div class="form-group">
                            <div class="col-md-12" >
                                <table>
                                    <tr>
                                        <td style="width:80%">
                                             <label>Categoria</label>
                                  <asp:DropDownList runat="server" ID="dpCategorias" CssClass="form-control">
                                </asp:DropDownList>
                                        </td>
                                        <td style="width:100%">
                                            <label>Stock</label>
                                   <input type="text" id="txtStock" class="form-control" placeholder="Stock" />
                                        </td>
                                    </tr>
                                </table>
                                
                                
                            </div>

                        </div>
                         <div class="form-group">
                            <div class="col-md-12">
                                <label>Otro</label>
                                   <input type="text" id="txtOtro" class="form-control" placeholder="Ingrese comentarios adicionales al producto (opcional)"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Estado</label>
                                <asp:DropDownList runat="server" ID="dpEstadoArticulo" CssClass="form-control">
                                    <asp:ListItem Value="1">Activo</asp:ListItem>
                                    <asp:ListItem Value="0">Inactivo</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <input type="button" class="btn btn-primary btn-lg" onclick="actualizarArticulo()" value="Guardar" />
                                <input type="button" class="btn btn-primary btn-lg" onclick="cancelarArticulo()" value="Cancelar" />
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
                                <input type="text" id="txtTelefonoCliente" class="form-control" placeholder="Telefono"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Identificacion</label>
                                <input type="text" id="txtIdentificacionCliente" class="form-control" placeholder="Identificacion"/>
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
                                <input type="text" id="txtNitCliente" class="form-control" placeholder="NIT"/>
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


                  <div class="padre" style="display:none" id="edicionPedido">
                  <div class="hijo">                    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="well well-sm">
                    <fieldset>
                        <h1><legend class="text-center header">Control del Pedido</legend></h1>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>ID Pedido</label>
                                <input type="text" id="txtIDpedido" class="form-control" placeholder="ID Pedido" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Fecha de Pedido</label>
                                <input type="text" id="txtFechaPedido" class="form-control" placeholder="Fecha de Pedido" disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Descripcion del pedido</label>
                                   <input type="text" id="txtNombrePedido" class="form-control" placeholder="Descripcion" disabled/>
                            </div>
                        </div>

                         <div class="form-group">
                            <div class="col-md-12">
                                <label>Direccion del pedido</label>
                                   <input type="text" id="txtDireccionPedido" class="form-control" placeholder="Direccion" disabled/>
                            </div>
                        </div>

                        

                        <div class="form-group" >
                            <div class="col-md-12" style="font-size:large; border:1px solid #36A0FF" >
                                <center>
                                    <br />
                                <div >Estado</div>
                                <br />
                                
                                <asp:RadioButton runat="server"  ID="rdbPendiente"  GroupName="estados" Font-Size="Large"/>
                                &nbsp; Pendiente&nbsp;&nbsp;&nbsp;
                                <asp:RadioButton runat="server"  ID="rdbEnproceso"  GroupName="estados" Font-Size="Large"/>
                                &nbsp; En Proceso&nbsp;&nbsp;&nbsp;
                                <asp:RadioButton runat="server"  ID="rdbFinalizado" GroupName="estados" Font-Size="Large"/>

                                &nbsp; Finalizado&nbsp;&nbsp;
                                     <br /><br />
                                    </center>
                            </div>
                           
                        </div>
                        <br /><br />
                    

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <input type="button" class="btn btn-primary btn-lg" onclick="actualizarPedido()" value="Actualizar" />
      <%--                          <asp:Button runat="server" ID="btnRegistrarUser" Text="Guardar" CssClass="btn btn-primary btn-lg" OnClick="btnRegistrarUser_Click" OnClientClick="cancelarUsuario()"/>--%>
                                <input type="button" class="btn btn-primary btn-lg" onclick="cancelarPedido()" value="Cancelar" />
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
                 <asp:LinkButton runat="server" ID="lnkActualizarArticulo" ClientIDMode="Static" OnClick="lnkActualizarArticulo_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkLimpiarFotos" ClientIDMode="Static" OnClick="lnkLimpiarFotos_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkActualizarArticuloExistente" ClientIDMode="Static" OnClick="lnkActualizarArticuloExistente_Click"></asp:LinkButton>
                <asp:LinkButton runat="server" ID="lnkActualizarPedido" ClientIDMode="Static" OnClick="lnkActualizarPedido_Click"></asp:LinkButton>

                
                
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

                 <asp:HiddenField runat="server" ID="hdIdArticulo" ClientIDMode="Static" value=""/>
                <asp:HiddenField runat="server" ID="hdNombreArticulo" ClientIDMode="Static" value=""/>
                <asp:HiddenField runat="server" ID="hdDescripcionArticulo" ClientIDMode="Static" value=""/>
                 <asp:HiddenField runat="server" ID="hdStock" ClientIDMode="Static" value=""/>
                <asp:HiddenField runat="server" ID="hdOtro" ClientIDMode="Static" value=""/>

                <asp:HiddenField runat="server" ID="hdIdPedido" ClientIDMode="Static" value=""/>


            </ContentTemplate>
            <Triggers>
               <asp:PostBackTrigger ControlID="lnkActualizarArticulo" />
                <asp:PostBackTrigger ControlID="lnkActualizarArticuloExistente" />
            </Triggers>
        </asp:UpdatePanel>
    </form>

</body>
</html>
