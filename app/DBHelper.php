<?php
    /**
     * Class DBHelper
     * Класс помощник для работы с базой данных в тестовом задании
     */
    Class DBHelper
    {
        public function openConnection()
        {
            mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
            $connect = mysqli_connect($this->server, $this->user, $this->pass, $this->dbname);
        }
        // Выполнение SQL запроса и вывод результата в массив
        private function getDataArray($connect, $statment)
        {
            $array = mysqli_query($connect, $statment);
            $array = mysqli_fetch_all($array);
            return $array;
        }

        // Импорт из БД в таблицу, с сылками 
        function importFromDBtoTable($connect, $statment)
        {
            $array = $this->getDataArray($connect, $statment);
            foreach($array as $element)
            {
                echo '<tr>';
                echo '<td><div><a href="app/cart.php?product_id='.$element[0].'">'.$element[1].'</a></div></td>';
                for($i = 2; $i < count($element); $i++)
                {
                    echo '<td>'.$element[$i].'</td>';
                }
                echo '</tr>';
            }
        }

        // Создание карточки продукта
        function createProductCard($connect, $statment)
        {
            $array = $this->getDataArray($connect, $statment);
            foreach($array as $elem)
            {   
                echo '<h3>'.$elem[4].'</h3>';
                echo '<p> Цена: '.$elem[5].' рублей</p>';
                echo '<p> Старая цена: '.$elem[7].' рублей</p>';
                echo '<p> Описание: '.$elem[8].'</p>';
                echo '<img src="../content/'.$elem[9].'" alt="тут должна быть картинка"/>';
            }
        }
    }
?>