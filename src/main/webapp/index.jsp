<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Comunidad de Propietarios</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
    <h1>Gestión de Comunidad de Propietarios</h1>
    <form action="procesar-comunidad" method="post" enctype="multipart/form-data">
        <label>Archivo de comunidad:</label>
        <input type="file" name="comunidadFile" accept=".txt" required><br>
        <label>Archivo de gastos:</label>
        <input type="file" name="gastosFile" accept=".txt" required><br>
        <button type="submit">Procesar</button>
    </form>
</body>
</html>