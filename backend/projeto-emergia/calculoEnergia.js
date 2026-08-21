function calcularKwh(potencia, horas){
    return (potencia * horas) / 1000;
}

function calcularCusto(totalKwh, precoKwh) {
    return totalKwh * precoKwh
}

function classificarConsumo(totalKwh){
     if (totalKwh <= 100) {
        return "consumo baixo";
    }else {
        return "consumo elevado";
    }
}
    
module.exports = {
    calcularKwh,
    calcularCusto
}

