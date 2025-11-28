<?php

$conn = new mysqli("localhost", "root", "senaisp", "Oficina_Malaman");

if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

$id = $_POST['id'] ?? die("ID não fornecido.");
$tabela = $_POST['tabela'] ?? die("Tabela não fornecida.");

$sql = "";
$bind_types = "";
$bind_params = [];

// 1. Prepara a query UPDATE e os parâmetros com base na tabela
switch ($tabela) {
    case 'clientes':
        $nome = $_POST['nome'];
        $email = $_POST['email'];
        $telefone = $_POST['telefone'];
        $cpf = $_POST['cpf'];
        $sql = "UPDATE Clientes SET nome_cliente=?, email_cliente=?, telefone_cliente=?, CPF_cliente=? WHERE id_cliente=?";
        $bind_types = "ssssi"; 
        $bind_params = [&$nome, &$email, &$telefone, &$cpf, &$id];
        break;

    case 'veiculos':
        $modelo = $_POST['modelo'];
        $marca = $_POST['marca'];
        $ano = $_POST['ano'];
        $placa = $_POST['placa'];
        $cor = $_POST['cor'];
        $sql = "UPDATE Veiculos SET modelo_veiculo=?, marca_veiculo=?, ano_veiculo=?, placa_veiculo=?, cor_veiculo=? WHERE id_veiculo=?";
        $bind_types = "sssssi"; 
        $bind_params = [&$modelo, &$marca, &$ano, &$placa, &$cor, &$id];
        break;

    case 'pecas':
        $nome_peca = $_POST['nome_peca'];
        $tipo_peca = $_POST['tipo_peca'];
        $qtde_peca = $_POST['qtde_peca'];
        $preco_peca = $_POST['preco_peca'];
        $sql = "UPDATE Pecas SET nome_peca=?, tipo_peca=?, qtde_peca=?, preco_peca=? WHERE id_peca=?";
        $bind_types = "ssdii"; 
        $bind_params = [&$nome_peca, &$tipo_peca, &$qtde_peca, &$preco_peca, &$id];
        break;
        
    default:
        die("Tabela inválida para atualização.");
}

// 2. Executa a atualização
$stmt = $conn->prepare($sql);
if ($stmt === false) {
    die("Erro na preparação da query: " . $conn->error);
}

// Junta os tipos de binding e os parâmetros em um array
array_unshift($bind_params, $bind_types);

// Chama bind_param com call_user_func_array
call_user_func_array([$stmt, 'bind_param'], $bind_params);

if ($stmt->execute()){
    echo ucfirst($tabela) . " atualizado(a) com sucesso!";
    echo "<br><a href='listar.php'>Voltar para a lista</a>";
} else {
    echo "Erro ao atualizar " . $tabela . ": ". $stmt->error;
    echo "<br><a href='listar.php'>Voltar para a lista</a>";
}

$stmt->close();
$conn->close();
?>