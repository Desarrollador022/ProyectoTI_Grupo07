package com.empresa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.empresa.entity.Usuario;
import com.empresa.entity.UsuarioHasRol;
import com.empresa.entity.UsuarioHasRolPK;
import com.empresa.service.UsuarioHasRolService;
import com.empresa.service.UsuarioService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UsuarioCrudController {


	@Autowired
	private UsuarioService usuarioService;

	@Autowired
	private UsuarioHasRolService usuarioHasRolService;




	@GetMapping("/consultaCrudjefes")
	@ResponseBody
	public List<Usuario> listaJefes(String filtro){
		List<Usuario> lstSalida = usuarioService.listaJefesLike("%" + filtro + "%");
		return lstSalida;
	}

	@GetMapping("/consultaCrudPrestamista")
	@ResponseBody
	public List<Usuario> listaPrestamista(String filtro){
		List<Usuario> lstSalida = usuarioService.listaPrestamistaLike("%" + filtro + "%");
		return lstSalida;
	}


	@GetMapping("/consultaCrudPrestatario")
	@ResponseBody
	public List<Usuario> listaPrestatario(String filtro){
		List<Usuario> lstSalida = usuarioService.listaPrestatarioLike("%" + filtro + "%");
		return lstSalida;
	}








	@PostMapping("/registraCrudJefe")
	@ResponseBody
	public Map<?, ?> registra(Usuario obj, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		Usuario validadni =usuarioService.buscaPorDni(obj.getDni());

		if(validadni != null){
			map.put("mensaje", "El DNI ya está registrado");
			return map;
		}
		else{


			Usuario objSalida = usuarioService.insertaUsuario(obj);
			UsuarioHasRolPK pk = new UsuarioHasRolPK();
			pk.setIdUsuario(obj.getIdUsuario());
			pk.setIdRol(2);

			UsuarioHasRol usuobj = new UsuarioHasRol();
			usuobj.setUsuarioHasRolPk(pk);

			usuarioHasRolService.inserta(usuobj);



			if (objSalida == null) {
				map.put("mensaje", "Error en el registro");
			} else {
				map.put("mensaje", "Registro exitoso");
			}
		}
		return map;

	}


	@PostMapping("/registraCrudPrestamista")
	@ResponseBody
	public Map<?, ?> registraPrestamista(Usuario obj, HttpSession session) {


		HashMap<String, String> map = new HashMap<String, String>();
		Usuario objSalida = usuarioService.insertaUsuario(obj);

		UsuarioHasRolPK pk = new UsuarioHasRolPK();
		pk.setIdUsuario(obj.getIdUsuario());
		pk.setIdRol(3);

		UsuarioHasRol usuobj = new UsuarioHasRol();
		usuobj.setUsuarioHasRolPk(pk);

		usuarioHasRolService.inserta(usuobj);


		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			map.put("mensaje", "Registro exitoso");
		}

		return map;

	}



	@PostMapping("/registraCrudPrestatario")
	@ResponseBody
	public Map<?, ?> registraPrestatario(Usuario obj, HttpSession session) {


		HashMap<String, String> map = new HashMap<String, String>();
		Usuario objSalida = usuarioService.insertaUsuario(obj);

		UsuarioHasRolPK pk = new UsuarioHasRolPK();
		pk.setIdUsuario(obj.getIdUsuario());
		pk.setIdRol(4);

		UsuarioHasRol usuobj = new UsuarioHasRol();
		usuobj.setUsuarioHasRolPk(pk);

		usuarioHasRolService.inserta(usuobj);


		if (objSalida == null) {
			map.put("mensaje", "Error en el registro");
		} else {
			map.put("mensaje", "Registro exitoso");
		}

		return map;

	}






}