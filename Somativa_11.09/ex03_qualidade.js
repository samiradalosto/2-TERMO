
const entrada = require("readline-sync");

console.log("=== CONTROLE DE QUALIDADE DE PEÇAS ===");

const peso = entrada.questionFloat("Digite o peso da peca (g): ");

console.log("\n--- RESULTADO DA INSPEÇÃO ---");

console.log(`Peso informado: ${peso} g`);

if (peso >= 95 && peso <= 105) {
    console.log("PEÇA APROVADA");
} else {
    console.log("PEÇA REPROVADA");
}