const entrada = require("readline-sync");

console.log("=== PEDIDO DE MATÉRIA-PRIMA ===");
const material = entrada.question("Nome do material: ");
const quantidade = entrada.questionFloat("Quantidade comprada: ");
const precoUnitario = entrada.questionFloat("Preco unitario (R$): ");

const valorTotal = quantidade * precoUnitario;

console.log("\n--- COMPRA ---");

console.log(`Material: ${material}`);
console.log(`Quantidade: ${quantidade}`);
console.log(`Preço unitário: R$ ${precoUnitario.toFixed(2)}`);
console.log(`Valor total da compra: R$ ${valorTotal.toFixed(2)}`);
console.log(' 😘 ')