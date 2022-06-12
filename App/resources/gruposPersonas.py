from flask_restful import Resource
from flask import jsonify, request
import sys
sys.path.append('../')
from data import Cursor

SP = "EXEC STP_TM_PERSONAS_GRUPO @ID = ?, @ID_PERSONA = ?, @ID_PERSONA_AGRUPADA = ?, @OPERACION = ?"

class GrupoPersona(Resource):
    
    def get(self, id):        
        try:
            
            info = None
            
            with Cursor() as db:
            
                db.execute(SP, (None, id, None, 5))
                info = db.fetchall()
                
            data = []   
            for persona in info:
                data.append({
                    "id" : persona[0],
                    "persona" : persona[1],
                    "agrupada": persona[2],
                    "nombreRelacionado" : persona[3]
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
        idPersona = jsonData["idPersona"]
        idPersonaAgrupada = jsonData["relacion"]
        
        try:
            info = None
                        
            with Cursor() as db:
                db.execute(SP, (None, idPersona, idPersonaAgrupada, 0))
            
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