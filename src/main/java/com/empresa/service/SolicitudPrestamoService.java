package com.empresa.service;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.empresa.entity.SolicitudPrestamos;
import com.empresa.entity.Zona;

public interface SolicitudPrestamoService {



    public SolicitudPrestamos insertaSolicitudPrestamo(SolicitudPrestamos obj);

    public List<SolicitudPrestamos> BuscaNombreLike(int id);


    public SolicitudPrestamos actualizaSolicitudPrestamo(SolicitudPrestamos obj);



}
