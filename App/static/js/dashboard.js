import { MensajeEmergente } from "./comunes.js";
import { SpanishDataTable } from "./resources.js"

//#region Elementos html

const lstTipoDocumento = document.getElementById('lstTipoDocumento');
const lstGenero = document.getElementById('lstGenero');


//#region Elementos datos basicos

const primerNombre = document.getElementById('primerNombre');
const segundoNombre = document.getElementById('segundoNombre');
const primerApellido = document.getElementById('primerApellido');
const segundoApellido = document.getElementById('segundoApellido');
const numeroDocumento = document.getElementById('numeroDocumento');
const edad = document.getElementById('edad');
const email = document.getElementById('email');
const celular = document.getElementById('celular');
const btnActualizar = document.getElementById('btnActualizar');

const btnDatos = document.getElementById('btnDatos');

const lstEnfermedades = document.getElementById('lstInconvenientesSalud');
const btnRegistrarEnfermedad = document.getElementById('btnRegistrarEnfermedad');


const fechaReporte = document.getElementById('fechaReporte');

const btnAgregarAccidente = document.getElementById('btnAgregarAccidente');
const descripcionAccidente = document.getElementById('descripcionAccidente');
const lugarAccidente = document.getElementById('lugarAccidente');
const enTratamientoAccidente = document.getElementById('enTratamientoAccidente');

const btnAgregarExamen = document.getElementById('btnAgregarExamen');

const descripcionExamen = document.getElementById('descripcionExamen');
const fechaExamen = document.getElementById('fechaExamen');
const fechaResultados = document.getElementById('fechaResultados');


const lstVacunas = document.getElementById('tipoVacuna');
const fechaVacuna = document.getElementById('fechaVacuna');
const btnAgregarVacuna = document.getElementById('btnAgregarVacuna');

const btnAgregarPersona = document.getElementById('btnAgregarPersona');
//#region 

//#endregion

let tblCondiciones;
let tblResultadosExamenes;
let tblVacunas;
let tblEntrenamientos;
let tblAccidentes;
let tiposDocumento;
let generos;
let vacunas;

let idPersonaActual;
let infoPersonaActual;
let enfermedades;

$(document).ready(() => {
    idPersonaActual = TOKEN.persona;    
    validarPersonaRegistrada();
    cargarTiposDocumento();
    cargarGeneros();    
    cargarEnfermedades();
    cargarVacunas();

    $("select").select2({
        dropdownParent: $("#datosPersonas"),
        width: "100%",
        heigth: "100%"
    });
});

btnDatos.addEventListener('click', e => {
    idPersonaActual = TOKEN.persona;
})

btnAgregarPersona.addEventListener('click', e => {    
    idPersonaActual = null;
    limpiarInformacion();
});

function limpiarInformacion(){
    document.getElementById('globalForm').reset();
    tblAccidentes.destroy();
    tblCondiciones.destroy();
    tblEntrenamientos.destroy();
    tblResultadosExamenes.destroy();
    tblVacunas.destroy();
}

btnAgregarVacuna.addEventListener('click', e => {
     
    e.preventDefault();

    const requestData = {
        method : "POST",
        headers: defaultHeaders,
        body: JSON.stringify({
            idVacuna : lstVacunas.value,
            fecha: fechaVacuna.value,            
            idPersona: idPersonaActual
        })
    }

    fetch('/vacunasPersona', requestData)
    .then(response => response.json())
    .then(rs => {
        tablaVacunas();
    })

})

btnAgregarExamen.addEventListener('click', e => {
    
    e.preventDefault();

    const requestData = {
        method : "POST",
        headers: defaultHeaders,
        body: JSON.stringify({
            informacion : descripcionExamen.value,
            fechaExamen: fechaExamen.value,
            fechaResultados: fechaResultados.value,
            idPersona: idPersonaActual
        })
    }

    fetch('/examenesPersona', requestData)
    .then(response => response.json())
    .then(rs => {
        tablaResultadosExamenes();
    })


})

