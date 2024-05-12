package com.empresa.service;

import com.empresa.entity.Cuota;
import com.empresa.repository.CuotaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CuotaServiceImpl implements CuotaService{

    @Autowired
    private CuotaRepository repository;



    @Override
    public Cuota insertaCuota(Cuota obj) {

        return repository.save(obj);
    }
}
