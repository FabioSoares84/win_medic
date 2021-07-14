DROP TABLE IF EXISTS atendimentos;

CREATE TABLE `atendimentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO atendimentos VALUES("2","Consulta","70.00");
INSERT INTO atendimentos VALUES("3","Consulta Psicóloga","60.00");
INSERT INTO atendimentos VALUES("5","Consulta Oftamologista","80.00");


DROP TABLE IF EXISTS cargos;

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO cargos VALUES("1","Balconista");
INSERT INTO cargos VALUES("2","Caixa");
INSERT INTO cargos VALUES("3","Faxineira");
INSERT INTO cargos VALUES("4","Enfermeira");
INSERT INTO cargos VALUES("7","Recepcionista");
INSERT INTO cargos VALUES("8","Tesoureiro");
INSERT INTO cargos VALUES("10","Médico");
INSERT INTO cargos VALUES("11","Farmáceutico");


DROP TABLE IF EXISTS chamadas;

CREATE TABLE `chamadas` (
  `id` int(11) NOT NULL,
  `paciente` varchar(40) NOT NULL,
  `consultorio` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO chamadas VALUES("1","Sem Paciente",NULL,"Aguardando");


DROP TABLE IF EXISTS consultas;

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `paciente` int(11) NOT NULL,
  `tipo_atendimento` int(11) NOT NULL,
  `medico` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `pgto_confirmado` varchar(5) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `atestado` int(11) DEFAULT NULL,
  `prescricao` varchar(10) DEFAULT NULL,
  `receita` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT INTO consultas VALUES("1","0000-00-00","00:00:00","2","3",NULL,"2500.00","Sim",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("2","2020-03-17","12:00:00","1","1","2","120.00","Sim",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("3","2020-03-17","18:00:00","2","2","2","60.00","Sim","Finalizada",NULL,NULL,NULL);
INSERT INTO consultas VALUES("4","2020-03-17","19:00:00","2","1","2","120.00","Sim",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("5","2020-03-19","15:00:00","4","1","2","120.00","Sim","Finalizada",NULL,NULL,NULL);
INSERT INTO consultas VALUES("6","2020-03-19","12:00:00","3","2","2","60.00","Sim","Aguardando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("7","2020-03-19","14:00:00","4","1","2","120.00","Sim","Aguardando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("8","2020-03-19","16:00:00","4","2","2","60.00","Sim","Aguardando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("9","2020-03-19","08:00:00","2","1","2","120.00","Sim","Aguardando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("10","2020-03-19","16:00:00","2","2","1","60.00","Sim","Aguardando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("11","2020-03-19","11:00:00","1","1","1","120.00","Sim","Aguardando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("12","2020-03-19","18:00:00","3","1","1","120.00","Sim","Aguardando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("13","2020-03-19","11:00:00","3","2","2","60.00","Não",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("14","2020-03-23","15:00:00","1","3","2","2500.00","Sim","Finalizada",NULL,NULL,NULL);
INSERT INTO consultas VALUES("15","2020-03-23","12:00:00","3","1","1","120.00","Sim","Finalizada",NULL,NULL,NULL);
INSERT INTO consultas VALUES("16","2020-03-23","15:00:00","4","1","1","120.00","Sim","Finalizada",NULL,NULL,NULL);
INSERT INTO consultas VALUES("17","2020-03-23","11:00:00","2","1","2","120.00","Sim","Aguardando","6",NULL,NULL);
INSERT INTO consultas VALUES("18","2020-03-23","14:00:00","2","3","2","2500.00","N�o",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("19","2020-03-23","13:00:00","4","3","2","2500.00","Sim","Aguardando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("20","2020-03-23","13:00:00","4","1","1","120.00","Sim","Consultando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("21","2020-03-23","18:00:00","1","1","1","120.00","Sim","Aguardando","6",NULL,NULL);
INSERT INTO consultas VALUES("22","2020-03-24","14:00:00","1","1","2","120.00","Sim","Aguardando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("23","2020-03-24","16:00:00","2","2","2","60.00","Sim","Aguardando",NULL,NULL,NULL);
INSERT INTO consultas VALUES("24","2020-03-24","12:00:00","3","3","1","2500.00","Sim","Aguardando","3",NULL,"Sim");
INSERT INTO consultas VALUES("25","2020-03-24","11:00:00","4","1","1","120.00","Sim","Finalizada","6","Sim","Sim");
INSERT INTO consultas VALUES("26","2020-04-23","08:00:00","5","5","2","60.00","Não",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("27","2020-04-23","09:00:00","6","1","2","120.00","Não",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("28","2020-04-24","14:00:00","5","5","2","60.00","Não",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("29","2020-04-24","16:00:00","4","2","2","60.00","Não",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("30","2020-04-25","11:00:00","6","5","1","60.00","Não",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("31","2020-04-27","08:00:00","6","5","15","60.00","Não",NULL,NULL,NULL,NULL);
INSERT INTO consultas VALUES("32","2020-04-27","15:00:00","5","2","11","70.00","Não",NULL,NULL,NULL,NULL);


DROP TABLE IF EXISTS contas_pagar;

CREATE TABLE `contas_pagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(40) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `pagamento` date DEFAULT NULL,
  `pago` varchar(5) NOT NULL,
  `funcionario` varchar(20) NOT NULL,
  `foto` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO contas_pagar VALUES("1","Luz","980.00","2020-03-17","2020-03-17","Sim","000.000.000-00","conta2.jpg");
