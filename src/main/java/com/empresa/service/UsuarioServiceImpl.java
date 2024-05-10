package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Opcion;
import com.empresa.entity.Rol;
import com.empresa.entity.Usuario;
import com.empresa.repository.UsuarioRepository;




@Service
public class UsuarioServiceImpl implements UsuarioService{

	@Autowired
	private UsuarioRepository repository;
	
	@Override
	public Usuario login(Usuario bean) {
		return repository.login(bean);
	}

	@Override
	public List<Opcion> traerEnlacesDeUsuario(int idUsuario) {
		return repository.traerEnlacesDeUsuario(idUsuario);
	}

	@Override
	public List<Rol> traerRolesDeUsuario(int idUsuario) {
		return repository.traerRolesDeUsuario(idUsuario);
	}


	@Override
	public Usuario insertaUsuario(Usuario obj) {
		return repository.save(obj);
	}

	public Usuario buscaPorDni(String dni) {
		return repository.findByDni(dni);
	}



	@Override
	public List<Usuario> listaJefesLike(String nombre,int usureg) {
		// TODO Auto-generated method stub
		return repository.listaJefesLike(nombre, usureg);
	}

	@Override
	public List<Usuario> listaPrestamistaLike(String nombre, int usureg) {
		return repository.listaPrestamistaLike(nombre, usureg);
	}

	@Override
	public List<Usuario> listaPrestatarioLike(String nombre, int usureg) {
		return repository.listaPrestatariosLike(nombre, usureg);
	}

}
