package ar.edu.centro8.desarrollo.proyectoauto.service;

import java.util.List;

import ar.edu.centro8.desarrollo.proyectoauto.dto.AutoRequestDTO;
import ar.edu.centro8.desarrollo.proyectoauto.model.Auto;

public interface IAutoService {
    
    // Operaciones CRUD básicas
    List<Auto> getAutos();
    Auto saveAuto(AutoRequestDTO autoDTO);
    Auto findAuto(Long id);
    Auto editAuto(Long id, AutoRequestDTO autoDTO);
    void deleteAuto(Long id);
    
    // Método que utiliza el method query
    List<Auto> getAutosByPrecioRange(Double precioMin, Double precioMax);
}