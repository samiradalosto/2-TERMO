function calcularMaoDeObra(horas) {
    return horas * 80;
}

function calcularTotal(valorPecas, horas) {
    return valorPecas + calcularMaoDeObra(horas);
}

function verificarGarantia(meses) {
    if (meses <= 6) {
        return 'EM GARANTIA';
    } else {
        return 'FORA DA GARANTIA';
    }
}

module.exports = {
    calcularMaoDeObra,
    calcularTotal,
    verificarGarantia
};