package com.empresa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.UsuarioHasRol;
import com.empresa.repository.UsuarioHasRolRepository;


@Service
public class UsuarioHasRolServiceImpl implements UsuarioHasRolService{
   
	
	@Autowired
	private UsuarioHasRolRepository repository;

	@Override
	public UsuarioHasRol inserta(UsuarioHasRol obj) {
		return repository.save(obj);
	} 
	


}
