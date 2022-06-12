from flask_restful import Resource
from flask import jsonify, request
import sys
sys.path.append('../')
from data import Cursor

SP = "EXEC STP_TM_VACUNAS_PERSONAS @ID = ?, @FECHA = ?, @ID_VACUNA = ?, @ID_PERSONA = ?, @OPERACION = ?"

class VacunasPersona(Resource):
    
    def get(self, id):        
        try:
            
            info = None
            
            with Cursor() as db:
            
                db.execute(SP, (None, None, None, id, 5))
                info = db.fetchall()
                
            data = []   
            for vacuna in info:
                data.append({
                    "id" : vacuna[0],
                    "fecha" : vacuna[1],
                    "persona": vacuna[2],
                    "vacuna" : vacuna[3],
                    "nombreVacuna" : vacuna[4]                    
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
        idVacuna = jsonData["idVacuna"]
        fecha = jsonData["fecha"]
        idPersona = jsonData["idPersona"]
        
        try:
            info = None
                        
            with Cursor() as db:
                db.execute(SP, (None, fecha, idVacuna, idPersona, 0))
            
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