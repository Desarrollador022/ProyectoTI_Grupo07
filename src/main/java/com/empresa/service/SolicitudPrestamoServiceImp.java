package com.empresa.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.SolicitudPrestamos;
import com.empresa.entity.Zona;
import com.empresa.repository.SolicitudPrestamoRepository;
import com.empresa.repository.ZonaRepository;

@Service
public class SolicitudPrestamoServiceImp implements SolicitudPrestamoService {

    @Autowired
    private SolicitudPrestamoRepository repository;



    @Override
    public SolicitudPrestamos insertaSolicitudPrestamo(SolicitudPrestamos obj) {

        return repository.save(obj);
    }



    @Override
    public List<SolicitudPrestamos> BuscaNombreLike(int usu,int idPrest) {

        return repository.BuscaNombreLike(usu,idPrest);
    }



    @Override
    public SolicitudPrestamos actualizaSolicitudPrestamo(SolicitudPrestamos obj) {

        return repository.save(obj);
    }


}