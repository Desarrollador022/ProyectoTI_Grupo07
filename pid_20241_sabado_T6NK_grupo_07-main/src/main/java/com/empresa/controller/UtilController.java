package com.empresa.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Zona;
import com.empresa.service.ZonaService;
@Controller
public class UtilController {

	@Autowired
	private ZonaService zonaService;
	

	@GetMapping("/listaZona")
	@ResponseBody
	public List<Zona> listaZona() {
		return zonaService.listaTodos();
	}
	
}
