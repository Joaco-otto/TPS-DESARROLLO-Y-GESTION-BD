package ar.centro8.com.tp2.Tp2_FloresJoaquin.dto;

import ar.centro8.com.tp2.Tp2_FloresJoaquin.model.Auto;

public class AutoMapper {
     public static Auto toEntity(AutoRequestDTO dto) {
        Auto auto = new Auto();
        auto.setMarca(dto.getMarca());
        auto.setPrecio(dto.getPrecio());
        return auto;
    }

    public static AutoResponseDTO toResponseDTO(Auto auto) {
        return new AutoResponseDTO(auto.getId(), auto.getMarca(), auto.getPrecio());
    }

    public static void updateEntity(Auto auto, AutoRequestDTO dto) {
        auto.setMarca(dto.getMarca());
        auto.setPrecio(dto.getPrecio());
    }

}
