<?php 
include('../../conexao.php');
$id = $_GET['id'];
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
        margin-bottom:30px;
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
    .pgto{
        margin:1px;
    }
    .dados{
        font-size:11px;
    }
</style>

<div class="cabecalho">
    <div class="row">
        <div class="col-sm-4">	
            <img src="../../img/logo-rel.jpg" width="250px">
        </div>
        <div class="col-sm-6">	
            <h3 class="titulo"><b>CLINICA SANTA RITA - </b></h3>
            <h6 class="titulo">Rua da Q-Cursos Networks Nº 1000, Centro - BH - MG - CEP 30555-555</h6>
        </div>
    </div>
</div>

<div class="container">
    <?php
        $res = $pdo->query("SELECT * from pacientes where id = '$id' order by nome asc");
        $dados = $res->fetchAll(PDO::FETCH_ASSOC);

        for ($i=0; $i < count($dados); $i++) { 
        foreach ($dados[$i] as $key => $value) {
        }

        $id = $dados[$i]['id'];	
        $nome = $dados[$i]['nome'];
        $cpf = $dados[$i]['cpf'];
        $rg = $dados[$i]['rg'];
        $telefone = $dados[$i]['telefone'];
        $email = $dados[$i]['email'];
        $idade = $dados[$i]['idade'];
        $civil = $dados[$i]['civil'];
        $sexo = $dados[$i]['sexo'];
        $endereco = $dados[$i]['endereco'];
        $obs = $dados[$i]['obs'];
        }             
    ?>
    <div class="row">
        <div class="col-sm-3">	
            <?php 
                if($sexo == 'Masculino'){
                        echo '<img src="../../img/homem.jpg" width="150px">';
                }else{
                        echo '<img src="../../img/mulher.jpg" width="150px">';
                }
             ?>
        </div>
        <div class="col-sm-9">	
           <big><big><?php echo strtoupper($nome) ?></big></big><br>
           <span class="dados">Telefone: <?php echo $telefone ?> &nbsp; &nbsp; Email: <?php echo $email ?> </span><br>
           <span class="dados">Endereço: Rua Campo Belo 150 - Santa Monica - Belo Horizonte - MG </span><br>
           <span class="dados">CPF: <?php echo $cpf ?> &nbsp; &nbsp; RG: <?php echo $rg ?> </span><br>
           <span class="dados">Idade: <?php echo $idade ?> &nbsp; &nbsp; Sexo: <?php echo $sexo ?> &nbsp; &nbsp; Estado Cívil: <?php echo $civil ?> </span><br>
        </div>
    </div>
    <hr>
    <br><br>
    <table class="table">
        <tr bgcolor="#f9f9f9">
            <td style="font-size:12px"> <b>Observações</b> </td>
        </tr>
        <tr>
            <td style="font-size:12px"> <?php echo $obs; ?> </td>
        </tr>
    </table>
    <hr>
    <hr>
</div>
<div class="footer">
    <p style="font-size:12px" align="center">Desenvolvido por Fábio Soares - WSoluções</p> 
</div>


