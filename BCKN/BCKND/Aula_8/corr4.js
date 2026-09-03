const entrada = require("readline-sync")

const cinema = [
    {nome: "Backrooms", classificacao: "Terror", censura: 16},
    {nome: "Para todos os garotos que eu ja amei", classificacao: "Romance", censura: 12},
    {nome: "Gente grande", classificacao: "Comédia", censura: 10},
];

const idade = entrada.questionInt("Informe sua idade: ");

console.log("Filmes que você pode assistir:");

for (let i = 0; i < cinema.length; i++) {
    if (idade >= cinema[i].censura) {
        console.log(cinema[i].nome);
    }
}