package ar.org.centro8.curso.java.entidades;

  public class AutoClasico extends Vehiculo {

     public AutoClasico(String marca, String modelo,String Color,Double precio) {
            super(marca, modelo,Color,precio);
    }      
     @Override
            public String tipo() {
             return "AutoClasico";
            }
    }





