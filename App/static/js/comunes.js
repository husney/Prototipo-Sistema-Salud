export function MensajeEmergente(titulo,mensaje,tipo,btnCancelar=false,btnAceptarTexto="Aceptar",btnCancelarTexto="Cancelar", funcAccept = null, funcCancel = null){

    const msjEmergente =  new Swal({
          title: titulo,
          text: mensaje,
          type: tipo,
          showCancelButton    : btnCancelar,
          cancelButtonText    : btnCancelarTexto,
          confirmButtonColor  : "btn-danger",
          confirmButtonText   : btnAceptarTexto,
          allowOutsideClick: false,
          closeOnConfirm: false,
          //closeOnCancel: false
      });
    
      if(funcAccept != null){
          msjEmergente.then(() =>{
              funcAccept();
          }).catch(() =>{
              if(funcCancel != null){
                  funcCancel();
              }
          });
      }   
    
      return msjEmergente;
    
}