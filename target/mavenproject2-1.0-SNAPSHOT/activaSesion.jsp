<%-- 
    Document   : activaSesion
    Created on : 23/12/2022, 02:30:04 AM
    Author     : Angel Arevalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
String usuario = request.getParameter("usuario");
session.setAttribute("usuario",usuario);
response.sendRedirect("articulos.jsp");
%>