<%-- 
    Document   : validaAcceso
    Created on : 23/12/2022, 02:01:48 AM
    Author     : Angel Arevalo
--%>


<%@page language="java" import="com.mycompany.mavenproject2.*" %>
<%@page session="true"%>

<%
String usuario = request.getParameter("usuario");
String password = request.getParameter("password");
usuarios usu = new usuarios();
String valido = usu.validaAcceso(usuario, password);
out.print(valido);
%>
