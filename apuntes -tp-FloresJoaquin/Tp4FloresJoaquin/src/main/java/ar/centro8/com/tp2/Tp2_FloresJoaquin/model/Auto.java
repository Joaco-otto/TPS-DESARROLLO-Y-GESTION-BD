package ar.centro8.com.tp2.Tp2_FloresJoaquin.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "autos")
@Data

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter

public class Auto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private Long id;
    private String marca;
    private Double precio;

    /* // Constructor auxiliar sin id si te sirve
    public Auto(String marca, Double precio){
        this.marca = marca;
        this.precio = precio;
    } */

    public void setPrecio(double precio) {
        if (precio < 0) {
            throw new IllegalArgumentException("El precio no puede ser negativo.");
        }
        this.precio = precio;
    }
   

    }
    
