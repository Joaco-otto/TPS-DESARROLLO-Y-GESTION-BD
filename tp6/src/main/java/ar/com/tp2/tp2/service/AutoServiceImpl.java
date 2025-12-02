package ar.com.tp2.tp2.service;

import ar.com.tp2.tp2.model.Auto;
import ar.com.tp2.tp2.repository.AutoRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AutoServiceImpl implements AutoService {

    private final AutoRepository repo;

    public AutoServiceImpl(AutoRepository repo) {
        this.repo = repo;
    }

    @Override
    public List<Auto> findAll() {
        return repo.findAll();
    }

    @Override
    public Optional<Auto> findById(Long id) {
        return repo.findById(id);
    }

    @Override
    public Auto save(Auto auto) {
        return repo.save(auto);
    }

    @Override
    public Auto update(Long id, Auto auto) {
        return repo.findById(id).map(existing -> {
            existing.setMarca(auto.getMarca());
            existing.setPrecio(auto.getPrecio());
            return repo.save(existing);
        }).orElseThrow(() -> new RuntimeException("Auto no encontrado con id " + id));
    }

    @Override
    public void deleteById(Long id) {
        repo.deleteById(id);
    }

    @Override
    public List<Auto> obtenerAutos() {
         return repo.findAll(); 
    }
}

