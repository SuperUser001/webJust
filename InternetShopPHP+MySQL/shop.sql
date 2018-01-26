-- phpMyAdmin SQL Dump
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Янв 05 2018 г., 10:52

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- База данных: `shop00`



-- --------------------------------------------------------


-- Структура таблицы `items`
-- Таблица относится к товару

CREATE TABLE `items` (
  `id` int(3) NOT NULL,
  `page` text NOT NULL,
  `title` text NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `full_description` text NOT NULL
) 
	ENGINE=InnoDB 
	DEFAULT CHARSET=utf8;
-- InnoDB - таблицы с поддержкой транзакций и блокировкой строк;



-- Добавление данных таблицы `items`


INSERT INTO `items` (`id`, `page`, `title`, `image`, `description`, `full_description`) VALUES
(0, 
	'melodrams', 
	'Титаник\r\n   \r\n    \r\n    \r\n    \r\n     \r\n    \r\n    \r\n        ',
 	'melodrama1.jpg',

    '<div class="item_char">Год: <b>1997</b></div>    \r\n
    <div class="item_char">Страна: <b>США</b></div>\r\n
    <div class="item_char">Режиссер: <b>Джеймс Кэмерон</b></div>\r\n
    <div class="item_char">Цена: <b>699 р.</b></div>\r\n\r\n            \r\n            \r\n            \r\n            \r\n            \r\n            \r\n            ',

   'Молодые влюбленные Джек и Роза находят друг друга в первом и последнем плавании «непотопляемого» Титаника. 
   Они не могли знать, что шикарный лайнер столкнется с айсбергом в холодных водах Северной Атлантики, 
   и их страстная любовь превратится в схватку со смертью…\r\n            \r\n            '),

(1, 
	'melodrams', 
	'Унесённые ветром\r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        ', 
	'melodrama2.jpg  \n        \n        \n        \n        \n        \n        \n        ', 

	'<div class="item_char">Год: <b>1939</b></div>    \r\n
	 <div class="item_char">Страна: <b>США</b></div>\r\n
	 <div class="item_char">Режиссер: <b>1Виктор Флеминг,Джордж Кьюкор</b></div>\r\n
	 <div class="item_char">Цена: <b>199 р.</b></div>            \r\n            \r\n            \r\n           	\r\n            \r\n            \r\n            \r\n            ',
	  ''),

(2, 
	'melodrams', 
	'Дневник памяти\r\n        ', 
	'melodrama3.jpg', 
	'<div class="item_char">Год: <b>2004</b></div>    \r\n
		<div class="item_char">Страна: <b>США</b></div>\r\n
		<div class="item_char">Режиссер: <b>Ник Кассаветис</b></div>\r\n
		<div class="item_char">Артикул: <b>399 р.</b></div>\r\n            ',
	 ''),


(3, 
	'melodrams', 
	'Римские каникулы\r\n        \r\n        ', 
	'melodrama4.jpg\r\n        ', 
	'<div class="item_char">Год: <b>1953</b></div>    \r\n
		<div class="item_char">Страна: <b>США</b></div>\r\n
		<div class="item_char">Режиссер: <b>Ульямн Уайлер</b></div>\r\n
		<div class="item_char">Цена: <b>399 р.</b></div>\r\n            \r\n            ', 
	'Нормальный такой фотик   '),


(4, 
	'fantastics', 
	'Начало\r\n        ', 
	'fantastic1.jpg', 

	'<div class="item_char">Год: <b>2010</b></div>    \r\n
	<div class="item_char">Режиссер: <b>Кристофер Нолан</b></div>\r\n
	<div class="item_char">Цена: <b>1099 р.</b></div>\r\n                  \r\n            ',
	 ''),

(5, 
	'fantastics', 
	'Престиж', 
	'fantastic2.jpg', 

	'\n     <div class="item_char">Год: <b>2006</b></div>    \n                        
			<div class="item_char">Режиссер: <b>Кристофер Нолан</b></div>\n                        
			<div class="item_char">Цена: <b>899 р.</b></div>\n                ',
	 ''),

(6, 
	'fantastics', 
	'Интерстеллар\r\n        ', 
	'fantastic3.jpg\r\n        ', 

	'<div class="item_char">Год: <b>2014</b></div>    \r\n
	<div class="item_char">Режиссер: <b>Кристофер Нолан</b></div>\r\n
	<div class="item_char">Цена: <b>799 р.</b></div>\r\n            \r\n            ', 

	''),

(7, 
	'komedi', 
	'1+1\r\n        ', 
	'komedi1.png', 

	'<div class="item_char">Год: <b>2011</b></div>    \r\n
	<div class="item_char">Страна: <b>Франция</b></div>\r\n
	<div class="item_char">Цена <b>199 р.</b></div>\r\n            ', 

	''),

(8, 
	'komedi', 
	'Джентлемены удачи', 
	'komedi2.png', 

	' \n <div class="item_char">Год: <b>1971</b></div>    \n                        
		<div class="item_char">Страна: <b>СССР</b></div>\n                        
		<div class="item_char">Цена: <b>699 р.</b></div>',

	 ''),

(9, 
	'komedi', 
	'Ла-Ла Ленд\r\n        ', 
	'komedi3.png', 

	'<div class="item_char">Год: <b>2016</b></div>    \r\n
	 <div class="item_char">Страна: <b>США, Гонконг</b></div>\r\n
	 <div class="item_char">Цена: <b>999 р.</b></div>\r\n            ', 

	''),

(10, 
	'melodrams', 
	'Форест Гамп\r\n        \r\n        ', 
	'melodrama5.jpg',

	 '<div class="item_char">Год: <b>1994</b></div>    \r\n
	 <div class="item_char">Страна: <b>США</b></div>\r\n
	 <div class="item_char">Режиссер: <b>Роберт Земекис</b></div>\r\n
	 <div class="item_char">Цена: <b>499 р.</b></div>\r\n', 

	'Хороший фильм!'),

(11, 
	'melodrams', 
	'Иллюзионист\r\n        ', 
	'melodrama6.jpg', 

	'<div class="item_char">Год: <b>2005</b></div>    \r\n
	<div class="item_char">Страна: <b>США, Чехия</b></div>\r\n
	<div class="item_char">Режиссер: <b>Нил Бёргер</b></div>\r\n
	<div class="item_char">Цена: <b>599 р.</b></div>\r\n',

	'Потрясающее кино'),

(12, 
	'fantastics', 
	'Матрица \r\n        ', 
	'fantastic4.jpg', 

	'<div class="item_char">Год: <b>1999</b></div>    \r\n
	<div class="item_char">Режиссер: <b>Лана Вачовски, Лилли Вачовски</b></div>\r\n
	<div class="item_char">Цена: <b>499 р.</b></div>', 

	'Отлично'),

(13, 
	'fantastics', 
	'Темный рыцарь\r\n        ', 
	'fantastic5.jpg', 
	'\r\n   <div class="item_char">Год: <b>2008</b></div>    \r\n                        
			<div class="item_char">Режиссер: <b>Кристофер Нори</b></div>\r\n                        
			<div class="item_char">Цена: <b>1599 р.</b></div>\r\n ', 

	'Отлино'),

(14, 
	'komedi', 
	'Назад в будущее\r\n        ', 
	'komedi4.png', 

	'<div class="item_char">Год: <b>1975</b></div>\r\n
	 <div class="item_char">Страна: <b>США</b></div>\r\n
	 <div class="item_char">Цена: <b>299 р.</b></div>\r\n  ', 

	'Отличный фильм, про путешествие во времени!');

-- --------------------------------------------------------

-- Структура таблицы `menu`

CREATE TABLE `menu` (
  `id` int(4) NOT NULL,
  `link` text NOT NULL,
  `text` text NOT NULL
)
  ENGINE=InnoDB
   DEFAULT CHARSET=utf8;


-- Дамп данных таблицы `menu`

INSERT INTO `menu` (`id`, `link`, `text`) VALUES
(0, 'http://localhost/shop/?page=index', 'Главная'),
(1, 'http://localhost/shop/?page=melodrams', 'Мелодрамы'),
(2, 'http://localhost/shop/?page=komedi', 'Комедии'),
(3, 'http://localhost/shop/?page=fantastics\r\n        \r\n        ', 'Фантастика\r\n        \r\n        '),
(4, 'http://localhost/shop/?page=contacts', 'О фирме'),
(5, 'http://localhost/shop/?page=about', 'Об авторе');

-- --------------------------------------------------------

-- Структура таблицы `pages`

CREATE TABLE `pages` (
  `id` int(4) NOT NULL,
  `url` text NOT NULL,
  `title` text NOT NULL,
  `template` text NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Дамп данных таблицы `pages`

INSERT INTO `pages` (`id`, `url`, `title`, `template`, `content`) VALUES
(0, 'index', 'Главная', 'default_simple', '                                                                                                                             
	<h3>Приветствуем вас в нашем интернет-магазине "Фильмография"!</h3>\n
	В интернет магазине Фильмография Вы можете купить DVD диски на любой вкус. 
	Определиться с выбором нужного видео Вам поможет подробные характеристики и удобное меню.\n
	                                                                        \n
	                                                                                    \n            '),
(1, 'contacts', 'Контакты', 'default_simple', 'Почта <br><b>filmografiya@video.com </b>\r\n
	<br><br>\r\nМагазин располагается по адресу:<br> 
	<b>Ростов-на-Дону, ул.Пушкинская</b>\r\n<br><br>\r\n
	<img src="img/move.png" alt="Схема проезда"  width="400" height="300">              \r\n            \r\n            '),

(2, 'about', 'Об Авторе', 'default_simple', '                                                          
		<div class="text_item_body">\r\n                        
			<div class="item_char">Имя: <b>Волик</b></div>  \r\n                        
			<div class="item_char">Фамилия: <b>Анастасия</b></div>    \r\n                                         
		</div>\r\n            \r\n            \r\n            '),

(3, 'melodrams', 'Мелодрамы', 'default_shop', ''),
(4, 'fantastics', 'Фантастика', 'default_shop', ''),
(5, 'komedi', 'Комедии', 'default_shop', ''),
(6, 'admin', 'Админ Панель', 'default_admin', ''),
(7, 'item', 'Товар', 'default_item', ''),

(8, 'auth', 'Авторизация', 'default_simple',
		 '<div class="auth">\r\n    <form action="auth.php">\r\n        
		 <input type="text" name="login"><br><br>\r\n        
		 <input type="password" name="pass"><br><br>\r\n        
		 <input type="submit">\r\n    </form>\r\n</div>');


-- --------------------------------------------------------


-- Структура таблицы `templates`


CREATE TABLE `templates` (
  `id` int(4) NOT NULL,
  `name` text NOT NULL,
  `structure` text NOT NULL,
  `body` text NOT NULL,
  `head_tags` text NOT NULL,
  `main` text NOT NULL,
  `head` text NOT NULL,
  `menu` text NOT NULL,
  `menu_item` text NOT NULL,
  `content` text NOT NULL,
  `item` text NOT NULL,
  `bottom` text NOT NULL
) 
	ENGINE=InnoDB 
	DEFAULT CHARSET=utf8;


-- Дамп данных таблицы `templates` шаблонизатор


INSERT INTO `templates` (`id`, `name`, `structure`, `body`, `head_tags`, `main`, `head`, `menu`, `menu_item`, `content`, `item`, `bottom`) 
VALUES

(0, 
	'default_simple', 
	'<html>\r\n[HEAD_TAGS]\r\n[BODY]\r\n</html>', 

	'<body class="main_style">\r\n[HEAD]\r\n[MAIN]\r\n</body>',
 	' <head><title>[NAME_PAGE]</title>\r\n
 	    <meta charset="UTF-8">\r\n
 	        <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n
 	            <link href="mainer.css" rel="stylesheet">\r\n
 	  </head>',

  '<div class="main">\r\n[MENU]\r\n[CONTENT]\r\n[BOTTOM]\r\n</div>',

   '<div class="head_bg">\r\n\r\n
       <div class="head_logo">\r\n
               <a href="index.php"><img src="img/startPage.png" alt="Магазин Фильмография" width="300" height="60"></a>\r\n
       </div>\r\n
     </div>', 

   '<div class="menu">\r\n
           [MENU_ITEMS]\r\n
      </div>',

    '<a href="[MENU_LINK]" class="links">\n
       <div class="menu_item">[MENU_TEXT]</div>\n
     </a>', 

   '<div class="body_style">\r\n\r\n
           <div class="body_item_simple body_item">\r\n
                       [TEXT_CONTENT]\r\n
           </div>\r\n
    </div>', 

   '', 

   ' <div class="bottom">\r\n
           <a href="mailto: filmografiya@video.com " class="link_mail">filmografiya@video.com </a>\r\n
                   <br>\r\n
                           <div class="copyright">&copy;RaiN</div>\r\n 
      </div>'),


(1, 'default_shop', 
	'<html>\r\n[HEAD_TAGS]\r\n[BODY]\r\n</html>',

    '<body class="main_style">\r\n[HEAD]\r\n[MAIN]\r\n</body>', 

 	' <head><title>[NAME_PAGE]</title>\r\n
     <meta charset="UTF-8">\r\n
         <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n
             <link href="mainer.css" rel="stylesheet">\r\n
    </head>', 

 '<div class="main">\r\n[MENU]\r\n[CONTENT]\r\n[BOTTOM]\r\n</div>', 

 '<div class="head_bg">\r\n\r\n
     <div class="head_logo">\r\n
             <a href="index.php"><img src="img/startPage.png" alt="Магазин Фильмография" width="300" height="60"></a>\r\n    
     </div>\r\n
  </div>',

  '<div class="menu">\r\n
          [MENU_ITEMS]\r\n    
    </div>',

   '<a href="[MENU_LINK]" class="links">\r\n 
  	 <div class="menu_item">[MENU_TEXT]</div>\r\n 
   </a>',

    '<div class="body_style">\r\n\r\n 
          [ITEMS]\r\n\r\n
     </div>',

     '<div class="body_item">\r\n\r\n
   		  <div class="item_title">\r\n
   		  	[ITEM_TITLE]\r\n
   		  </div>\r\n\r\n
   		  <div class="image_item_body">\r\n\r\n
     		<img src="img/[IMAGE_ITEM]" class="image_style">\r\n\r\n
     	  </div>\r\n\r\n
    	 <div class="text_item_body">\r\n[DESCR_ITEM]\r\n</div>\r\n\r\n
    </div>',

     ' <div class="bottom">\r\n
              <a href="mailto: qema19@gmail.com" class="link_mail">qema19@gmail.com</a>\r\n
                      <br>\r\n 
                             <div class="copyright">&copy;QEM
                             </div>\r\n    
       </div>'),


(2, 'default_admin', '<html>\r\n[HEAD_TAGS]\r\n[BODY]\r\n</html>', 
-- textarea задаем элемент веб-формы Имя поля задаем ширину и высоту
	'<body>\r\n
		<div style="width:45%; float: left;">\r\n    
			<h2>Страницы сайта</h2><br>\r\n
			    [1]\r\n
		</div>\r\n
		<div style="width:45%;border-left: 1px solid;float: left;padding: 0 0 0 100px">\r\n    
			<form action="" method="post">\r\n        
				<p><b>Содержимое страницы:</b></p>\r\n        
				<p><textarea rows="10" cols="70" name="textContent">\r\n 
		               [2]\r\n
				 </textarea></p>\r\n        
				<p><input type="submit" value="Изменить"></p>\r\n    
			</form>\r\n\r\n
		</div>\r\n
		<div style="width:45%; float: left;">\r\n    
			<div style="float:left; width: 150px; border-right: solid 1px;">\r\n        
				<h2>Категории товаров</h2><br><br><br><br>\r\n
				        [8]\r\n
			</div>\r\n    
		<div style="float:left; width: 150px; padding: 0 0 0 20px">\r\n       
	 			<h2>Товары сайта</h2>\r\n        
				<a href="?page=admin&itemedit=new">\r\n            
	 			<div style="width: 150px; height: 30px; border: 1px solid; border-radius: 10px; text-align: center">\r\n
	 			                Добавить\r\n                товар\r\n            
	 			</div>\r\n        
	 			</a>\r\n        
	 <br>\r\n 
	        [3]\r\n    
	    </div>\r\n
	  </div>\r\n

	 <div style="width:45%;border-left: 1px solid;float: left;padding: 0 0 0 100px">\r\n
	     <form action="" method="post" enctype="multipart/form-data">\r\n
	             <p><b>Информация о товаре</b></p>\r\n
	             <p>Страница: <textarea rows="1" cols="70" name="page">\r\n[4]\r\n
	                          </textarea></p>\r\n
	             <p>Название: <textarea rows="1" cols="70" name="title">\r\n[5]\r\n
	                          </textarea></p>\r\n
	             <p>[6]\r\n
	                    <input type="file" name="photo" accept="image/*">\r\n\r\n
	             </p>\r\n\r\n
	             <p>Описание: <textarea rows="7" cols="70" name="description">\r\n[7]\r\n
	                       </textarea></p>\r\n\r\n
	             <p>Полное описание: <textarea rows="7" cols="70" name="full_description">\r\n[9]\r\n
	                                 </textarea></p>\r\n
	                     <p><input type="submit" value="Отправить"></p>\r\n
	      </form>\r\n\r\n
	  </div>\r\n\r\n
	  <div style="width: 45%; float: left;">\r\n
	             Пункты меню: <br>\r\n
	                <a href="?page=admin&menuedit=new"><div style="width: 100px; text-align: center; border: solid 1px; border-radius: 10px;">Добавить пункт</div></a>\r\n
	        [10]\r\n
	  </div>\r\n
	  <div style="width: 45%; float: left;">\r\n
	            Редактирование пункта: <br>\r\n
	              <form action="" method="post">\r\n
	                   <p>Ссылка: <textarea rows="1" cols="70" name="link">\r\n[11]\r\n
	                              </textarea></p>\r\n
	                   <p>Текст: <textarea rows="1" cols="70" name="textMenu">\r\n[12]\r\n
	                              </textarea></p>\r\n
	                   <p><input type="submit" value="Отправить"></p>\r\n
	                              </form>\r\n
	   </div>\r\n
	   </body>',

	  ' <head><title>[NAME_PAGE]</title>\r\n
	      <meta charset="UTF-8">\r\n
	          <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n
	          <link href="mainer.css" rel="stylesheet">\r\n
	    </head>',

	   '', '', '', '', '', '', ''),

(3, 'default_item',
	'<html>\r\n[HEAD_TAGS]\r\n[BODY]\r\n</html>',
	 '<body class="main_style">\r\n[HEAD]\r\n[MAIN]\r\n</body>', 
	 ' <head><title>[ITEM_TITLE]</title>\r\n
	     <meta charset="UTF-8">\r\n
	     <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n
	         <link href="mainer.css" rel="stylesheet">\r\n</head>', 

	 '<div class="main">\r\n[MENU]\r\n[CONTENT]\r\n[BOTTOM]\r\n</div>', 

	 '<div class="head_bg">\r\n\r\n
	     <div class="head_logo">\r\n
	             <a href="index.php"><img src="img/startPage.png" alt="Магазин Фильмографи\" width="300" height="60"></a>\r\n
	     </div>\r\n
	  </div>', 

	 '<div class="menu">\r\n
	         [MENU_ITEMS]\r\n
	   </div>',

	  '<a href="[MENU_LINK]" class="links">\r\n
	  	 <div class="menu_item">[MENU_TEXT]</div>\r\n
	   </a>', 

	  '<div class="body_style">\r\n\r\n
	  		<div class="body_item">\r\n\r\n
	 			 <div class="item_title">\r\n[ITEM_TITLE]\r\n </div>\r\n\r\n
	  		<div class="image_item_body"  style="width: 210px">\r\n\r\n
	  			<img src="img/[IMAGE_ITEM]" class="image_style" style="width: 200px;height: 200px;">\r\n\r\n
		  	</div>\r\n\r\n
			<div class="text_item_body" style="width: 320px">\r\n[DESCR_ITEM]\r\n</div>\r\n
			<div style="float:left; margin: 10px 0 0 0">\r\n[FULL_DESCR]\r\n</div>\r\n
	</div>\r\n
</div>', 

	  '', 

	  ' <div class="bottom">\r\n 
	         <a href="mailto: filmografiya@video.com" class="link_mail">filmografiya@video.com</a>\r\n
	                 <br>\r\n
	                         <div class="copyright">&copy;RaiN</div>\r\n
	    </div>');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` text NOT NULL,
  `password` text NOT NULL,
  `access` int(1) NOT NULL
) 
	ENGINE=InnoDB 
	DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `access`) VALUES
(0, 'Nana', '1111', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
