<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Comunidad" %>
<%
Comunidad comunidad = (Comunidad) session.getAttribute("comunidad");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resumen de la Comunidad</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
    <h2>Resumen de la Comunidad</h2>
    <ul>
        <li>Comunidad: <%= comunidad.getCodigo() %> - <%= comunidad.getNombre() %></li>
        <li>Número de zonas: <%= comunidad.getZonas().size() %></li>
        <li>Número de propiedades: <%= comunidad.getPropiedades().size() %></li>
        <li>Número de propietarios: <%= comunidad.getPropietarios().size() %></li>
        <li>Número de gastos: <%= comunidad.getGastos().size() %></li>
    </ul>
    
    <nav>
        <a href="propiedades.jsp">Ver propiedades</a>
        <a href="propietarios.jsp">Ver propietarios</a>
        <a href="cuotas.jsp">Ver cuotas</a>
    </nav>
</body>
</html>