INSERT INTO contas_pagar VALUES("2","Agua","680.00","2020-03-17","2020-03-17","Sim","000.000.000-00","conta3.jpg");
INSERT INTO contas_pagar VALUES("3","Conta de Telefone","690.00","2020-03-18",NULL,"N�o","000.000.000-00","conta.jpg");
INSERT INTO contas_pagar VALUES("5","Telefone","1200.00","2020-03-17","2020-03-17","Sim","000.000.000-00","conta.jpg");
INSERT INTO contas_pagar VALUES("6","Vidra�aria","1800.00","2020-03-17",NULL,"N�o","000.000.000-00","sem-foto.png");
INSERT INTO contas_pagar VALUES("7","Compra de Cadeiras","1200.00","2020-03-17",NULL,"N�o","000.000.000-00","conta2.jpg");
INSERT INTO contas_pagar VALUES("8","Compra de Rem�dios","16.00","2020-03-18","2020-03-18","Sim","000.000.000-00","sem-foto.png");
INSERT INTO contas_pagar VALUES("9","Compra de Rem�dios","24.00","2020-03-18",NULL,"N�o","999.999.999-80","sem-foto.png");
INSERT INTO contas_pagar VALUES("10","Compra de Rem�dios","16.00","2020-03-18",NULL,"N�o","777.777.777-80","sem-foto.png");
INSERT INTO contas_pagar VALUES("11","Compra de Materiais","400.00","2020-03-19","2020-03-19","Sim","000.000.000-00","sem-foto.png");
INSERT INTO contas_pagar VALUES("13","Compra de Remédios","30.00","2020-03-19","2020-03-19","Sim","000.000.000-00","sem-foto.png");
INSERT INTO contas_pagar VALUES("14","Pagamento Eletrecista","400.00","2020-03-19","2020-03-19","Sim","000.000.000-00","sem-foto.png");
INSERT INTO contas_pagar VALUES("15","Compra de Remédios","18.00","2020-03-19",NULL,"Não","777.777.777-80","sem-foto.png");


DROP TABLE IF EXISTS contas_receber;

