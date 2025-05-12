package model;

import java.util.HashMap;
import java.util.Map;

public class Cuota {
    private Map<Zona, Double> importesPorZona = new HashMap<>(); // Ej: {Zona-Escala: 390.88€}

    // Getters y Setters
    public Map<Zona, Double> getImportesPorZona() { return importesPorZona; }
    public void setImportesPorZona(Map<Zona, Double> importesPorZona) { this.importesPorZona = importesPorZona; }
}