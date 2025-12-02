package ar.edu.centro8.desarrollo.proyectoauto.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "autos")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Auto {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String marca;
    
    @Column(nullable = false)
    private Double precio;
    
    /**
     * REGLA DE NEGOCIO EN LA ENTIDAD:
     * El precio no puede ser negativo
     */
    public void setPrecio(Double precio) {
        if (precio != null && precio < 0) {
            throw new IllegalArgumentException("El precio no puede ser negativo");
        }
        this.precio = precio;
    }
}