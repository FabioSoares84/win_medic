<?php
$agora = date('Y-m-d');
require_once("../conexaoPDO.php");
?>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset='utf-8' />
        <link href='css/clockpicker.css' rel='stylesheet' />
        <link href='css/main.css' rel='stylesheet' />
        <link href='css/personalizado.css' rel='stylesheet' />
        <link href='css/daygrid/main.css' rel='stylesheet' />
        <link href='css/timegrid/main.css' rel='stylesheet' />
        <link href='css/list/main.css' rel='stylesheet' />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src='js/core/main.js'></script>
        <script src='js/interaction/main.js'></script>
        <script src='js/daygrid/main.js'></script>
        <script src='js/timegrid/main.js'></script>
        <script src='js/list/main.js'></script>
        <script src='js/locales/locales-all.js'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
        <script src="js/personalizado.js"></script>
        <script src='js/clockpicker.js'></script>
    </head>
    <body>
        <div id='calendar'></div>
        <!-- Modal Agenda -->
        <div class="modal fade" id="visualizarConsulta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Consulta</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <dl class="row">
                            <dt class="col-sm-3">ID da Consulta</dt>
                            <dt class="col-md-9" id="id"></dt>
                            <dt class="col-sm-3">Titulo</dt>
                            <dt class="col-md-9" id="title"></dt>
                            <dt class="col-sm-3">Data Inicial</dt>
                            <dt class="col-md-9" id="start"></dt>
                            <dt class="col-sm-3">Data Final</dt>
                            <dt class="col-md-9" id="end"></dt>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Cadastrar -->
        <div class="modal fade" id="cadastrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Agendar Consulta</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                  <label for="inputState">Paciente:</label>
                                  <select id="inputState" class="form-control">
                                    <option selected>Choose...</option>
                                    <option>...</option>
                                  </select>
                                </div>
                                <div class="form-group col-md-12">
                                  <label for="inputState">Médico:</label>
                                  <select id="inputState" class="form-control">
                                    <option selected>Choose...</option>
                                    <option>...</option>
                                  </select>
                                </div>
                                
                                <div class="form-group col-md-12">
                                  <label for="inputState">Atendimento:</label>
                                  <select id="inputState" class="form-control">
                                    <option selected>Choose...</option>
                                    <option>...</option>
                                  </select>
                                </div>
                                
                                <div class="form-group col-md-12">
                                   <div class="text-center">
                                        <label for="inputState">Horas:</label>
                                        <input type="text" class="text-center clockpicker" data-placement="right" data-align="top" data-autoclose="true" readonly="" >
                                   </div>
                                </div>                                                             
<!--                            <div class="form-group col-md-6" align="center">
                                <label for="inputState">Horas:</label>
                                <input type="text" class="form-control clockpicker" data-placement="right" data-align="top" data-autoclose="true" readonly="" >
                                </div>-->                            
                                <script type="text/javascript">
                                $('.clockpicker').clockpicker();
                                </script>
                               
                            </div>
                        </form>
                       
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
