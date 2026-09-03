// Criando a "maquina" de calcular media 
const entrada = require("readline-sync")
function calcularMedia(n1, n2) {
    return (n1+n2) / 2;
}

const num1 = entrada.questionInt("Qual é sua nprimeira nota");
const num2 = entrada.questionInt("Qual é sua segunda nota");
const resultado = calcularMedia(num1, num2)
console.log(`A meda calcuada foi ${resultado}`)