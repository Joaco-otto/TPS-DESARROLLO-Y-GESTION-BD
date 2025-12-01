package ar.org.centro.java.curso.entidades;

import lombok.Getter;

@Getter
public class Moto extends Vehiculo {
    private final String cilindrada;

    public Moto(String marca, String modelo, String cilindrada, double precio) {
        super(marca, modelo, precio);
        this.cilindrada = cilindrada;
    }

    @Override
    public String toString() {

        return "Marca: " + getMarca() + " // Modelo: " + getModelo() + " // Cilindrada: " + getCilindrada()
                + " // Precio: $" + CreaDF(getPrecio());

    }

}
