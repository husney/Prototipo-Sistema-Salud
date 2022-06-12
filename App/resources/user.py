from flask_restful import Resource
from flask import jsonify, request
import sys
sys.path.append('../')
from data import Cursor
from resources.utils import formatResponse

SP = "EXEC STP_TM_USUARIOS @ID = ?, @NOMBRE = ?, @PASSWORD = ?, @EMAIL = ?, @OPERACION = ?"

class UserAuth(Resource):
    
    def post(self):
        jsonData = request.json
        
        userName = jsonData["nombre"]
        password = jsonData["password"]
        
        try:
            idUser = 0
            
            with Cursor() as db:
                db.execute(SP, (None, userName, password, None, 5))
                
                #user = formatResponse(db.description, db.fetchone())
                info = db.fetchone()
                if info != None:
                    return jsonify({
                        "success" : True,
                        "data" : {
                            "Id": info[0],
                            "Nombre": info[1],
                            "Email": info[3]
                        }
                        
                    })
                else:
                    return jsonify({
                        "success": False,
                        "error": "No se encontró el usuario."
                    })
                # print(str(user)[0])
                # return jsonify({"name" : str(user)});
                
        except Exception as ex:
            return {
                "error" : str(ex)
            }, 400
        

class User(Resource):
    
    def get(self):
        pass
    
    def post(self):
        jsonData = request.json
        userName = jsonData["nombre"]
        password = jsonData["password"]
        email = jsonData["email"]
        
        try:
            
            iduser = 0
            
            with Cursor() as db:
                db.execute(SP, (None, userName, password, email, 0))
                
                idUser = db.fetchone()                
            return jsonify({
                "success": True,
                "user": int(idUser[0])
                })
                
        except Exception as ex:
            return {
                "error" : str(ex)
            }, 400