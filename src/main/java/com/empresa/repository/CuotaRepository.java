package com.empresa.repository;


import com.empresa.entity.Cuota;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CuotaRepository extends JpaRepository<Cuota, Integer> {
}
