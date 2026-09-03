const entrada = require('readline-sync')

console.log("---Praticar lógica aplicada ao dia a dia.---")

const precoalcool = entrada.question(' Qual e o preco do alcool: ');
const precogasolina = entrada.question(' Qual e o preco da gasolina: ');
valor = precoalcool / precogasolina
 
if (valor < 0.7) {
    console.log(`abasteca com alcool`)

} else {
    console.log(` abasteca com gasolina`)
}