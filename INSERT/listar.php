<?php

$conn = new mysqli("localhost", "root", "senaisp", "Livraria");
$result = $conn -> query("SELECT * FROM usuarios");

echo "<h2>Usuários</h2>";
echo "<table border='1'>";
echo "<tr><th>ID</th><th>Nome</th><th>Email</th><th>Ações</th><th>Apagar</th></tr>";

while ($row = $result -> fetch_assoc()) {
    echo "<tr>
    <td>{$row['id_usuario']}</td>
    <td>{$row['nome']}</td>
    <td>{$row['email']}</td>
    <td><a href='editar.php?id={$row['id_usuario']}'>Editar</a></td>
    <td><a href='deletar.php?id={$row['id_usuario']}'>Deletar</a></td></tr>
";
}

echo "</table>";
$conn -> close();
?>

<a href="index.html"><button type="button">Pagina Inicial</button></a>

    <style>

     
body {
    background-color: cadetblue;
    margin-top: 30px;
    margin-bottom: 20px;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
}


h2 {
    color: white;
    text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
    margin-bottom: 20px;
}


table {
    border-collapse: collapse;
    background-color: white;
    border-radius: 10px;
    overflow: hidden;
    width: 80%;
    max-width: 900px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.3);
}

th {
    background-color: #1976d2;
    color: white;
    padding: 12px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

td {
    padding: 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

tr:hover {
    background-color: #f5f5f5;
}


a {
    text-decoration: none;
    font-weight: 600;
}

a[href*="editar.php"] {
    color: white;
    background-color: #388e3c;
    padding: 6px 12px;
    border-radius: 8px;
    transition: 0.3s;
}

a[href*="editar.php"]:hover {
    background-color: #2e7d32;
}

a[href*="deletar.php"] {
    color: white;
    background-color: #d32f2f;
    padding: 6px 12px;
    border-radius: 8px;
    transition: 0.3s;
}

a[href*="deletar.php"]:hover {
    background-color: #b71c1c;
}


button {
    background-color: #1565c0;
    color: white;
    border: none;
    padding: 10px 18px;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
    margin-top: 25px;
}

button:hover {
    background-color: #0d47a1;
    transform: scale(1.05);
}
</style>

    

