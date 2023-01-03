<%-- 
    Document   : validaAcceso
    Created on : 2/01/2023, 10:43:52 PM
    Author     : AT_Fam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="tasf.test.examenTASF.*" %>
<!DOCTYPE html>
<%@page session="true"%>


<%
String usuario = request.getParameter("usuario");
String password = request.getParameter("password");
usuarios usu = new usuarios();
int valido = usu.validaAcceso(usuario, password);
out.print(valido);
%>

