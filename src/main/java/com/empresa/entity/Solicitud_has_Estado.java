package com.empresa.entity;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "solicitud_has_Estado")
public class Solicitud_has_Estado {
    @EmbeddedId
    private Solicitud_has_EstadoPK solicitudHasRolPk;

    @ManyToOne
    @JoinColumn(name = "idSolicitudPrestamos", nullable = false, insertable = false, updatable = false)
    private SolicitudPrestamos idSolicitudPrestamos;

    @ManyToOne
    @JoinColumn(name = "idEstadoSoli", nullable = false, insertable = false, updatable = false)
    private Estado_Soli idEstadoSoli;

}
