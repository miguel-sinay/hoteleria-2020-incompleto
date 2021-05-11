<%-- 
    Document   : registrarPersonal
    Created on : 28/10/2019, 08:22:24 PM
    Author     : Miguel Sinay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Estructuras.puesto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%
    HttpSession sesion = request.getSession();
    if(sesion.getAttribute("usuario")==null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<%
    String perfilCadena;
    int perfil;
    perfilCadena = sesion.getAttribute("perfil").toString();
    perfil = Integer.parseInt(perfilCadena);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Registro de personal</title>
    </head>
    <body class="bg-light">
        <!-- Inicia BARRA DE NAVEGACION -->
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="menu.jsp">Hotelería</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <%
                    if(perfil == 1)
                    {
                    %>
                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPersonal" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Personal</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownPersonal">
                            <a class="dropdown-item" href="srvListaPuestoParaRegistroPersonal">Registrar Nuevo</a>
                            <a class="dropdown-item" href="#">Visualizar</a><!--FALTA CODIFICACION AQUI-->
                        </div>
                    </li>
                    <%
                    }
                    if(perfil == 1)
                    {
                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownClientes" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Clientes</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownClientes">
                            <a class="dropdown-item" href="registrarClientes.jsp">Registrar Nuevo</a>
                            <a class="dropdown-item" href="">Visualizar</a><!--FALTA CODIFICACION AQUI-->
                        </div>
                    </li>
                    <%
                    }
                    if(perfil == 1)
                    {
                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownServiciosVarios" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Servicios Varios</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownServiciosVarios">
                            <a class="dropdown-item" href="registrarServiciosVarios.jsp">Registrar Nuevo Informe</a>
                            <a class="dropdown-item" href="">Visualizar algún informe</a><!--FALTA CODIFICACION AQUI-->
                        </div>
                    </li>
                    <%
                    }
                    if(perfil == 1 || perfil == 2)
                    {
                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownReservaciones" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reservaciones</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownReservaciones">
                            <a class="dropdown-item" href="reservar.jsp">Reservar</a>
                            <a class="dropdown-item" href="">Visualizar reservación</a><!--FALTA CODIFICACION AQUI-->
                        </div>
                    </li>
                    <%
                    }
                    if(perfil == 1)
                    {
                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownFacturacion" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Facturación</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownFacturacion">
                            <a class="dropdown-item" href="facturar.jsp">Registrar factura</a>
                            <a class="dropdown-item" href="">Visualizar factura</a><!--FALTA CODIFICACION AQUI-->
                        </div>
                    </li>
                    <%
                    }
                    if(perfil == 1 || perfil == 3)
                    {
                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownReportes" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reportes</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownReportes">
                            <a class="dropdown-item" href="rpPlanillaLaboral.jsp">Planilla Laboral</a>
                            <a class="dropdown-item" href="rpReservaciones.jsp">Reservaciones</a>
                            <a class="dropdown-item" href="rpDisponibleHabitacion">Disponibilidad de Habitación</a>
                            <a class="dropdown-item" href="rpFacturacion">Facturación</a>
                        </div>
                    </li><%}%>
                </ul>
                <form class="form-inline my-2 my-lg-0" method="POST">
                    <a class="btn btn-outline-secondary my-2 my-sm-0" href="login.jsp?cerrar=true">Salir</a>
                </form>
            </div>
        </nav>
        <!-- Finaliza BARRA DE NAVEGACION -->
        <div class="container align-content-center"><h2>Registro de nuevo personal</h2></div>
        <!-- Inicia Formulario de registro de personal -->
        <form action="srvRegistrarPersonal" name="frmRegistroPersonal" id="frmRegistroPersonal" method="POST">
            <div class="form-row">
                <div class="col-sm-2"></div>
                <div class="form-group col-sm-4">
                    <label for="nombres">Nombres:</label>
                    <input type="text" class="form-control" id="nombres" name="txtNombres" placeholder="Los nombres del colaborador" required>
                </div>
                <div class="form-group col-sm-4">
                    <label for="apellidos">Apellidos:</label>
                    <input type="text" class="form-control" id="apellidos" name="txtApellidos" placeholder="Los apellidos del colaborador" required>
                </div>
                <div class="col-sm-2"></div>
            </div>
            <div class="form-row">
                <div class="col-sm-2"></div>
                <div class="form-group col-sm-8">
                    <label for="direccion">Dirección:</label>
                    <input type="text" class="form-control" id="direccion" name="txtDireccion" placeholder="Antigua carretera a Amatitlán Km 20.5 Zona 10, Villa Nueva" required>
                </div>
                <div class="col-sm-2"></div>
            </div>
            <div class="form-row">
                <div class="col-sm-2"></div>
                <div class="form-group col-sm-8">
                    <label for="profesion">Profesión:</label>
                    <input type="text" class="form-control" id="profesion" name="txtProfesion" placeholder="Ingeniero(a) en sistemas de información y ciencias de la computación" required>
                </div>
                <div class="col-sm-2"></div>
            </div>
            <div class="form-row">
                <div class="col-sm-2"></div>
                <div class="form-group col-sm-3">
                    <label for="dpi">DPI No.:</label>
                    <input type="text" class="form-control" id="dpi" name="txtDPI" placeholder="2898579210101" required>
                </div>
                <div class="form-group col-sm-5">
                    <label for="puesto">Puesto:</label>
                    <%
                    ArrayList<puesto> lp = (ArrayList<puesto>) request.getAttribute("listar");
                    %>
                    <select id="puesto" name="txtPuesto" class="form-control">
                        <option value="0" selected>Selecciona puesto</option>
                        <%
                        for(puesto p : lp){
                        %>
                        <option value="<%= p.getIdPuesto()%>"><%= p.getNombrePuesto()%></option>
                        <%
                        }
                        %>
                    </select>
                </div>
                <div class="col-sm-2"></div>
            </div>
            <div class="form-row">
                <div class="col-sm-2"></div>
                <div class="form-group col-sm-3">
                    <label for="telefono">No. de Teléfono:</label>
                    <input type="text" class="form-control" id="telefono" name="txtTelefono" required>
                </div>
                <div class="form-group col-sm-3">
                    <label for="email">Dirección de correo:</label>
                    <input type="email" class="form-control" id="email" name="txtEmail">
                </div>
                <div class="form-group col-sm-2">
                    <label for="salario">Salario:</label>
                    <input type="text" class="form-control" id="salario" name="txtSalario" required>
                </div>
                <div class="col-sm-2"></div>
            </div>
            <div class="form-row">
                <div class="col-sm-4"></div>
                <div class="form-group col-sm-2">
                    <label for="fechaNacimiento">Fecha de nacimiento:</label>
                    <input type="date" class="form-control" id="fechaNacimiento" name="txtFechaNacimiento">
                </div>
                <div class="form-group col-sm-2">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" id="estadoActivo" name="txtEstatus" value="A" checked>
                        <label class="form-check-label" for="estadoActivo">Activo</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" id="estadoInactivo" name="txtEstatus" value="I">
                        <label class="form-check-label" for="estadoInactivo">Inactivo</label>
                    </div>
                </div>
                <div class="col-sm-4"></div>
            </div>
            <div class="form-row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"><input type="submit" class="btn btn-outline-primary btn-block" value="Registrar personal" id="btnRegistrarPersonal" name="btnRegistrarPersonal" onClick="return validarFrmRegistroPersonal();"></div>
                <div class="col-sm-4"></div>
            </div>
            <div class="form-row" style="margin-top: 8px;">
                <div class="col-sm-4"></div>
                <div class="col-sm-2"><input type="reset" class="btn btn-outline-danger btn-block" value="Limpiar formulario"></div>
                <div class="col-sm-2"><a class="btn btn-outline-warning btn-block" href="menu.jsp">Cancelar</a></div>
                <div class="col-sm-4"></div>
            </div>
        </form>
        <!-- Finaliza Formulario de registro de personal -->
        <!-- Marco para mostrar alertas -->
        <div class="container-fluid" id="marco-general" style="margin-top: 10px;">
            <div class="container-fluid" id="marco-malas-noticias">
                <div class="alert alert-warning fade show" role="alert" style="display:none;" id="listaVacios"></div>
            </div>
            <div class="container-fluid" id="marco-buenas-noticias"></div>
        </div>
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="js/popper-1.14.7.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function validarFrmRegistroPersonal(){
                var campoVacio = ""; mensajeCorto=""; var incidentes=false;
                if($("#nombres").val() == "")
                {
                    campoVacio += "<li>Nombres del colaborador.</li>";
                }
                if($("#apellidos").val() == "")
                {
                    campoVacio += "<li>Apellidos del colaborador.</li>";
                }
                if($("#direccion").val() == "")
                {
                    campoVacio += "<li>Dirección.</li>";
                }
                if($("#profesion").val() == "")
                {
                    campoVacio += "<li>Profesión.</li>";
                }
                if($("#dpi").val() == "")
                {
                    campoVacio += "<li>No. de DPI.</li>";
                }
                if($("#puesto").val() == 0)
                {
                    campoVacio += "<li>Puesto.</li>";
                }
                if($("#telefono").val() == "")
                {
                    campoVacio += "<li>No. de Teléfono.</li>";
                }
                if($("#email").val() == "")
                {
                    campoVacio += "<li>Dirección de correo electrónico.</li>";
                }
                if($("#salario").val() == "")
                {
                    campoVacio += "<li>Salario.</li>";
                }
                if($("#fechaNacimiento").val() == "")
                {
                    campoVacio += "<li>Fecha de nacimiento.</li>";
                }
                if(campoVacio != "")
                {
                    campoVacio ="<h5 class=\"alert-heading\">Por favor completa los siguientes campos:</h5><ul>" + campoVacio + "</ul>";
                    $("#listaVacios").html(campoVacio);
                    $("#listaVacios").fadeIn("slow");
                    if($("#listaVacios").attr("style") != "" || $("#listaVacios").attr("style") != undefined)
                    {
                        $("#listaVacios").removeAttr("style");
                    }
                    incidentes=true;
                }
                if(incidentes==true)
                {
                    return false;
                }
            };
        </script>
        <%
            if(request.getAttribute("operacion")!=null)
            {
                %>alert("Inserción exitosa. <%=request.getAttribute("operacion")%>");<%
                if((Integer)request.getAttribute("operacion") == 1)
                {
                    %><script type="text/javascript">
                        //$("#marco-buenas-noticias").html("<div class=\"alert alert-success fade show\" role=\"alert\"><strong>¡Registro exitoso!</strong> Nuevo integrante del personal registrado.</div>");
                        alert("Inserción exitosa.");
                    </script>
                    <%
                }
                else
                {
                    %><script type="text/javascript">
                        /*$("#marco-malas-noticias").html("");
                        $("#marco-malas-noticias").html("<div class=\"alert alert-danger fade show\" role=\"alert\"><strong>Fallo.</strong> No se logró concretar la inserción del registro.</div>");*/
    alert("Fallo");
                    </script>
                    <%
                }
            }
        %>
    </body>
</html>
