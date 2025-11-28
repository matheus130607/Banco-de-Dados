<?php

$conn = new mysqli("localhost", "root", "senaisp", "Oficina_Malaman");
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

$id = isset($_GET['id']) ? intval($_GET['id']) : null;
$tabela = isset($_GET['tabela']) ? $_GET['tabela'] : null;

if (!$id || !$tabela) {
    die("Parâmetros inválidos para exclusão.");
}

// Mapeamento de tabela => coluna id
$map = [
    'clientes' => ['table' => 'Clientes', 'idcol' => 'id_cliente'],
    'veiculos' => ['table' => 'Veiculos', 'idcol' => 'id_veiculo'],
    'pecas' => ['table' => 'Pecas', 'idcol' => 'id_peca'],
    'mecanicos' => ['table' => 'Mecanicos', 'idcol' => 'id_mecanico'],
    'os' => ['table' => 'OS', 'idcol' => 'id_os']
];

if (!array_key_exists($tabela, $map)) {
    die("Tabela inválida para exclusão.");
}

$tableName = $map[$tabela]['table'];
$idCol = $map[$tabela]['idcol'];

$sql = "DELETE FROM `" . $tableName . "` WHERE `" . $idCol . "` = ?";
$stmt = $conn->prepare($sql);
if (!$stmt) {
    die("Erro na preparação da consulta: " . $conn->error);
}
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    // Redireciona de volta para a lista
    header('Location: listar.php');
    exit;
} else {
    echo "Erro ao deletar: " . $stmt->error;
    echo "<br><a href='listar.php'>Voltar para a lista</a>";
}

$stmt->close();
$conn->close();

?>
