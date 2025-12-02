package ar.centro8.com.tp2.Tp2_FloresJoaquin.service;


import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.centro8.com.tp2.Tp2_FloresJoaquin.dto.AutoMapper;
import ar.centro8.com.tp2.Tp2_FloresJoaquin.dto.AutoRequestDTO;
import ar.centro8.com.tp2.Tp2_FloresJoaquin.dto.AutoResponseDTO;
import ar.centro8.com.tp2.Tp2_FloresJoaquin.model.Auto;
import ar.centro8.com.tp2.Tp2_FloresJoaquin.repository.I_AutoRepository;
@Service
public class AutoService implements I_AutoService {

        @Autowired
    private I_AutoRepository autoRepo;

    @Override
    public List<AutoResponseDTO> getAutos() {
        List<Auto> autos = autoRepo.findAll();
        return autos.stream()
            .map(AutoMapper::toResponseDTO)
            .collect(Collectors.toList());
    }

    @Override
    public AutoResponseDTO saveAuto(AutoRequestDTO autoDto) {
        autoDto.validarDTO();
        
        validarMarcaUnica(autoDto.getMarca());

        Auto auto = AutoMapper.toEntity(autoDto);
        Auto autoGuardado = autoRepo.save(auto);

        return AutoMapper.toResponseDTO(autoGuardado);
    }

    @Override
    public void deleteAuto(Long id) {
        Optional<Auto> auto = autoRepo.findById(id);
        if (!auto.isPresent()) {
            throw new IllegalArgumentException("No se encontró auto para el ID " + id);
        }
        autoRepo.deleteById(id);
    }

    @Override
    public AutoResponseDTO findAuto(Long id) {
        Optional<Auto> auto = autoRepo.findById(id);
        if (!auto.isPresent()) {
            throw new IllegalArgumentException("No se encontró ningún auto con id = " + id);
        }
        return AutoMapper.toResponseDTO(auto.get());
    }

    @Override
    public AutoResponseDTO editAuto(Long id, AutoRequestDTO autoDto) {
        Optional<Auto> autoExistente = autoRepo.findById(id);
        if (!autoExistente.isPresent()) {
            throw new IllegalArgumentException("No se encontró ningún auto con id = " + id);
        }

        Auto auto = autoExistente.get();
        if (!auto.getMarca().equals(autoDto.getMarca())) {
            validarMarcaUnica(autoDto.getMarca());
        }

        AutoMapper.updateEntity(auto, autoDto);
        Auto autoEditado = autoRepo.save(auto); 
        return AutoMapper.toResponseDTO(autoEditado);
    }

    private void validarMarcaUnica(String marca) {
        Optional<Auto> autoExistente = autoRepo.findByMarca(marca);
        if (autoExistente.isPresent()) {
            throw new IllegalArgumentException("Ya existe la marca '" + marca + "'");
        }

    }

}
