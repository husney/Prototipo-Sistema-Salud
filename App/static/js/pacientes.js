import { SpanishDataTable } from "./resources.js";

let tblPacientes;

$(document).ready(() => {
    
    tablaPacientes();
});

function tablaPacientes(){
    tblPacientes = $("#tblPacientes").DataTable({
        language: SpanishDataTable
    });    
    
}