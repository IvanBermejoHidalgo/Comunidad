package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;

import model.*;
import service.ComunidadService;
import util.Parsers;

@WebServlet("/procesar-comunidad")
@MultipartConfig
public class ComunidadController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ComunidadService comunidadService = new ComunidadService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            Part comunidadFile = request.getPart("comunidadFile");
            Part gastosFile = request.getPart("gastosFile");
            
            if (comunidadFile.getSize() == 0 || gastosFile.getSize() == 0) {
                throw new ServletException("Debe subir ambos archivos");
            }
            
            Comunidad comunidad = Parsers.parseComunidad(comunidadFile.getInputStream());
            List<Gasto> gastos = Parsers.parseGastos(gastosFile.getInputStream(), comunidad);
            
            comunidad.setGastos(gastos);
            comunidadService.calcularCuotas(comunidad);
            
            request.getSession().setAttribute("comunidad", comunidad);
            request.getRequestDispatcher("resumen.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al procesar: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }
    }
}