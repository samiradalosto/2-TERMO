const entrada = require("readline-sync");
function calcularEficiencia(real, prevista) {
    return (real / prevista) * 100;
}
function classificarEficiencia(percentual) {
    if (percentual >= 90) {
        return "META ATINGIDA 😍";
    } else if (percentual >= 70) {
        return "ATENÇÃO 🤔";
    } else {
        return "ABAIXO DA META 😭 ";
    }
}

console.log("=== CÁLCULO DE EFICIÊNCIA DE PRODUÇÃO ===");

const producaoPrevista = entrada.questionFloat("Digite a produção prevista: ");
const producaoReal = entrada.questionFloat("Digite a produção real: ");

const percentual = calcularEficiencia(producaoReal, producaoPrevista);
const classificacao = classificarEficiencia(percentual);

console.log("\n--- RESULTADO DA ANÁLISE ---");

console.log(`Produção prevista: ${producaoPrevista}`);
console.log(`Produção real: ${producaoReal}`);
console.log(`Eficiência: ${percentual.toFixed(2)}%`);
console.log(`Classificação: ${classificacao}`);