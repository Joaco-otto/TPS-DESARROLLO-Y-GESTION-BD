package ar.org.centro8.curso.java.entidades;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
/*
 * Clase "abstracta" llamada vehiculo que nos servira de base para
 * crear otros tipos de vehiculos(AutoNuevo,AutoClasico y Colectivo).
 * No se puede crear un objeto de tipo Vehiculo directamente.
 */
public abstract class Vehiculo {

    private String marca;
    private String modelo;
    private String color;
    private Double precio;
    @Setter(AccessLevel.NONE)
    protected Radio radio;

    /**
     * 
     * Constructor con los atributos obligatorios y precio,
     * se omite Radio por que se puede agregar,cambiar o quitar con metodos
     *
     * @param marca
     * @param modelo
     * @param color
     * @param precio
     */
    public Vehiculo(String marca, String modelo, String color, Double precio) {
        this.marca = marca;
        this.modelo = modelo;
        this.precio = precio;
        this.color = color;
    }

    /**
     * Se agrega el constructor con los atributos obligatorios omitiendo "Precio"
     * util para que el usuario pueda crear un objeto sin ese valor.(consigna)
     * 
     * @param marca
     * @param modelo
     * @param color
     */
    public Vehiculo(String marca, String modelo, String color) {
        this.marca = marca;
        this.modelo = modelo;
        this.color = color;
    }

    /**
     * Se define el metodo "set precio" para asignar un nuevo valor al atributo
     * 
     * @param precio
     */
    public void setPrecio(double precio) {
        this.precio = precio;
    }

    /**
     * Metodo abstracto, cada tipo de vehiculo tendra su propia version del metodo.
     * 
     * @return
     */
    public abstract String tipo();

    /**
     * Este metodo realiza varias validaciones antes de conectar una radio
     * si la radio es nula,no realiza nada
     * si la radio elegida ya esta asignada a un vehiculo, la desvincula
     * si el vehiculo actual tiene una radio asignada, se la quita antes de
     * asignarla una nueva
     * 
     * @param nuevaRadio
     */
    public void conectarRadio(Radio nuevaRadio) {
        if (nuevaRadio == null) {
            System.out.println("No se puede asignar una radio nula.");
            return;
        }
        //
        Vehiculo vehiculoAnterior = nuevaRadio.getVehiculo();
        if (vehiculoAnterior != null && vehiculoAnterior != this) {
            if (vehiculoAnterior.tipo().equalsIgnoreCase("AutoNuevo")) {
                System.out.println("No se puede quitar la radio a un AutoNuevo ");
                return;
            }
            vehiculoAnterior.radio = null;
            System.out.println("Radio quitada del vehículo anterior: " + vehiculoAnterior.tipo());
        }
        if (this.radio != null) {
            this.radio.setVehiculo(null);
            System.out.println("Radio anterior quitada del vehículo actual.");
        }
        // Asignar la nueva radio
        this.radio = nuevaRadio;
        nuevaRadio.setVehiculo(this);
        System.out.println("Radio asignada correctamente al vehículo actual.");

    }

    /**
     * 
     * Este metodo quita la radio si el vehiculo lo tiene
     * Si se intenta quitar una radio a Autonuevo no lo permite
     * Si no tiene radio asignada se informa por consola
     */
    public void quitarRadio() {
        if (this.tipo().equalsIgnoreCase("AutoNuevo")) {
            System.out.println(" No se puede quitar la radio a un AutoNuevo ");
            return;
        }
        if (this.radio != null) {
            this.radio.setVehiculo(null);
            this.radio = null;
            System.out.println("Radio quitada del vehículo.");
        } else {
            System.out.println("Este vehículo no tiene una radio para quitar.");
        }
    }

    /**
     * Se sobreescribe toString() para que las clases hijas
     * hereden el comportamiento sin necesidad de escribirlo
     */
    @Override
    public String toString() {
        return ", -TipoVehiculo:   " + tipo() +
                ",   - Marca:  " + marca +
                ",  - Modelo: " + modelo +
                ",  - Color: " + color +
                ", - Precio: " + (precio != null ? ", Precio: " + precio + " USD" : "") +
                ",  - Radio: " + (radio != null ? radio.getMarca() + " (" + radio.getPotencia() + "W)" : "Sin radio");

    }

}
