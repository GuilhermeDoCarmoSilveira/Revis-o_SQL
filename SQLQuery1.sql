CREATE DATABASE REVISAOSQL

GO

USE REVISAOSQL


GO

CREATE TABLE aluno (
	RA		int				not null,
	nome	varchar(100)	not null,
	idade	int				not null	CHECK(idade > 0)
	primary key(RA)
)

GO

CREATE TABLE curso (
	codigo		int				not null,
	nome		varchar(50)		not null,
	area		varchar(100)	not null
	primary key(codigo)
)

GO

CREATE TABLE disciplina (
	codigo			int				not null,
	nome			varchar(80)		not null,
	carga_horaria	int				not null CHECK(carga_horaria >= 32)
	primary key(codigo)
)

GO

CREATE TABLE aluno_disciplina (
	alunoRa					int		not null,
	disciplinaCodigo		int		not null
	primary key (alunoRa, disciplinaCodigo)
	foreign key (alunoRa) references aluno (RA),
	foreign key (disciplinaCodigo) references disciplina (codigo),
)

GO 

CREATE TABLE curso_disciplina (
	cursoCodigo			int		not null,
	disciplinaCodigo	int		not null
	primary key (cursoCodigo, disciplinaCodigo)
	foreign key (cursoCodigo) references curso (codigo),
	foreign key (disciplinaCodigo) references disciplina (codigo)
)

GO

CREATE TABLE titulacao (
	codigo			int				not null,
	titulo			varchar(40)		not null,
	primary key (codigo)
)

GO

CREATE TABLE professor (
	registro		int				not null,
	nome			varchar(100)	not null,
	titulacaoCodigo  int			not null
	primary key (registro)
	foreign key (titulacaoCodigo) references disciplina (codigo)
)

GO

CREATE TABLE disciplina_professor (
	disciplinaCodigo		int			not null,
	professorRegistro		int			not null
	primary key (disciplinaCodigo, professorRegistro)
	foreign key (professorRegistro) references professor (registro)

)

GO 

INSERT INTO aluno (RA, nome, idade) VALUES
(3416, 'DIEGO PIOVESAN DE RAMOS', 18),
(3423, 'LEONARDO MAGALHÃES DA ROSA', 17),
(3434, 'LUIZA CRISTINA DE LIMA MARTINELI', 20),
(3440, 'IVO ANDRÉ FIGUEIRA DA SILVA', 25),
(3443, 'BRUNA LUISA SIMIONI', 37),
(3448, 'THAÍS NICOLINI DE MELLO', 17),
(3457, 'LÚCIO DANIEL TÂMARA ALVES', 29),
(3459, 'LEONARDO RODRIGUES', 25),
(3465, 'ÉDERSON RAFAEL VIEIRA', 19),
(3466, 'DAIANA ZANROSSO DE OLIVEIRA', 21),
(3467, 'DANIELA MAURER', 23),
(3470, 'ALEX SALVADORI PALUDO', 42),
(3471, 'VINÍCIUS SCHVARTZ', 19),
(3472, 'MARIANA CHIES ZAMPIERI', 18),
(3482, 'EDUARDO CAINAN GAVSKI', 19),
(3483, 'REDNALDO ORTIZ DONEDA', 20),
(3499, 'MAYELEN ZAMPIERON', 22);

GO

INSERT INTO disciplina (codigo, Nome, carga_horaria) VALUES
(1, 'Laboratório de Banco de Dados', 80),
(2, 'Laboratório de Engenharia de Software', 80),
(3, 'Programação Linear e Aplicações', 80),
(4, 'Redes de Computadores', 80),
(5, 'Segurança da informação', 40),
(6, 'Teste de Software', 80),
(7, 'Custos e Tarifas Logísticas', 80),
(8, 'Gestão de Estoques', 40),
(9, 'Fundamentos de Marketing', 40),
(10, 'Métodos Quantitativos de Gestão', 80),
(11, 'Gestão do Tráfego Urbano', 80),
(12, 'Sistemas de Movimentação e Transporte', 40);

GO