CREATE TABLE `contas_receber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `data_baixa` date DEFAULT NULL,
  `forma_pgto` varchar(25) DEFAULT NULL,
  `tipo_pgto` varchar(30) DEFAULT NULL,
  `tesoureiro` varchar(30) DEFAULT NULL,
  `id_consulta` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT INTO contas_receber VALUES("1","3","2500.00","2020-03-17","2020-03-17","Dinheiro","A Vista","000.000.000-00","1");
INSERT INTO contas_receber VALUES("2","1","120.00","2020-03-17","2020-03-17","Dinheiro","A Vista","000.000.000-00","2");
INSERT INTO contas_receber VALUES("3","2","60.00","2020-03-17","2020-03-17","Conv�nio","Unimed","000.000.000-00","3");
INSERT INTO contas_receber VALUES("4","1","120.00","2020-03-17","2020-03-17","Conv�nio","Unimed","000.000.000-00","4");
INSERT INTO contas_receber VALUES("5","1","120.00","2020-03-19","2020-03-19","Dinheiro","A Vista","000.000.000-00","5");
INSERT INTO contas_receber VALUES("6","2","60.00","2020-03-19","2020-03-19","Dinheiro","A Vista","000.000.000-00","6");
INSERT INTO contas_receber VALUES("7","1","120.00","2020-03-19","2020-03-19","Dinheiro","A Vista","000.000.000-00","7");
INSERT INTO contas_receber VALUES("8","2","60.00","2020-03-19","2020-03-19","Dinheiro","A Vista","000.000.000-00","8");
INSERT INTO contas_receber VALUES("9","1","120.00","2020-03-19","2020-03-19","Dinheiro","A Vista","000.000.000-00","9");
INSERT INTO contas_receber VALUES("10","2","60.00","2020-03-19","2020-03-19","Dinheiro","A Vista","000.000.000-00","10");
INSERT INTO contas_receber VALUES("11","1","120.00","2020-03-19","2020-03-19","Dinheiro","A Vista","000.000.000-00","11");
INSERT INTO contas_receber VALUES("12","1","120.00","2020-03-19","2020-03-19","Convênio","Unimed","000.000.000-00","12");
INSERT INTO contas_receber VALUES("13","2","60.00","2020-03-19",NULL,NULL,NULL,NULL,"13");
INSERT INTO contas_receber VALUES("14","3","2500.00","2020-03-23","2020-03-23","Dinheiro","A Vista","000.000.000-00","14");
INSERT INTO contas_receber VALUES("15","1","120.00","2020-03-23","2020-03-23","Conv�nio","Unimed","000.000.000-00","15");
INSERT INTO contas_receber VALUES("16","1","120.00","2020-03-23","2020-03-23","Dinheiro","A Vista","000.000.000-00","16");
INSERT INTO contas_receber VALUES("17","1","120.00","2020-03-23","2020-03-23","Dinheiro","A Vista","000.000.000-00","17");
INSERT INTO contas_receber VALUES("18","3","2500.00","2020-03-23",NULL,NULL,NULL,NULL,"18");
INSERT INTO contas_receber VALUES("19","3","2500.00","2020-03-23","2020-03-23","Dinheiro","A Vista","000.000.000-00","19");
INSERT INTO contas_receber VALUES("20","1","120.00","2020-03-23","2020-03-23","Dinheiro","A Vista","000.000.000-00","20");
INSERT INTO contas_receber VALUES("21","1","120.00","2020-03-23","2020-03-23","Dinheiro","Unimed","000.000.000-00","21");
INSERT INTO contas_receber VALUES("22","1","120.00","2020-03-24","2020-03-24","Dinheiro","A Vista","000.000.000-00","22");
INSERT INTO contas_receber VALUES("23","2","60.00","2020-03-24","2020-03-24","Dinheiro","A Vista","000.000.000-00","23");
INSERT INTO contas_receber VALUES("24","3","2500.00","2020-03-24","2020-03-24","Dinheiro","A Vista","000.000.000-00","24");
INSERT INTO contas_receber VALUES("25","1","120.00","2020-03-24","2020-03-24","Dinheiro","A Vista","000.000.000-00","25");
INSERT INTO contas_receber VALUES("26","5","60.00","2020-04-23",NULL,NULL,NULL,NULL,"26");
INSERT INTO contas_receber VALUES("27","1","120.00","2020-04-23",NULL,NULL,NULL,NULL,"27");
INSERT INTO contas_receber VALUES("28","5","60.00","2020-04-24",NULL,NULL,NULL,NULL,"28");
INSERT INTO contas_receber VALUES("29","2","60.00","2020-04-24",NULL,NULL,NULL,NULL,"29");
INSERT INTO contas_receber VALUES("30","5","60.00","2020-04-25",NULL,NULL,NULL,NULL,"30");
INSERT INTO contas_receber VALUES("31","5","60.00","2020-04-27",NULL,NULL,NULL,NULL,"31");
INSERT INTO contas_receber VALUES("32","2","70.00","2020-04-27",NULL,NULL,NULL,NULL,"32");


DROP TABLE IF EXISTS entradas_remedios;

CREATE TABLE `entradas_remedios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remedio` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `fornecedor` int(11) NOT NULL,
  `farmaceutico` varchar(20) NOT NULL,
  `nome_remedio` varchar(100) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO entradas_remedios VALUES("8","1","3","3.00","2","777.777.777-80","Dipirona L�quida","2020-03-18");
INSERT INTO entradas_remedios VALUES("9","2","4","4.00","2","777.777.777-80","Dipirona Comprimido","2020-03-18");
INSERT INTO entradas_remedios VALUES("10","2","4","4.00","2","777.777.777-80","Dipirona Comprimido","2020-03-18");
INSERT INTO entradas_remedios VALUES("11","2","12","2.00","2","999.999.999-80","Dipirona Comprimido","2020-03-18");
INSERT INTO entradas_remedios VALUES("12","1","8","2.00","2","777.777.777-80","Dipirona L�quida","2020-03-18");
INSERT INTO entradas_remedios VALUES("13","4","6","5.00","2","777.777.777-80","Aspirina","2020-03-19");
INSERT INTO entradas_remedios VALUES("14","4","6","3.00","2","777.777.777-80","Aspirina","2020-03-19");


DROP TABLE IF EXISTS especializacoes;

CREATE TABLE `especializacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO especializacoes VALUES("1","Pediatra");
INSERT INTO especializacoes VALUES("3","Ortopedista");
INSERT INTO especializacoes VALUES("4","Clínico Geral");
INSERT INTO especializacoes VALUES("5","Cirugião");
INSERT INTO especializacoes VALUES("6","Clinico Geral Gastro");
INSERT INTO especializacoes VALUES("7","Clinico Geral Angiologista");
INSERT INTO especializacoes VALUES("8","Dermatologista");
INSERT INTO especializacoes VALUES("9","Neurologista");
INSERT INTO especializacoes VALUES("10","Psiquiatra");
INSERT INTO especializacoes VALUES("11","Endocrinologista");
INSERT INTO especializacoes VALUES("12","Oftalmologista");
INSERT INTO especializacoes VALUES("13","Cardiologista");
INSERT INTO especializacoes VALUES("14","Ginicologista");
INSERT INTO especializacoes VALUES("15","Otorrino");


