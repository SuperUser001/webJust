<?php

function curPageName()
{
    return substr($_SERVER["SCRIPT_NAME"], strrpos($_SERVER["SCRIPT_NAME"], "/") + 1);
    // $_SERVER["SCRIPT_NAME"] Содержит имя скрипта, начиная от корневого каталога виртуального хоста
}

function getTitle()
{

    $mysqli = new mysqli("localhost", "admin", "45654", "shop00");  //Создание подключения
    $mysqli->set_charset("utf8");
    $query = "SELECT title FROM `content` WHERE `page`='" . curPageName() . "'";
    //запрашиваем данные в бд 
    $result = $mysqli->query($query);
    $result->data_seek(0);//переходим к 0 строке
    $row = $result->fetch_row(); //Получение строки результирующей таблицы в виде массива
    printf($row[0]);
}

function sendQuery($query)
{
    $mysqli = new mysqli("localhost", "admin", "45654", "shop00");
    $mysqli->set_charset("utf8");
    return $mysqli->query($query);
}

function getValue()
{
    $mysqli = new mysqli("localhost","admin", "45654", "shop00");
    $mysqli->set_charset("utf8");
    $query = "SELECT value FROM `content` WHERE `page`='" . curPageName() . "'";
    $result = $mysqli->query($query);
    $result->data_seek(0);
    $row = $result->fetch_row();
    printf($row[0]);
}

function getImage()
{
    $mysqli = new mysqli("localhost","admin", "45654", "shop00");
    $mysqli->set_charset("utf8");
    $query = "SELECT image FROM `item` WHERE `page`='" . curPageName() . "'";
    $result = $mysqli->query($query);
    $result->data_seek(0);
    $row = $result->fetch_row();
    printf($row[0]);
}

function getDescription()
{
    $mysqli = new mysqli("localhost", "admin", "45654", "shop00");
    $mysqli->set_charset("utf8");
    $query = "SELECT description FROM `item` WHERE `page`='" . curPageName() . "'";
    $result = $mysqli->query($query);
    $result->data_seek(0);
    $row = $result->fetch_row();
    printf($row[0]);
}

function getResult($query)
{
    $mysqli = new mysqli("localhost", "admin", "45654", "shop00");
    $mysqli->set_charset("utf8");
    $result = $mysqli->query($query);
    $result->data_seek(0);
    $row = $result->fetch_row();
    return $row[0];
}

//функция возвращает несколько строк результата запроса
function getResultItems($query)
{
    $mysqli = new mysqli("localhost", "admin", "45654", "shop00");
    $mysqli->set_charset("utf8");
    $result = $mysqli->query($query);
    return $result;
}

function getItems($template)
{
    $result = "";
    //получаем оформление одного товара
    $teml_item = getResult("SELECT item FROM `templates` WHERE `name`='" . $template . "'");
    //получаем список всех товаров
    $listAllItems = getResultItems("SELECT * FROM `items` WHERE `page`='" . $_GET["page"] . "'");

    //цикл оформляет информацию о товарах и добавляет в result
    for ($i = 0; $i < $listAllItems->num_rows; $i++) {
        $result .= $teml_item;
        $listAllItems->data_seek($i);
        $itemInfo = $listAllItems->fetch_row();
        $result = str_replace("[ITEM_TITLE]", "<a href='?page=item&item=" . $itemInfo[0] . "' class=\"links\">" . $itemInfo[2] . "</a>", $result);
        $result = str_replace("[IMAGE_ITEM]", $itemInfo[3], $result);
        $result = str_replace("[DESCR_ITEM]", $itemInfo[4], $result);
    }
    return $result;
}

