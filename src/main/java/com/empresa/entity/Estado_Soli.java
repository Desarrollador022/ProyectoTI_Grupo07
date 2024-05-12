package com.empresa.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "Estado_Soli")
public class Estado_Soli {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idEstadoSoli;
    private String descripcion;
}
