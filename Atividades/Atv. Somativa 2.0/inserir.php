<?php

$conn = new mysqli("localhost", "root", "senaisp", "Oficina_Malaman");

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}


// 1. Lógica para Clientes

if (isset($_POST["nomeCliente"], $_POST["emailCliente"], $_POST["telefoneCliente"], $_POST["CPFCliente"])) {
    
    $nome = $_POST["nomeCliente"];
    $email = $_POST["emailCliente"];
    $telefone = $_POST["telefoneCliente"];
    $cpf = $_POST["CPFCliente"];

    $stmt = $conn->prepare("INSERT INTO Clientes (nome_cliente, email_cliente, telefone_cliente, CPF_cliente) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $nome, $email, $telefone, $cpf);

    if ($stmt->execute()) {
        echo "Cliente cadastrado com sucesso!";
    } else {
        echo "Erro ao cadastrar Cliente: " . $stmt->error;
    }
    $stmt->close();
    
} 

// 2. Lógica para Veículos

else if (isset($_POST["modeloVeiculo"], $_POST["marcaVeiculo"], $_POST["anoVeiculo"], $_POST["placaVeiculo"], $_POST["corVeiculo"])) {
    
    $modelo = $_POST["modeloVeiculo"];
    $marca = $_POST["marcaVeiculo"];
    $ano = $_POST["anoVeiculo"];
    $placa = $_POST["placaVeiculo"];
    $cor = $_POST["corVeiculo"];

    $stmt = $conn->prepare("INSERT INTO Veiculos (modelo_veiculo, marca_veiculo, ano_veiculo, placa_veiculo, cor_veiculo) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $modelo, $marca, $ano, $placa, $cor);

    if ($stmt->execute()) {
        echo "Veículo cadastrado com sucesso!";
    } else {
        echo "Erro ao cadastrar Veículo: " . $stmt->error;
    }
    $stmt->close();

} 

// 3. Lógica para Peças (Novo)

else if (isset($_POST["nomePeca"], $_POST["tipoPeca"], $_POST["qtdePeca"], $_POST["precoPeca"])) {
    
    $nome = $_POST["nomePeca"];
    $tipo = $_POST["tipoPeca"];
    $qtde = $_POST["qtdePeca"];
    $preco = $_POST["precoPeca"];

    $stmt = $conn->prepare("INSERT INTO Pecas (nome_peca, tipo_peca, qtde_peca, preco_peca) VALUES (?, ?, ?, ?)");
    // Assumindo: nome, tipo (string), qtde (integer), preco (decimal/string)
    $stmt->bind_param("ssis", $nome, $tipo, $qtde, $preco);

    if ($stmt->execute()) {
        echo "Peça cadastrada com sucesso!";
    } else {
        echo "Erro ao cadastrar Peça: " . $stmt->error;
    }
    $stmt->close();

} 

// 4. Lógica para Mecânicos (Novo)

else if (isset($_POST["nomeMecanico"], $_POST["emailMecanico"], $_POST["telefoneMecanico"], $_POST["CPFMecanico"], $_POST["salarioMecanico"])) {
    
    $nome = $_POST["nomeMecanico"];
    $email = $_POST["emailMecanico"];
    $telefone = $_POST["telefoneMecanico"];
    $cpf = $_POST["CPFMecanico"];
    $salario = $_POST["salarioMecanico"];

    $stmt = $conn->prepare("INSERT INTO Mecanicos (nome_mecanico, email_mecanico, telefone_mecanico, CPF_mecanico, salario_mecanico) VALUES (?, ?, ?, ?, ?)");
    // Assumindo: todos como string, deixando o MySQL converter o salário
    $stmt->bind_param("sssss", $nome, $email, $telefone, $cpf, $salario);

    if ($stmt->execute()) {
        echo "Mecânico cadastrado com sucesso!";
    } else {
        echo "Erro ao cadastrar Mecânico: " . $stmt->error;
    }
    $stmt->close();

} 

// 5. Nenhuma ação

else {
    echo "Nenhum formulário válido foi enviado.";
}

// Redireciona para o novo arquivo principal index.php
echo "<br><a href='index.php'>Voltar para o Início</a>";

$conn->close();
?>