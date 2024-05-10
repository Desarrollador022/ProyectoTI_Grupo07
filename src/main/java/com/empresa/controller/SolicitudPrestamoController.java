package com.empresa.controller;

import java.io.Console;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.empresa.entity.SolicitudPrestamos;
import com.empresa.service.SolicitudPrestamoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.empresa.entity.Usuario;
import com.empresa.entity.UsuarioHasRol;
import com.empresa.entity.UsuarioHasRolPK;
import com.empresa.service.UsuarioHasRolService;
import com.empresa.service.UsuarioService;
import com.empresa.service.ZonaService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class SolicitudPrestamoController {




        @Autowired
        private SolicitudPrestamoService solicitudPrestamoService;


        @Autowired
        private UsuarioService usuarioService;


        @GetMapping("/consultaCrudSolicitudPrestamo")
        @ResponseBody
        public List<SolicitudPrestamos> consulta(HttpSession session) {

            Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");
            return solicitudPrestamoService.BuscaNombreLike(objUsuario.getIdUsuario());
        }


        @PostMapping("/registraSolicitudPrestamo")
        @ResponseBody
        @Transactional
        public Map<?, ?> registra(
                @RequestParam("monto") double monto,
                @RequestParam("fechaInicio") @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaInicio,
                @RequestParam("fechaFin") @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaFin,
                @RequestParam("dias") int dias,
                @RequestParam("pagoDiario") double pagoDiario,
                RedirectAttributes redirectAttributes, HttpServletRequest request, HttpSession session
        ) {

            Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");


            SolicitudPrestamos s = new SolicitudPrestamos();
            s.setMonto(monto);
            s.setFechaInicio(fechaInicio);
            s.setFechaFin(fechaFin);
            s.setDias(dias);
            s.setPagodiario(pagoDiario);
            s.setUsureg(objUsuario.getIdUsuario());
            s.setEstado(2);


            SolicitudPrestamos objSalida = solicitudPrestamoService.insertaSolicitudPrestamo(s);
            HashMap<String, Object> map = new HashMap<String, Object>();
            if (objSalida == null) {
                map.put("mensaje", "Error en el registro");
            } else {


                map.put("mensaje", "Registro exitoso ");


            }


            return map;
        }


        @PostMapping("/actualizaSolicitudPrestamos")
        @ResponseBody
        public Map<?, ?> actualiza(
                @RequestParam("idSolicitudPrestamo") int idSolicitudPrestamo,
                @RequestParam("monto") double monto,
                @RequestParam("fechaInicio") @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaInicio,
                @RequestParam("fechaFin") @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaFin,
                @RequestParam("dias") int dias,
                @RequestParam("pagoDiario") double pagoDiario,
                RedirectAttributes redirectAttributes, HttpSession session
        ) {
            HashMap<String, Object> map = new HashMap<String, Object>();


            Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");


            SolicitudPrestamos s = new SolicitudPrestamos();
            s.setIdSolicitudPrestamos(idSolicitudPrestamo);
            s.setMonto(monto);
            s.setFechaInicio(fechaInicio);
            s.setFechaFin(fechaFin);
            s.setDias(dias);
            s.setPagodiario(pagoDiario);
            s.setEstado(1);

            SolicitudPrestamos objSalida = solicitudPrestamoService.actualizaSolicitudPrestamo(s);
            if (objSalida == null) {
                map.put("mensaje", "Error en actualizar");
            } else {
                map.put("mensaje", "Actualización exitosa");
                List<SolicitudPrestamos> lista = solicitudPrestamoService.BuscaNombreLike(objUsuario.getIdUsuario());
                map.put("lista", lista);
            }
            return map;
        }


        @PostMapping("/actualizaSolicitudPrestamosRechaza")
        @ResponseBody
        public Map<?, ?> actualizaRechasa(
                @RequestParam("idSolicitudPrestamo") int idSolicitudPrestamo,
                @RequestParam("monto") double monto,
                @RequestParam("fechaInicio") @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaInicio,
                @RequestParam("fechaFin") @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaFin,
                @RequestParam("dias") int dias,
                @RequestParam("pagoDiario") double pagoDiario,
                RedirectAttributes redirectAttributes, HttpSession session
        ) {
            HashMap<String, Object> map = new HashMap<String, Object>();

            Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");


            SolicitudPrestamos s = new SolicitudPrestamos();
            s.setIdSolicitudPrestamos(idSolicitudPrestamo);
            s.setMonto(monto);
            s.setFechaInicio(fechaInicio);
            s.setFechaFin(fechaFin);
            s.setDias(dias);
            s.setPagodiario(pagoDiario);
            s.setEstado(0);

            SolicitudPrestamos objSalida = solicitudPrestamoService.actualizaSolicitudPrestamo(s);
            if (objSalida == null) {
                map.put("mensaje", "Error en actualizar");
            } else {
                map.put("mensaje", "Actualización exitosa");
                List<SolicitudPrestamos> lista = solicitudPrestamoService.BuscaNombreLike(objUsuario.getIdUsuario());
                map.put("lista", lista);
            }
            return map;
        }


    }
