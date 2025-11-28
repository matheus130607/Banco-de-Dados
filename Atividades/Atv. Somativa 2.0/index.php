<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Oficina Malaman</title>
</head>
<body>
    <h1>Oficina Malaman</h1>
    
    <header class="secao">
        <button onclick="cadastrar('clientes')">Cadastrar Clientes</button>
        <button onclick="cadastrar('veiculos')">Cadastrar Veiculos</button>
        <button onclick="cadastrar('pecas')">Cadastrar Peças</button>
        <button onclick="cadastrar('mecanicos')">Cadastrar Mecânicos</button>
        <button onclick="cadastrar('os')">Abrir Ordem de Serviço</button>
        <a href="listar.php"><button>Listar Clientes</button></a>
    </header>

<main>
    
    <form action="inserir.php" method="POST" class="form-container" id="clientes">
        <h2>Cadastrar Clientes</h2>
        <label>Nome:</label>
        <input type="text" name="nomeCliente" placeholder="Digite seu nome" required>

        <label>Email:</label>
        <input type="email" name="emailCliente" placeholder="Digite seu email" required>

        <label>Telefone:</label>
        <input type="text" name="telefoneCliente" placeholder="Digite seu telefone" required>

        <label>CPF:</label>
        <input type="text" name="CPFCliente" maxlength="14" placeholder="Ex: (123.456.789-10)" required>

        <button type="submit">Cadastrar Cliente</button>
    </form>

    <form action="inserir.php" method="POST" class="hidden form-container" id="veiculos">
        <h2>Cadastrar Veiculos</h2>
        <label>Modelo:</label>
        <input type="text" name="modeloVeiculo" placeholder="Digite o modelo do seu veiculo" required>

        <label>Marca:</label>
        <input type="text" name="marcaVeiculo" placeholder="Digite a marca do seu veiculo" required>

        <label>Ano:</label>
        <input type="text" name="anoVeiculo" maxlength="4" placeholder="Digite o ano do seu veiculo" required>

        <label>Placa:</label>
        <input type="text" name="placaVeiculo" maxlength="7" placeholder="Digite a placa do seu veiculo" required>

        <label>Cor:</label>
        <input type="text" name="corVeiculo" placeholder="Digite a cor do seu veiculo" required>

        <button type="submit">Cadastrar Veiculo</button>
    </form>
    
    <form action="inserir.php" method="POST" class="hidden form-container" id="pecas">
        <h2>Cadastrar Peças</h2>
        <label>Nome da Peça:</label>
        <input type="text" name="nomePeca" placeholder="Nome da peça" required>

        <label>Tipo (Ex: Motor, Elétrico):</label>
        <input type="text" name="tipoPeca" placeholder="Tipo da peça" required>
        
        <label>Quantidade:</label>
        <input type="number" name="qtdePeca" placeholder="Quantidade em estoque" required>

        <label>Preço (R$):</label>
        <input type="text" name="precoPeca" placeholder="Preço (Use ponto ou vírgula)" required>

        <button type="submit">Cadastrar Peça</button>
    </form>
    
    <form action="inserir.php" method="POST" class="hidden form-container" id="mecanicos">
        <h2>Cadastrar Mecânicos</h2>
        <label>Nome:</label>
        <input type="text" name="nomeMecanico" placeholder="Nome do Mecânico" required>

        <label>Email:</label>
        <input type="email" name="emailMecanico" placeholder="Email do Mecânico" required>
        
        <label>Telefone:</label>
        <input type="text" name="telefoneMecanico" placeholder="Telefone" required>

        <label>CPF:</label>
        <input type="text" name="CPFMecanico" placeholder="CPF" required>

        <label>Salário (R$):</label>
        <input type="text" name="salarioMecanico" placeholder="Salário" required>

        <button type="submit">Cadastrar Mecânico</button>
    </form>


    <form action="cadastrar_os.php" method="POST" class="hidden form-container" id="os">
        <h2>Abrir Ordem de Serviço (OS)</h2>
        
        <?php 
            // Bloco PHP para buscar dados do banco
            $conn = new mysqli("localhost", "root", "senaisp", "Oficina_Malaman");
            if ($conn->connect_error) { 
                echo "<p style='color:red;'>Erro na conexão com o banco de dados. Verifique a conexão.</p>";
            } else {
        ?>

        <label>Cliente:</label>
        <select name="idCliente" required>
            <option value="">Selecione o Cliente</option>
            <?php 
                $resultClientes = $conn->query("SELECT id_cliente, nome_cliente, CPF_cliente FROM Clientes ORDER BY nome_cliente");
                while ($row = $resultClientes->fetch_assoc()):
            ?>
            <option value="<?php echo $row['id_cliente']; ?>">
                <?php echo htmlspecialchars($row['nome_cliente']) . " - CPF: " . $row['CPF_cliente']; ?>
            </option>
            <?php endwhile; ?>
        </select>
        
        <label>Veículo:</label>
        <select name="idVeiculo" required>
            <option value="">Selecione o Veículo</option>
            <?php 
                $resultVeiculos = $conn->query("SELECT id_veiculo, modelo_veiculo, placa_veiculo FROM Veiculos ORDER BY modelo_veiculo");
                while ($row = $resultVeiculos->fetch_assoc()):
            ?>
            <option value="<?php echo $row['id_veiculo']; ?>">
                <?php echo htmlspecialchars($row['modelo_veiculo']) . " - Placa: " . $row['placa_veiculo']; ?>
            </option>
            <?php endwhile; ?>
        </select>

        <label>Peça (Produto):</label>
        <select name="idPeca" required>
            <option value="">Selecione a Peça</option>
            <?php 
                $resultPecas = $conn->query("SELECT id_peca, nome_peca, preco_peca FROM Pecas ORDER BY nome_peca");
                while ($row = $resultPecas->fetch_assoc()):
            ?>
            <option value="<?php echo $row['id_peca']; ?>">
                <?php echo htmlspecialchars($row['nome_peca']) . " (R$ " . number_format($row['preco_peca'], 2, ',', '.') . ")"; ?>
            </option>
            <?php endwhile; ?>
        </select>
        
        <label>Mecânico:</label>
        <select name="idMecanico" required>
            <option value="">Selecione o Mecânico</option>
            <?php
                $resultMecanicos = $conn->query("SELECT id_mecanico, nome_mecanico FROM Mecanicos ORDER BY nome_mecanico");
                while ($row = $resultMecanicos->fetch_assoc()):
            ?>
            <option value="<?php echo $row['id_mecanico']; ?>"><?php echo htmlspecialchars($row['nome_mecanico']); ?></option>
            <?php endwhile; ?>
        </select>
        
        <?php 
            $conn->close(); 
            } // Fecha o else do if de conexão
        ?>

        <label>Descrição do Serviço:</label>
        <textarea name="descricaoServico" placeholder="Descreva o serviço a ser realizado" required></textarea>

        <label>Preço Total do Serviço (R$):</label>
        <input type="text" name="precoServico" placeholder="0.00" required>

        <button type="submit">Abrir OS</button>
    </form>

</main>
<script src="index.js"></script>
</body>
</html>