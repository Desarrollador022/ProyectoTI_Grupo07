package com.empresa.service;

import java.util.List;


import com.empresa.entity.Opcion;
import com.empresa.entity.Rol;
import com.empresa.entity.Usuario;



public interface UsuarioService {
	
	public abstract Usuario insertaUsuario(Usuario obj);

	public abstract Usuario login(Usuario bean);

	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);

	public abstract List<Rol> traerRolesDeUsuario(int idUsuario);

	public abstract Usuario buscaPorDni(String dni);

	public abstract List<Usuario> listaJefesLike(String nombre, int usureg);
	
	public abstract List<Usuario> listaPrestamistaLike(String nombre, int usureg);
	
	public abstract List<Usuario> listaPrestatarioLike(String nombre, int usureg);
	
	
}