btnAgregarAccidente.addEventListener('click', e => {
    e.preventDefault();

    const requestData = {
        method : "POST",
        headers: defaultHeaders,
        body: JSON.stringify({
            descripcion : descripcionAccidente.value,
            lugar: lugarAccidente.value,
            idPersona: idPersonaActual
        })
    }

    fetch('/accidentesPersona', requestData)
    .then(response => response.json())
    .then(rs => {
        tablaAccidentes();
    })


})

btnRegistrarEnfermedad.addEventListener('click', e => {
    e.preventDefault();

    const requestData = {
        method : "POST",
        headers: defaultHeaders,
        body: JSON.stringify({
            fechaDiagnostico : fechaReporte.value,
            idEnfermedad: lstEnfermedades.value,
            idPersona: idPersonaActual
        })
    }

    fetch('/enfermedadesPersona', requestData)
    .then(response => response.json())
    .then(rs => {
        tablaCondiciones();
    })


})

$('#datosPersonas').on('shown.bs.modal', function(e){

    $('#datosPrsonas').modal({
        backdrop: 'static', 
        keyboard: false
    })

    if(idPersonaActual != null){
        obtenerInformacionPersonaActual();
        tablaCondiciones();
        tablaResultadosExamenes();
        tablaVacunas();
        tablaEntrenamientos();
        tablaAccidentes();
    }
        
});

function obtenerInformacionPersonaActual(){
    
    fetch(`/persona/${idPersonaActual}`)
    .then(response => response.json())
    .then(rs => {        
        if(rs.success){
            infoPersonaActual = rs.persona;
            agregarInformacionPesona();
        }
    });

}

function cargarEnfermedades(){
    fetch('/enfermedades')
    .then(response => response.json())
    .then(rs => {

        if(!rs.success)
            return;

        enfermedades = rs.data;

        while(lstEnfermedades.firstChild)
            lstEnfermedades.firstChild.remove();

        const defaultOption = document.createElement('option');
        defaultOption.value = 0;
        defaultOption.textContent = "Seleccionar";

        lstEnfermedades.appendChild(defaultOption);

        enfermedades.forEach(enfermedad => {
            const option = document.createElement('option');
            option.value = enfermedad.id;
            option.textContent = enfermedad.descripcion;

            lstEnfermedades.appendChild(option);
        });

    })
}

function agregarInformacionPesona(){
    
    celular.value = infoPersonaActual.celular;
    edad.value = infoPersonaActual.edad;
    email.value = infoPersonaActual.email,
    lstGenero.value = infoPersonaActual.idGenero;
    lstTipoDocumento.value = infoPersonaActual.idTipoDocumento;
    numeroDocumento.value = infoPersonaActual.numeroDocumento;
    primerApellido.value = infoPersonaActual.primerApellido;
    primerNombre.value = infoPersonaActual.primerNombre;
    segundoApellido.value = infoPersonaActual.segundoApellido;
    segundoNombre.value = infoPersonaActual.segundoNombre

}

btnActualizar.addEventListener('click', e => {
    e.preventDefault();    
    const requestInfo= {        
        headers: defaultHeaders,
        body : JSON.stringify({
            primerNombre: primerNombre.value,
            segundoNombre: segundoNombre.value,
            primerApellido: primerApellido.value,
            segundoApellido: segundoApellido.value,
            numeroDocumento: numeroDocumento.value,
            tipoDocumento: lstTipoDocumento.value,
            genero: lstGenero.value,
            usuario: idPersonaActual == null ? TOKEN.Id : null,
            personaUsuario : TOKEN.persona != null ? TOKEN.persona : null,
            email: email.value,
            edad: edad.value,
            celular: celular.value
        })
    };

    if(idPersonaActual == null){
        requestInfo.method = "POST";
    }else{
        requestInfo.method = "PUT";
    }

    let url = `/persona`
    if (requestInfo.method == "PUT")
        url += `/${idPersonaActual}`
    
    fetch(url, requestInfo)
    .then(response => response.json())
    .then(rs => {
        if(rs.success){
            idPersonaActual = rs.persona;
            obtenerInformacionPersonaActual();
            MensajeEmergente("", "Actualizado correctamente.", "success");
            agregarPersonasRelacionadas();
        }
    })

})

