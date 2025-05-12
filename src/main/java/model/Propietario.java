package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Propietario {
    private String codigo;
    private String nombre;
    private String direccion;
    private String email;
    private List<Propiedad> propiedades = new ArrayList<>();
    private Map<Zona, Double> totalesPorZona = new HashMap<>(); // Para cuotas por propietario

    // Getters y Setters
    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public List<Propiedad> getPropiedades() { return propiedades; }
    public void setPropiedades(List<Propiedad> propiedades) { this.propiedades = propiedades; }
    public Map<Zona, Double> getTotalesPorZona() { return totalesPorZona; }
    public void setTotalesPorZona(Map<Zona, Double> totalesPorZona) { this.totalesPorZona = totalesPorZona; }
}