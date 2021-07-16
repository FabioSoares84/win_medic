<?php $pagina = 'pacientes'; ?>
    <div class="row botao-novo">
        <div class="col-md-12">
            <a id="btn-novo" data-toggle="modal" data-target="#modal"></a>
            <a href="index.php?acao=<?php echo $pagina ?>&funcao=novo"  type="button" class="btn btn-secondary">Novo Paciente</a>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-6 col-sm-12">
            <form method="post">
                <div class="float-left">
                    <select onChange="submit();" class="form-control-sm" id="exampleFormControlSelect1" name="itens-pagina">
                        <?php 
                            if(isset($_POST['itens-pagina'])){
                                $item_paginado = $_POST['itens-pagina'];
                            }elseif(isset($_GET['itens'])){
                                $item_paginado = $_GET['itens'];
                            }
                        ?>
                        <option value="<?php echo @$item_paginado ?>"><?php echo @$item_paginado ?> Registros</option>
                            <?php if(@$item_paginado != $opcao1){ ?> 
                        <option value="<?php echo $opcao1 ?>"><?php echo $opcao1 ?> Registros</option> <?php } ?>
                            <?php if(@$item_paginado != $opcao2){ ?> 
                        <option value="<?php echo $opcao2 ?>"><?php echo $opcao2 ?> Registros</option> <?php } ?>
                            <?php if(@$item_paginado != $opcao3){ ?> 
                        <option value="<?php echo $opcao3 ?>"><?php echo $opcao3 ?> Registros</option> <?php } ?>
                    </select>
                </div>
            </form>
        </div>
        <div class="col-md-6 col-sm-12">
            <div class="float-right mr-4">
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control form-control-sm mr-sm-2" type="search" placeholder="Buscar Nome" aria-label="Search" name="txtbuscar">
                    <button class="btn btn-outline-secondary btn-sm my-2 my-sm-0" type="submit" name="<?php echo $pagina; ?>"><i class="fas fa-search"></i></button>
                </form>
            </div>
        </div>
    </div> 
    <table class="table table-sm mt-3">
	<thead class="thead-light">
            <tr>
                <th scope="col">Nome</th>
                <th scope="col">CPF</th>
                <th scope="col">Telefone</th>
                <th scope="col">Idade</th>
                <th scope="col">Ações</th>
            </tr>
	</thead>
	<tbody>
        <?php
            //DEFINIR O NUMERO DE ITENS POR PÁGINA
            if(isset($_POST['itens-pagina'])){
                $itens_por_pagina = $_POST['itens-pagina'];
                @$_GET['pagina'] = 0;
            }elseif(isset($_GET['itens'])){
                $itens_por_pagina = $_GET['itens'];
            }
            else{
                $itens_por_pagina = $opcao1;
            }
            //PEGAR A PÁGINA ATUAL
            $pagina_pag = intval(@$_GET['pagina']);
            $limite = $pagina_pag * $itens_por_pagina;
            //CAMINHO DA PAGINAÇÃO
            $caminho_pag = 'index.php?acao='.$pagina.'&';
            
            if(isset($_GET[$item4]) and $_GET['txtbuscar'] != ''){
            $nome_buscar = '%'.$_GET['txtbuscar'].'%';
            $res = $pdo->prepare("SELECT * from pacientes where nome LIKE :nome order by nome asc LIMIT $limite,$itens_por_pagina ");
            $res->bindValue(":nome", $nome_buscar);
            $res->execute();
            }else{
                $res = $pdo->query("SELECT * from pacientes order by nome desc LIMIT $limite, $itens_por_pagina");
            }
            $dados = $res->fetchAll(PDO::FETCH_ASSOC);

            //TOTALIZAR OS REGISTROS PARA PAGINAÇÃO
            $res_todos = $pdo->query("SELECT * from usuarios");
            $dados_total = $res_todos->fetchAll(PDO::FETCH_ASSOC);
            $num_total = count($dados_total);

            //DEFINIR O TOTAL DE PAGINAS
            $num_paginas = ceil($num_total/$itens_por_pagina);

    for ($i=0; $i < count($dados); $i++) { 
        foreach ($dados[$i] as $key => $value) {
        }
        $id       = $dados[$i]['id'];	
        $nome     = $dados[$i]['nome'];
        $cpf      = $dados[$i]['cpf'];
        $telefone = $dados[$i]['telefone'];
        $idade    = $dados[$i]['idade'];
        $linhas   = count($dados);
?>
        <tr>
            <td><?php echo $nome ?></td>
            <td><?php echo $cpf  ?></td>
            <td><?php echo $telefone ?></td>
            <td><?php echo $idade ?></td>
            <td>
                <a href="index.php?acao=<?php echo $pagina; ?>&funcao=editar&id=<?php echo $id ?>"><i class="fas fa-edit text-info"></i></a>
                <a href="index.php?acao=<?php echo $pagina; ?>&funcao=excluir&id=<?php echo $id ?>"><i class="far fa-trash-alt text-danger"></i></a>
            </td>
        </tr>
<?php } ?>

	</tbody>
