package com.empresa.entity;

import jakarta.persistence.Embeddable;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
@Embeddable
public class Solicitud_has_EstadoPK {
    private static final long serialVersionUID = 1L;
    private int idSolicitudPrestamos;
    private int idEstadoSoli;
}
