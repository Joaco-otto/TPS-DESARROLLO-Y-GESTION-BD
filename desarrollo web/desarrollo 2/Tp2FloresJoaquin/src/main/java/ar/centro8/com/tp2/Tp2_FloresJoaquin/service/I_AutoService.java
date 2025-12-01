package ar.centro8.com.tp2.Tp2_FloresJoaquin.service;

import java.util.List;
import java.util.Optional;

import ar.centro8.com.tp2.Tp2_FloresJoaquin.model.Auto;

public interface I_AutoService {

    List<Auto> findAll();
    Optional<Auto> findById(Long id);
    Auto save(Auto auto);
    void deleteById(Long id);
}
