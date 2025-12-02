package ar.edu.centro8.desarrollo.proyectoauto.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import ar.edu.centro8.desarrollo.proyectoauto.dto.AutoRequestDTO;
import ar.edu.centro8.desarrollo.proyectoauto.model.Auto;
import ar.edu.centro8.desarrollo.proyectoauto.service.IAutoService;

@RestController
@RequestMapping("/api/autos")
public class AutoController {

    @Autowired
    private IAutoService autoService;
    
    /**
     * GET - Obtener todos los autos
     */
    @GetMapping
    public ResponseEntity<List<Auto>> getAllAutos() {
        List<Auto> autos = autoService.getAutos();
        return ResponseEntity.ok(autos);
    }
    
    /**
     * GET - Obtener auto por ID
     */
    @GetMapping("/{id}")
    public ResponseEntity<Auto> getAutoById(@PathVariable Long id) {
        try {
            Auto auto = autoService.findAuto(id);
            return ResponseEntity.ok(auto);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    /**
     * POST - Crear nuevo auto
     */
    @PostMapping
    public ResponseEntity<?> createAuto(@RequestBody AutoRequestDTO autoDTO) {
        try {
            Auto autoCreado = autoService.saveAuto(autoDTO);
            return ResponseEntity.ok(autoCreado);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }
    
    /**
     * PUT - Actualizar auto existente
     */
    @PutMapping("/{id}")
    public ResponseEntity<?> updateAuto(@PathVariable Long id, @RequestBody AutoRequestDTO autoDTO) {
        try {
            Auto autoActualizado = autoService.editAuto(id, autoDTO);
            return ResponseEntity.ok(autoActualizado);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }
    
    /**
     * DELETE - Eliminar auto
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteAuto(@PathVariable Long id) {
        try {
            autoService.deleteAuto(id);
            return ResponseEntity.ok("Auto eliminado exitosamente");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error al eliminar el auto: " + e.getMessage());
        }
    }
    
    /**
     * GET - Buscar autos por rango de precio
     * Utiliza el method query implementado
     */
    @GetMapping("/precio")
    public ResponseEntity<List<Auto>> getAutosByPrecioRange(
            @RequestParam Double min, 
            @RequestParam Double max) {
        try {
            List<Auto> autos = autoService.getAutosByPrecioRange(min, max);
            return ResponseEntity.ok(autos);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
}