</table>

<?php 
    //MOSTRAR A PÁGINAÇÃO SÓ SE NÃO HOUVER BUSCA
    if(!isset($_GET[$pagina])){ 
?>

<!--ÁREA DA PÁGINAÇÃO -->
<nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item">
              <a class="btn btn-outline-dark btn-sm mr-1" href="<?php echo $caminho_pag; ?>pagina=0&itens=<?php echo $itens_por_pagina ?>" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Previous</span>
              </a>
            </li>
            <?php 
            for($i=0;$i<$num_paginas;$i++){
            $estilo = "";
            if($pagina_pag == $i)
              $estilo = "active";
            ?>
             <li class="page-item"><a class="btn btn-outline-dark btn-sm mr-1 <?php echo $estilo; ?>" href="<?php echo $caminho_pag; ?>pagina=<?php echo $i; ?>&itens=<?php echo $itens_por_pagina ?>"><?php echo $i+1; ?></a></li>
          <?php } ?>
            
            <li class="page-item">
              <a class="btn btn-outline-dark btn-sm" href="<?php echo $caminho_pag; ?>pagina=<?php echo $num_paginas-1; ?>&itens=<?php echo $itens_por_pagina ?>" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
                <span class="sr-only">Next</span>
              </a>
            </li>
          </ul>
</nav>
<?php } ?>
       
    
    
    
<div id="listarFABIO">
</div>

