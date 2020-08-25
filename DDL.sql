CREATE DATABASE Edux

USE Edux

CREATE TABLE Curso(
	IdCurso INT IDENTITY PRIMARY KEY NOT NULL,
	NomeCurso VARCHAR(100) NOT NULL
)

CREATE TABLE TipoUsuario(
	IdTipoUsuario INT IDENTITY PRIMARY KEY NOT NULL,
	Tipo VARCHAR(100) NOT NULL
)

CREATE TABLE Instituicao(
	IdInstituicao INT IDENTITY PRIMARY KEY NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Logradouro VARCHAR(100) NOT NULL,
	Numero VARCHAR(50) NOT NULL,
	Complemento VARCHAR(50) NOT NULL,
	Bairro VARCHAR(100) NOT NULL,
	Cidade VARCHAR(100) NOT NULL,
	UF VARCHAR(2) NOT NULL,
	CEP VARCHAR(50) NOT NULL
)

CREATE TABLE Usuario(
	IdUsuario INT IDENTITY PRIMARY KEY NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,

	IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario) NOT NULL,
	IdInstituicao INT FOREIGN KEY REFERENCES Instituicao(IdInstituicao) NOT NULL
)

CREATE TABLE Turma(
	IdTurma INT IDENTITY PRIMARY KEY NOT NULL,
	Numero VARCHAR(100) NOT NULL,
	Semestre VARCHAR(100) NOT NULL,
	Periodo VARCHAR (100) NOT NULL,

	IdCurso INT FOREIGN KEY REFERENCES Curso(IdCurso) NOT NULL
)

CREATE TABLE ProfTurma(
	IdProfTurma INT IDENTITY PRIMARY KEY NOT NULL,

	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	IdTurma INT FOREIGN KEY REFERENCES Turma(IdTurma) NOT NULL,
)

CREATE TABLE AlunoTurma(
	IdAlunoTurma INT IDENTITY PRIMARY KEY NOT NULL,

	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	IdTurma INT FOREIGN KEY REFERENCES Turma(IdTurma) NOT NULL,
)

CREATE TABLE Categoria(
	IdCategoria INT IDENTITY PRIMARY KEY NOT NULL,
	NivelCategoria INT NOT NULL,
	Descricao VARCHAR(20) NOT NULL
)

CREATE TABLE Objetivo(
	IdObjetivo INT IDENTITY PRIMARY KEY NOT NULL,
	Titulo VARCHAR(50) NOT NULL,
	Descricao VARCHAR(255) NOT NULL,
	DataLimite DATETIME NOT NULL,

	IdCategoria INT FOREIGN KEY REFERENCES Categoria(IdCategoria) NOT NULL,
	IdProfTurma INT FOREIGN KEY REFERENCES ProfTurma(IdProfTurma) NOT NULL
)

CREATE TABLE ObjetivoAluno(
	IdObjetivoAluno INT IDENTITY PRIMARY KEY NOT NULL,
	Nota INT DEFAULT 0,
	DataEntrega DATETIME
)

CREATE TABLE Post(
	IdPost INT IDENTITY PRIMARY KEY NOT NULL,
	Imagem IMAGE,
	Descriao VARCHAR(255) NOT NULL,
	Curtidas INT DEFAULT 0
)