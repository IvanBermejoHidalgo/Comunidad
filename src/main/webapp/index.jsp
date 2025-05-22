<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Comunidad de Propietarios</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #34495e;
        }

        input[type="file"] {
            margin-top: 5px;
            width: 100%;
        }

        button {
            margin-top: 25px;
            width: 100%;
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>Gestión de Comunidad de Propietarios</h1>
    <form action="procesar-comunidad" method="post" enctype="multipart/form-data">
        <label>Archivo de comunidad:</label>
        <input type="file" name="comunidadFile" accept=".txt" required>
        
        <label>Archivo de gastos:</label>
        <input type="file" name="gastosFile" accept=".txt" required>
        
        <button type="submit">Procesar</button>
    </form>
</body>
</html>
