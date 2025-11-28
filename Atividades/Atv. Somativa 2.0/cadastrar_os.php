<?php

$conn = new mysqli("localhost", "root", "senaisp", "Oficina_Malaman");

if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

// 1. Inserir na tabela Servicos
$descricao = $_POST["descricaoServico"];
$preco = $_POST["precoServico"];
$nome_servico = "OS - " . date("Y-m-d H:i:s");
$tipo_servico = "Ordem de Serviço"; 

$stmt_servico = $conn->prepare("INSERT INTO Servicos (nome_servico, preco_servico, descricao_servico, tipo_servico) VALUES (?, ?, ?, ?)");
$stmt_servico->bind_param("sdss", $nome_servico, $preco, $descricao, $tipo_servico);

if (!$stmt_servico->execute()) {
    echo "Erro ao cadastrar Serviço: " . $stmt_servico->error;
    $stmt_servico->close();
    $conn->close();
    die("<br><a href='oficina.php'>Voltar para o Início</a>");
}
$id_servico = $conn->insert_id;
$stmt_servico->close();


// 2. Inserir na tabela OS (Ordem de Serviço)

$id_cliente = $_POST["idCliente"];
$id_veiculo = $_POST["idVeiculo"];
$id_peca = $_POST["idPeca"];
$tipo_os = "Reparo";
$id_mecanico = isset($_POST["idMecanico"]) ? $_POST["idMecanico"] : null;

// Preparar dados para inserir na tabela OS. Ajuste das colunas conforme o esquema.
$preco_os = $preco; // valor total do serviço
$descricao_os = $descricao; // descrição do serviço
$data_inicio_os = date("Y-m-d H:i:s");
// Por causa do esquema da tabela, também precisamos fornecer 'data_termino_os' (NOT NULL).
$data_termino_os = $data_inicio_os; // padrão: mesma data de início (a OS ainda não foi finalizada)

$stmt_os = $conn->prepare("INSERT INTO OS (id_cliente, id_veiculo, id_peca, id_mecanico, id_servico, tipo_os, preco_os, descricao_os, data_incio_os, data_termino_os) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
if (!$stmt_os) {
    die("Erro na preparação do INSERT OS: " . $conn->error);
}
$stmt_os->bind_param("iiiiisdsss", $id_cliente, $id_veiculo, $id_peca, $id_mecanico, $id_servico, $tipo_os, $preco_os, $descricao_os, $data_inicio_os, $data_termino_os);

if ($stmt_os->execute()) {
    echo "Ordem de Serviço cadastrada com sucesso! ID da OS: " . $conn->insert_id;
} else {
    echo "Erro ao cadastrar Ordem de Serviço: " . $stmt_os->error;
}

$stmt_os->close();
$conn->close();
echo "<br><a href='oficina.php'>Voltar para o Início</a>";

?>