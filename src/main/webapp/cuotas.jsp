<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.*, model.Comunidad" %>
<%
    Comunidad comunidad = (Comunidad) session.getAttribute("comunidad");
    List<Gasto> gastos = comunidad != null ? comunidad.getGastos() : new ArrayList<>();
    List<Propiedad> propiedades = comunidad != null ? comunidad.getPropiedades() : new ArrayList<>();
    
    // Calcular totales
    double totalE = 0, totalC = 0, totalG = 0;
    for (Propiedad p : propiedades) {
        for (Map.Entry<Zona, Double> entry : p.getCuota().getImportesPorZona().entrySet()) {
            if (entry.getKey().getCodigo().equals("E")) totalE += entry.getValue();
            else if (entry.getKey().getCodigo().equals("C")) totalC += entry.getValue();
            else if (entry.getKey().getCodigo().equals("G")) totalG += entry.getValue();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>QUOTES PER PROPIETATS</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
    <div style="text-align: center; font-weight: bold;">QUOTES PER PROPIETATS:</div>
    <br>
    <table>
        <tr><td colspan="9" class="divider"></td></tr>
        <tr>
            <th>CPt</th>
            <th>Nom Propietari</th>
            <th>%E</th>
            <th>%C</th>
            <th>%G</th>
            <th>E.</th>
            <th>C.</th>
            <th>G.</th>
            <th>Total</th>
        </tr>
        <tr><td colspan="9" class="divider"></td></tr>
        <% for (Propiedad p : propiedades) { 
            double e = 0, c = 0, g = 0;
            for (Map.Entry<Zona, Double> entry : p.getCuota().getImportesPorZona().entrySet()) {
                if (entry.getKey().getCodigo().equals("E")) e = entry.getValue();
                else if (entry.getKey().getCodigo().equals("C")) c = entry.getValue();
                else if (entry.getKey().getCodigo().equals("G")) g = entry.getValue();
            }
            
            double porcentajeE = p.getPorcentajesPorZona().entrySet().stream()
                .filter(entry -> entry.getKey().getCodigo().equals("E"))
                .map(Map.Entry::getValue)
                .findFirst().orElse(0.0);
                
            double porcentajeC = p.getPorcentajesPorZona().entrySet().stream()
                .filter(entry -> entry.getKey().getCodigo().equals("C"))
                .map(Map.Entry::getValue)
                .findFirst().orElse(0.0);
                
            double porcentajeG = p.getPorcentajesPorZona().entrySet().stream()
                .filter(entry -> entry.getKey().getCodigo().equals("G"))
                .map(Map.Entry::getValue)
                .findFirst().orElse(0.0);
        %>
            <tr>
                <td><%= p.getCodigo() %></td>
                <td><%= p.getPropietario().getNombre() %></td>
                <td><%= String.format("%.0f", porcentajeE) %></td>
                <td><%= String.format("%.0f", porcentajeC) %></td>
                <td><%= String.format("%.0f", porcentajeG) %></td>
                <td class="right"><%= String.format("%.2f", e) %></td>
                <td class="right"><%= String.format("%.2f", c) %></td>
                <td class="right"><%= String.format("%.2f", g) %></td>
                <td class="right"><%= String.format("%.2f", e + c + g) %></td>
            </tr>
        <% } %>
        <tr><td colspan="9" class="divider"></td></tr>
        <tr>
            <td colspan="5">Total</td>
            <td class="right"><%= String.format("%.2f", totalE) %></td>
            <td class="right"><%= String.format("%.2f", totalC) %></td>
            <td class="right"><%= String.format("%.2f", totalG) %></td>
            <td class="right"><%= String.format("%.2f", totalE + totalC + totalG) %></td>
        </tr>
        <tr><td colspan="9" class="divider"></td></tr>
        <tr>
            <td colspan="9" style="text-align: right;">
                <%= propiedades.size() %> propietats total
            </td>
        </tr>
    </table>
    
    <br><br>
    
    <div style="text-align: center; font-weight: bold;">QUOTES PER PROPIETARIS:</div>
    <br>
    <table>
        <tr><td colspan="9" class="divider"></td></tr>
        <tr>
            <th>CP</th>
            <th>Nom Propietari</th>
            <th>%E</th>
            <th>%C</th>
            <th>%G</th>
            <th>E.</th>
            <th>C.</th>
            <th>G.</th>
            <th>Total</th>
        </tr>
        <tr><td colspan="9" class="divider"></td></tr>
        <% 
            Map<String, Propietario> propietariosUnicos = new LinkedHashMap<>();
            for (Propiedad p : propiedades) {
                Propietario prop = p.getPropietario();
                if (!propietariosUnicos.containsKey(prop.getCodigo())) {
                    propietariosUnicos.put(prop.getCodigo(), prop);
                }
            }
            
            for (Propietario p : propietariosUnicos.values()) { 
                double e = 0, c = 0, g = 0;
                for (Propiedad prop : p.getPropiedades()) {
                    for (Map.Entry<Zona, Double> entry : prop.getCuota().getImportesPorZona().entrySet()) {
                        if (entry.getKey().getCodigo().equals("E")) e += entry.getValue();
                        else if (entry.getKey().getCodigo().equals("C")) c += entry.getValue();
                        else if (entry.getKey().getCodigo().equals("G")) g += entry.getValue();
                    }
                }
                
                double porcentajeE = p.getTotalesPorZona().entrySet().stream()
                    .filter(entry -> entry.getKey().getCodigo().equals("E"))
                    .map(Map.Entry::getValue)
                    .findFirst().orElse(0.0);
                    
                double porcentajeC = p.getTotalesPorZona().entrySet().stream()
                    .filter(entry -> entry.getKey().getCodigo().equals("C"))
                    .map(Map.Entry::getValue)
                    .findFirst().orElse(0.0);
                    
                double porcentajeG = p.getTotalesPorZona().entrySet().stream()
                    .filter(entry -> entry.getKey().getCodigo().equals("G"))
                    .map(Map.Entry::getValue)
                    .findFirst().orElse(0.0);
        %>
            <tr>
                <td><%= p.getCodigo() %></td>
                <td><%= p.getNombre() %></td>
                <td><%= String.format("%.0f", porcentajeE) %></td>
                <td><%= String.format("%.0f", porcentajeC) %></td>
                <td><%= String.format("%.0f", porcentajeG) %></td>
                <td class="right"><%= String.format("%.2f", e) %></td>
                <td class="right"><%= String.format("%.2f", c) %></td>
                <td class="right"><%= String.format("%.2f", g) %></td>
                <td class="right"><%= String.format("%.2f", e + c + g) %></td>
            </tr>
        <% } %>
        <tr><td colspan="9" class="divider"></td></tr>
        <tr>
            <td colspan="5">Total</td>
            <td class="right"><%= String.format("%.2f", totalE) %></td>
            <td class="right"><%= String.format("%.2f", totalC) %></td>
            <td class="right"><%= String.format("%.2f", totalG) %></td>
            <td class="right"><%= String.format("%.2f", totalE + totalC + totalG) %></td>
        </tr>
        <tr><td colspan="9" class="divider"></td></tr>
        <tr>
            <td colspan="9" style="text-align: right;">
                <%= propietariosUnicos.size() %> propietaris total
            </td>
        </tr>
    </table>
    <a href="resumen.jsp">Volver al resumen</a>
</body>
</html>