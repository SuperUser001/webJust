<?php
include "functions.php";


//получили название текущей страницы url
if (empty($_GET))
    $page = "index";
else
    $page = $_GET["page"];

//работа с админкой
//Возвращает всю строку начиная со вхождения 2ого арг
if (stristr($page, "admin") != false) {
    if (checkLogPassCookie()) {
        if (isset($_POST) && !empty($_POST["textContent"])) {
            $query = "UPDATE `pages` SET `content` = '" . $_POST["textContent"] . "' WHERE `pages`.`url` ='" . $_GET["edit"] . "'";
            sendQuery($query);
        }

        //проверяем содержатся ли данные в форме 
        if (isset($_POST) && !empty($_POST["textMenu"]) && !empty($_POST["link"])) {
            $query = "UPDATE `menu` SET `link` = '" . $_POST["link"] . "', `text` = '" . $_POST["textMenu"] . "' WHERE `id` =" . $_GET["menuedit"];
            //обновляем значение присваивая ему значение из формы 
            sendQuery($query);
        }
        if (isset($_POST) && !empty($_POST["textMenu"]) && !empty($_POST["link"]) && $_GET["menuedit"] == "new") {
            $query = "INSERT INTO `menu` (`id`, `link`, `text`) VALUES ('" . genId("menu") . "', '" . trim($_POST["link"]) . "', '" . $_POST["textMenu"] . "');";
            sendQuery($query);
        }


        $uploadfile = "C:/xampp/htdocs/shop/img/" . basename($_FILES['photo']['name']); //получаем имя файла из указанного пути
        if ($_FILES["photo"]["size"] != 0 && move_uploaded_file($_FILES['photo']['tmp_name'], $uploadfile)) {
            if (isset($_POST) && !empty($_POST["page"])) {
                if ($_GET["itemedit"] != "new") {
                    //запрос на изменение, если пользователь загрузил картинку
                    $query = "UPDATE `items` SET `page` = '" . trim($_POST["page"]) . "',`image` = '" . basename($_FILES['photo']['name']) . "', `title` = '" . $_POST["title"] . "', `description` = '" . $_POST["description"] . "', `full_description` = '" . $_POST["full_description"] . "' WHERE `id` = " . $_GET["itemedit"] . ";";
                    sendQuery($query);
                } else {
                    //запрос на добавление, если пользователь загрузил картинку
                    $query = "INSERT INTO `items` (`id`, `page`, `title`, `image`, `description`, `full_description`) VALUES ('" . genId("items") . "', '" . trim($_POST["page"]) . "', '" . $_POST["title"] . "', '" . basename($_FILES['photo']['name']) . "', '" . $_POST["description"] . "', '" . $_POST["full_description"] . "');";
                    sendQuery($query);
                }
            }
        } else {
            if (isset($_POST) && !empty($_POST["page"])) {
                if ($_GET["itemedit"] != "new") {
                    //запрос на изменение, если пользователь НЕ загрузил картинку
                    $query = "UPDATE `items` SET `page` = '" . trim($_POST["page"]) . "', `title` = '" . $_POST["title"] . "', `description` = '" . $_POST["description"] . "', `full_description` = '" . $_POST["full_description"] . "' WHERE `id` = " . $_GET["itemedit"] . ";";
                    sendQuery($query);
                } else {
                    //запрос на добавление, если пользователь НЕ загрузил картинку
                    $query = "INSERT INTO `items` (`id`, `page`, `title`, `image`, `description`, `full_description`) VALUES ('" . genId("items") . "', '" . trim($_POST["page"]) . "', '" . $_POST["title"] . "', 'no_image.png', '" . $_POST["description"] . "', '" . $_POST["full_description"] . "');";
                    sendQuery($query);
                }
            }
        }
        //если был нажат крестик удаления
        if ($_GET["pageItem"] == "del") {
            $query = "DELETE FROM `items` WHERE `id` = " . $_GET["itemedit"];
            sendQuery($query);
        }
        //если был нажат крестик удаления
        if ($_GET["menuedit"] == "del") {
            $query = "DELETE FROM `menu` WHERE `id` = " . $_GET["id"];
            sendQuery($query);
        }
    }
}


//получили название шаблона для текущей страницы
$template = getResult("SELECT template FROM `pages` WHERE `url`='" . $page . "'");
if (stristr($template, "admin")) {
    if (checkLogPassCookie()) {
        $structure = getResult("SELECT structure FROM `templates` WHERE `name`='" . $template . "'");
    } else {
        $structure = "Неправильный пароль";
        header('Location: http://localhost/shop/?page=auth');
    }
} else {
    //подгружаем общую структуру шаблона
    $structure = getResult("SELECT structure FROM `templates` WHERE `name`='" . $template . "'");
}
//получаем товары, если в названии шаблона есть слово shop
if (stristr($template, "shop") != false)
    $items = getItems($template);

