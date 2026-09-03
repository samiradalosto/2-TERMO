const entrada = require("readline-sync");

console.log("=== Controle de Acesso as laboratorio");

const Idade = entrada.questionInt("digite a idade do aluno: ");

const autorização= entrada.question(
    "Possui autorização ? (S/N):"
).toUpperCase();
 const acompanhado = entrada.question(
    "Esta acompanhado por um professor? (S/N): "
 ).toUpperCase();

if(
    (Idade >= 16 && autorização === "S") ||
    acompanhado === "S"
) {
    console.log("Acesso Liberado");
} else{
    console.log("Acesso Negado");
}
 
console.log("\nPressione Enter para fechar...");
entrada.question();
