<%-- 
    Document   : desactivaSesion
    Created on : 23/12/2022, 02:41:52 AM
    Author     : Angel Arevalo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
session.removeAttribute("usuario");
response.sendRedirect("articulos.jsp");
%>
