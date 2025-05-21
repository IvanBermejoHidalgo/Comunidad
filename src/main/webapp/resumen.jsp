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
    
    <table>
        <tr>
            <th>Campo</th>
            <th>Valor</th>
        </tr>
        <tr>
            <td>Comunidad</td>
            <td><%= comunidad.getCodigo() %> - <%= comunidad.getNombre() %></td>
        </tr>
        <tr>
            <td>Número de zonas</td>
            <td><%= comunidad.getZonas().size() %></td>
        </tr>
        <tr>
            <td>Número de propiedades</td>
            <td><%= comunidad.getPropiedades().size() %></td>
        </tr>
        <tr>
            <td>Número de propietarios</td>
            <td><%= comunidad.getPropietarios().size() %></td>
        </tr>
        <tr>
            <td>Número de gastos</td>
            <td><%= comunidad.getGastos().size() %></td>
        </tr>
    </table>

    <nav>
        <a href="propiedades.jsp">Ver propiedades</a>
        <a href="propietarios.jsp">Ver propietarios</a>
        <a href="cuotas.jsp">Ver cuotas</a>
    </nav>
</body>
</html>
