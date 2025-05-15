package model;

import java.util.HashMap;
import java.util.Map;

public class Propiedad {
    private String codigo;
    private double metrosCuadrados;
    private Propietario propietario;
    private Map<Zona, Double> porcentajesPorZona = new HashMap<>();
    private String tipoPropiedad;
    private String informacionAdicional;
    private Cuota cuota = new Cuota();

    // Getters y Setters
    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }
    public double getMetrosCuadrados() { return metrosCuadrados; }
    public void setMetrosCuadrados(double metrosCuadrados) { this.metrosCuadrados = metrosCuadrados; }
    public Propietario getPropietario() { return propietario; }
    public void setPropietario(Propietario propietario) { this.propietario = propietario; }
    public Map<Zona, Double> getPorcentajesPorZona() { return porcentajesPorZona; }
    public void setPorcentajesPorZona(Map<Zona, Double> porcentajesPorZona) { this.porcentajesPorZona = porcentajesPorZona; }
    public String getTipoPropiedad() { return tipoPropiedad; }
    public void setTipoPropiedad(String tipoPropiedad) { this.tipoPropiedad = tipoPropiedad; }
    public String getInformacionAdicional() { return informacionAdicional; }
    public void setInformacionAdicional(String informacionAdicional) { this.informacionAdicional = informacionAdicional; }
    public Cuota getCuota() { return cuota; }
    public void setCuota(Cuota cuota) { this.cuota = cuota; }
    
    public String getPorcentajesFormateados() {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<Zona, Double> entry : porcentajesPorZona.entrySet()) {
            if (sb.length() > 0) sb.append(" ");
            sb.append(entry.getKey().getCodigo())
              .append("-")
              .append(entry.getValue())
              .append("%");
        }
        return sb.toString();
    }
}