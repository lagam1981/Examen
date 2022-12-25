<%-- 
    Document   : acceso.jsp
    Created on : 23/12/2022, 00:27:10 PM
    Author     : Angel Arevalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="com.mycompany.mavenproject2.*" %>
<%@page session="true"%>

<%
if( session.getAttribute("usuario")==null ){
    response.sendRedirect("acceso.jsp");
}

String folio = request.getParameter("folven");
ventas vta = new ventas();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Examen</title>
        
        <link href="assets/css/css.css" rel="stylesheet" media="all" />
    </head>
    <body>
        
        <div class="renglon">
            Bienvenido: <%=session.getAttribute("usuario")%>
            <a title="Eliminar sesión activa" href="desactivaSesion.jsp">Salir</a>
        </div>
        
        <div class="principalBox">
            <span class="titulo">Consulta de ventas</span>
            
            
            <div class="renglon">
                <label>Folio de venta</label>
                <form name="frmConsulta" id="frmConsulta" method="get">
                    <input tabindex="0" type="number" name="folven" id="folven" class="textboxes" value="<%=folio%>" style="width: 25%;" />
                    <button title="Consultar folio" type="button" name="consultar" id="consultar" class="btnbasico">Consultar</button>
                </form>
            </div>
            
            <div class="renglon">
                <label>Listado de productos</label>
                <table class="listado" cellspacing="0" cellpadding="5">
                    <tr style="background: rgba(182,221,231,0.8);">
                        <td>No.</td>
                        <td>Producto</td>
                        <td>Cantidad</td>
                        <td>Precio Unitario</td>
                        <td>Total</td>
                    </tr>
                    <tbody name="listaArticulos" id="listaArticulos">
                        <% out.print(vta.listadoVenta(folio)); %>
                    </tbody>
                    <tr style="background: rgba(182,221,231,0.5);">
                        <td colspan="2" style="text-align: right;">Total Productos:</td>
                        <td><label id="totprod">0</label></td>
                        <td style="text-align: right;">Total Venta:</td>
                        <td align="right"><label id="totven">$ 0</label></td>
                    </tr>
                </table>
            </div>
            
        </div>
        
    </body>
</html>

<script src="assets/scripts/jquery-3.6.3.js"></script>
<script src="assets/scripts/botones.js"></script>
<script>acumulados();</script>