<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
	<div class="modal-content">
            <div class="modal-header">
		<h5 class="modal-title" id="exampleModalLabel"><?php if(@$_GET['funcao'] == 'editar'){
                    $nome_botao = 'Editar';
                    $id_reg = $_GET['id'];
                    //BUSCAR DADOS DO REGISTRO A SER EDITADO
                    $res = $pdo->query("select * from pacientes where id = '$id_reg'");
                    $dados = $res->fetchAll(PDO::FETCH_ASSOC);
                    $nome = $dados[0]['nome'];
                    $cpf = $dados[0]['cpf'];
                    $rg = $dados[0]['rg'];
                    $telefone = $dados[0]['telefone'];
                    $email = $dados[0]['email'];
                    $data = $dados[0]['data_nasc'];
                    $idade = $dados[0]['idade'];
                    $civil = $dados[0]['civil'];
                    $sexo = $dados[0]['sexo'];
                    $endereco = $dados[0]['endereco'];
                    $obs = $dados[0]['obs'];
                    echo 'Edição de Paciente';
                    }else{
                        $nome_botao = 'Salvar';
                        echo 'Cadastro de Paciente';
                    } ?>
		</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
	    </div>
	    <div class="modal-body">
		<form method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
				<input type="hidden" id="id"  name="id" value="<?php echo @$id_reg ?>" required>
				<input type="hidden" id="campo_antigo"  name="campo_antigo" value="<?php echo @$cpf ?>" required>
				<label for="exampleFormControlInput1">Nome</label>
				<input type="text" class="form-control" id="nome" placeholder="Insira o Nome " name="nome" value="<?php echo @$nome ?>" required>
                            </div>
			</div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleFormControlInput1">CPF</label>
                                <input type="text" class="form-control" id="cpf" placeholder="Insira o CPF " name="cpf" value="<?php echo @$cpf ?>" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="exampleFormControlInput1">RG</label>
                                <input type="text" class="form-control" id="rg" placeholder="Insira o RG " name="rg" value="<?php echo @$rg ?>" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Telefone</label>
                                <input type="text" class="form-control" id="telefone" placeholder="Insira o Telefone " name="telefone" value="<?php echo @$telefone ?>" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Email</label>
                                <input type="email" class="form-control" id="telefone" placeholder="Insira o Email " name="email" value="<?php echo @$email ?>" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
			<div class="col-md-4">
                            <label for="exampleFormControlSelect1">Estado Civil</label>
                            <select class="form-control" id="" name="civil">
                                <?php 
                                if(@$_GET['funcao'] == 'editar'){
                                        echo '<option value="'.$civil.'">'.$civil.'</option>';
                                }
                                ?>
                                <?php if($civil != 'Solteiro') echo '<option value="Solteiro">Solteiro</option>'; ?>
                                <?php if($civil != 'Casado') echo '<option value="Casado">Casado</option>'; ?>
                                <?php if($civil != 'Viúvo') echo '<option value="Viúvo">Viúvo</option>'; ?>
                            </select>
			</div>
			<div class="col-md-4">
                            <label for="exampleFormControlSelect1">Sexo</label>
                            <select class="form-control" id="" name="sexo">
                                <?php 
                                if(@$_GET['funcao'] == 'editar'){
                                    echo '<option value="'.$sexo.'">'.$sexo.'</option>';
                                }
                                ?>
                                <?php if($sexo != 'Feminino') echo '<option value="Feminino">Feminino</option>'; ?>
                                <?php if($sexo != 'Masculino') echo '<option value="Masculino">Masculino</option>'; ?>
                            </select>
			</div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="exampleFormControlInput1">Data Nascimento</label>
                                <input type="date" class="form-control" id="data" name="data" value="<?php echo @$data ?>" required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Endereço</label>
                        <input type="text" class="form-control" id="endereco" placeholder="Insira o Endereço " name="endereco" value="<?php echo @$endereco ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Observações</label>
                        <textarea  class="form-control" id="obs" name="obs" maxlength="350"><?php echo 	@$obs; ?></textarea>
                    </div>
                    <div id="mensagem" class="">
                    </div>
            </div>
            <div class="modal-footer">
                <button id="btn-fechar" type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="submit" name="<?php echo $nome_botao ?>" id="<?php echo $nome_botao ?>" class="btn btn-primary"><?php echo $nome_botao ?></button>
            </div>
	</form>
	</div>
    </div>
</div>
<!--CHAMADA DA MODAL NOVO -->
<?php 
if(@$_GET['funcao'] == 'novo' && @$item_paginado == ''){ 
	?>
	<script>$('#btn-novo').click();</script>
<?php } ?>
<!--CHAMADA DA MODAL EDITAR -->
<?php 
if(@$_GET['funcao'] == 'editar' && @$item_paginado == ''){ 
	
	?>
	<script>$('#btn-novo').click();</script>
<?php } ?>
<!--CHAMADA DA MODAL DELETAR -->
<?php 
if(@$_GET['funcao'] == 'excluir' && @$item_paginado == ''){ 
	$id = $_GET['id'];
	?>
	<div class="modal" id="modal-deletar" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
		<div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Excluir Registro</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Deseja realmente Excluir este Registro?</p>
                    </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn-cancelar-excluir">Cancelar</button>
                            <form method="post">
                                    <input type="hidden" id="id"  name="id" value="<?php echo @$id ?>" required>
                                    <button type="button" id="btn-deletar" name="btn-deletar" class="btn btn-danger">Excluir</button>
                            </form>
                        </div>
		</div>
            </div>
	</div>
<?php } ?>

