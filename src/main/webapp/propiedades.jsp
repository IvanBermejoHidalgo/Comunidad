<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Comunidad, model.Propiedad, java.util.List, java.util.Map, model.Zona" %>
<%
Comunidad comunidad = (Comunidad) session.getAttribute("comunidad");
if (comunidad == null) {
    response.sendRedirect("../index.jsp");
    return;
}
List<Propiedad> propiedades = comunidad.getPropiedades();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Propiedades</title>
    <link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
    <h2>Listado de Propiedades</h2>
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>m2</th>
                <th>Propietario</th>
                <th>Zonas y porcentajes</th>
                <th>Tipo</th>
                <th>Información adicional</th>
            </tr>
        </thead>
        <tbody>
            <% if (propiedades != null) { 
                for (Propiedad p : propiedades) { 
                    if (p != null) { %>
            <tr>
                <td><%= p.getCodigo() != null ? p.getCodigo() : "" %></td>
                <td><%= p.getMetrosCuadrados() %></td>
                <td><%= p.getPropietario() != null ? p.getPropietario().getNombre() : "N/A" %></td>
                <td>
                    <% if (p.getPorcentajesPorZona() != null) { 
                        for (Map.Entry<Zona, Double> entry : p.getPorcentajesPorZona().entrySet()) { 
                            if (entry.getKey() != null) { %>
                                <%= entry.getKey().getCodigo() %>-<%= entry.getValue() %>% 
                            <% } 
                        } 
                    } %>
                </td>
                <td><%= p.getTipoPropiedad() != null ? p.getTipoPropiedad() : "" %></td>
                <td><%= p.getInformacionAdicional() != null ? p.getInformacionAdicional() : "" %></td>
            </tr>
                    <% } 
                } 
            } %>
        </tbody>
    </table>
    <a href="resumen.jsp">Volver al resumen</a>
</body>
</html>