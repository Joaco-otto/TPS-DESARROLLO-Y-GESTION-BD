package ar.org.centro.java.curso.entidades;

import lombok.Getter;

@Getter
public class Auto extends Vehiculo {

    private final String cantidadPuertas;

    public Auto(String marca, String modelo, String cantidadPuertas, double precio) {
        super(marca, modelo, precio);
        this.cantidadPuertas = cantidadPuertas;
    }

    @Override
    public String toString() {

        return "Marca: " + getMarca() + " // Modelo: " + getModelo() + " // Puertas: " + getCantidadPuertas()
                + " // Precio: $" + CreaDF(getPrecio());

    }

}
