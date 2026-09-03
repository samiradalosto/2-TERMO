const fs = require('fs');

const produtos = [
    {id:1, nome: "Parafuso", qtd: 100},
    {id:2, nome: "Porca", qtd: 250},
    {id:3, nome: "Arruela", qtd: 50}
];
// json.stringfy = e responsavel por criar um arquivo em dison e o formato do arquivo 
// e um arquivo de banco de dados 
function salvarDados(){
    const dadosTexto = JSON.stringify(produtos, null, 2);

    fs.writeFileSync('estoque.json', dadosTexto);
    console.log("Dados salvos com sucesso no arquivo estoque.json!");
}

function verEstoqueBaixo(){
    console.log("\n--- Produtos com estoque baixo ---");
    const baixoEstoque = produtos.filter(p => p.qtd < 100); 
    console.log(baixoEstoque);
}

salvarDados();
verEstoqueBaixo();