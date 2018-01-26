<?php
include "scripts/functions.php";

setcookie("login", $_GET["login"], time() + 300);  /* срок действия 5 минут */
setcookie("pass", $_GET["pass"], time() + 300);  /* срок действия 5 минут */
header('Location: http://localhost/shop/?page=admin');
?>