function validarPersonaRegistrada(){

    const intervalo = setInterval(() => {
        fetch(`/personaAuth/${TOKEN.Id}`)
        .then(response => response.json())
        .then(rs => {            
            if(rs.registrado){
                clearInterval(intervalo);
                TOKEN.registrado = rs.registrado;
                TOKEN.persona = rs.persona;
                localStorage.setItem("current-user", JSON.stringify(TOKEN));
                idPersonaActual = TOKEN.persona;
                obtenerInformacionPersonaActual();
                agregarPersonasRelacionadas();
            }                
            else{
                
                if(!$('#datosPersonas').hasClass('show'))
                    $('#datosPersonas').modal('show');
            }
        })
    }, 2000);

}

function agregarPersonasRelacionadas(){
    fetch(`/grupoPersona/${TOKEN.persona}`)
    .then(response => response.json())
    .then(rs => {
        if(rs.success){
            rs.data.forEach(persona => {
                document.getElementById('personasContenedor').innerHTML = "";
                const div = document.createElement('div');

                const infoPerson = `<div class="card d-flex justify-content-center d-inline-block mx-2 cursor-pointer personInfo"
                style="width: 8rem; height: 210px" data-person="${persona.agrupada}">
                <img src="../static/images/man.png" width="100% margin:auto" alt="" data-person="${persona.agrupada}">
                <div class="card-body" data-person="${persona.agrupada}">
                    <div class="card-title" data-person="${persona.agrupada}">
                        <span data-person="${persona.agrupada}">${persona.nombreRelacionado}</span>
                    </div>                    
                </div>
            </div>`;

                div.innerHTML = infoPerson;
                document.getElementById('personasContenedor').appendChild(div)
            });

            $(".personInfo").on("click", function(e){
                idPersonaActual = Number(e.target.dataset.person);
                $('#datosPersonas').modal('show');
            })
        }
    })
}


function cargarVacunas(){
    fetch('/vacunas')
    .then(response => response.json())
    .then(rs => {
        vacunas = rs;

        while(lstVacunas.firstChild){
            lstVacunas.firstChild.remove();
        }

        const defaultOption = document.createElement('option');
        defaultOption.value = 0;
        defaultOption.textContent = "Seleccionar";
        lstVacunas.appendChild(   defaultOption);
        
        rs.data.forEach(genero => {
            const option = document.createElement('option');
            option.value = genero.id;
            option.textContent = genero.descripcion;

            lstVacunas.appendChild(option);
        });


    })
}

function cargarGeneros(){

    fetch('/generos')
    .then(response => response.json())
    .then(rs => {
        generos = rs;

        while(lstGenero.firstChild){
            lstGenero.firstChild.remove();
        }

        const defaultOption = document.createElement('option');
        defaultOption.value = 0;
        defaultOption.textContent = "Seleccionar";
        lstGenero.appendChild(   defaultOption);
        
        rs.data.forEach(genero => {
            const option = document.createElement('option');
            option.value = genero.id;
            option.textContent = genero.descripcion;

            lstGenero.appendChild(option);
        });


    })

}

function cargarTiposDocumento(){

    fetch('/tiposDocumento')
    .then(response => response.json())
    .then(rs => {
        
        tiposDocumento = rs.data;

        while(lstTipoDocumento.firstChild){
            lstTipoDocumento.firstChild.remove();
        }

        const defaultOption = document.createElement('option');
        defaultOption.value = 0;
        defaultOption.textContent = "Seleccionar"
        lstTipoDocumento.appendChild(defaultOption);

        rs.data.forEach(tipo => {
            const option = document.createElement('option');
            option.value = tipo.id;
            option.textContent = `${tipo.codigo} - ${tipo.descripcion}`;

            lstTipoDocumento.appendChild(option);
        })


    });

}