DROP TABLE IF EXISTS fornecedores;

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  `remedios` varchar(350) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO fornecedores VALUES("2","Matheus Silva","(33) 33333-3333","mateus@hotmail.com","Dipirona, Aspirina");


DROP TABLE IF EXISTS funcionarios;

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

INSERT INTO funcionarios VALUES("2","Bruna Caroline da Costa",NULL,NULL,NULL,"Medico");
INSERT INTO funcionarios VALUES("3","Recepcionista2","444.444.444-44","(44) 44444-4444","recepcionista2@gmail.com","Recepcionista");
INSERT INTO funcionarios VALUES("4","Recepcionista1","999.999.999-99","(99) 99999-9999","recepcionista@gmail.com","Recepcionista");
INSERT INTO funcionarios VALUES("6","Tesoureiro","000.000.000-00","(88) 88888-8888","tesoureiro@gmail.com","Tesoureiro");
INSERT INTO funcionarios VALUES("10","Thiago Paulo","444.445.666-66","(66) 66666-6666","thiago@hotmail.com","Balconista");
INSERT INTO funcionarios VALUES("11","Marcela Santos","544.545.445-45","(55) 55555-5555","marcelas@hotmail.com","Enfermeira");
INSERT INTO funcionarios VALUES("12","Patricia Silva","245.545.454-54","(45) 45454-5454","pat@hotmail.com","Caixa");
INSERT INTO funcionarios VALUES("13","Antonieta","222.222.222-26","(55) 55555-5555","anton@hotmail.com","Faxineira");
INSERT INTO funcionarios VALUES("17","Mauro Santos","999.999.999-80","(55) 55555-5555","mauro@hotmail.com","Farmáceutico");
INSERT INTO funcionarios VALUES("18","Gabriel Silva","777.777.777-80","(33) 33333-3344","gabriel@hotmail.com","Farmáceutico");
INSERT INTO funcionarios VALUES("19","recepcionista","000.938.021-37","(67) 99223-0567","recepcionista@gmail.com","Recepcionista");
INSERT INTO funcionarios VALUES("20","Jonas Escorcio Neto","123.188.888-82",NULL,NULL,"Medico");
INSERT INTO funcionarios VALUES("21","Marcelo Alves higa","1","(67) 77777-7777",NULL,"Medico");
INSERT INTO funcionarios VALUES("22","Francine","2","(22) 22222-2222",NULL,"Medico");
INSERT INTO funcionarios VALUES("23","Sergio Candido da Silva","23","(23) 33333-3333",NULL,"Medico");
INSERT INTO funcionarios VALUES("24","Natalia Dias Afonso","5","(55) 55555-5555",NULL,"Medico");
INSERT INTO funcionarios VALUES("25","Donald Remberto Pereira","9","(99) 99999-9999",NULL,"Medico");
INSERT INTO funcionarios VALUES("26","katherine Lizot","3","(33) 33333-3333",NULL,"Medico");
INSERT INTO funcionarios VALUES("27","Sabrina Cassia Bernardo","4","(44) 44444-4444",NULL,"Medico");
INSERT INTO funcionarios VALUES("28","Amaury Bitencout","6","(68) 88888-8888",NULL,"Medico");
INSERT INTO funcionarios VALUES("30","Marcos Paulo Tiguman","343.4","(22) 22222-2222",NULL,"Medico");
INSERT INTO funcionarios VALUES("31","Jorge Menezes de Almeida","233.2","(67) 77777-7777",NULL,"Medico");
INSERT INTO funcionarios VALUES("32","kellen Santiago Lopes","777.7","(67) 77777-7777",NULL,"Medico");
INSERT INTO funcionarios VALUES("33","Thiago","656.5","(67) 77777-7777",NULL,"Medico");


