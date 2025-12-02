package ar.edu.centro8.desarrollo.proyectoauto.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.edu.centro8.desarrollo.proyectoauto.dto.AutoMapper;
import ar.edu.centro8.desarrollo.proyectoauto.dto.AutoRequestDTO;
import ar.edu.centro8.desarrollo.proyectoauto.model.Auto;
import ar.edu.centro8.desarrollo.proyectoauto.repository.IAutoRepository;

@Service
public class AutoService implements IAutoService {

    @Autowired
    private IAutoRepository autoRepo;
    
    @Override
    public List<Auto> getAutos() {
        return autoRepo.findAll();
    }

    @Override
    public Auto saveAuto(AutoRequestDTO autoDTO) {
        // Validar DTO
        autoDTO.validar();
        
        /**
         * REGLA DE NEGOCIO EN SERVICIO:
         * No permitir autos duplicados con la misma marca
         * Utiliza el method query findByMarca del repositorio
         */
        validarMarcaUnica(autoDTO.getMarca());
        
        // Convertir DTO a entidad
        Auto auto = AutoMapper.toEntity(autoDTO);
        
        // Guardar en base de datos
        return autoRepo.save(auto);
    }

    @Override
    public Auto findAuto(Long id) {
        Optional<Auto> auto = autoRepo.findById(id);
        if (auto.isPresent()) {
            return auto.get();
        }
        throw new IllegalArgumentException("Auto no encontrado con ID: " + id);
    }

    @Override
    public Auto editAuto(Long id, AutoRequestDTO autoDTO) {
        // Validar DTO
        autoDTO.validar();
        
        // Buscar auto existente
        Optional<Auto> autoExistente = autoRepo.findById(id);
        if (!autoExistente.isPresent()) {
            throw new IllegalArgumentException("Auto no encontrado con ID: " + id);
        }
        
        Auto auto = autoExistente.get();
        
        // Validar marca única (si cambió la marca)
        if (!auto.getMarca().equals(autoDTO.getMarca())) {
            validarMarcaUnica(autoDTO.getMarca());
        }
        
        // Actualizar entidad
        AutoMapper.updateEntity(auto, autoDTO);
        
        // Guardar cambios
        return autoRepo.save(auto);
    }

    @Override
    public void deleteAuto(Long id) {
        autoRepo.deleteById(id);
    }

    @Override
    public List<Auto> getAutosByPrecioRange(Double precioMin, Double precioMax) {
        /**
         * Utiliza el segundo method query del repositorio
         */
        return autoRepo.findByPrecioBetween(precioMin, precioMax);
    }
    
    /**
     * REGLA DE NEGOCIO PRIVADA:
     * Validar que no exista otro auto con la misma marca
     * Utiliza el primer method query del repositorio
     */
    private void validarMarcaUnica(String marca) {
        Optional<Auto> autoExistente = autoRepo.findByMarca(marca);
        if (autoExistente.isPresent()) {
            throw new IllegalArgumentException("Ya existe un auto con la marca: " + marca);
        }
    }
}