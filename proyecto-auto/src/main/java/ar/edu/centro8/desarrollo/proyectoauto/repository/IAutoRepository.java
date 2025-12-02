package ar.edu.centro8.desarrollo.proyectoauto.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ar.edu.centro8.desarrollo.proyectoauto.model.Auto;

@Repository
public interface IAutoRepository extends JpaRepository<Auto, Long> {
    
    /**
     * Method Query 1: Buscar auto por marca
     * Usado para implementar regla de negocio en el servicio
     */
    //select * from autos where marca=?
    Optional<Auto> findByMarca(String marca);
    
    /**
     * Method Query 2: Buscar autos por rango de precio
     */
    //select * from autos where precio between ? and ?
    List<Auto> findByPrecioBetween(Double precioMin, Double precioMax);
}