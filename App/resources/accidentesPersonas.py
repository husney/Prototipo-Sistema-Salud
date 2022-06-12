from flask_restful import Resource
from flask import jsonify, request
import sys
sys.path.append('../')
from data import Cursor

SP = "EXEC STP_TM_ACCIDENTES_PERSONAS @ID = ?, @DESCRIPCION = ?, @LUGAR = ?, @EN_TRATAMIENTO = ?, @ID_PERSONA = ?, @ID_ESTADO = ?, @OPERACION = ?"

class AccidentesPersona(Resource):
    
    def get(self, id):        
        try:
            
            info = None
            
            with Cursor() as db:
            
                db.execute(SP, (None, None, None, None, id, None,5))
                info = db.fetchall()
                
            data = []   
            for accidente in info:
                data.append({
                    "id" : accidente[0],
                    "descripcion" : accidente[1],
                    "persona": accidente[2],
                    "lugar" : accidente[3],
                    "nombreEstado" : accidente[4],
                    "estado" : accidente[5]                    
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
        print(jsonData)       
        descripcion = jsonData["descripcion"]
        lugar = jsonData["lugar"]
        #enTratamiento = jsonData["enTratamiento"]
        idPersona = jsonData["idPersona"]
        
        try:
            info = None
                        
            with Cursor() as db:
                db.execute(SP, (None, descripcion, lugar, True, idPersona, 1, 0))
            
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