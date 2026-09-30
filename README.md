"# atividade1-bcd"
🗄️ Banco de Dados — bcd_segundoEx
📋 Descrição

Este projeto consiste na criação de um banco de dados utilizando MySQL, desenvolvido para armazenar informações de clientes, produtos e vendas.

O banco de dados possui três tabelas principais:

👤 bcd_cliente — armazena os dados dos clientes;
📦 bcd_produto — armazena os dados dos produtos;
🛒 bcd_venda — registra as vendas relacionando clientes e produtos.
🛠️ Tecnologias utilizadas
MySQL
SQL
MySQL Workbench ou outro gerenciador de banco de dados compatível
🗂️ Estrutura do banco

O banco de dados utilizado no projeto é:

CREATE DATABASE bcd_segundoEx;

Depois, o banco é selecionado com:

USE bcd_segundoEx;
📊 Tabelas
👤 Tabela bcd_cliente

Armazena as informações dos clientes.

Campo	Tipo	Descrição
id_cliente	INT	Identificador único do cliente
nome_cliente	VARCHAR(100)	Nome do cliente
email_cliente	VARCHAR(100)	E-mail do cliente
tel	INT	Telefone do cliente

O campo id_cliente é a chave primária da tabela.

CREATE TABLE bcd_cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) NOT NULL,
    tel INT NOT NULL
);

O e-mail também possui uma restrição UNIQUE, evitando e-mails repetidos:

ALTER TABLE bcd_cliente
ADD CONSTRAINT uk_bcd_cliente_unico
UNIQUE (email_cliente);
📦 Tabela bcd_produto

Armazena as informações dos produtos.

Campo	Tipo	Descrição
id_produto	INT	Identificador único do produto
nome_produto	VARCHAR(100)	Nome do produto
preco_produto	DECIMAL(10,2)	Preço do produto
dt_entrega	DATE	Data de entrega
qtd	INT	Quantidade disponível
CREATE TABLE bcd_produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco_produto DECIMAL(10,2),
    dt_entrega DATE NOT NULL,
    qtd INT NOT NULL
);

O nome do produto possui uma restrição UNIQUE, evitando produtos com o mesmo nome:

ALTER TABLE bcd_produto
ADD CONSTRAINT uk_bcd_produto_unico
UNIQUE (nome_produto);
🛒 Tabela bcd_venda

A tabela bcd_venda registra as vendas realizadas.

Campo	Tipo	Descrição
id_venda	INT	Identificador da venda
id_cliente	INT	Cliente relacionado à venda
id_produto	INT	Produto relacionado à venda
dt_entrada	DATE	Data de entrada da venda
CREATE TABLE bcd_venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    dt_entrada DATE NOT NULL
);
🔗 Relacionamentos

A tabela bcd_venda possui relacionamento com as tabelas bcd_cliente e bcd_produto.

Cliente → Venda
ALTER TABLE bcd_venda
ADD CONSTRAINT fk_bcd_venda_cliente
FOREIGN KEY (id_cliente)
REFERENCES bcd_cliente(id_cliente);

Isso significa que cada venda está relacionada a um cliente cadastrado.

Produto → Venda
ALTER TABLE bcd_venda
ADD CONSTRAINT fk_bcd_venda_produto
FOREIGN KEY (id_produto)
REFERENCES bcd_produto(id_produto);

Isso significa que cada venda está relacionada a um produto cadastrado.

📌 Modelo do relacionamento
bcd_cliente
     │
     │ 1
     │
     │ N
     ▼
 bcd_venda
     ▲
     │ N
     │
     │ 1
     │
bcd_produto 
