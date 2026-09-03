const readline = require("readline-sync");
const calculoEnergia = require("./calculoEnergia");

const nomeMaquina = readline.question("Qual e o nome da maquina: ");
const potencia = readline.questionInt("Qual e a potencia em Watts: ");
const horas = readline.questionInt("Quais sao as horas de uso no mes: ");
const precoKwh = readline.questionFloat("Qual e o preco do kWh (em R$): ");

const totalKwh = calculoEnergia.calcularKwh(potencia, horas);
const custoTotal = calculoEnergia.calcularCusto(totalKwh, precoKwh);
const classificacao = calculoEnergia.classificarConsumo(totalKwh);

console.log("\n--- RELATÓRIO DE EFICIÊNCIA ENERGÉTICA ---");
console.log(`Máquina: ${nomeMaquina.toUpperCase()}`);
console.log(`Consumo Mensal: ${totalKwh.toFixed(2)} kWh`);
console.log(`Custo Estimado: R$ ${custoTotal.toFixed(2)}`);
console.log(`Classificação: ${classificacao}`);
console.log("😊 ".repeat(8));