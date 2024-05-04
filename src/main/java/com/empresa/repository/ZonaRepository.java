package com.empresa.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import com.empresa.entity.Zona;

public interface ZonaRepository extends JpaRepository<Zona, Integer>{

	public abstract List<Zona> findByOrderByNombreAsc();
	
}
