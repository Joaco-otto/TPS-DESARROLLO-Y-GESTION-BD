package ar.centro8.com.tp2.Tp2_FloresJoaquin.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ar.centro8.com.tp2.Tp2_FloresJoaquin.model.Auto;

@Repository

public interface I_AutoRepository extends JpaRepository<Auto, Long> {

    public Optional<Auto> findByMarca(String marca);

    public List<Auto> findByPrecioBetween(double precioMinimo, double precioMaximo);



}
