package ar.org.centro.java.curso.entidades;

import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public abstract class Vehiculo implements Comparable<Vehiculo> {

    private String marca;
    private String modelo;
    private double precio;

    public static String CreaDF(double numero) {
        DecimalFormat df = new DecimalFormat("#,###.00");
        return df.format(numero);
    }

    @Override
    public int compareTo(Vehiculo otroAuto) {
        int result = this.marca.compareTo(otroAuto.marca);
        if (result != 0) {
            return result;
        }

        result = this.modelo.compareTo(otroAuto.modelo);
        if (result != 0) {
            return result;
        }

        return Double.compare(this.precio, otroAuto.precio);
    }

}
