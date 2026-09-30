# 🗄️ Banco de Dados — bcd_segundoEx

## 📋 Descrição

Este projeto consiste na criação de um banco de dados utilizando **MySQL**, desenvolvido para armazenar informações de **clientes, produtos e vendas**.

O banco de dados possui três tabelas principais:

* 👤 `bcd_cliente` — armazena os dados dos clientes;
* 📦 `bcd_produto` — armazena os dados dos produtos;
* 🛒 `bcd_venda` — registra as vendas relacionando clientes e produtos.

---

## 🛠️ Tecnologias utilizadas

* **MySQL**
* **SQL**
* **MySQL Workbench** ou outro gerenciador de banco de dados compatível

---

## 🗂️ Estrutura do banco

O banco de dados utilizado no projeto é:

```sql
CREATE DATABASE bcd_segundoEx;
```

Depois, o banco é selecionado com:

```sql
USE bcd_segundoEx;
```

---

## 📊 Tabelas

### 👤 Tabela `bcd_cliente`

Armazena as informações dos clientes.

| Campo           | Tipo         | Descrição                      |
| --------------- | ------------ | ------------------------------ |
| `id_cliente`    | INT          | Identificador único do cliente |
| `nome_cliente`  | VARCHAR(100) | Nome do cliente                |
| `email_cliente` | VARCHAR(100) | E-mail do cliente              |
| `tel`           | INT          | Telefone do cliente            |

O campo `id_cliente` é a **chave primária** da tabela.

```sql
CREATE TABLE bcd_cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) NOT NULL,
    tel INT NOT NULL
);
```

O e-mail também possui uma restrição `UNIQUE`, evitando e-mails repetidos:

```sql
ALTER TABLE bcd_cliente
ADD CONSTRAINT uk_bcd_cliente_unico
UNIQUE (email_cliente);
```

---

### 📦 Tabela `bcd_produto`

Armazena as informações dos produtos.

| Campo           | Tipo          | Descrição                      |
| --------------- | ------------- | ------------------------------ |
| `id_produto`    | INT           | Identificador único do produto |
| `nome_produto`  | VARCHAR(100)  | Nome do produto                |
| `preco_produto` | DECIMAL(10,2) | Preço do produto               |
| `dt_entrega`    | DATE          | Data de entrega                |
| `qtd`           | INT           | Quantidade disponível          |

```sql
CREATE TABLE bcd_produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco_produto DECIMAL(10,2),
    dt_entrega DATE NOT NULL,
    qtd INT NOT NULL
);
```

O nome do produto possui uma restrição `UNIQUE`, evitando produtos com o mesmo nome:

```sql
ALTER TABLE bcd_produto
ADD CONSTRAINT uk_bcd_produto_unico
UNIQUE (nome_produto);
```

---

### 🛒 Tabela `bcd_venda`

A tabela `bcd_venda` registra as vendas realizadas.

| Campo        | Tipo | Descrição                   |
| ------------ | ---- | --------------------------- |
| `id_venda`   | INT  | Identificador da venda      |
| `id_cliente` | INT  | Cliente relacionado à venda |
| `id_produto` | INT  | Produto relacionado à venda |
| `dt_entrada` | DATE | Data de entrada da venda    |

```sql
CREATE TABLE bcd_venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    dt_entrada DATE NOT NULL
);
```

---

## 🔗 Relacionamentos

A tabela `bcd_venda` possui relacionamento com as tabelas `bcd_cliente` e `bcd_produto`.

### Cliente → Venda

```sql
ALTER TABLE bcd_venda
ADD CONSTRAINT fk_bcd_venda_cliente
FOREIGN KEY (id_cliente)
REFERENCES bcd_cliente(id_cliente);
```

Isso significa que cada venda está relacionada a um cliente cadastrado.

### Produto → Venda

```sql
ALTER TABLE bcd_venda
ADD CONSTRAINT fk_bcd_venda_produto
FOREIGN KEY (id_produto)
REFERENCES bcd_produto(id_produto);
```

Isso significa que cada venda está relacionada a um produto cadastrado.

### 📌 Modelo do relacionamento

