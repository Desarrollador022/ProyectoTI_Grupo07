package com.empresa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class EnlaceController {

	//Login
	@GetMapping("/")
	public String verLogin() {	return "intranetLogin";  }
	
	@GetMapping("/verIntranetHome")
	public String verIntranetHome() {	return "intranetHome";  }

	//Registro
	@GetMapping("/verCrudJefes")
	public String verCrudJefes() {	return "CrudJefes";	}

	@GetMapping("/verCrudPrestamistas")
	public String verCrudPrestamista() {	return "CrudPrestamistas";	}

	@GetMapping("/verCrudPrestatarios")
	public String verCrudPrestatario() {	return "CrudPrestatarios";	}




}
