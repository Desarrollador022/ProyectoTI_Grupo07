package com.empresa.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.empresa.entity.SolicitudPrestamos;
import com.empresa.entity.Zona;

public interface SolicitudPrestamoRepository extends JpaRepository<SolicitudPrestamos, Integer>{


    @Query("select s from SolicitudPrestamos s where s.usureg = ?1 and s.prestamistareg=?2")
    public List<SolicitudPrestamos> BuscaNombreLike(int idusu ,int idprest);

}