package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Zona;
import com.empresa.repository.ZonaRepository;

@Service
public class ZonaServiceImp implements ZonaService {

	@Autowired
	private ZonaRepository repository;

	@Override
	public List<Zona> listaTodos() {
		return repository.findByOrderByNombreAsc();

	}

}
