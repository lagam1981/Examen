<%-- 
    Document   : acceso.jsp
    Created on : 22/12/2022, 10:25:10 PM
    Author     : Angel Arevalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="com.mycompany.mavenproject2.*" %>
<%@page session="true"%>
<!DOCTYPE html>
<%
if( session.getAttribute("usuario")!=null ){
    response.sendRedirect("articulos.jsp");
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acceso al examen</title>
        
        <link href="assets/css/css.css" rel="stylesheet" media="all" />
    </head>
    <body>
        <div class="loginBox">
            <span class="titulo">Bienvenido</span>
            
            <div class="renglon" style="margin-top: 50px;">
                <label>Usuario</label>
                <input tabindex="0" type="text" name="usuario" id="usuario" class="textboxes" placeholder="admin" />
            </div>
            
            <div class="renglon">
                <label>Contraseña</label>
                <input tabindex="0" type="password" name="password" id="password" class="textboxes" placeholder="admin" />
            </div>
            
            <div class="renglon centrado" style="margin-top: 150px;">
                <center>
                    <button title="Acceder al examen" type="button" name="acceder" id="acceder" class="btnbasico">Acceder</button>
                </center>
            </div>
        </div>
        
    </body>
</html>

<script src="assets/scripts/jquery-3.6.3.js"></script>
<script src="assets/scripts/botones.js"></script>