function tablaCondiciones(){
    tblCondiciones = $("#tblCondiciones").DataTable({
        bDestroy: true,
        language: SpanishDataTable,
        bLengthChange: false,
        ajax: {
            type: "GET",
            url: `/enfermedadesPersona/${idPersonaActual}`,
            contentType: "application/json",
            dataType: "json",
            dataFilter: function(data){
                
                let info = JSON.parse(data);
                let dataInfo = {
                    data: info.data
                };
                return JSON.stringify(dataInfo);
            }
        },
        columnDefs: [
            {
                targets: [0, 1, 2]
            }
        ],
        columns: [
            {
                data: "nombreEnfermedad"
            },
            {
                data: "fechaDiagnostico",
                render: (data) => moment(data).format("DD-MM-YYYY")
            },
            {
                data: "nombreEstado"
            }
        ]
    });
}

function tablaResultadosExamenes(){
    tblResultadosExamenes = $("#tblResultadosExamenes").DataTable({
        bDestroy: true,
        language: SpanishDataTable,
        bLengthChange: false,
        ajax: {
            type: "GET",
            url: `/examenesPersona/${idPersonaActual}`,
            contentType: "application/json",
            dataType: "json",
            dataFilter: function(data){
                
                let info = JSON.parse(data);
                let dataInfo = {
                    data: info.data
                };
                return JSON.stringify(dataInfo);
            }
        },
        columnDefs:[{
            targets: [0, 1, 2, 3]
        }],
        columns:[
            {
                className : "d-none",
                orderable: false,
                data: "id"
            },
            {
                data: "informacion"
            },
            {
                orderable : false,
                data: "fechaExamen",
                render: (data) => moment(data).format("DD-MM-YYYY")
            },
            {
                data: "fechaResultados",
                render: (data) => moment(data).format("DD-MM-YYYY")
            }
        ]
    });
}

function tablaVacunas(){
    tblVacunas = $("#tblVacunas").DataTable({
        bDestroy: true,
        language: SpanishDataTable,
        bLengthChange: false,
        ajax: {
            type: "GET",
            url: `/vacunasPersona/${idPersonaActual}`,
            contentType: "application/json",
            dataType: "json",
            dataFilter: function(data){
                
                let info = JSON.parse(data);
                let dataInfo = {
                    data: info.data
                };
                return JSON.stringify(dataInfo);
            }
        },
        columnDefs: [{
            targets: [0, 1, 2]
        }],
        columns:[
            {
                className : "d-none",
                data: "id"
            },
            {
                data: "nombreVacuna"
            },
            {
                data: "fecha",
                render: (data) => moment(data).format("DD-MM-YYYY")
            }            
        ]
    })
}

function tablaEntrenamientos(){
    tblEntrenamientos = $("#tblEntrenamientos").DataTable({
        bDestroy: true,
        language : SpanishDataTable,
        bLengthChange: false,
        columnDefs: [{
            targets: [0, 1, 2, 3, 4]
        }],
        columns:[
            {},
            {},
            {},
            {
                orderable: false
            },
            {
                orderable: false
            }
        ]
    })
}

function tablaAccidentes(){
    tblAccidentes = $("#tblAccidentes").DataTable({
        bDestroy: true,
        language: SpanishDataTable,
        bLengthChange: false,
        ajax: {
            type: "GET",
            url: `/accidentesPersona/${idPersonaActual}`,
            contentType: "application/json",
            dataType: "json",
            dataFilter: function(data){
                
                let info = JSON.parse(data);
                let dataInfo = {
                    data: info.data
                };
                return JSON.stringify(dataInfo);
            }
        },
        columnDefs: [{
            targets: [0, 1, 2, 3]
        }],
        columns: [
            {
                className : "d-none",
                data: "id"
            },
            {
                data: "descripcion"
            },
            {
                data: "lugar"
            },
            {
                data: "nombreEstado"
            }
        ]
    })
}