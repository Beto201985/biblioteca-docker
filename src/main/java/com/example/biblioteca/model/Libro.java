package com.example.biblioteca.model;

import jakarta.persistence.*;

@Entity
@Table(name = "libros")
public class Libro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String titulo;

    @Column(nullable = false)
    private Integer autorId;

    @Column(nullable = false)
    private Integer anioPublicacion;

    @Column(nullable = false)
    private Boolean disponible;

    // 🔹 Constructor vacío requerido por Spring Boot
    public Libro() {}

    public Libro(Integer id, String titulo, Integer autorId, Integer anioPublicacion, Boolean disponible) {
        this.id = id;
        this.titulo = titulo;
        this.autorId = autorId;
        this.anioPublicacion = anioPublicacion;
        this.disponible = disponible;
    }

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public Integer getAutorId() { return autorId; }
    public void setAutorId(Integer autorId) { this.autorId = autorId; }

    public Integer getAnioPublicacion() { return anioPublicacion; }
    public void setAnioPublicacion(Integer anioPublicacion) { this.anioPublicacion = anioPublicacion; }

    public Boolean getDisponible() { return disponible; }
    public void setDisponible(Boolean disponible) { this.disponible = disponible; }
}
