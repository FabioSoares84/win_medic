<?php

define('HOST','localhost');
define('USER','root');
define('PASS','');
define('DBNAME','win_medic');

$conn = new PDO('mysql:host='.HOST.';dbname='.DBNAME.';',USER,PASS);