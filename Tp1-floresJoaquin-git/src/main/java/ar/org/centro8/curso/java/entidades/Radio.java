package ar.org.centro8.curso.java.entidades;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class Radio {
    private String marca;
    private int potencia;
    private Vehiculo vehiculo;
    

    public Radio(String marca, int potencia) {
        this.marca = marca;
        this.potencia = potencia;
       
    }
     
}

