from flask_restful import Resource
from flask import jsonify, request
import sys
sys.path.append('../')
from data import Cursor

SP = "EXEC STP_TR_TIPOS_DOCUMENTO @ID = ?, @CODIGO = ?, @DESCRIPCION = ?, @OPERACION = ?"

class TipoDocumento(Resource):
    
    def get(self):        
        
        try:
            
            info = None
            
            with Cursor() as db:
                db.execute(SP, (None, None, None, 4))
            
                info = db.fetchall()
                
            data = []   
            for tipo in info:
                data.append({
                    "id" : tipo[0],
                    "codigo" : tipo[1],
                    "descripcion" : tipo[2]
                })
                
            
            return jsonify({
                "success": True,
                "data": data
                })
                
        except Exception as ex:
            return {
                "error" : str(ex)
            }, 400