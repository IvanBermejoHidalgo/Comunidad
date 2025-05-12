<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Gasto, model.Comunidad" %>
<%
    Comunidad comunidad = (Comunidad) session.getAttribute("comunidad");
    List<model.Gasto> gastos = comunidad != null ? comunidad.getGastos() : new ArrayList<>();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cuotas / Gastos</title>
</head>
<body>
    <h2>Lista de cuotas/gastos</h2>
    <ul>
        <% for (model.Gasto g : gastos) { %>
            <li><%= g.toString() %></li>
        <% } %>
    </ul>
    <a href="resumen.jsp">Volver al resumen</a>
</body>
</html>
