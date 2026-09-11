const entrada = require('readline-sync');
const manutencao = require('./app');

console.log("=== SISTEMA DE MANUTENÇÃO INDUSTRIAL ===");

const nomeMaquina = entrada.question("Nome da maquina: ");
const valorPecas = entrada.questionFloat("Valor das pecas: R$ ");
const horas = entrada.questionInt("Horas de servico: ");
const meses = entrada.questionInt("Meses desde a ultima manutencao: ");

const maoDeObra = manutencao.calcularMaoDeObra(horas);
const total = manutencao.calcularTotal(valorPecas, horas);
const garantia = manutencao.verificarGarantia(meses);

console.log("\n--- RELATÓRIO DE MANUTENÇÃO ---");
console.log(`Máquina: ${nomeMaquina}`);
console.log(`Mão de obra: R$ ${maoDeObra.toFixed(2)}`);
console.log(`Peças: R$ ${valorPecas.toFixed(2)}`);
console.log(`Total: R$ ${total.toFixed(2)}`);
console.log(`Situação da garantia: ${garantia}`);
console.log(" 😁 ");