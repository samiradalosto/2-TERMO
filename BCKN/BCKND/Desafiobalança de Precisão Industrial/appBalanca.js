const entrada = require("readline-sync");
const funcoesBalanca = require('./funcoesBalanca');

let sistemaAtivo = true;
while (sistemaAtivo) {
  try {
    const leitura = entrada.question("Digite o peso da peca em gramas(ou 'sair'): ");

    if (leitura.toLowerCase() === 'sair') {
      console.log("Encerrando sistema...");
      sistemaAtivo = false;
      break;
    }

    const resultado = funcoesBalanca.verificarPeso(leitura);
    console.log(resultado);

  } catch (erro) {
    console.log(` ALERTA: ${erro.message}`);
  }
}
