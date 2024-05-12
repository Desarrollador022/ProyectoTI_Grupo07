package com.empresa.repository;


import com.empresa.entity.Solicitud_has_Estado;
import com.empresa.entity.Solicitud_has_EstadoPK;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SolicitudHasEstadoRepository extends JpaRepository<Solicitud_has_Estado, Solicitud_has_EstadoPK> {
}
