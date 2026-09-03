const entrada = require(`readline-sync`);

console.log("---SISTEMA DE APOSENTADORIA---");

const nome = entrada.question("\nQual é seu nome: ");
const idade = entrada.questionInt("\nQual é sua idade: ");
const tempo = entrada.questionInt("\nQual é seu tempo de contribuição: ");

if (idade >=65 || tempo >=30 == true){
    console.log(`\nPARABENS, ${nome}, você foi aposentado!`);

}else {
    console.log(`\nSinto muito, ${nome}. você não foi aposentado.`);
}