```text
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
```

---

## 👥 Dados dos clientes

Foram cadastrados três clientes:

| ID | Nome   | E-mail                                      | Telefone |
| -: | ------ | ------------------------------------------- | -------- |
|  1 | Takeo  | [takeo@gmail.com](mailto:takeo@gmail.com)   | 9990128  |
|  2 | Julio  | [julio@gmail.com](mailto:julio@gmail.com)   | 124347   |
|  3 | Sayuri | [Sayuri@gmail.com](mailto:Sayuri@gmail.com) | 641735   |

Exemplo de inserção:

```sql
INSERT INTO bcd_cliente
(nome_cliente, email_cliente, tel)
VALUES
("Takeo", "takeo@gmail.com", "9990128");
```

Para consultar os clientes:

```sql
SELECT * FROM bcd_cliente;
```

---

## 📦 Dados dos produtos

Foram cadastrados três produtos:

| ID | Produto     |        Preço | Data de entrega | Quantidade |
| -: | ----------- | -----------: | --------------- | ---------: |
|  1 | Baggy Jeans |    R$ 200,45 | 30/09/2026      |       2000 |
|  2 | sandero     | R$ 50.000,99 | 23/10/2026      |          1 |
|  3 | Jersey y2k  |    R$ 150,89 | 01/11/2026      |       1902 |

Exemplo de inserção:

```sql
INSERT INTO bcd_produto
(nome_produto, dt_entrega, preco_produto, qtd)
VALUES
("Baggy Jeans", "2026-09-30", 200.45, 2000);
```

Para consultar os produtos:

```sql
SELECT * FROM bcd_produto;
```

---

## 🛍️ Dados das vendas

Foram registradas três vendas:

| ID Venda |    Cliente |         Produto | Data       |
| -------: | ---------: | --------------: | ---------- |
|        1 |  1 — Takeo | 1 — Baggy Jeans | 30/09/2026 |
|        2 | 3 — Sayuri |     2 — sandero | 26/07/2021 |
|        3 |  2 — Julio |  3 — Jersey y2k | 23/02/2001 |

Exemplo:

```sql
INSERT INTO bcd_venda
(id_cliente, id_produto, dt_entrada)
VALUES
(1, 1, "2026-09-30");
```

Para consultar as vendas:

```sql
SELECT * FROM bcd_venda;
```

---

## 🚀 Como executar

### 1. Instalar o MySQL

Instale o **MySQL Server** e, se desejar, o **MySQL Workbench**.

### 2. Abrir o MySQL Workbench

Abra o MySQL Workbench e conecte-se ao seu servidor MySQL.

### 3. Criar o banco

Execute:

```sql
CREATE DATABASE bcd_segundoEx;
```

### 4. Selecionar o banco

```sql
USE bcd_segundoEx;
```

### 5. Criar as tabelas

Execute os comandos `CREATE TABLE` das tabelas:

```text
bcd_cliente
bcd_produto
bcd_venda
```

### 6. Inserir os dados

Execute os comandos `INSERT INTO` para cadastrar os clientes, produtos e vendas.

### 7. Criar os relacionamentos

Execute os comandos `ALTER TABLE` responsáveis pelas chaves estrangeiras.

### 8. Criar as restrições UNIQUE

Execute os comandos que impedem e-mails e nomes de produtos duplicados.

---

## 🔎 Consultas utilizadas

Para visualizar os clientes:

```sql
SELECT * FROM bcd_cliente;
```

Para visualizar os produtos:

```sql
SELECT * FROM bcd_produto;
```

Para visualizar as vendas:

```sql
SELECT * FROM bcd_venda;
```

---

## 📁 Estrutura

```text
bcd_segundoEx
│
├── bcd_cliente
│   ├── id_cliente
│   ├── nome_cliente
│   ├── email_cliente
│   └── tel
│
├── bcd_produto
│   ├── id_produto
│   ├── nome_produto
│   ├── preco_produto
│   ├── dt_entrega
│   └── qtd
│
└── bcd_venda
    ├── id_venda
    ├── id_cliente
    ├── id_produto
    └── dt_entrada
```

---

