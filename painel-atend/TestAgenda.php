<?php 
    $agora = date('Y-m-d');
    require_once("../conexao.php");
    
    $res_agenda = $pdo->query("select * from consultas");
    $dados_agenda = $res_agenda->fetchAll(PDO::FETCH_ASSOC);
    
    $linhas = count($dados_agenda);
    //    $i=0; $i < count($dados); $i++
    for($i=0; $i < $linhas; $i++){
    
        echo 'ID: '.$dados_agenda[$i]['id']."<br \>";
        echo 'Data:'.$dados_agenda[$i]['data']."<br \>";
        echo 'Hora:'.$dados_agenda[$i]['hora']."<br \>";
        $paciente = $dados_agenda[$i]['paciente'];
        $tipo_atendimento = $dados_agenda[$i]['tipo_atendimento'];
     
        //BUSCAR O NOME DO PACIENTE
	$res_valor = $pdo->query("SELECT * from pacientes where id = '$paciente'");
	$dados_valor = $res_valor->fetchAll(PDO::FETCH_ASSOC);
	$lin = count($dados_valor);
	if($lin > 0){
            $nome_paciente = $dados_valor[0]['nome'];	
            echo 'Nome Paciente: '.$nome_paciente."<br \>";
	}
        
        //BUSCAR O NOME DO TIPO DE ATENDIMENTO
        $res_atend = $pdo->query("SELECT * from atendimentos where id = '$tipo_atendimento'");
        $dados_atend = $res_atend->fetchAll(PDO::FETCH_ASSOC);
        $linhas_atend = count($dados_atend);
        if($linhas_atend >0){
            $atendimento = $dados_atend[0]['descricao'];
            echo 'Tipo Atendimento: '.$atendimento. "<br \>";
        }
     
    }
    
   
   
   
    
   //
   //     $datat = $data.'T'.$hora;
   //     echo $datat;
?>
