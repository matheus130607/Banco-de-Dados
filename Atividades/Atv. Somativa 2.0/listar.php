<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Painel Oficina</title>

    <!-- SEU CSS AQUI -->
    <link rel="stylesheet" href="style.css">

</head>
<body>

<?php

$conn = new mysqli("localhost", "root", "senaisp", "Oficina_Malaman");
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}


// LISTAGEM DE CLIENTES

$resultClientes = $conn->query("SELECT * FROM Clientes");

echo "<h2>Clientes</h2>";
echo "<table border='1'>";

echo "<tr><th>ID</th><th>Nome</th><th>Email</th><th>Telefone</th><th>CPF</th><th>Editar</th><th>Apagar</th></tr>";

while ($row = $resultClientes->fetch_assoc()) {
    echo "<tr>
            <td>{$row['id_cliente']}</td>
            <td>{$row['nome_cliente']}</td>
            <td>{$row['email_cliente']}</td>
            <td>{$row['telefone_cliente']}</td>
            <td>{$row['CPF_cliente']}</td>
            <td><a href='editar.php?id={$row['id_cliente']}&tabela=clientes'>Editar</a></td>
            <td><a href='deletar.php?id={$row['id_cliente']}&tabela=clientes'>Apagar</a></td>
          </tr>";
}
echo "</table>";

echo "<br><hr><br>";


// LISTAGEM DE VEICULOS

$resultVeiculos = $conn->query("SELECT * FROM Veiculos");

echo "<h2>Veículos</h2>";
echo "<table border='1'>";
echo "<tr><th>ID</th><th>Modelo</th><th>Marca</th><th>Placa</th><th>Editar</th><th>Apagar</th></tr>";

while ($row = $resultVeiculos->fetch_assoc()) {
    echo "<tr>
            <td>{$row['id_veiculo']}</td>
            <td>{$row['modelo_veiculo']}</td>
            <td>{$row['marca_veiculo']}</td>
            <td>{$row['placa_veiculo']}</td>
            <td><a href='editar.php?id={$row['id_veiculo']}&tabela=veiculos'>Editar</a></td>
            <td><a href='deletar.php?id={$row['id_veiculo']}&tabela=veiculos'>Apagar</a></td>
          </tr>";
}
echo "</table>";

echo "<br><hr><br>";


// LISTAGEM DE PEÇAS

$resultPecas = $conn->query("SELECT * FROM Pecas");

echo "<h2>Peças</h2>";
echo "<table border='1'>";
echo "<tr><th>ID</th><th>Nome</th><th>Tipo</th><th>Quantidade</th><th>Preço</th><th>Editar</th><th>Apagar</th></tr>";

while ($row = $resultPecas->fetch_assoc()) {
    echo "<tr>
            <td>{$row['id_peca']}</td>
            <td>{$row['nome_peca']}</td>
            <td>{$row['tipo_peca']}</td>
            <td>{$row['qtde_peca']}</td>
            <td>{$row['preco_peca']}</td>
            <td><a href='editar.php?id={$row['id_peca']}&tabela=pecas'>Editar</a></td>
            <td><a href='deletar.php?id={$row['id_peca']}&tabela=pecas' onclick=\"return confirm('Confirma exclusão desta peça?');\">Apagar</a></td>
          </tr>";
}
echo "</table>";

echo "<br><hr><br>";


// LISTAGEM DE MECÂNICOS

$resultMecanicos = $conn->query("SELECT * FROM Mecanicos");

echo "<h2>Mecânicos</h2>";
echo "<table border='1'>";
echo "<tr><th>ID</th><th>Nome</th><th>Email</th><th>Telefone</th><th>CPF</th><th>Salário</th><th>Apagar</th></tr>";

while ($row = $resultMecanicos->fetch_assoc()) {
    echo "<tr>
            <td>{$row['id_mecanico']}</td>
            <td>{$row['nome_mecanico']}</td>
            <td>{$row['email_mecanico']}</td>
            <td>{$row['telefone_mecanico']}</td>
            <td>{$row['CPF_mecanico']}</td>
            <td>{$row['salario_mecanico']}</td>
            <td><a href='deletar.php?id={$row['id_mecanico']}&tabela=mecanicos' onclick=\"return confirm('Confirma exclusão deste mecânico?');\">Apagar</a></td>
          </tr>";
}
echo "</table>";

echo "<br><hr><br>";


// LISTAGEM DE ORDENS DE SERVIÇO (OS)

$sqlOS = "SELECT OS.id_os, OS.tipo_os, OS.descricao_os, OS.preco_os, Clientes.nome_cliente AS cliente,
          Veiculos.modelo_veiculo AS veiculo, Pecas.nome_peca AS peca, Mecanicos.nome_mecanico AS mecanico, 
          Servicos.nome_servico AS servico
          FROM OS
          LEFT JOIN Clientes ON OS.id_cliente = Clientes.id_cliente
          LEFT JOIN Veiculos ON OS.id_veiculo = Veiculos.id_veiculo
          LEFT JOIN Pecas ON OS.id_peca = Pecas.id_peca
          LEFT JOIN Mecanicos ON OS.id_mecanico = Mecanicos.id_mecanico
          LEFT JOIN Servicos ON OS.id_servico = Servicos.id_servico";

$resultOS = $conn->query($sqlOS);

echo "<h2>Ordens de Serviço (OS)</h2>";
echo "<table border='1'>";
echo "<tr><th>ID</th><th>Tipo</th><th>Descrição</th><th>Preço</th><th>Cliente</th><th>Veículo</th><th>Peça</th><th>Mecânico</th><th>Serviço</th><th>Apagar</th></tr>";

while ($row = $resultOS->fetch_assoc()) {
    echo "<tr>
            <td>{$row['id_os']}</td>
            <td>{$row['tipo_os']}</td>
            <td>{$row['descricao_os']}</td>
            <td>{$row['preco_os']}</td>
            <td>{$row['cliente']}</td>
            <td>{$row['veiculo']}</td>
            <td>{$row['peca']}</td>
            <td>{$row['mecanico']}</td>
            <td>{$row['servico']}</td>
            <td><a href='deletar.php?id={$row['id_os']}&tabela=os' onclick=\"return confirm('Confirma exclusão desta OS?');\">Apagar</a></td>
          </tr>";
}
echo "</table>";

echo "<br><a href='oficina.html'>Voltar para o Início</a>";

$conn->close();
?>

</body>
</html>
