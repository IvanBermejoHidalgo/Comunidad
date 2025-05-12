package model;

public class Zona {
    private String codigo;
    private String nombre;
    private char tipoReparto; // 'P' (proporcional) o 'I' (igualitario)

    // Getters y Setters
    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public char getTipoReparto() { return tipoReparto; }
    public void setTipoReparto(char tipoReparto) { this.tipoReparto = tipoReparto; }
}