const music = document.querySelector('audio');
const icono = document.getElementById("volumen");
const muted = document.getElementById("volumen-mute");


icono.addEventListener('click', mutear)
muted.addEventListener('click', desmutear)


function mutear(){
    icono.classList.add("hidden");
    muted.classList.remove("hidden");

    music.muted = true;
    
}

function desmutear(){
    icono.classList.remove("hidden");
    muted.classList.add("hidden");

    music.muted = false;
}


