const entrada = require('readline-sync');

//importar o módulo funcoesOficina
const oficina = require('./oficina/funcoesoficina');

console.log("=== SISTEMA DE GESTAO DE OFICINA ===");

const peca = entrada.questionFloat("Preco da peca: R$");
const horas = entrada.questionInt("Horas de servicos: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

const statusGarantia = oficina.verificarGarantia(tempoUso);
const total = oficina.calcularOrcamento(peca, horas);
const totalComDesconto = oficina.comDesconto(total);

//Relatorio Final 
console.log("\n--- RELATORIO DE SERVICO");
console.log(`Orcamento: R$ ${total.toFixed(2)}`);
console.log(`Orcamento com desconto (5%): R$ ${totalComDesconto.toFixed(2)}`);
console.log(`Status da Garnatia: ${statusGarantia}`);
console.log(" 😊 ".repeat(8));