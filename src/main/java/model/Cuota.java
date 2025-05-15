package model;

import java.util.HashMap;
import java.util.Map;

public class Cuota {
    private Map<Zona, Double> importesPorZona = new HashMap<>();

    // Getters y Setters
    public Map<Zona, Double> getImportesPorZona() { return importesPorZona; }
    public void setImportesPorZona(Map<Zona, Double> importesPorZona) { this.importesPorZona = importesPorZona; }
}