DROP TABLE IF EXISTS medicos;

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `especialidade` int(11) NOT NULL,
  `crm` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `consultorio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO medicos VALUES("2","Bruna Caroline da Costa","4",NULL,NULL,NULL,NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("3","Jonas Escorcio Neto","7","12323","123.188.888-82",NULL,NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("4","Marcelo Alves higa","6","1","1","(67) 77777-7777",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("5","Francine","8","2","2","(22) 22222-2222",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("6","Sergio Candido da Silva","3","23","23","(23) 33333-3333",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("7","Natalia Dias Afonso","1","5","5","(55) 55555-5555",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("8","Donald Remberto Pereira","9","9","9","(99) 99999-9999",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("9","katherine Lizot","10","3","3","(33) 33333-3333",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("10","Sabrina Cassia Bernardo","10","4","4","(44) 44444-4444",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("11","Amaury Bitencout","11","6","6","(68) 88888-8888",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("12","Marcelo Roberto","12","32","32","(32) 22222-2222",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("13","Marcos Paulo Tiguman","5","2","343.4","(22) 22222-2222",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("14","Jorge Menezes de Almeida","5","123","233.2","(67) 77777-7777",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("15","kellen Santiago Lopes","14","7777","777.7","(67) 77777-7777",NULL,"Manhã",NULL);
INSERT INTO medicos VALUES("16","Thiago","15","555","656.5","(67) 77777-7777",NULL,"Manhã",NULL);


DROP TABLE IF EXISTS movimentacoes;

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(15) NOT NULL,
  `movimento` varchar(30) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tesoureiro` varchar(20) NOT NULL,
  `data` date NOT NULL,
  `id_movimento` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

