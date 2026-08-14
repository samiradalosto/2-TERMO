const readline = require("readline-sync");
const nome = readline.question("Digite seu nome: ");
const cidade = readline.question("Digite sua cidade: ");
console.log("Olá,", nome);
console.log("Você mora em", cidade);