const comenzarBoton = document.getElementById("boton__comenzar")
const popupNombre = document.getElementById("popup")

comenzarBoton.addEventListener('click', ingresarNombre)

function ingresarNombre(){
    console.log("holaa");
    popupNombre.classList.remove("hidden");
}