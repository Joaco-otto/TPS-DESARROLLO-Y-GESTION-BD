package ar.org.centro8.curso.java.entidades;

public final class Colectivo extends Vehiculo {

    public Colectivo(String marca,String modelo,String color,double precio){
        super(marca, modelo,color,precio);
    }

        @Override
        public String tipo() {
        return "Colectivo";

    }
}