INSERT INTO aluno_disciplina (disciplinaCodigo, alunoRa) VALUES
(1, 3416),
(4, 3416),
(1, 3423),
(2, 3423),
(5, 3423),
(6, 3423),
(2, 3434),
(5, 3434),
(6, 3434),
(1, 3440),
(5, 3443),
(6, 3443),
(4, 3448),
(5, 3448),
(6, 3448),
(2, 3457),
(4, 3457),
(5, 3457),
(6, 3457),
(1, 3459),
(6, 3459),
(7, 3465),
(11, 3465),
(8, 3466),
(11, 3466),
(8, 3467),
(12, 3467),
(8, 3470),
(9, 3470),
(11, 3470),
(12, 3470),
(7, 3471),
(7, 3472),
(12, 3472),
(9, 3482),
(11, 3482),
(8, 3483),
(11, 3483),
(12, 3483),
(8, 3499);


GO

INSERT INTO titulacao (codigo, titulo) VALUES
(1, 'Especialista'),
(2, 'Mestre'),
(3, 'Doutor');


GO

INSERT INTO professor (registro, nome, titulacaoCodigo) VALUES
(1111, 'Leandro', 2),
(1112, 'Antonio', 2),
(1113, 'Alexandre', 3),
(1114, 'Wellington', 2),
(1115, 'Luciano', 1),
(1116, 'Edson', 2),
(1117, 'Ana', 2),
(1118, 'Alfredo', 1),
(1119, 'Celio', 2),
(1120, 'Dewar', 3),
(1121, 'Julio', 1);


GO

INSERT INTO curso (codigo, nome, area) VALUES
(1, 'ADS', 'Ciências da Computação'),
(2, 'Logística', 'Engenharia Civil');

GO


INSERT INTO disciplina_professor(disciplinaCodigo, professorRegistro) VALUES
(1, 1111),
(2, 1112),
(3, 1113),
(4, 1114),
(5, 1115),
(6, 1116),
(7, 1117),
(8, 1118),
(9, 1117),
(10, 1119),
(11, 1120),
(12, 1121);

GO

INSERT INTO curso_disciplina (disciplinaCodigo, cursoCodigo) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2);

	
GO

--SELECTS

SELECT p.nome as Professor, d.nome as Disciplina
FROM disciplina d, professor p, disciplina_professor dp
WHERE d.codigo = dp.disciplinaCodigo
	  AND p.registro = dp.professorRegistro

GO

SELECT c.nome as Nome_do_Curso
FROM curso c , disciplina d, curso_disciplina cd
WHERE d.codigo = cd.disciplinaCodigo AND
	  c.codigo = cd.cursoCodigo AND
	  d.nome like '%lab%'

GO

SELECT c.area
FROM disciplina d, curso c, curso_disciplina cd
WHERE d.codigo = cd.disciplinaCodigo AND
	  c.codigo = cd.cursoCodigo AND
		d.nome like 'lab%'

GO

SELECT t.titulo
FROM professor p, disciplina d, disciplina_professor dp, titulacao t
WHERE d.codigo = dp.disciplinaCodigo AND
	  p.registro = dp.professorRegistro AND
	  t.codigo = p.titulacaoCodigo AND 
	  d.nome like '%Laboratório de Banco de Dados%'

GO

SELECT d.nome, COUNT(a.RA) as QtdAlunos
FROM disciplina d, aluno a, aluno_disciplina ad
WHERE a.RA = ad.alunoRa AND
	  d.codigo = ad.disciplinaCodigo
GROUP BY d.nome

GO

SELECT p.nome
FROM disciplina d, aluno a, aluno_disciplina ad, professor p, disciplina_professor dp
WHERE a.RA = ad.alunoRa AND
	  d.codigo = ad.disciplinaCodigo AND
	  p.registro = dp.professorRegistro AND
	  d.codigo = dp.disciplinaCodigo AND
	  d.nome like '%%'
GROUP BY p.nome
HAVING COUNT(a.RA) > 5

GO

SELECT c.nome, COUNT(P.registro) as Quantidade
FROM professor p, curso c, disciplina d, curso_disciplina cd, disciplina_professor dp
WHERE c.codigo = cd.cursoCodigo AND 
	  d.codigo = cd.disciplinaCodigo AND
	  d.codigo = dp.disciplinaCodigo AND
	  p.registro = dp.professorRegistro
GROUP BY c.nome