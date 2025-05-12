package model;

import java.util.ArrayList;
import java.util.List;

public class Comunidad {
    private String codigo;
    private String nombre;
    private String ciudad;
    private List<Zona> zonas = new ArrayList<>();
    private List<Propiedad> propiedades = new ArrayList<>();
    private List<Propietario> propietarios = new ArrayList<>();
    private List<Gasto> gastos = new ArrayList<>();

    // Getters y Setters
    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getCiudad() { return ciudad; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }
    public List<Zona> getZonas() { return zonas; }
    public void setZonas(List<Zona> zonas) { this.zonas = zonas; }
    public List<Propiedad> getPropiedades() { return propiedades; }
    public void setPropiedades(List<Propiedad> propiedades) { this.propiedades = propiedades; }
    public List<Propietario> getPropietarios() { return propietarios; }
    public void setPropietarios(List<Propietario> propietarios) { this.propietarios = propietarios; }
    public List<Gasto> getGastos() { return gastos; }
    public void setGastos(List<Gasto> gastos) { this.gastos = gastos; }
}