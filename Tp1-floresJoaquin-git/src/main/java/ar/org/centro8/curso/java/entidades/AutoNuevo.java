package ar.org.centro8.curso.java.entidades;

 /**
 * Esta clase AutoNuevo hereda los atributos de la clase Vehiculo.
 * tiene un constructor privado para forzar el uso del metodo estatico "crearAutoNuevo"
 * como unica forma de de instanciar objetos de la clase AutoNuevo
 */
public class AutoNuevo extends Vehiculo {
    private AutoNuevo(String marca, String modelo,String color ,Radio radio,Double precio) {
        super(marca, modelo,color,precio);
        this.conectarRadio(radio);
    }
    /**
     * Este metodo estatico hace una validacion antes de crear un AutoNuevo 
     * solo si la radio es valida (no sea nula)
     * si pasa esto no se crea el objeto y se imprime mensaje de advertencia
     * @param marca
     * @param modelo
     * @param color
     * @param radio
     * @param precio
     * @return
     */
    public static AutoNuevo crearAutoNuevo(String marca, String modelo, String color, Radio radio, Double precio) {
        if (radio == null) {
            System.out.println(" No se puede crear AutoNuevo con una radio nula.");
            return null;
        }
        if (radio.getVehiculo() != null && radio.getVehiculo().tipo().equalsIgnoreCase("AutoNuevo")) {
        System.out.println(" No se puede crear AutoNuevo, la radio ya está asignada a otro AutoNuevo");
        return null;
 
        }
        
        return new AutoNuevo(marca, modelo, color, radio, precio);
    }


        @Override
        public String tipo() {
         return "AutoNuevo";
    }
        


}

