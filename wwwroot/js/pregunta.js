let tiempo = 10;

setInterval(() => {
    console.log(tiempo);
    if (tiempo > 0) {
        tiempo--;
    }
    else clearInterval();

} ,1000)