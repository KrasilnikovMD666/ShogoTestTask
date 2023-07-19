-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 17 2023 г., 23:07
-- Версия сервера: 10.4.19-MariaDB
-- Версия PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shogotesttask`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(16) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`id`, `login`, `password`, `name`, `surname`, `email`) VALUES
(1, 'admin', 'admin000', 'Администратор', 'Администратор', 'AdminMail@test.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT 0,
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `articul` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `price_old` decimal(10,2) NOT NULL,
  `notice` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `position`, `url`, `name`, `articul`, `price`, `currency_id`, `price_old`, `notice`, `content`, `visible`) VALUES
(1, 1, 'Яблоки Российские', 'apple_ru_1', 'Яблоки Российские', '100.00', 1, '90.00', 'Яблоки Российские, зеленые, производство Краснодар', 'apples.jpg', 1),
(2, 2, 'Яблоки Турция', 'apple_turkey', 'Яблоки Турция', '120.00', 1, '110.00', 'Яблоки Турция, красные', 'apples.jpg', 1),
(3, 3, 'Абрикосы Россия', 'apricot_ru', 'Абрикосы Россия', '150.00', 1, '130.00', 'Абрикосы Россия, Абхазия', NULL, 1),
(4, 4, 'Манго', 'mango', 'Манго', '200.00', 1, '210.00', 'Манго, Марокко', NULL, 1),
(5, 5, 'Сосиски копчёные', 'sausage_sm', 'Сосиски копчёные', '200.00', 1, '170.00', 'Сосиски копчёные, курица, свинина', NULL, 1),
(6, 6, 'Колбаса \"Пепперони\"', 'pepperoni', 'Колбаса \"Пепперони\"', '250.00', 1, '230.00', 'Колбаса \"Пепперони\", курица', 'pepperoni.jpg', 1),
(7, 7, 'Хлеб белый', 'bread_white', 'Хлеб белый', '40.00', 1, '38.00', 'Белый хлеб, пшеничный', 'bread_w.jpg', 1),
(8, 8, 'Хлеб чёрный', 'bread_black', 'Хлеб чёрный', '35.00', 1, '33.00', 'Чёрный хлеб, ржаной, со злаками', 'bread_b.jpg', 1),
(9, 9, 'Торт \"Тирамису\"', 'tiramisu', 'Торт \"Тирамису\"', '300.00', 1, '290.00', 'Торт \"Тирамису\"', NULL, 1),
(10, 10, 'Пирожок с яйцом', 'pie_egg', 'Пирожок с яйцом', '41.00', 1, '40.00', 'Пирожок с яйцом, ржаной', NULL, 1),
(20, 15, 'Картофель Деревенский', 'potato', 'Картофель Деревенский', '30.00', 1, '27.00', 'Картофель Деревенский, из деревни', 'potato.jpg', 1),
(140, 19, 'Колбаса докторская', 'doctorskaya', 'Колбаса \"Докторская\"', '155.00', 1, '130.00', 'Колбаса \"Докторская\", по ГОСТу', 'doktorskaya.jpg', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_assignment`
--

CREATE TABLE `product_assignment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_assignment`
--

INSERT INTO `product_assignment` (`id`, `product_id`, `section_id`, `type_id`, `visible`) VALUES
(1, 1, 1, 2, 1),
(2, 2, 1, 1, 1),
(3, 3, 1, 2, 1),
(4, 4, 1, 1, 1),
(5, 5, 3, 3, 1),
(6, 6, 3, 3, 1),
(7, 7, 2, 4, 1),
(8, 8, 2, 4, 1),
(9, 9, 2, 5, 1),
(10, 10, 2, 5, 1),
(25, 140, 3, 3, 1),
(26, 20, 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_param_name`
--

CREATE TABLE `product_param_name` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT 0,
  `visible` tinyint(1) NOT NULL,
  `name` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_param_name`
--

INSERT INTO `product_param_name` (`id`, `position`, `visible`, `name`) VALUES
(1, 1, 1, 'param_1'),
(2, 2, 1, 'param_2'),
(3, 3, 1, 'param_3');

-- --------------------------------------------------------

--
-- Структура таблицы `product_param_variant`
--

CREATE TABLE `product_param_variant` (
  `id` int(10) UNSIGNED NOT NULL,
  `param_id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `position` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_param_variant`
--

INSERT INTO `product_param_variant` (`id`, `param_id`, `name`, `position`) VALUES
(1, 1, 'param_variant_1', 1),
(2, 2, 'param_variant_2', 2),
(3, 3, 'param_variant_3', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `product_section`
--

CREATE TABLE `product_section` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT 0,
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notice` text DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_section`
--

INSERT INTO `product_section` (`id`, `position`, `url`, `name`, `notice`, `visible`) VALUES
(1, 1, 'Фрукты и овощи', 'fruit_and_vegetables', 'Фрукты и овощи', 1),
(2, 2, 'Хлеб. изделия', 'bakery_products', 'Хлебобулочные изделия', 1),
(3, 3, 'Мясная продукция', 'meat_products', 'Мясная продукция', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_type`
--

CREATE TABLE `product_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT 0,
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notice` text DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_type`
--

INSERT INTO `product_type` (`id`, `position`, `url`, `name`, `notice`, `visible`) VALUES
(1, 1, 'Фрукты импорт', 'fruit_import', 'Фрукты импорт', 1),
(2, 2, 'Фрукты Россия', 'fruit_ru', 'Фрукты из России', 1),
(3, 3, 'Колбасные изд.', 'sausage', 'Колбасные изделия', 1),
(4, 4, 'Хлеб', 'bread', 'Хлеб', 1),
(5, 5, 'Выпечка', 'bakery', 'Выпечка', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Индексы таблицы `product_assignment`
--
ALTER TABLE `product_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `visible` (`visible`);

--
-- Индексы таблицы `product_param_name`
--
ALTER TABLE `product_param_name`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_param_variant`
--
ALTER TABLE `product_param_variant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`param_id`,`name`(64)),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `product_section`
--
ALTER TABLE `product_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT для таблицы `product_assignment`
--
ALTER TABLE `product_assignment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `product_param_name`
--
ALTER TABLE `product_param_name`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `product_param_variant`
--
ALTER TABLE `product_param_variant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `product_section`
--
ALTER TABLE `product_section`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product_assignment`
--
ALTER TABLE `product_assignment`
  ADD CONSTRAINT `product_assignment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_assignment_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `product_section` (`id`),
  ADD CONSTRAINT `product_assignment_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `product_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_param_variant`
--
ALTER TABLE `product_param_variant`
  ADD CONSTRAINT `product_param_variant_ibfk_1` FOREIGN KEY (`param_id`) REFERENCES `product_param_name` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
