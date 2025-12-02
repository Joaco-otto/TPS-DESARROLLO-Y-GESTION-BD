package ar.com.tp2.tp2.service;

import java.util.List;
import java.util.Optional;

import ar.com.tp2.tp2.model.Auto;

public interface AutoService {
    List<Auto> findAll();
    Optional<Auto> findById(Long id);
    Auto save(Auto auto);
    Auto update(Long id, Auto auto);
    void deleteById(Long id);
    List<Auto> obtenerAutos();
    
}

