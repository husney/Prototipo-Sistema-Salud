from flask_restful import Resource
from flask import jsonify, request
import sys
sys.path.append('../')
from data import Cursor

SP = "EXEC STP_TR_GENEROS @ID = ?, @DESCRIPCION = ?, @OPERACION = ?"

class Generos(Resource):
    
    def get(self):
        pass
        try:
            
            info = None
            
            with Cursor() as db:
            
                db.execute(SP, (None, None, 4))
                info = db.fetchall()
                
            data = []   
            for genero in info:
                data.append({
                    "id" : genero[0],
                    "descripcion" : genero[1]
                })
                
            
            return jsonify({
                "success": True,
                "data": data
                })
                
        except Exception as ex:
            return {
                "error" : str(ex)
            }, 400