INSERT INTO movimentacoes VALUES("1","Entrada","Consulta","2500.00","000.000.000-00","2020-03-17","1");
INSERT INTO movimentacoes VALUES("2","Entrada","Consulta","60.00","000.000.000-00","2020-03-17","3");
INSERT INTO movimentacoes VALUES("6","Sa�da","Pagamento Conta","1800.00","000.000.000-00","2020-03-17","6");
INSERT INTO movimentacoes VALUES("7","Entrada","Consulta","120.00","000.000.000-00","2020-03-17","4");
INSERT INTO movimentacoes VALUES("8","Sa�da","Pagamento Conta","1200.00","000.000.000-00","2020-03-17","7");
INSERT INTO movimentacoes VALUES("9","Sa�da","Pgto Funcion�rio","500.00","000.000.000-00","2020-03-17","7");
INSERT INTO movimentacoes VALUES("10","Sa�da","Pagamento Conta","1200.00","000.000.000-00","2020-03-17","5");
INSERT INTO movimentacoes VALUES("11","Sa�da","Pagamento Conta","16.00","000.000.000-00","2020-03-18","8");
INSERT INTO movimentacoes VALUES("12","Saída","Pagamento Conta","400.00","000.000.000-00","2020-03-19","11");
INSERT INTO movimentacoes VALUES("13","Entrada","Consulta","60.00","000.000.000-00","2020-03-19","6");
INSERT INTO movimentacoes VALUES("14","Entrada","Consulta","120.00","000.000.000-00","2020-03-19","5");
INSERT INTO movimentacoes VALUES("15","Entrada","Consulta","120.00","000.000.000-00","2020-03-19","12");
INSERT INTO movimentacoes VALUES("16","Entrada","Consulta","120.00","000.000.000-00","2020-03-19","11");
INSERT INTO movimentacoes VALUES("17","Entrada","Consulta","60.00","000.000.000-00","2020-03-19","10");
INSERT INTO movimentacoes VALUES("18","Entrada","Consulta","120.00","000.000.000-00","2020-03-19","9");
INSERT INTO movimentacoes VALUES("19","Entrada","Consulta","60.00","000.000.000-00","2020-03-19","8");
INSERT INTO movimentacoes VALUES("20","Entrada","Consulta","120.00","000.000.000-00","2020-03-19","7");
INSERT INTO movimentacoes VALUES("21","Saída","Pagamento Conta","400.00","000.000.000-00","2020-03-19","14");
INSERT INTO movimentacoes VALUES("22","Saída","Pagamento Conta","30.00","000.000.000-00","2020-03-19","13");
INSERT INTO movimentacoes VALUES("23","Entrada","Consulta","120.00","000.000.000-00","2020-03-23","16");
INSERT INTO movimentacoes VALUES("24","Entrada","Consulta","120.00","000.000.000-00","2020-03-23","15");
INSERT INTO movimentacoes VALUES("25","Entrada","Consulta","2500.00","000.000.000-00","2020-03-23","14");
INSERT INTO movimentacoes VALUES("26","Entrada","Consulta","120.00","000.000.000-00","2020-03-23","17");
INSERT INTO movimentacoes VALUES("27","Entrada","Consulta","120.00","000.000.000-00","2020-03-23","21");
INSERT INTO movimentacoes VALUES("28","Entrada","Consulta","120.00","000.000.000-00","2020-03-23","20");
INSERT INTO movimentacoes VALUES("29","Entrada","Consulta","2500.00","000.000.000-00","2020-03-23","19");
INSERT INTO movimentacoes VALUES("30","Entrada","Consulta","120.00","000.000.000-00","2020-03-24","25");
INSERT INTO movimentacoes VALUES("31","Entrada","Consulta","2500.00","000.000.000-00","2020-03-24","24");
INSERT INTO movimentacoes VALUES("32","Entrada","Consulta","60.00","000.000.000-00","2020-03-24","23");
INSERT INTO movimentacoes VALUES("33","Entrada","Consulta","120.00","000.000.000-00","2020-03-24","22");


DROP TABLE IF EXISTS pacientes;

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(35) NOT NULL,
  `data_nasc` date NOT NULL,
  `idade` int(11) NOT NULL,
  `civil` varchar(15) NOT NULL,
  `sexo` varchar(15) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `obs` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO pacientes VALUES("5","FABIO PEREIRA SOARES","000.938.021-37","001136051","(67) 99223-0567","WINSOARES@GMAIL.COM","1984-06-07","35","Casado","Masculino","Rua Maria Virgínia Pimentel","PRIMEIRO PACIENTE");
INSERT INTO pacientes VALUES("6","ADRIELLE MAYSA DE AQUINO","029.270.681-27","8888888888888","(67) 99258-4093","ADRIELE@GMAIL.COM","1990-11-01","29","Casado","Feminino","RUA MARIA VIRGINIA PIMENTEL","SEGUNDO CADASTRO");


DROP TABLE IF EXISTS pagamentos;

CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario` varchar(35) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tesoureiro` varchar(35) NOT NULL,
  `data` date NOT NULL,
  `nome_funcionario` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO pagamentos VALUES("3","245.545.454-54","1500.00","000.000.000-00","2020-03-18","Patricia Silva");
INSERT INTO pagamentos VALUES("4","544.545.445-45","2500.00","000.000.000-00","2020-03-17","Marcela Santos");
INSERT INTO pagamentos VALUES("5","333.333.333-33","20000.00","000.000.000-00","2020-03-14","Paula Campos");
INSERT INTO pagamentos VALUES("7","000.000.000-00","500.00","000.000.000-00","2020-03-17","Pedro Freitas");


