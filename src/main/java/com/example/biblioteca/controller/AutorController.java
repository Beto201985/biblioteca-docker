package com.example.biblioteca.controller;

import com.example.biblioteca.model.Autor;
import com.example.biblioteca.service.AutorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/autores")
public class AutorController {

    @Autowired
    private AutorService autorService;

    @GetMapping
    public List<Autor> obtenerTodos() {
        return autorService.obtenerTodos();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Autor> obtenerPorId(@PathVariable Integer id) {
        Optional<Autor> autor = autorService.obtenerPorId(id);
        return autor.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Autor crear(@RequestBody Autor autor) {
        return autorService.guardar(autor);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Autor> actualizar(@PathVariable Integer id, @RequestBody Autor autorDetalles) {
        Optional<Autor> autorOptional = autorService.obtenerPorId(id);
        if (autorOptional.isPresent()) {
            Autor autor = autorOptional.get();
            autor.setNombre(autorDetalles.getNombre());
            autor.setFechaNacimiento(autorDetalles.getFechaNacimiento());
            autor.setNacionalidad(autorDetalles.getNacionalidad());

            return ResponseEntity.ok(autorService.guardar(autor));
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Integer id) {
        if (autorService.obtenerPorId(id).isPresent()) {
            autorService.eliminar(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}
