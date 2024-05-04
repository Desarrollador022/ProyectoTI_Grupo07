package com.empresa.entity;

import java.io.Serializable;

import jakarta.persistence.Embeddable;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
@Embeddable
public class UsuarioHasZonaPK implements Serializable {

	private static final long serialVersionUID = 1L;

	private int idUsuario;
	private int idRol;

}
