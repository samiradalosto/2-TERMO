//Em vez de bucar um produto espesífico, usem o comando .filter() para mostrar 
//na tela uma lista de todos os rodutos que tenham menos de 100 unidades no estoque
const fs = require('fs');

const produtos = [
    {id:1, nome: "caderno", estq: 100},
    {id:2, nome: "mochila", estq: 40},
    {id:3, nome: "lapis", estq: 50},
    {id:4, nome: "estojo", estq: 20}
];

function salvarDados(){
    const dadosTexto = JSON.stringify(produtos, null, 2);

    fs.writeFileSync('estoque.json', dadosTexto);
    console.log("Dados salvos com sucesso no arquivo estoque.json!");
}

function verEstoqueBaixo(){
    console.log("\n--- Produtos com estoque baixo de 100 unidades---");
    const baixoEstoque = produtos.filter(p => p.estq < 100); 
    console.log(baixoEstoque);
}

salvarDados();
verEstoqueBaixo();




