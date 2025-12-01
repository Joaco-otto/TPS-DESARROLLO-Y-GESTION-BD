package ar.centro8.com.tp2.Tp2_FloresJoaquin.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.centro8.com.tp2.Tp2_FloresJoaquin.model.Auto;
import ar.centro8.com.tp2.Tp2_FloresJoaquin.repository.I_AutoRepository;
@Service
public class AutoService implements I_AutoService {

    private final I_AutoRepository repo;
    
    @Autowired

    public AutoService(I_AutoRepository repo) {
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
    public void deleteById(Long id) {
        repo.deleteById(id);
    }

}
