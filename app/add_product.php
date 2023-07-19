<?php
    require_once("connect.php");
    if($_SERVER['REQUEST_METHOD'] === 'POST')
    {
        $pos = trim($_REQUEST['position']);
        $url = trim($_REQUEST['url']);
        $name = trim($_REQUEST['name']);
        $articul = trim($_REQUEST['articul']);
        $price = trim($_REQUEST['price']);
        $currency_id = trim($_REQUEST['currency_id']);
        $old_price = trim($_REQUEST['old_price']);
        $notice = trim($_REQUEST['notice']);
        $content = $_REQUEST['content'];

        $sql = "INSERT INTO product (position, url, name, articul, price, currency_id, price_old, notice, content, visible)
        VALUES ('$pos','$url', '$name', '$articul', '$price', '$currency_id', '$old_price', '$notice', '$content', 1)";
        if(!mysqli_query($connect, $sql))
        {
            echo "Error!";
        }
    }
?> 