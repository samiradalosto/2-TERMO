const entrada = require('readline-sync')

console.log("---SISTEMA GERADOR DE PARCELAS---");

const produto = entrada.question("Qual é seu produto: ");
const valor = entrada.questionInt("Qual é o valor: ");
const num = entrada.question("Qauntas parcelas você vai querer? a quantidade e ate 12 parcelas: ");

let total = num / valor

for (let [i]= 1; i <= num;){
    console.log(`${num} / ${i} = ${num / i}`);
}
