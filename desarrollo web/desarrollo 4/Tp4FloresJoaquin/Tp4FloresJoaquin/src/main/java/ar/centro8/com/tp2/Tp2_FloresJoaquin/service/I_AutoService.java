package ar.centro8.com.tp2.Tp2_FloresJoaquin.service;

import java.util.List;

import ar.centro8.com.tp2.Tp2_FloresJoaquin.dto.AutoRequestDTO;
import ar.centro8.com.tp2.Tp2_FloresJoaquin.dto.AutoResponseDTO;


public interface I_AutoService {

    public List<AutoResponseDTO> getAutos();

    public AutoResponseDTO saveAuto(AutoRequestDTO autoDto);

    public void deleteAuto(Long id);

    public AutoResponseDTO findAuto(Long id);

    public AutoResponseDTO editAuto(Long id, AutoRequestDTO autoDto);
}
