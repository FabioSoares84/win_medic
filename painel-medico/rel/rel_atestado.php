
<?php 
$id = $_GET['id'];

include('../../conexao.php');



?>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<style>

	@page {
		margin: 0px;

	}

	.footer {
		position:absolute;
		bottom:0;
		width:100%;
		background-color: #ebebeb;
		padding:10px;
	}

	.cabecalho {    
		background-color: #ebebeb;
		padding-top:15px;
		margin-bottom:50px;
	}

	.titulo{
		margin:0;
	}

	.areaTotais{
		border : 0.5px solid #bcbcbc;
		padding: 15px;
		border-radius: 5px;
		margin-right:25px;
	}

	.areaTotal{
		border : 0.5px solid #bcbcbc;
		padding: 15px;
		border-radius: 5px;
		margin-right:25px;
		background-color: #f9f9f9;
		margin-top:2px;
	}

	.area-texto{
		margin-top:20px;
	}



</style>


<div class="cabecalho">
	
	<div class="row">
		<div class="col-sm-4">	
			 <img src="../../img/logo-rel.jpg" width="250px">
		</div>
		<div class="col-sm-6">	
			<h3 class="titulo"><b>SysMedical - Hospitais e Clínicas</b></h3>
			<h6 class="titulo">Rua da Q-Cursos Networks Nº 1000, Centro - BH - MG - CEP 30555-555</h6>
		</div>
	</div>
	

</div>

<div class="container">


	<div class="col-md-12" align="center">
		
			 <big><big> ATESTADO MÉDICO  </big> </big> 
		

	</div>

	
	<hr>




	<br><br>

	<?php

	
	

		$res = $pdo->query("SELECT * from consultas where id = '$id'");
	


	$dados = $res->fetchAll(PDO::FETCH_ASSOC);
                        //$dado = mysqli_fetch_array($result);
	$row = count($dados);

		for ($i=0; $i < count($dados); $i++) { 
				foreach ($dados[$i] as $key => $value) {
				}

				
				$paciente = $dados[$i]['paciente'];
				$medico = $dados[$i]['medico'];
				$data = $dados[$i]['data'];
				$atestado = $dados[$i]['atestado'];
				$hora = $dados[$i]['hora'];
				
				$data2 = implode('/', array_reverse(explode('-', $data)));



				//BUSCAR O NOME DO MEDICO
				$res_medico = $pdo->query("select * from medicos where id = '$medico'");
				$dados_medico = $res_medico->fetchAll(PDO::FETCH_ASSOC);
				$nome_medico = $dados_medico[0]['nome'];
				$crm = $dados_medico[0]['crm'];

				//BUSCAR O NOME DO MEDICO
				$res_paciente = $pdo->query("select * from pacientes where id = '$paciente'");
				$dados_paciente = $res_paciente->fetchAll(PDO::FETCH_ASSOC);
				$nome_paciente = $dados_paciente[0]['nome'];
				$cpf_paciente = $dados_paciente[0]['cpf'];




				
   }  ?>



   <div class="area-texto">
   		Atesto para os devidos fins, que o Sr. <?php echo $nome_paciente ?>, inscrito no CPF n.º <?php echo $cpf_paciente ?>, foi atendido no dia <?php echo $data2 ?> às <?php echo $hora ?> apresentando um quadro que o impossibilita realizar qualquer tipo de tarefa ou trabalho e necessita de <?php echo $atestado ?> dias de repouso.

   		<br><br><br>

   		<?php echo $cidade ?> - <?php echo $data2 ?><br>
		<?php echo $nome_medico ?> - CRM <?php echo $crm ?> <br><br>

		<div align="center">
		Assinatura do Médico<br><br>

		__________________________________________________________________________
		</div>
   </div>


	<hr>


	

	




	
</div>


<div class="footer">
	<p style="font-size:12px" align="center">Desenvolvido por Hugo Vasconcelos - Q-Cursos Networks</p> 
</div>