DROP TABLE IF EXISTS prescricao;

CREATE TABLE `prescricao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_consulta` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `remedio` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

INSERT INTO prescricao VALUES("1","15","1","Dipirona Liquida");
INSERT INTO prescricao VALUES("3","15","3","Outro Remédio");
INSERT INTO prescricao VALUES("4","15","4","Teste");
INSERT INTO prescricao VALUES("5","15","5","testes");
INSERT INTO prescricao VALUES("6","15","6","testess");
INSERT INTO prescricao VALUES("7","15","7","aaa");
INSERT INTO prescricao VALUES("8","25","1","Dipirona");
INSERT INTO prescricao VALUES("18","21","1","Dipirona");
INSERT INTO prescricao VALUES("19","25","2","Aspirina");


DROP TABLE IF EXISTS receitas;

CREATE TABLE `receitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_consulta` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `remedio` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO receitas VALUES("1","25","1","Dipirona Liquida 200 ML dsfdaxxx");
INSERT INTO receitas VALUES("3","25","2","Soro xxxxxxxxx");
INSERT INTO receitas VALUES("4","24","1","Remédio do Item 1 da Receita");
INSERT INTO receitas VALUES("5","24","2","Remédio do Item 2 da Receita");
INSERT INTO receitas VALUES("7","24","3","Remédio do Item 3 da Receita");
INSERT INTO receitas VALUES("8","25","3","Remédio X ");


DROP TABLE IF EXISTS recepcionistas;

CREATE TABLE `recepcionistas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `turno` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO recepcionistas VALUES("1","Recepcionista2","444.444.444-44","(44) 44444-4444","recepcionista2@gmail.com","Tarde");
INSERT INTO recepcionistas VALUES("2","Recepcionista1","999.999.999-99","(99) 99999-9999","recepcionista@gmail.com","Manhã");


DROP TABLE IF EXISTS remedios;

CREATE TABLE `remedios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `estoque` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO remedios VALUES("2","Dipirona Comprimido","25 Comprimidos","17");
INSERT INTO remedios VALUES("4","Aspirina","13 Capsulas","9");
INSERT INTO remedios VALUES("5","Dipirona Líquida","200 ML",NULL);


DROP TABLE IF EXISTS saidas_remedios;

CREATE TABLE `saidas_remedios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remedio` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `farmaceutico` varchar(20) NOT NULL,
  `nome_remedio` varchar(100) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO saidas_remedios VALUES("1","2","1","11","777.777.777-80","Dipirona Comprimido","2020-03-18");
INSERT INTO saidas_remedios VALUES("3","4","3","11","777.777.777-80","Aspirina","2020-03-19");
INSERT INTO saidas_remedios VALUES("4","2","5","11","777.777.777-80","Dipirona Comprimido","2020-03-19");


DROP TABLE IF EXISTS tesoureiros;

CREATE TABLE `tesoureiros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(35) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `turno` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tesoureiros VALUES("2","Tesoureiro","000.000.000-00","(88) 88888-8888","tesoureiro@gmail.com","Manhã");


DROP TABLE IF EXISTS usuarios;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `usuario` varchar(40) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `senha_original` varchar(25) NOT NULL,
  `nivel` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

INSERT INTO usuarios VALUES("11","Administrador","adm@gmail.com","202cb962ac59075b964b07152d234b70","123","admin");
INSERT INTO usuarios VALUES("45","Recepcionista1","recepcionista1@gmail.com","202cb962ac59075b964b07152d234b70","123","Recepcionista");
INSERT INTO usuarios VALUES("46","Recepcionista2","recepcionista2@gmail.com","202cb962ac59075b964b07152d234b70","123","Recepcionista");
INSERT INTO usuarios VALUES("48","Pedro Freitas","tesoureiro@hotmail.com","645a8aca5a5b84527c57ee2f153f1946","123","Tesoureiro");
INSERT INTO usuarios VALUES("52","Farmaceutico","farmaceutico@gmail.com","202cb962ac59075b964b07152d234b70","123","Farmáceutico");
INSERT INTO usuarios VALUES("54","Tela","tela@gmail.com","202cb962ac59075b964b07152d234b70","123","Tela");
INSERT INTO usuarios VALUES("55","teste","teste@gmail.com","202cb962ac59075b964b07152d234b70","123","admin");


