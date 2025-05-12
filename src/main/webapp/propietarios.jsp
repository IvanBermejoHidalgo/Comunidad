<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Propietario, model.Comunidad" %>
<%
    Comunidad comunidad = (Comunidad) session.getAttribute("comunidad");
    List<model.Propietario> propietarios = comunidad != null ? comunidad.getPropietarios() : new ArrayList<>();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Propietarios</title>
</head>
<body>
    <h2>Lista de propietarios</h2>
    <ul>
        <% for (model.Propietario p : propietarios) { %>
            <li><%= p.toString() %></li>
        <% } %>
    </ul>
    <a href="resumen.jsp">Volver al resumen</a>
</body>
</html>
