var MSG_ERROR = "Se gener&oacute; un error, consulte al administrador";
var MSG_ELIMINAR = "&#191;Desea eliminar el registro&#63;";

function mostrarMensaje(msg, ejecutarAccion){
	$('#id_my_modal').remove();
	
	$("body").append('<div class="modal fade" id="id_my_modal" role="dialog"><div class="modal-dialog"><div class="modal-content">' + 
					 '<div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title">Mensaje</h4></div>'+
					 '<div class="modal-body"><p>'+msg+'</p></div>'+
					 '<div class="modal-footer"><button type="button" id="id_btn_dialog_aceptar" class="btn btn-primary btn-sm">Aceptar</button></div>'+
					 '</div></div></div>');
	
	$("#id_btn_dialog_aceptar").click(function(){
		$('#id_my_modal').modal("hide");
		if(ejecutarAccion != undefined){
			window.location.href = ejecutarAccion;
		}
	});
	
	$('#id_my_modal').modal("show");
}
  
var IDIOMA = {
	processing:"procesando...",
    lengthMenu: "_MENU_ Registros por p&aacute;gina",
    zeroRecords: "No existen registros",
    info: "P&aacute;gina _PAGE_ de _PAGES_",
    infoEmpty: "Sin registros",
    infoFiltered: "(Filtro de _MAX_ registros)",
    search: "Buscar:",
    paginate: {
        "first":      "Primero",
        "last":       "Last",
        "next":       "Siguiente",
        "previous":   "Anterior"
    }
};

function mostrarMensajeConfirmacion(msg, accionAceptar, accionCancelar, data){
	$('#id_my_modal_confirmacion').remove();
	
	$("body").append('<div class="modal fade" id="id_my_modal_confirmacion" role="dialog"><div class="modal-dialog"><div class="modal-content">' + 
					 '<div class="modal-header"><button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title">Mensaje</h4></div>'+
					 '<div class="modal-body"><p>'+msg+'</p></div>'+
					 '<div class="modal-footer">'+
					 '<button type="button" id="id_btn_dialog_si" class="btn btn-primary btn-sm">Si</button>'+
					 '<button type="button" id="id_btn_dialog_no" class="btn btn-default">No</button>'+
					 '</div>'+
					 '</div></div></div>');
	
	$("#id_btn_dialog_si").click(function(){
		$('#id_my_modal_confirmacion').modal("hide");
		if(accionAceptar != null){
			accionAceptar(data);
		}
	});
	$("#id_btn_dialog_no").click(function(){
		$('#id_my_modal_confirmacion').modal("hide");
		if(accionCancelar != null){
			accionCancelar(data);
		}
	});
	
	$('#id_my_modal_confirmacion').modal("show");
}



function valFechaInicioMayFechaFin(idIni, idFin){
		    var fIni = $.trim($(idIni).val());
		    var fFin = $.trim($(idFin).val());
		    
		    var dIni = new Date(fIni);
		    var dFin = new Date(fFin);
		    
		    if (dIni > dFin){
		        return true;
		    }else{
		        return false;
        }
  }