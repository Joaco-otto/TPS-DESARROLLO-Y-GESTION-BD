package ar.com.tp2.tp2.controller;

import java.net.URI;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ar.com.tp2.tp2.model.Auto;
import ar.com.tp2.tp2.service.AutoService;

@RestController
@RequestMapping("/autos")
@CrossOrigin(origins = "*")

public class AutoController {

    private final AutoService service;

    public AutoController(AutoService service) {
        this.service = service;
    }

    // GET /api/autos
    @GetMapping
    public ResponseEntity<List<Auto>> getAll() {
        return ResponseEntity.ok(service.findAll());
    }

    // GET /api/autos/{id}
    @GetMapping("/{id}")
    public ResponseEntity<Auto> getById(@PathVariable Long id) {
        return service.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // POST /api/autos
    @PostMapping
    public ResponseEntity<Auto> create(@RequestBody Auto auto) {
        Auto saved = service.save(auto);
        return ResponseEntity.created(URI.create("/api/autos/" + saved.getId())).body(saved);
    }

    // PUT /api/autos/{id}
    @PutMapping("/{id}")
    public ResponseEntity<Auto> update(@PathVariable Long id, @RequestBody Auto auto) {
        try {
            Auto updated = service.update(id, auto);
            return ResponseEntity.ok(updated);
        } catch (RuntimeException ex) {
            return ResponseEntity.notFound().build();
        }
    }

    // DELETE /api/autos/{id}
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        service.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    public List<Auto> getAllAutos() {
        return service.obtenerAutos();
    }
}

