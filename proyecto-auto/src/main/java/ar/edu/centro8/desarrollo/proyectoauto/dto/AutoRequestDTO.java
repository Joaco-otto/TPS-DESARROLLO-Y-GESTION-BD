package ar.edu.centro8.desarrollo.proyectoauto.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AutoRequestDTO {
    
    private String marca;
    private Double precio;
    
    /**
     * Validación del DTO:
     * Los campos marca y precio son obligatorios
     */
    public void validar() {
        if (marca == null || marca.trim().isEmpty()) {
            throw new IllegalArgumentException("La marca no puede estar vacía");
        }
        // if (precio == null || precio < 0) {
        //     throw new IllegalArgumentException("El precio no puede ser negativo");
        // }
    }
}