<?php
    session_start();
    require_once('app/connect.php');
    require('app/DBHelper.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shogo test task</title>
    <link rel="stylesheet" href="styles/styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
</head>
<body>
    <nav class="container d-flex flex-column flex-md-row">
        <a href="app/auth.php" id="enter">Войти</a><br>
        <a href="app/exit.php" id="exit">Выйти</a>
    </nav>
    <div class="">
    <table class="table">
        <tr>
            <th>Продукт</th>
            <th>Раздел</th>
            <th>Тип</th>
        </tr>
        <?php
            $statement = "SELECT DISTINCT product_assignment.product_id, product.articul, product_section.notice, product_type.notice
                FROM  `product`, `product_type`, `product_section`, `product_assignment`
                where product_assignment.product_id = product.id and product_assignment.section_id = product_section.id and product_assignment.type_id = product_type.id";
            
            $importFromDB = new DBHelper;
            $importFromDB->importFromDBtoTable($connect, $statement);
        ?>
    </table>
    <?php 
    if(isset($_SESSION['username']) == 'admin')
    {
    echo    
    '
        <div class="add-to-db">
        <p>Добавить запись в таблицу Product</p>
        <form action="app/add_product.php" method="POST">
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">Позиция</label>
                <input type="text" class="form-control"  placeholder="Позиция">
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">Имя в БД</label>
                <input type="text" class="form-control" name="name" placeholder="Имя в БД">
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">Название товара</label>
                <input type="text" class="form-control" name="articul" placeholder="Название товара">
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">Цена</label>
                <input type="text" class="form-control" name="price" placeholder="Цена">
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">Код валюты</label>
                <input type="text" class="form-control" name="currency_id" placeholder="Код валюты">
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">Старая цена</label>
                <input type="text" class="form-control" name="old_price" placeholder="Старая цена">
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">Описание</label>
                <input type="text" class="form-control" name="content" name="notice" placeholder="Описание">
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label"></label>
                <input type="file" class="form-control" placeholder="">
            </div>
        </form>
        </div>
        ';
    }
    ?>
    </div>  
</body>
</html>