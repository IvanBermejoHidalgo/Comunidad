package service;

import model.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ComunidadService {
    public void calcularCuotas(Comunidad comunidad) {
        // 1. Agrupar gastos por zona
        Map<Zona, Double> gastosPorZona = comunidad.getGastos().stream()
            .collect(Collectors.groupingBy(
                Gasto::getZona,
                Collectors.summingDouble(Gasto::getImporte)
            ));

        // 2. Calcular reparto para cada zona
        for (Map.Entry<Zona, Double> entry : gastosPorZona.entrySet()) {
            Zona zona = entry.getKey();
            double totalGastoZona = entry.getValue();

            if (zona.getTipoReparto() == 'P') {
                // Reparto proporcional
                double totalPorcentaje = comunidad.getPropiedades().stream()
                    .filter(p -> p.getPorcentajesPorZona().containsKey(zona))
                    .mapToDouble(p -> p.getPorcentajesPorZona().get(zona))
                    .sum();

                for (Propiedad propiedad : comunidad.getPropiedades()) {
                    if (propiedad.getPorcentajesPorZona().containsKey(zona)) {
                        double porcentaje = propiedad.getPorcentajesPorZona().get(zona);
                        double importe = (porcentaje / totalPorcentaje) * totalGastoZona;
                        propiedad.getCuota().getImportesPorZona().put(zona, importe);
                    }
                }
            } else {
                // Reparto igualitario
                long numPropiedadesEnZona = comunidad.getPropiedades().stream()
                    .filter(p -> p.getPorcentajesPorZona().containsKey(zona))
                    .count();

                double importePorPropiedad = totalGastoZona / numPropiedadesEnZona;

                for (Propiedad propiedad : comunidad.getPropiedades()) {
                    if (propiedad.getPorcentajesPorZona().containsKey(zona)) {
                        propiedad.getCuota().getImportesPorZona().put(zona, importePorPropiedad);
                    }
                }
            }
        }

        // 3. Calcular totales por propietario
        for (Propietario propietario : comunidad.getPropietarios()) {
            Map<Zona, Double> totalesPorZona = new HashMap<>();

            for (Propiedad propiedad : propietario.getPropiedades()) {
                for (Map.Entry<Zona, Double> entry : propiedad.getCuota().getImportesPorZona().entrySet()) {
                    totalesPorZona.merge(entry.getKey(), entry.getValue(), Double::sum);
                }
            }
            propietario.setTotalesPorZona(totalesPorZona);
        }
    }
}