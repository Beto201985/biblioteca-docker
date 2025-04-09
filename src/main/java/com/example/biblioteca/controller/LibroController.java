package com.example.biblioteca.controller;

import com.example.biblioteca.model.Libro;
import com.example.biblioteca.service.LibroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/libros")
@CrossOrigin(origins = "*")  // 🔹 Permitir peticiones desde JavaFX
public class LibroController {

    @Autowired
    private LibroService libroService;

    @GetMapping
    public List<Libro> obtenerTodos() {
        return libroService.obtenerTodos();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Libro> obtenerPorId(@PathVariable Integer id) {
        Optional<Libro> libro = libroService.obtenerPorId(id);
        return libro.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
public ResponseEntity<?> crear(@RequestBody Libro libro) {
    try {
        System.out.println("📥 Recibida solicitud para agregar libro: " + libro.getTitulo());

        // 🔹 Establecer el ID en null para que Hibernate lo genere automáticamente
        libro.setId(null);

        Libro nuevoLibro = libroService.guardar(libro);
        return ResponseEntity.status(201).body(nuevoLibro);
    } catch (Exception e) {
        e.printStackTrace(); // 🔹 Imprime el error en la consola de Spring Boot
        return ResponseEntity.status(500).body("Error al agregar el libro: " + e.getMessage());
    }
}



    @PutMapping("/{id}")
    public ResponseEntity<Libro> actualizar(@PathVariable Integer id, @RequestBody Libro libroDetalles) {
        Optional<Libro> libroOptional = libroService.obtenerPorId(id);
        if (libroOptional.isPresent()) {
            Libro libro = libroOptional.get();
            libro.setTitulo(libroDetalles.getTitulo());
            libro.setAutorId(libroDetalles.getAutorId());
            libro.setAnioPublicacion(libroDetalles.getAnioPublicacion());
            libro.setDisponible(libroDetalles.getDisponible());

            return ResponseEntity.ok(libroService.guardar(libro));
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable Integer id) {
        if (libroService.obtenerPorId(id).isPresent()) {
            libroService.eliminar(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}
