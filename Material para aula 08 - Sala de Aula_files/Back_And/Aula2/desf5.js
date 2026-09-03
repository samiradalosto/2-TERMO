const entrada = require('readline-sync')

console.log("---O Simulador de Empréstimo (Operadores Lógicos)---")

const nome = entrada.question("Nome do cliente; ");
const idade = entrada.questionInt("Idade: ");
const renda = entrada.questionFloat("Renda Mensal: ");
const seunomel= entrada.keyInYNStrict("Seu nome está limpo? "); //

if (idade >= 18 &&(renda >= 2000 || seunomel === true/false )) {
    console.log(`\nPARABENS, ${nome},! Seu emprestimo foi APROVADO!`);

}else{
    console.log(`\nSinto muito, ${nome}. Seu emprestimo foi NEGADO.`);
} 
