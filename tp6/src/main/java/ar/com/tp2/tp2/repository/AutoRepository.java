package ar.com.tp2.tp2.repository;

import ar.com.tp2.tp2.model.Auto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AutoRepository extends JpaRepository<Auto, Long> {
    // metodos CRUD ya disponibles por JpaRepository
}
