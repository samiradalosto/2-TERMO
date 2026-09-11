const entrada = require("readline-sync");

console.log("=== TABELA DE PRODUÇÃO ===");

const pecasPorCiclo = entrada.questionInt("Quantas pecas a maquina produz por ciclo? ");

console.log("\n--- PRODUÇÃO ACUMULADA ---");

let producaoAcumulada = 0;

for (let ciclo = 1; ciclo <= 10; ciclo++) {
    producaoAcumulada += pecasPorCiclo;
    console.log(`Ciclo ${ciclo}: ${producaoAcumulada} peças`);
}