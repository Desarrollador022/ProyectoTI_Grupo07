package com.empresa.service;

import com.empresa.entity.Solicitud_has_Estado;
import com.empresa.repository.SolicitudHasEstadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SolicitudHasEstadoServiceImpl implements SolicitudHasEstadoService{

    @Autowired
    private SolicitudHasEstadoRepository repository;


    @Override
    public Solicitud_has_Estado inserta(Solicitud_has_Estado obj) {
        return repository.save(obj);
    }
}
