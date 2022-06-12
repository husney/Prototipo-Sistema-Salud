import { SpanishDataTable } from "./resources.js";

let tblMedicos;

$(document).ready(() => {
    
    tablaPacientes();
});

function tablaPacientes(){
    tblMedicos = $("#tblMedicos").DataTable({
        language: SpanishDataTable
    });    
    
}