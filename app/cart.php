<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Карточка товара</title>
    <link rel="stylesheet" href="styles/styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
</head>
<body>
    <div>
        <?php
            require_once("connect.php");
            require_once("DBHelper.php");

            $id = $_GET['product_id'];

            $statement = "SELECT * FROM `product` WHERE `product`.`id` = $id";
            $test = new DBHelper;
            $test->createProductCard($connect, $statement);
        ?>
    </div>
</body>
</html>