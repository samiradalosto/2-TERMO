const entrada = require("readline-sync");

console.log("=== CLASSIFICAÇÃO DE TEMPERATURA DA MÁQUINA ===");
const temperatura = entrada.questionFloat("Digite a temperatura da maquina (degC): ");

console.log("\n--- RESULTADO DA INSPEÇÃO ---");

console.log(`Temperatura informada: ${temperatura} °C`);

if (temperatura <= 60) {
    console.log("Situação: NORMAL 😊");
} else if (temperatura <= 80) {
    console.log("Situação: ATENÇÃO 😐");
} else {
    console.log("Situação: CRÍTICA 😡");
}