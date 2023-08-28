const music = document.querySelector('audio');
const icono = document.getElementById("volumen");
const muted = document.getElementById("volumen-mute");



if (localStorage.getItem("mutear") == true) {
    music.muted = true;
} else{
    music.muted = false
}

icono.addEventListener('click', mutear)
muted.addEventListener('click', desmutear)


function mutear(){
    icono.classList.add("hidden");
    muted.classList.remove("hidden");
    localStorage.setItem("mutear", true);
}

function desmutear(){
    icono.classList.remove("hidden");
    muted.classList.add("hidden");
    localStorage.setItem("mutear", false);
}


