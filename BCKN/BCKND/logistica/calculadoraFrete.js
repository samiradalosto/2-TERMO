const { calcularOrcamento } = require("../oficina/funcoesoficina");

function calcularBase(km){
    return km * 2.10;
}
function cacularSeguro(valorCarga){
    return valorCarga * 0.01;
}

function verificarPrazo(km) {
    if (km < 100){
        return "1 dia util";
    }else{
        return "3 a 5 dias uteis";
    }
}
module.exports = {
    calcularBase,
    cacularSeguro,
    verificarPrazo
}