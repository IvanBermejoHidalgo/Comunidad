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
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Propiedades</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 0.5rem;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        a {
            display: inline-block;
            margin-top: 1rem;
            text-decoration: none;
            color: #0066cc;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Listado de Propiedades</h2>

    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>m²</th>
                <th>Propietario</th>
                <th>Zonas y Porcentajes</th>
                <th>Tipo</th>
                <th>Información Adicional</th>
            </tr>
        </thead>
        <tbody>
            <%
            if (propiedades != null && !propiedades.isEmpty()) {
                for (Propiedad p : propiedades) {
                    if (p != null) {
            %>
            <tr>
                <td><%= p.getCodigo() != null ? p.getCodigo() : "-" %></td>
                <td><%= p.getMetrosCuadrados() %></td>
                <td><%= (p.getPropietario() != null && p.getPropietario().getNombre() != null) ? p.getPropietario().getNombre() : "N/A" %></td>
                <td>
                    <%
                    if (p.getPorcentajesPorZona() != null && !p.getPorcentajesPorZona().isEmpty()) {
                        boolean first = true;
                        for (Map.Entry<Zona, Double> entry : p.getPorcentajesPorZona().entrySet()) {
                            if (entry.getKey() != null) {
                                if (!first) out.print(", ");
                                out.print(entry.getKey().getCodigo() + "-" + entry.getValue() + "%");
                                first = false;
                            }
                        }
                    } else {
                        out.print("N/A");
                    }
                    %>
                </td>
                <td>
                    <%
                    String tipo = p.getTipoPropiedad();
                    if (tipo == null) {
                        out.print("-");
                    } else if (tipo.equals("HH")) {
                        out.print("Habitatge Habitual");
                    } else if (tipo.equals("HNH")) {
                        out.print("Habitatge no habitual");
                    } else if (tipo.equals("A")) {
                        out.print("Oberta");
                    } else if (tipo.equals("C")) {
                        out.print("Tancada");
                    } else if (tipo.equals("Banc Mundial")) {
                        out.print("Banca");
                    } else if (tipo.equals("Hercules")) {
                        out.print("Assegurances");
                    } else if (tipo.equals("Caprabo")) {
                        out.print("Alimentació");
                    } else {
                        out.print(tipo);
                    }
                    %>
                </td>
                <td>
                    <%
                    String info = p.getInformacionAdicional();
                    if (info == null || info.trim().isEmpty()) {
                        out.print("-");
                    } else {
                        try {
                            int dorms = Integer.parseInt(info.trim());
                            out.print(dorms + " dormitoris");
                        } catch (NumberFormatException e) {
                            if (info.equalsIgnoreCase("N")) {
                                out.print("Sense traster");
                            } else if (info.equalsIgnoreCase("S")) {
                                out.print("Amb traster");
                            } else {
                                out.print(info);
                            }
                        }
                    }
                    %>
                </td>
            </tr>
            <%
                    }
                }
            } else {
            %>
            <tr>
                <td colspan="6">No hay propiedades disponibles.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <a href="resumen.jsp">← Volver al resumen</a>
</body>
</html>
