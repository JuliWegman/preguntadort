const comenzarBoton = document.getElementById("boton__comenzar")
const popupNombre = document.getElementById("popup")

comenzarBoton.addEventListener('click', ingresarNombre)

function ingresarNombre(){
    popupNombre.classList.remove("hidden");
}