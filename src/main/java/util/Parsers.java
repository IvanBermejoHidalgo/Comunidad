package util;

import model.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Parsers {
	public static Comunidad parseComunidad(InputStream is) throws IOException {
	    Comunidad comunidad = new Comunidad();
	    List<Zona> zonas = new ArrayList<>();
	    List<Propiedad> propiedades = new ArrayList<>();
	    List<Propietario> propietarios = new ArrayList<>();
	    Map<String, Propietario> propietariosMap = new HashMap<>();
	    
	    // Cambiamos el orden para procesar primero los propietarios
	    String currentSection = null;
	    List<String> lineasPropietat = new ArrayList<>(); // Almacenamos líneas de propiedades para procesar después

	    try (BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {
	        String line;
	        
	        while ((line = br.readLine()) != null) {
	            line = line.trim();
	            if (line.isEmpty()) continue;

	            if (line.startsWith("#")) {
	                currentSection = line.substring(1);
	                continue;
	            }

	            switch (currentSection) {
	                case "Comunitat":
	                    String[] datosComunidad = line.split(";");
	                    if (datosComunidad.length >= 3) {
	                        comunidad.setCodigo(datosComunidad[0].trim());
	                        comunidad.setNombre(datosComunidad[1].trim());
	                        comunidad.setCiudad(datosComunidad[2].trim());
	                    }
	                    break;
	                    
	                case "Zona":
	                    String[] datosZona = line.split(";");
	                    if (datosZona.length >= 3) {
	                        Zona zona = new Zona();
	                        zona.setCodigo(datosZona[0].trim());
	                        zona.setNombre(datosZona[1].trim());
	                        zona.setTipoReparto(datosZona[2].trim().charAt(0));
	                        zonas.add(zona);
	                    }
	                    break;
	                    
	                case "Propietari":
	                    String[] datosPropietario = line.split(";");
	                    if (datosPropietario.length >= 4) {
	                        Propietario propietario = new Propietario();
	                        propietario.setCodigo(datosPropietario[0].trim());
	                        propietario.setNombre(datosPropietario[1].trim());
	                        propietario.setDireccion(datosPropietario[2].trim());
	                        propietario.setEmail(datosPropietario[3].trim());
	                        propietarios.add(propietario);
	                        propietariosMap.put(propietario.getCodigo(), propietario);
	                    }
	                    break;
	                    
	                case "Propietat":
	                    // Almacenamos para procesar después de tener todos los propietarios
	                    lineasPropietat.add(line);
	                    break;
	            }
	        }
	    }

	    // Ahora procesamos las propiedades con los propietarios ya cargados
	    for (String line : lineasPropietat) {
	        try {
	            String[] datosPropiedad = line.split(";");
	            if (datosPropiedad.length < 5) continue;

	            Propiedad propiedad = new Propiedad();
	            propiedad.setCodigo(datosPropiedad[1].trim());
	            
	            try {
	                propiedad.setMetrosCuadrados(Double.parseDouble(datosPropiedad[2].trim()));
	            } catch (NumberFormatException e) {
	                continue;
	            }

	            // Campos opcionales
	            propiedad.setTipoPropiedad(datosPropiedad.length > 5 ? datosPropiedad[5].trim() : "");
	            propiedad.setInformacionAdicional(datosPropiedad.length > 6 ? datosPropiedad[6].trim() : "");

	            // Procesar zonas
	            String[] zonasPropiedad = datosPropiedad[4].split(",");
	            for (String zp : zonasPropiedad) {
	                zp = zp.trim();
	                if (zp.contains("-")) {
	                    String[] partes = zp.split("-");
	                    if (partes.length == 2) {
	                        String codigoZona = partes[0].trim();
	                        try {
	                            double porcentaje = Double.parseDouble(partes[1].trim());
	                            Zona zonaProp = zonas.stream()
	                                .filter(z -> z.getCodigo().equals(codigoZona))
	                                .findFirst()
	                                .orElse(null);
	                            if (zonaProp != null) {
	                                propiedad.getPorcentajesPorZona().put(zonaProp, porcentaje);
	                            }
	                        } catch (NumberFormatException e) {
	                            // Ignorar porcentaje inválido
	                        }
	                    }
	                }
	            }

	            // Asignar propietario
	            String codigoPropietario = datosPropiedad[3].trim();
	            Propietario propietario = propietariosMap.get(codigoPropietario);
	            if (propietario != null) {
	                propiedad.setPropietario(propietario);
	                propietario.getPropiedades().add(propiedad);
	            }

	            propiedades.add(propiedad);
	        } catch (Exception e) {
	            System.err.println("Error procesando línea de propiedad: " + line);
	            e.printStackTrace();
	        }
	    }

	    comunidad.setZonas(zonas);
	    comunidad.setPropiedades(propiedades);
	    comunidad.setPropietarios(propietarios);
	    return comunidad;
	}
	
	public static List<Gasto> parseGastos(InputStream is, Comunidad comunidad) throws IOException {
	    List<Gasto> gastos = new ArrayList<>();
	    Map<String, Zona> zonasMap = comunidad.getZonas().stream()
	        .collect(Collectors.toMap(Zona::getCodigo, z -> z));

	    try (BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {
	        String line;
	        String currentSection = null;

	        while ((line = br.readLine()) != null) {
	            line = line.trim();
	            if (line.isEmpty()) continue;

	            if (line.startsWith("#")) {
	                currentSection = line.substring(1);
	                continue;
	            }

	            if ("Pressupost 2008".equals(currentSection)) {
	                String[] datosGasto = line.split(";");
	                if (datosGasto.length >= 4) {
	                    try {
	                        Gasto gasto = new Gasto();
	                        gasto.setCodigo(datosGasto[0].trim());
	                        gasto.setDescripcion(datosGasto[1].trim());
	                        gasto.setImporte(Double.parseDouble(datosGasto[2].trim()));
	                        
	                        String codigoZona = datosGasto[3].trim();
	                        Zona zona = zonasMap.get(codigoZona);
	                        if (zona != null) {
	                            gasto.setZona(zona);
	                            gastos.add(gasto);
	                        } else {
	                            System.err.println("Zona no encontrada para gasto: " + codigoZona);
	                        }
	                    } catch (NumberFormatException e) {
	                        System.err.println("Error en formato numérico en línea: " + line);
	                    }
	                }
	            }
	        }
	    }
	    return gastos;
	}
}