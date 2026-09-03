const entrada = require(`readline-sync`);

//criando a "ferramenta" de conversão
function converterParaFahrenheit(celsius){
    let fahrenheit = (celsius * 9/5) + 32;
    return fahrenheit;  // devolve o esultado para quem chamou 
}

const tempC = entrada.questionFloat("Digite a temperatura em Celsius: ");

// Chamado a funçãp e guardando o que ela "cuspiu" de volta
const tempf = converterParaFahrenheit(tempC);
console.log(`A temperatura convertida e: ${tempf.toFixed(1)}°F`);