const entrada = require('readline-sync')


console.log("---O Verificador de Votação (Básico)--");

const nome = entrada.question("Nome do eleitor; ");
const idade = entrada.questionInt("Idade: ");

if (idade >= 18  ) {
    console.log(`\n ${nome},!  Você pode vota!`);

}else{
    console.log(`\nSinto muito, ${nome}.Você não pode vota.`);
} 
