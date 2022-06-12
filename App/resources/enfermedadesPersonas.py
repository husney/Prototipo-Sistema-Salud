from flask_restful import Resource
from flask import jsonify, request
import sys
sys.path.append('../')
from data import Cursor

SP = "EXEC STP_ENFERMEDADES_PERSONAS @ID = ?, @FECHA_DIAGNOSTICO = ?, @ID_PERSONA = ?, @ID_ENFERMEDAD = ?, @ID_ESTADO = ?, @OPERACION = ?"

class EnfermedadesPersona(Resource):
    
    def get(self, id):        
        try:
            
            info = None
            
            with Cursor() as db:
            
                db.execute(SP, (None, None, id, None, None, 5))
                info = db.fetchall()
                
            data = []   
            for enfermedad in info:
                data.append({
                    "id" : enfermedad[0],
                    "fechaDiagnostico" : enfermedad[1],
                    "persona": enfermedad[2],
                    "enfermedad" : enfermedad[3],
                    "nombreEnfermedad" : enfermedad[4],
                    "estado" : enfermedad[5],
                    "nombreEstado" : enfermedad[6]
                })
                
            
            return jsonify({
                "success": True,
                "data": data
                })
                
        except Exception as ex:
            return {
                "error" : str(ex)
            }, 400
            
    def post(self):
        jsonData = request.json;        
        fechaDiagnostico = jsonData["fechaDiagnostico"]
        idPersona = jsonData["idPersona"]
        idEnfermedad = jsonData["idEnfermedad"]
        
        try:
            info = None
                        
            with Cursor() as db:
                db.execute(SP, (None, fechaDiagnostico, idPersona, idEnfermedad, None, 0))
            
                info = db.fetchone()
                print(info)
                
            return jsonify({
                "success": True,                
                "registro" : int(info[0])
                })
                
        except Exception as ex:
            return {
                "error" : str(ex)
            }, 400