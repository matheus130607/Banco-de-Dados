<?php

$conn = new mysqli("localhost", "root", "senaisp", "Oficina_Malaman");

if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

$id = $_GET['id'] ?? die("ID não fornecido.");
$tabela = $_GET['tabela'] ?? die("Tabela não fornecida.");

$sql = "";
$id_coluna = "";

// 1. Define a query e a coluna ID com base na tabela
switch ($tabela) {
    case 'clientes':
        $sql = "SELECT * FROM Clientes WHERE id_cliente = ?";
        $id_coluna = 'id_cliente';
        break;
    case 'veiculos':
        $sql = "SELECT * FROM Veiculos WHERE id_veiculo = ?";
        $id_coluna = 'id_veiculo';
        break;
    case 'pecas':
        $sql = "SELECT * FROM Pecas WHERE id_peca = ?";
        $id_coluna = 'id_peca';
        break;
    default:
        die("Tabela inválida.");
}

// 2. Executa a busca (Prepared Statement para segurança)
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
$stmt->close();
$conn->close();

if (!$row) {
    die("Registro não encontrado.");
}
?>

<h2>Editar <?php echo ucfirst($tabela); ?></h2>

<form action="atualizar.php" method="POST">
    <input type="hidden" name="id" value="<?php echo htmlspecialchars($row[$id_coluna]); ?>">
    <input type="hidden" name="tabela" value="<?php echo htmlspecialchars($tabela); ?>">

    <?php if ($tabela == 'clientes'): ?>
        <label>Nome:</label>
        <input type="text" name="nome" value="<?php echo htmlspecialchars($row['nome_cliente']); ?>"><br>
        <label>Email:</label>
        <input type="email" name="email" value="<?php echo htmlspecialchars($row['email_cliente']);?>"><br>
        <label>Telefone:</label>
        <input type="text" name="telefone" value="<?php echo htmlspecialchars($row['telefone_cliente']);?>"><br>
        <label>CPF:</label>
        <input type="text" name="cpf" value="<?php echo htmlspecialchars($row['CPF_cliente']);?>"><br>

    <?php elseif ($tabela == 'veiculos'): ?>
        <label>Modelo:</label>
        <input type="text" name="modelo" value="<?php echo htmlspecialchars($row['modelo_veiculo']); ?>"><br>
        <label>Marca:</label>
        <input type="text" name="marca" value="<?php echo htmlspecialchars($row['marca_veiculo']); ?>"><br>
        <label>Ano:</label>
        <input type="text" name="ano" value="<?php echo htmlspecialchars($row['ano_veiculo']); ?>"><br>
        <label>Placa:</label>
        <input type="text" name="placa" value="<?php echo htmlspecialchars($row['placa_veiculo']); ?>"><br>
        <label>Cor:</label>
        <input type="text" name="cor" value="<?php echo htmlspecialchars($row['cor_veiculo']); ?>"><br>
    
    <?php elseif ($tabela == 'pecas'): ?>
        <label>Nome da Peça:</label>
        <input type="text" name="nome_peca" value="<?php echo htmlspecialchars($row['nome_peca']); ?>"><br>
        <label>Tipo:</label>
        <input type="text" name="tipo_peca" value="<?php echo htmlspecialchars($row['tipo_peca']); ?>"><br>
        <label>Quantidade:</label>
        <input type="number" name="qtde_peca" value="<?php echo htmlspecialchars($row['qtde_peca']); ?>"><br>
        <label>Preço:</label>
        <input type="text" name="preco_peca" value="<?php echo htmlspecialchars($row['preco_peca']); ?>"><br>

    <?php endif; ?>
    
    <input type="submit" value="Atualizar">
</form>