$menuItems = getItemsMenu($template);
//анализируем структуру, находим BB-коды и заменяем их на участки кода
for ($i = 0; $i < 8; $i++) {
    $structure = str_replace("[HEAD_TAGS]", getResult("SELECT head_tags FROM `templates` WHERE `name`='" . $template . "'"), $structure);
    $structure = str_replace("[BODY]", getResult("SELECT body FROM `templates` WHERE `name`='" . $template . "'"), $structure);
    $structure = str_replace("[HEAD]", getResult("SELECT head FROM `templates` WHERE `name`='" . $template . "'"), $structure);
    $structure = str_replace("[MAIN]", getResult("SELECT main FROM `templates` WHERE `name`='" . $template . "'"), $structure);
    $structure = str_replace("[MENU]", getResult("SELECT menu FROM `templates` WHERE `name`='" . $template . "'"), $structure);
    $structure = str_replace("[CONTENT]", getResult("SELECT content FROM `templates` WHERE `name`='" . $template . "'"), $structure);
    $structure = str_replace("[BOTTOM]", getResult("SELECT bottom FROM `templates` WHERE `name`='" . $template . "'"), $structure);
    if ($_GET["page"] != "item")
        $structure = str_replace("[TEXT_CONTENT]", getResult("SELECT content FROM `pages` WHERE `url`='" . $page . "'"), $structure);
    else {
        $structure = str_replace("[TEXT_CONTENT]", getFullInfoItem(), $structure);
    }
    $structure = str_replace("[NAME_PAGE]", getResult("SELECT title FROM `pages` WHERE `url`='" . $page . "'"), $structure);
    if (stristr($template, "shop") != false)
        $structure = str_replace("[ITEMS]", $items, $structure);
    if (stristr($template, "item") != false) {
        $structure = str_replace("[ITEM_TITLE]", getResult("SELECT title FROM `items` WHERE `id`=" . $_GET["item"]), $structure);
        $structure = str_replace("[IMAGE_ITEM]", getResult("SELECT image FROM `items` WHERE `id`=" . $_GET["item"]), $structure);
        $structure = str_replace("[DESCR_ITEM]", getResult("SELECT description FROM `items` WHERE `id`=" . $_GET["item"]), $structure);
        $structure = str_replace("[FULL_DESCR]", getResult("SELECT full_description FROM `items` WHERE `id`=" . $_GET["item"]), $structure);
    }
    $structure = str_replace("[MENU_ITEMS]", $menuItems, $structure);
    if (stristr($template, "admin") != false) {
        $structure = str_replace("[1]", getStaticPages(), $structure);
        $structure = str_replace("[2]", getResult("SELECT content FROM `pages` WHERE `url`='" . $_GET["edit"] . "'"), $structure);
        $structure = str_replace("[8]", getDynamicPages(), $structure);
        $structure = str_replace("[3]", getItemsPages(), $structure);
        $structure = str_replace("[10]", getListMenu(), $structure);
        if ($_GET["itemedit"] != "new") {
            $structure = str_replace("[4]", getResult("SELECT page FROM `items` WHERE `id`='" . $_GET["itemedit"] . "'"), $structure);
            $structure = str_replace("[5]", getResult("SELECT title FROM `items` WHERE `id`='" . $_GET["itemedit"] . "'"), $structure);
            $structure = str_replace("[6]", "<img src=\"img/" . getResult("SELECT image FROM `items` WHERE `id`='" . $_GET["itemedit"] . "'") . "\" width=\"100\" height=\"100\">", $structure);
            $structure = str_replace("[7]", getResult("SELECT description FROM `items` WHERE `id`='" . $_GET["itemedit"] . "'"), $structure);
            $structure = str_replace("[9]", getResult("SELECT full_description FROM `items` WHERE `id`='" . $_GET["itemedit"] . "'"), $structure);
        } else {
            $structure = str_replace("[4]", "", $structure);
            $structure = str_replace("[5]", "", $structure);
            $structure = str_replace("[6]", "<img src=\"img/no_image.png\" width=\"100\" height=\"100\">", $structure);
            $structure = str_replace("[7]", "", $structure);
            $structure = str_replace("[9]", "", $structure);
        }
        if ($_GET["menuedit"] != "new") {
            $structure = str_replace("[11]", getResult("SELECT link FROM `menu` WHERE `id`='" . $_GET["menuedit"] . "'"), $structure);
            $structure = str_replace("[12]", getResult("SELECT text FROM `menu` WHERE `id`='" . $_GET["menuedit"] . "'"), $structure);
        } else {
            $structure = str_replace("[11]", "", $structure);
            $structure = str_replace("[12]", "", $structure);
        }
    }
}
echo $structure;