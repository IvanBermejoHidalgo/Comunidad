<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Propietario, model.Comunidad" %>
<%
    Comunidad comunidad = (Comunidad) session.getAttribute("comunidad");
    List<Propietario> propietarios = comunidad != null ? comunidad.getPropietarios() : new ArrayList<>();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PROPIETARIS</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
    <div style="text-align: center; font-weight: bold; font-size: 1.2em;">PROPIETARIS:</div>
    <br>
    <table>
        <tr>
            <th>C.</th>
            <th>Nom Propietari</th>
            <th>Email</th>
            <th>Propietats</th>
        </tr>
        <tr><td colspan="4" class="divider"></td></tr>
        <% for (Propietario p : propietarios) { %>
            <tr>
                <td><%= p.getCodigo() %></td>
                <td><%= p.getNombre() %></td>
                <td><%= p.getEmail() %></td>
                <td><%= p.getPropiedadesFormateadas() %></td>
            </tr>
        <% } %>
        <tr><td colspan="4" class="divider"></td></tr>
        <tr>
            <td colspan="4" style="text-align: right;">
                <%= propietarios.size() %> propietaris total
            </td>
        </tr>
    </table>
    <a href="resumen.jsp">Volver al resumen</a>
</body>
</html>