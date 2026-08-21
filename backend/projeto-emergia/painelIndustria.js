const entrada = require("readline-sync");
const projetoenergia = require("./calculoEnergia");

console.log("===  Projeto-energia ===");

const nome = entrada.question("Prosuto a ser transportado: ");
const potenciaWatts = entrada.questionInt("Qual é a potencia: ");
const horas = entrada.questionInt()
const preço= entrada.questionFloat("Qual é o preco do KWh: ");
