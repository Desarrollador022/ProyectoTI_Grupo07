package com.empresa.controller;

import java.io.Console;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.empresa.entity.*;
import com.empresa.service.*;
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


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class SolicitudPrestamoController {




        @Autowired
        private SolicitudPrestamoService solicitudPrestamoService;
        @Autowired
        private SolicitudHasEstadoService solicitudHasPrestamoService;


        @Autowired
        private UsuarioService usuarioService;


        @GetMapping("/consultaCrudSolicitudPrestamo")
        @ResponseBody
        public List<SolicitudPrestamos> listaJefes(int filtro, int usureg){
            List<SolicitudPrestamos> lstSalida = solicitudPrestamoService.BuscaNombreLike(filtro,usureg);
            return lstSalida;
        }


        @PostMapping("/registraSolicitudPrestamo")
        @ResponseBody
        @Transactional
        public Map<?, ?> registra(
                @RequestParam("monto") double monto,
                @RequestParam("fechaInicio") @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaInicio,
                @RequestParam("fechaFin") @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaFin,
                @RequestParam("dias") int dias,
                @RequestParam("montoPrest") int montoprest,
                @RequestParam("pagoDiario") String pagoDiario,
                RedirectAttributes redirectAttributes, HttpServletRequest request, HttpSession session
        ) {

            Usuario objUsuario = (Usuario) session.getAttribute("objUsuario");


            SolicitudPrestamos s = new SolicitudPrestamos();
            s.setMonto(monto);
            s.setFechaInicio(fechaInicio);
            s.setFechaFin(fechaFin);
            s.setDias(dias);
            s.setPagodiario(pagoDiario);
            s.setMontoprest(montoprest);
            s.setUsureg(objUsuario.getIdUsuario());
            s.setPrestamistareg(objUsuario.getUsureg());
            s.setInteres("10%");
            solicitudPrestamoService.insertaSolicitudPrestamo(s);
            Solicitud_has_EstadoPK pk = new Solicitud_has_EstadoPK();
            pk.setIdSolicitudPrestamos(s.getIdSolicitudPrestamos());
            pk.setIdEstadoSoli(2);

            Solicitud_has_Estado soliobj = new Solicitud_has_Estado();
            soliobj.setSolicitudHasRolPk(pk);
            Solicitud_has_Estado objsalida = solicitudHasPrestamoService.inserta(soliobj);



            HashMap<String, Object> map = new HashMap<String, Object>();
            if (objsalida == null) {
                map.put("mensaje", "Error en el registro");
            } else {


                map.put("mensaje", "Registro exitoso ");


            }


            return map;
        }


        @PostMapping("/actualizaSolicitudPrestamos")
        @ResponseBody
        public Map<?, ?> actualiza(
                @RequestParam("soli") int idSolicitudPrestamo,

                RedirectAttributes redirectAttributes, HttpSession session
        ) {
            HashMap<String, Object> map = new HashMap<String, Object>();




            Solicitud_has_EstadoPK pk = new Solicitud_has_EstadoPK();
            pk.setIdSolicitudPrestamos(idSolicitudPrestamo);
            pk.setIdEstadoSoli(2);

            Solicitud_has_Estado soliobj = new Solicitud_has_Estado();
            soliobj.setSolicitudHasRolPk(pk);

            Solicitud_has_Estado objsalida = solicitudHasPrestamoService.inserta(soliobj);









            if (objsalida == null) {
                map.put("mensaje", "Error en actualizar");
            } else {
                map.put("mensaje", "Actualización exitosa");
            }
            return map;
        }


        @PostMapping("/actualizaSolicitudPrestamosRechaza")
        @ResponseBody
        public Map<?, ?> actualizaRechasa(
                @RequestParam("soli") int idSolicitudPrestamo,

                RedirectAttributes redirectAttributes, HttpSession session
        ) {
            HashMap<String, Object> map = new HashMap<String, Object>();




            Solicitud_has_EstadoPK pk = new Solicitud_has_EstadoPK();
            pk.setIdSolicitudPrestamos(idSolicitudPrestamo);
            pk.setIdEstadoSoli(3);

            Solicitud_has_Estado soliobj = new Solicitud_has_Estado();
            soliobj.setSolicitudHasRolPk(pk);

            Solicitud_has_Estado objsalida = solicitudHasPrestamoService.inserta(soliobj);





            if (objsalida == null) {
                map.put("mensaje", "Error en actualizar");
            } else {
                map.put("mensaje", "Actualización exitosa");
            }
            return map;
        }


    }
