const entrada = require('readline-sync')

console.log("---Classificação de Atleta (Múltiplas Condições)---")

const idade = entrada.question('Qual e sua idade?');

if (5<= idade && 10>= idade){
    console.log("Infantil")
}
else if(11<= idade && 17>= idade ){
    console.log("Juvenil")
}
else if(18<= idade && 60>= idade){
    console.log("Adulto")
}
else{
    console.log("Sênior")
}
