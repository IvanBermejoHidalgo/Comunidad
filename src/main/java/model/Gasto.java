package model;

public class Gasto {
    private String codigo;
    private String descripcion;
    private double importe;
    private Zona zona;

    // Getters y Setters
    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public double getImporte() { return importe; }
    public void setImporte(double importe) { this.importe = importe; }
    public Zona getZona() { return zona; }
    public void setZona(Zona zona) { this.zona = zona; }
    
    @Override
    public String toString() {
        return String.format("%s - %s - %.2f€ - Zona: %s", 
            codigo, descripcion, importe, zona != null ? zona.getNombre() : "N/A");
    }
}