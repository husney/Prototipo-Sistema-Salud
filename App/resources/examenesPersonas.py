from flask_restful import Resource
from flask import jsonify, request
import sys
sys.path.append('../')
from data import Cursor

SP = "EXEC STP_TM_EXAMENES_PERSONAS @ID = ?, @INFORMACION = ?, @FECHA_EXAMEN = ?, @FECHA_RESULTADOS = ?, @ID_PERSONA = ?, @OPERACION = ?"

class ExamenesPersona(Resource):
    
    def get(self, id):        
        try:
            
            info = None
            
            with Cursor() as db:
            
                db.execute(SP, (None, None, None, None, id, 5))
                info = db.fetchall()
                
            data = []   
            for examen in info:
                data.append({
                    "id" : examen[0],
                    "informacion" : examen[1],
                    "persona": examen[2],
                    "fechaExamen" : examen[3],
                    "fechaResultados" : examen[4]                    
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
        informacion = jsonData["informacion"]
        idPersona = jsonData["idPersona"]
        fechaExamen = jsonData["fechaExamen"]
        fechaResultados = jsonData["fechaResultados"]
        
        try:
            info = None
                        
            with Cursor() as db:
                db.execute(SP, (None, informacion, fechaExamen, fechaResultados, idPersona, 0))
            
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