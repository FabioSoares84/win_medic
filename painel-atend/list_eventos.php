<?php

 require_once("../conexaoPDO.php");
 
$query_consultas = "SELECT id,title,color,start,end from events";
$resultado_lista = $conn->prepare($query_consultas);
$resultado_lista->execute();

$consultas = [];
while($row_consultas = $resultado_lista->fetch(PDO::FETCH_ASSOC)){
    $id = $row_consultas['id'];
    $title = $row_consultas['title'];
    $color = $row_consultas['color'];
    $start = $row_consultas['start'];
    $end = $row_consultas['end'];
    
    $consultas[]=[
        'id'=> $id,
        'title'=> $title,
        'color'=> $color,
        'start'=> $start,
        'end'=> $end,
    ];
}
echo json_encode($consultas);