function getItemsMenu($template)
{
    $result = "";
    //получаем оформление одного товара
    $teml_item = getResult("SELECT menu_item FROM `templates` WHERE `name`='" . $template . "'");
    //получаем список всех товаров
    $listAllItems = getResultItems("SELECT * FROM `menu`");

    //цикл оформляет информацию о пунктах меню и добавляет в result
    for ($i = 0; $i < $listAllItems->num_rows; $i++) {
        $result = $result . $teml_item;
        $listAllItems->data_seek($i);
        $itemInfo = $listAllItems->fetch_row();
        $result = str_replace("[MENU_LINK]", $itemInfo[1], $result);
        $result = str_replace("[MENU_TEXT]", $itemInfo[2], $result);
    }
    return $result;
}

function getStaticPages()
{
    $result = "";
    $pages = getResultItems("SELECT * FROM `pages`");
    for ($i = 0; $i < $pages->num_rows; $i++) {
        $pages->data_seek($i);
        $row = $pages->fetch_row();
        if (stristr($row[3], "simple") != false && stristr($row[1], "auth") == false)
            $result = $result . "<a href=\"?page=admin&edit=" . $row[1] . "\">" . $row[2] . "</a> - " . $row[1] . " - " . $row[3] . "<br><br>";
    }
    return $result;
}

function getDynamicPages()
{
    $result = "";
    $pages = getResultItems("SELECT * FROM `pages`");
    for ($i = 0; $i < $pages->num_rows; $i++) {
        $pages->data_seek($i);
        $row = $pages->fetch_row();
        if (stristr($row[3], "shop") != false)
            $result = $result . "<a href=\"?page=admin&pageItem=" . $row[1] . "\">" . $row[2] . "</a><br><br>";
    }
    return $result;
}

function getItemsPages()
{
    $result = "";
    $pages = getResultItems("SELECT * FROM `items` WHERE `page` = '" . $_GET["pageItem"] . "'");
    for ($i = 0; $i < $pages->num_rows; $i++) {
        $pages->data_seek($i);
        $row = $pages->fetch_row();
        $result .= "<a href=\"?page=admin&pageItem=" . $_GET["pageItem"] . "&itemedit=" . $row[0] . "\">" . $row[2] . "</a>";
        $result .= "<a href=\"?page=admin&pageItem=del&itemedit=" . $row[0] . "\"> <img src=\"img/del.png\"></a>";
        $result .= "<br><br>";
    }
    return $result;
}

function genId($table)
{
    $result = 0;
    $items = getResultItems("SELECT * FROM `".$table."`");
    for ($i = 0; $i < $items->num_rows; $i++) {
        $items->data_seek($i);
        $row = $items->fetch_row();
        if ($row[0] > $result) {
            $result = $row[0];
        }
    }
    $result++;
    return $result;
}

//получение информации для индивидуальной страницы товара
function getFullInfoItem()
{
    $result = "";
    $items = getResultItems("SELECT * FROM `items` WHERE `id` = " . $_GET["item"]);
    $items->data_seek(0);
    $row = $items->fetch_row();
    for ($i = 2; $i < count($row); $i++) {
        $result .= $row[$i];
    }
    return $result;
}



function checkLogPassCookie()
{
    if (!empty($_COOKIE["login"])) {
        $pass = getResult("SELECT password FROM `users` WHERE `login` ='" . $_COOKIE["login"] . "'");
    } else {
        return false;
    }
    if ($_COOKIE["pass"] == $pass)
        return true;
    else
        return false;
}

function checkLogPassForm()
{
    if (!empty($_GET["login"])) {
        $pass = getResult("SELECT password FROM `users` WHERE `login` ='" . $_COOKIE["login"] . "'");
    } else {
        return false;
    }
    if ($_GET["pass"] == $pass)
        return true;
    else
        return false;
}


function getListMenu()
{
    $result = "";
    $pages = getResultItems("SELECT * FROM `menu`");
    for ($i = 0; $i < $pages->num_rows; $i++) {
        $pages->data_seek($i);
        $row = $pages->fetch_row();
        $result = $result . "<a href=\"?page=admin&menuedit=" . $row[0] . "\">" . $row[2] . "</a>";
        $result .= "<a href=\"?page=admin&menuedit=del&id=" . $row[0] . "\"> <img src=\"img/del.png\"></a><br><br>";
    }
    return $result;
}