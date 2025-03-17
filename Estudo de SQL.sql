CREATE DATABASE Modelagem_manha;

CREATE TABLE cliente(
cpf VARCHAR(11) PRIMARY KEY NOT NULL,
nome VARCHAR(11) NOT NULL,
telefone VARCHAR(11) NOT NULL
);

CREATE TABLE fabricante(
codigo INT PRIMARY KEY NOT NULL,
nome VARCHAR(200),
endereco VARCHAR(500)
);

CREATE TABLE produto(
codigo INT PRIMARY KEY NOT NULL,
nome VARCHAR(200),
fabricante INT,
CONSTRAINT cod_fabricante FOREIGN KEY (fabricante)
REFERENCES fabricante (codigo) 
);

CREATE TABLE estoque(
codigo INT PRIMARY KEY NOT NULL,
produto INT NOT NULL,
valor_compra DECIMAL (10,2) NOT NULL,
quantidade INT NOT NULL,
CONSTRAINT cod_produto FOREIGN KEY (produto)
REFERENCES produto(codigo)
);

CREATE TABLE venda(
codigo INT PRIMARY KEY NOT NULL,
cliente VARCHAR(11) NOT NULL,
data_hora DATE NOT NULL,
CONSTRAINT cod_cliente FOREIGN KEY (cliente)
REFERENCES cliente (cpf)
);

CREATE TABLE venda_produto(
codigo INT PRIMARY KEY NOT NULL,
produto INT NOT NULL,
venda INT NOT NULL,
valor_venda DECIMAL(10,2) NOT NULL,
CONSTRAINT cod_produto_venda FOREIGN KEY (produto)
REFERENCES produto(codigo),
CONSTRAINT cod_venda FOREIGN KEY (venda)
REFERENCES venda (codigo)
);