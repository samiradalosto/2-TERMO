
const entrada = require("readline-sync");

console.log("=== CADASTRO DE ESTOQUE DE COMPONENTES ===");
const componentes = [];

for (let i = 0; i < 3; i++) {
    console.log(`\n--- Cadastro do Componente ${i + 1} ---`);
    
    const nome = entrada.question("Nome do componente: ");
    const quantidade = entrada.questionInt("Quantidade em estoque: ");
    const estoqueMinimo = entrada.questionInt("Estoque minimo: ");
    const componente = {
        nome: nome,
        quantidade: quantidade,
        estoqueMinimo: estoqueMinimo
    };
    componentes.push(componente);
}

console.log("\n=== RELATÓRIO DE ESTOQUE ===");
for (let i = 0; i < componentes.length; i++) {
    const item = componentes[i];
    
    let status = "";
    if (item.quantidade < item.estoqueMinimo) {
        status = "REPOR NO ESTOQUE 😒";
    } else {
        status = "ESTOQUE OK 😁";
    }

    console.log(`Componente: ${item.nome} | Quantidade: ${item.quantidade} | Mínimo: ${item.estoqueMinimo} -> Status: ${status}`);
}