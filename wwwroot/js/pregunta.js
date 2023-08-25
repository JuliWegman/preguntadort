let tiempo = 9;
const timer = document.getElementById("timer");

let intervalo = setInterval(() => {
    timer.innerText = tiempo;
    if (tiempo > 0) {
        tiempo--;
    } else {
        window.location.href = '/Home/VerificarRespuesta?idPregunta=2&idRespuesta=2';
        terminarIntervalo();
    }
}, 1000);

const terminarIntervalo = () => {
    clearInterval(intervalo);
};
