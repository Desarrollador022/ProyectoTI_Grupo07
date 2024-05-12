package com.empresa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;



import com.empresa.entity.Opcion;
import com.empresa.entity.Rol;
import com.empresa.entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{

	@Query("Select x from Usuario x where x.dni = :#{#usu.dni} and x.password = :#{#usu.password}")
	public abstract Usuario login(@Param(value = "usu") Usuario bean);
	
	@Query("Select p from Opcion p, RolHasOpcion pr, Rol r, UsuarioHasRol u where  p.idOpcion = pr.opcion.idOpcion and pr.rol.idRol = r.idRol and r.idRol = u.rol.idRol and u.usuario.idUsuario = :var_idUsuario")
	public abstract List<Opcion> traerEnlacesDeUsuario(@Param("var_idUsuario") int idUsuario);

	@Query("Select r from Rol r, UsuarioHasRol u where r.idRol = u.rol.idRol and u.usuario.idUsuario = :var_idUsuario")
	public abstract List<Rol> traerRolesDeUsuario(@Param("var_idUsuario")int idUsuario);

	@Query("select u from Usuario u where  u.dni like ?1" )
	public abstract Usuario findByDni(String dni);
	

	@Query("select u from Usuario u, UsuarioHasRol r where u.idUsuario = r.usuario.idUsuario and r.rol.idRol = 2 and u.nombre like ?1 and u.usureg=?2" )
	public List<Usuario> listaJefesLike(String nombre, int usureg);

	@Query("select u from Usuario u, UsuarioHasRol r where u.idUsuario = r.usuario.idUsuario and r.rol.idRol = 3 and u.nombre like ?1 and u.usureg=?2")
	public List<Usuario> listaPrestamistaLike(String nombre, int usureg);

	@Query("select u from Usuario u, UsuarioHasRol r where u.idUsuario = r.usuario.idUsuario and r.rol.idRol = 4 and u.nombre like ?1 and u.usureg=?2")
	public List<Usuario> listaPrestatariosLike(String nombre, int usureg);
	@Query("select u.idUsuario,u.nombre,u.apellido prestatrio from Usuario u, UsuarioHasRol r where u.idUsuario = r.usuario.idUsuario and r.rol.idRol = 4 and u.nombre like ?1 and u.usureg=?2")
	public List<Usuario> listaPrestatariosNombre(int usureg);
	
	
}
