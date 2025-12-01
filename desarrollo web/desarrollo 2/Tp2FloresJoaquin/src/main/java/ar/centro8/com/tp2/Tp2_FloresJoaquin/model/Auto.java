package ar.centro8.com.tp2.Tp2_FloresJoaquin.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Table(name = "autos")
@Data

@NoArgsConstructor
@AllArgsConstructor
@ToString

public class Auto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private Long id;
    private String marca;
    private Double precio;

    // Constructor auxiliar sin id si te sirve
    public Auto(String marca, Double precio){
        this.marca = marca;
        this.precio = precio;
    }

   

    }
    
