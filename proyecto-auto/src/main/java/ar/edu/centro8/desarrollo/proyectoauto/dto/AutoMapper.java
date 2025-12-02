package ar.edu.centro8.desarrollo.proyectoauto.dto;

import ar.edu.centro8.desarrollo.proyectoauto.model.Auto;

/**
 * Mapper para convertir entre DTOs y entidades Auto
 * Solo maneja los campos: id, marca y precio
 */
public class AutoMapper {
    
    /**
     * Convierte un AutoRequestDTO a una entidad Auto
     */
    public static Auto toEntity(AutoRequestDTO dto) {
        if (dto == null) {
            return null;
        }
        
        Auto auto = new Auto();
        auto.setMarca(dto.getMarca());
        auto.setPrecio(dto.getPrecio()); // La validación de precio negativo se hace en el setter
        
        return auto;
    }
    
    /**
     * Convierte una entidad Auto a AutoRequestDTO
     * Útil para operaciones de edición
     */
    public static AutoRequestDTO toRequestDTO(Auto auto) {
        if (auto == null) {
            return null;
        }
        
        return new AutoRequestDTO(
            auto.getMarca(),
            auto.getPrecio()
        );
    }
    
    /**
     * Actualiza una entidad Auto existente con los datos de un AutoRequestDTO
     */
    public static void updateEntity(Auto auto, AutoRequestDTO dto) {
        if (auto == null || dto == null) {
            return;
        }
        
        auto.setMarca(dto.getMarca());
        auto.setPrecio(dto.getPrecio()); // La validación se hace en el setter
    }
}