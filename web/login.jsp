<%-- 
    Document   : login
    Created on : 21/10/2019, 09:52:42 AM
    Author     : Miguel Sinay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Acceso al sistema</title>
    </head>
    <body class="bg-light">
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 class="display-4">Sistema de hotelería</h1>
            <p class="lead">Inicia sesión para efectuar reservaciones, administrar usuarios, personal, clientes y más.</p>
        </div>
    </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <form class="container-fluid" name="frmLogin" id="frmLogin" method="POST" action="srvLogin">
            <div class="form-group">
                <label for="usuario">Usuario:</label>
                <input type="text" class="form-control" id="usuario" name="txtUsuario" aria-describedby="userHelp" placeholder="Introduce tu nombre de usuario">
                <small id="userHelp" class="form-text text-muted">No compartas tus credenciales de acceso.</small>
            </div>
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" class="form-control" id="password" name="txtPassword" placeholder="Introduce tu contraseña" required>
            </div>
                <input type="submit" class="btn btn-lg btn-block btn-outline-primary" value="Iniciar Sesión" id="btnLogin" name="btnLogin" onClick="return validarForm();">
            </form>
            </div>
            <div class="col-md-3"></div>
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
        <script type="text/javascript">
            function validarForm(){
                var campoVacio = ""; mensajeCorto=""; var incidentes=false; var lon = $("#password").val().length;
                if($("#usuario").val() == "")
                {
                    campoVacio += "<li>Nombre de usuario.</li>";
                }
                if($("#password").val() == "")
                {
                    campoVacio += "<li>Contraseña.</li>";
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
                if(lon < 5 && lon > 0)
                {
                    mensajeCorto = $("#marco-malas-noticias").html() + "<div class=\"alert alert-warning\" role=\"alert\">Generalmente no permitimos contraseñas de menos de 5 caracteres.</div>";
                    $("#marco-malas-noticias").html(mensajeCorto); incidentes=true;
                }
                if(incidentes==true)
                {
                    return false;
                }
            };
        </script>
        <%
            HttpSession sesion = request.getSession();
            if(request.getAttribute("respuesta") != null)
            {
                if(request.getAttribute("respuesta")=="True")
                {
                    sesion.setAttribute("usuario", request.getAttribute("usuario"));
                    sesion.setAttribute("perfil", request.getAttribute("perfil"));
                    response.sendRedirect("menu.jsp");
                }
                else
                {
                    %>
                    <script type="text/javascript">
                            $("#marco-malas-noticias").html("");
                            $("#marco-malas-noticias").html("<div class=\"alert alert-danger\" role=\"alert\"><strong>Usuario no encontrado</strong> Comprueba tus credenciales de acceso.</div>");
                    </script>
        <%
                }
            }
            if(request.getParameter("cerrar")!=null)
            {
                session.invalidate();
            }
        %>
    </body>
</html>
