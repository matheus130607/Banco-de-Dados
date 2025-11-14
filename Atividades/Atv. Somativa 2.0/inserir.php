<?php

$conn = new mysqli("localhost", "root", "senaisp", "Oficina_Malaman");

// Dados Clientes
$nomeCliente = $_POST["nome_cliente"];
$emailCliente = $_POST["email_cliente"];
$telefoneCliente = $_POST["telefone_cliente"];
$CPFCliente = $_POST["CPF_cliente"];

    if ($conn -> connect_error) {
    die("Erro de conexão: " . $conn -> connect_error);
}

$sql1 = "INSERT INTO Clientes (nome_cliente, email_cliente, telefone_cliente, CPF_cliente) VALUES ('$nomeCliente', '$emailCliente', '$telefoneCliente', '$CPFCliente')";
    if ($conn -> query($sql1) === TRUE) {
        echo "Dados salvos com sucesso!";
    } else {
        echo "Erro: " . $conn -> error;
    }

// Dados Veiculos
$anoVeiculo = $_POST["ano_veiculo"];
$marcaVeiculo = $_POST["marca_veiculo"];
$modeloVeiculo = $_POST["modelo_veiculo"];
$corVeiculo = $_POST["cor_veiculo"];
$placaVeiculo = $_POST["placa_veiculo"];

    if ($conn -> connect_error) {
    die("Erro de conexão: " . $conn -> connect_error);
}

$sql2 = "INSERT INTO Veiculos (modelo_veiculo, marca_veiculo, ano_veiculo, placa_veiculo, cor_veiculp) VALUES ('$modeloVeiculo', '$marcaVeiculo', '$anoVeiculo', '$placaVeiculo', '$corVeiculo')";
    if ($conn -> query($sql2) === TRUE) {
        echo "Dados salvos com sucesso!";
    } else {
        echo "Erro: " . $conn -> error;
    }


// Dados Peças
$qtdePeca = $_POST["qtde_peca"];
$tipoPeca = $_POST["tipo_peca"];
$nomePeca = $_POST["nome_Peca"];
$precoPeca = $_POST["preco_peca"];

    if ($conn -> connect_error) {
    die("Erro de conexão: " . $conn -> connect_error);
}

$sql3 = "INSERT INTO Pecas (nome_peca, tipo_peca, qtde_peca, preco_peca) VALUES ('$nomePeca', '$tipoPeca', '$qtdePeca', '$precoPeca')";
    if ($conn -> query($sql3) === TRUE) {
        echo "Dados salvos com sucesso!";
    } else {
        echo "Erro: " . $conn -> error;
    }


// Dados Mecânicos
$nomeMecanico = $_POST["nome_mecanico"];
$emailMecanico = $_POST["email_mecanico"];
$telefoneMecanico = $_POST["telefone_mecanico"];
$CPFMecanico = $_POST["CPF_mecanico"];
$salarioMecanico = $_POST["salario_mecanico"];

    if ($conn -> connect_error) {
    die("Erro de conexão: " . $conn -> connect_error);
}

$sql4 = "INSERT INTO Mecanicos (nome_mecanico, email_mecanico, telefone_mecanico, CPF_mecanico, salario_mecanico) VALUES ('$nomeMecanico', '$emailMecanico', '$telefoneMecanico', '$CPFMecanico')";
    if ($conn -> query($sql4) === TRUE) {
        echo "Dados salvos com sucesso!";
    } else {
        echo "Erro: " . $conn -> error;
    }




