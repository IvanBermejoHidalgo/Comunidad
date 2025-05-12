<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
    <h1>Error en la aplicación</h1>
    <p>Ha ocurrido un error al procesar tu solicitud:</p>
    <div class="error-message">
        <%= request.getAttribute("error") != null ? 
            request.getAttribute("error") : 
            "Error desconocido" %>
    </div>
    <a href="../index.jsp">Volver al inicio</a>
</body>
</html>