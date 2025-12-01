package ar.centro8.com.tp2.Tp2_FloresJoaquin.controller;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

import ar.centro8.com.tp2.Tp2_FloresJoaquin.model.Auto;
import ar.centro8.com.tp2.Tp2_FloresJoaquin.service.I_AutoService;
@RestController
@RequestMapping("/api/autos")
@CrossOrigin(origins = "*")
public class AutoController {
    private final I_AutoService autoService;
@Autowired
    public AutoController(I_AutoService autoService) {
        this.autoService = autoService;
    }

    @GetMapping
    public List<Auto> getAll (){
        return autoService.findAll();
    }
    @GetMapping("/{id}")
    public ResponseEntity<Auto> getById(@PathVariable Long id) {
        return autoService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    @PostMapping
      public ResponseEntity<Auto> create(@RequestBody Auto auto) {
        Auto saved = autoService.save(auto);
        return ResponseEntity.created(URI.create("/api/autos/" + saved.getId())).body(saved);
    }
    @PutMapping("/{id}")
     public ResponseEntity<Auto> update(@PathVariable Long id, @RequestBody Auto auto) {
        return autoService.findById(id)
                .map(existing -> {
                    existing.setMarca(auto.getMarca());
                    existing.setPrecio(auto.getPrecio());
                    Auto updated = autoService.save(existing);
                    return ResponseEntity.ok(updated);
                })
                .orElse(ResponseEntity.notFound().build());
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        return autoService.findById(id)
                .map(existing -> {
                    autoService.deleteById(id);
                    return ResponseEntity.noContent().<Void>build();
                })
                .orElse(ResponseEntity.notFound().build());
    }


}
