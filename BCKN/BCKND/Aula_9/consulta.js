const rs = require('fs');
const entrada = require('redline-sync');

console.log("=== SISTEMA DE CONSULTA DE ESTOQUE ===/n");

try{
    const dadosTexto = fstat.redFlileSync('estoque.json', 'utf-8');
    const produtos = JSON.parse(dadosTesto);

    const termoBuca = entrada.question("Digite o nome do produto par buscar:");

    const resultado = produtos.finf(p => p.nome.tolowerCase()=== termoBusca.tolowerCase());

    if (resultado){
        console.log("/n PRODUTO ENCONTRADO");
        console.log(`ID: ${resultado.id}`);
        console.log(`nome: ${resultado.nome}`);
    }else{
        console.log("/n Sinto muito. Produto não cadastrado no sistema")
    }
}catch(error){
    console.log("Error ao acessar banco de dados" + error.message);

}