<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$connect = mysqli_connect("127.0.0.1", "root", "", "shogotesttask");

if($connect === false)
{
    die(mysqli_connect_errno().' '.mysqli_connect_error());
}
?>