
import { MensajeEmergente } from "./comunes.js"

//#region Elementos html


const formLogin = document.getElementById('formLogin');
const nombreUsuario = document.getElementById('nombre');
const email = document.getElementById('email');
const passwordIn = document.getElementById('passwordIn');
const passwordConfirm = document.getElementById('passwordInConfirm');

const btnRegistrar = document.getElementById('btnRegistro');

const user = document.getElementById('user');
const password = document.getElementById('password');

const btnIngresar = document.getElementById('btnIngresar');

formLogin.addEventListener('submit', e => {
    e.preventDefault();
    e.stopImmediatePropagation();

    btnIngresar.click();
});


btnIngresar.addEventListener('click', () => {
    
    const userName = user.value;    
    const passwordValue = password.value;

    ingresar(userName, passwordValue);

});

function ingresar(userName, passwordValue){
    

    if(userName == "" || passwordValue == "")
        return
    
    fetch('/userAuth', {
        method: "POST",
        headers : defaultHeaders,
        body: JSON.stringify({
            nombre: userName,
            password: passwordValue
        })
    })
    .then(response => response.json())
    .then(rs => {
        if(rs.success){
            localStorage.setItem("current-user", JSON.stringify(rs.data));
            window.location.href = "/"
        }else{
            MensajeEmergente("", "La información no es correcta.", "danger");
        }
    })

}

btnRegistrar.addEventListener('click', () => {
    
    const userName = nombreUsuario.value;
    const emailValue = email.value;
    const password1 = passwordIn.value;

    if(userName == "" || emailValue == "" || password1 == "")
        return;

    const requestInfo = {
        method: 'POST',
        headers: defaultHeaders,
        body: JSON.stringify({
            nombre : userName,
            email: emailValue,
            password: password1
        })
    }

    fetch(`/user`, requestInfo)
    .then(res => res.json())
    .then(rs => {
        if(rs.user == 0){
            MensajeEmergente("", "Error al crear el usuario.", "danger");
        }
        else if(rs.user > 0){
            ingresar(userName, password1);
        }
    })
    
});

//#endregion