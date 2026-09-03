const entrada = require('readline-sync')

console.log("--- O Mão de Vaca (Cálculo com Decisão)---")
const nome = entrada.question('Qual e seu nome?')
const valor = entrada.question('Qual é o seu pedido?:');

if (valor >= 100) {
    const venda = valor * 0.9
    console.log(`\n  ${nome}, Seu descontp foi adicionado o valor é R$ ${venda}`);

}else{
    console.log(`\n ${nome}, não contém desconto, R$ ${valor}`);
} 