<script>$('#modal-deletar').modal("show");</script>
<!--MASCARAS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
<script src="../js/mascaras.js"></script>
<!--AJAX PARA INSERÇÃO DOS DADOS -->
<script type="text/javascript">
	$(document).ready(function(){
		var pag = "<?=$pagina?>";
		$('#Salvar').click(function(event){
			event.preventDefault();
			$.ajax({
				url: pag + "/inserir.php",
				method: "post",
				data: $('form').serialize(),
				dataType: "text",
				success: function(mensagem){
					$('#mensagem').removeClass()
					if(mensagem == 'Cadastrado com Sucesso!!'){
						$('#mensagem').addClass('mensagem-sucesso')
						$('#nome').val('')
						$('#cpf').val('')
						$('#telefone').val('')
						$('#crm').val('')
						$('#email').val('')
						$('#txtbuscar').val('')
						$('#btn-buscar').click();
						//$('#btn-fechar').click();
					}else{
						$('#mensagem').addClass('mensagem-erro')
					}
					$('#mensagem').text(mensagem)
				},
			})
		})
	})
</script>
<!--AJAX PARA BUSCAR OS DADOS -->
<script type="text/javascript">
	$(document).ready(function(){
		var pag = "<?=$pagina?>";
		$('#btn-buscar').click(function(event){
			event.preventDefault();	
			$.ajax({
				url: pag + "/listar.php",
				method: "post",
				data: $('form').serialize(),
				dataType: "html",
				success: function(result){
					$('#listar').html(result)
				},
			})
		})
	})
</script>
<!--AJAX PARA LISTAR OS DADOS -->
<script type="text/javascript">
	$(document).ready(function(){
		var pag = "<?=$pagina?>";
		$.ajax({
			url: pag + "/listar.php",
			method: "post",
			data: $('#frm').serialize(),
			dataType: "html",
			success: function(result){
				$('#listar').html(result)
			},
		})
	})
</script>
<!--AJAX PARA BUSCAR OS DADOS PELA TXT -->
<script type="text/javascript">
	$('#txtbuscar').keyup(function(){
		$('#btn-buscar').click();
	})
</script>
<!--AJAX PARA EDIÇÃO DOS DADOS -->
<script type="text/javascript">
	$(document).ready(function(){
		var pag = "<?=$pagina?>";
		$('#Editar').click(function(event){
			event.preventDefault();
			$.ajax({
				url: pag + "/editar.php",
				method: "post",
				data: $('form').serialize(),
				dataType: "text",
				success: function(mensagem){
					$('#mensagem').removeClass()
					if(mensagem == 'Editado com Sucesso!!'){
						$('#mensagem').addClass('mensagem-sucesso')
						$('#txtbuscar').val('')
						$('#btn-buscar').click();
						$('#btn-fechar').click();
					}else{
						
						$('#mensagem').addClass('mensagem-erro')
					}
					$('#mensagem').text(mensagem)
				},
			})
		})
	})
</script>
<!--AJAX PARA EXCLUSÃO DOS DADOS -->
<script type="text/javascript">
    $(document).ready(function(){
        var pag = "<?=$pagina?>";
        $('#btn-deletar').click(function(event){
            event.preventDefault();
            $.ajax({
                url: pag + "/excluir.php",
                method: "post",
                data: $('form').serialize(),
                dataType: "text",
                success: function(mensagem){
                    $('#txtbuscar').val('')
                    $('#btn-buscar').click();
                    $('#btn-cancelar-excluir').click();
                },
            })
        })
    })
</script>



