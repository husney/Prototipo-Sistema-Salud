from flask import Flask, render_template
from flask_restful import Api
import mimetypes

mimetypes.add_type('application/javascript', '.js')

app = Flask(__name__)
api = Api(app)

##########################################################

@app.route("/")
def entry():
    return render_template('index.html')

@app.route("/login")
def login():
    return render_template('login.html')

@app.route("/pacientes")
def pacientes():
    return render_template('pacientes.html')

@app.route("/medicos")
def medicos():
    return render_template('medicos.html')

##########################################################

from resources.user import User, UserAuth
from resources.tiposDocumento import TipoDocumento
from resources.generos import Generos
from resources.persona import PersonaAuth, Persona
from resources.enfermedades import Enfermedades
from resources.enfermedadesPersonas import EnfermedadesPersona
from resources.accidentesPersonas import AccidentesPersona
from resources.examenesPersonas import ExamenesPersona
from resources.vacunas import Vacunas
from resources.vacunasPersonas import VacunasPersona
from resources.gruposPersonas import GrupoPersona

api.add_resource(User, '/user', '/user/<id>')
api.add_resource(UserAuth, '/userAuth')

api.add_resource(TipoDocumento, '/tiposDocumento')

api.add_resource(Generos, '/generos')

api.add_resource(Vacunas, '/vacunas')

api.add_resource(PersonaAuth, '/personaAuth/<id>')
api.add_resource(Persona, '/persona', '/persona/<id>')
api.add_resource(GrupoPersona, '/grupoPersona', '/grupoPersona/<id>')


    
api.add_resource(Enfermedades, '/enfermedades')
api.add_resource(EnfermedadesPersona, '/enfermedadesPersona' , '/enfermedadesPersona/<id>')

api.add_resource(AccidentesPersona, '/accidentesPersona' , '/accidentesPersona/<id>')

api.add_resource(ExamenesPersona, '/examenesPersona' , '/examenesPersona/<id>')

api.add_resource(VacunasPersona, '/vacunasPersona' , '/vacunasPersona/<id>')


if __name__ == "__main__":
    app.run(debug=True, port=3090)


