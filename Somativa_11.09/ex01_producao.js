const entrada = require('readline-sync');

function calcularProducao(quatp, hrstrb) {
    return quatp * hrstrb; 
}

const quantpecas = entrada.questionInt("Qual foi aquantidade de peças produzidas por hora: ");
const horastrab = entrada.questionInt("Qual foi a quantidade de horas trabalhadas:");
const producaototal = calcularProducao(quantpecas, horastrab);

console.log(`A produção final foi de: ${producaototal}`);

