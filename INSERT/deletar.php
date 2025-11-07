<?php

$conn = new mysqli("localhost", "root", "senaisp", "Livraria");
 if ($conn->connect_error) {
    die("Erro na conexão:" . $conn->connect_error);
 }

 $id = $_GET['id'];


// Preparar a declaração
$stmt = $conn -> prepare( "DELETE FROM  usuarios WHERE id_usuario = ?");
$stmt -> bind_param("i", $id);

//Executar e verificar
if ($stmt -> execute()){
    echo "Usuário deletado com sucesso!";
    
} else {
    echo "Erro: ". $stmt -> error;
}
echo "<br><a href='listar.php'>Voltar para a lista</a>";

$conn -> close();
$stmt -> close();

?>

<style>
    /* ===== Estilo da página de exclusão ===== */

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #e3f2fd, #bbdefb);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.container {
    background: #fff;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
    text-align: center;
    width: 90%;
    max-width: 400px;
}

h1 {
    margin-bottom: 25px;
    font-size: 22px;
}

.sucesso {
    color: #2e7d32;
}

.erro {
    color: #c62828;
}

.voltar {
    display: inline-block;
    text-decoration: none;
    background-color: #1976d2;
    color: white;
    padding: 12px 20px;
    border-radius: 10px;
    transition: 0.3s ease;
    font-weight: 600;
}

.voltar:hover {
    background-color: #0d47a1;
    transform: scale(1.05);
}

</style>