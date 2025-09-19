<?php

//Comunicação com o banco de dados
$mysqli = mysqli_connect('localhost', 'root', 'senaisp', 'book_master');


// Segurança em buscar valores no banco
$columns = array('titulo_livro', 'autor_livro', 'preco_livro');


//Trazer conteúdo do Banco
$column = isset($_GET['column']) && in_array($_GET['column'], $columns) ? $_GET['column'] : $columns[0];


// Trazer dadis em ordem e decrescente
$sort_order = isset($_GET['order']) && strtolower($_GET['order']) == 'desc' ? 'DESC' : 'ASC';


//Verificar dados no banco{
if($result = $mysqli->query( "SELECT * FROM Livros ORDER BY '. $column . '' . $sort_order")) {
    //Várias para a tabela
    $up_or_down = str_replace(array('ASC', 'DESC'), array('up', 'down'), $sort_order);
    $asc_or_desc = $sort_order == 'ASC' ? 'desc' : 'asc';
    $add_class = ' class = "highlight"';

?>

<!DOCTYPE html>
<html>
    <head>
        <title>Banco de Dados - Book Master</title>
        <meta charset="utf-8">
    </head>
    <body>
        <table>
            <tr>
                <th>
                    <a href="index.php?column=tiulo&order=<?php echo$asc_or_desc; ?>">Título<?php echo $column == 'titulo_livro' ? '-' . $up_or_down : ''; ?>
                    </a>
                </th>

                <th>
                    <a href="index.php?column=autor&order=<?php echo$asc_or_desc; ?>">Autor<?php echo $column == 'autor_livro' ? '-' . $up_or_down : ''; ?>
                    </a>
                </th>

                <th>
                    <a href="index.php?column=preco&order=<?php echo$asc_or_desc; ?>">Preço<?php echo $column == 'preco_livro' ? '-' . $up_or_down : ''; ?>
                    </a>
                </th>
            </tr>
            <?php while($row = $result->fetch_assoc()): ?>
                <tr>
                    <td <?php echo $column == 'titulo_livro' ? $add_class : ''; ?>> <?php echo $row['titulo_livro']; ?> </td>

                    <td <?php echo $column == 'autor_livro' ? $add_class : ''; ?>> <?php echo $row['autor_livro']; ?> </td>

                    <td <?php echo $column == 'preco_livro' ? $add_class : ''; ?>> <?php echo $row['preco_livro']; ?> </td>
                </tr>
                <?php endwhile; ?>
        </table>
    </body>
</html>
<?php $result->free();
}
?>