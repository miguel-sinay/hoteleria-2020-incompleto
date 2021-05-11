<%-- 
    Document   : menu
    Created on : 27/10/2019, 10:00:36 AM
    Author     : Marit Herrarte
--%>

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
        <title>Menú Principal</title>
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
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPersonal" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Personal</a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownPersonal">
                            <a class="dropdown-item" href="srvListaPuestoParaRegistroPersonal">Registrar Nuevo</a><!--href="srvListaPuestoParaRegistroPersonal"-->
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
        <div class="row container-fluid" style="margin-top: 30px;">
            <div class="col-sm-6"><div class="alert alert-info fade show">Sesión iniciada como: <strong><%=sesion.getAttribute("usuario")%></strong> | idPerfil: <%=sesion.getAttribute("perfil")%></div></div>
        </div>
        <div class="container-fluid" id="marco-general" style="margin-top: 10px;">
            <div class="container-fluid" id="marco-malas-noticias">
                <div class="alert alert-warning fade show" role="alert" style="display:none;" id="listaVacios"></div>
            </div>
            <div class="container-fluid" id="marco-buenas-noticias"></div>
        </div>
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="js/popper-1.14.7.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
    </body>
</html>
