from flask_restful import Resource
from flask import jsonify, request
import sys
sys.path.append('../')
from data import Cursor

SP = "EXEC STP_TM_PERSONAS @ID = ?, @PRIMER_NOMBRE = ?, @SEGUNDO_NOMBRE = ?, @PRIMER_APELLIDO = ?, @SEGUNDO_APELLIDO = ?,@NUMERO_DOCUMENTO = ?, @EMAIL = ?, @CELULAR = ?, @EDAD = ?, @ESTADO = ?, @ID_TIPO_DOCUMENTO = ?, @ID_GENERO = ?, @ID_USUARIO = ?,  @OPERACION = ?"

class PersonaAuth(Resource):
    
    def get(self, id):
        
        try:
            
            info = None
            print(id)
            with Cursor() as db:
                db.execute(SP, (None, None, None, None, None, None, None, None, None, None, None, None, id, 5))
            
                info = db.fetchone()
                print(info)
            
            return jsonify({
                "success": True,
                "registrado"  : info[0],
                "persona" : info[1]
                })
                
        except Exception as ex:
            return {
                "error" : str(ex)
            }, 400
            
            
            
class Persona(Resource):
    
    def get(self, id):
        
        try:
            
            info = None
                        
            with Cursor() as db:
                db.execute(SP, (id, None, None, None, None, None, None, None, None, None, None, None, None, 3))
            
                info = db.fetchone()
                
            data = {
                "id" : info[0],
                "primerNombre" : info[1],
                "segundoNombre" : info[2],
                "primerApellido" : info[3],
                "segundoApellido" : info[4],
                "numeroDocumento" : info[5],
                "email" : info[6],
                "celular" : info[7],
                "edad" : info[8],
                "estado" : info[9],
                "idTipoDocumento" : info[10],
                "idGenero" : info[11],
                "idUsuario" : info[12]
            }
            
            return jsonify({
                "success": True,                
                "persona" : data
                })
                
        except Exception as ex:
            return {
                "error" : str(ex)
            }, 400
    
    def post(self):
        
        jsonData = request.json;        
        primerNombre = jsonData["primerNombre"]
        segundoNombre = jsonData["segundoNombre"]
        primerApellido = jsonData["primerApellido"]
        segundoApellido = jsonData["segundoApellido"]
        numeroDocumento = jsonData["numeroDocumento"]
        tipoDocumento = jsonData["tipoDocumento"]
        genero = jsonData["genero"]
        usuario = None
        if "usuario" in jsonData:
            usuario = jsonData["usuario"]
        personaUsuario = None
        if "personaUsuario" in jsonData:
            personaUsuario = jsonData["personaUsuario"]
        
        email = jsonData["email"]
        edad = jsonData["edad"]
        celular = jsonData["celular"]
        
        try:
            info = None
                        
            with Cursor() as db:
                db.execute(SP, (None, primerNombre, segundoNombre, primerApellido, segundoApellido, numeroDocumento, email, celular, edad, None, tipoDocumento, genero, usuario, 0))
            
                info = db.fetchone()
                
            with Cursor() as db2:
                db2.execute("EXEC STP_TM_PERSONAS_GRUPO @ID = ?, @ID_PERSONA = ?, @ID_PERSONA_AGRUPADA = ?, @OPERACION = ?", (None, personaUsuario, int(info[0]), 0))
                
            return jsonify({
                "success": True,                
                "persona" : int(info[0])
                })
                
        except Exception as ex:
            return {
                "error" : str(ex)
            }, 400
            
    def put(self, id):
        
        jsonData = request.json;        
        primerNombre = jsonData["primerNombre"]
        segundoNombre = jsonData["segundoNombre"]
        primerApellido = jsonData["primerApellido"]
        segundoApellido = jsonData["segundoApellido"]
        numeroDocumento = jsonData["numeroDocumento"]
        tipoDocumento = jsonData["tipoDocumento"]
        genero = jsonData["genero"]
        usuario = None
        if "usuario" in jsonData:
            usuario = jsonData["usuario"]
        print(usuario)
        email = jsonData["email"]
        edad = jsonData["edad"]
        celular = jsonData["celular"]
        
        try:
            info = None
                        
            with Cursor() as db:
                db.execute(SP, (id, primerNombre, segundoNombre, primerApellido, segundoApellido, numeroDocumento, email, celular, edad, None, tipoDocumento, genero, usuario, 1))
                
            return jsonify({
                "success": True,                
                "persona" : id
                })
                
        except Exception as ex:
            return {
                "error" : str(ex)
            }, 400