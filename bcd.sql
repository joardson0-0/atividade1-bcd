CREATE DATABASE bcd_segundoEx;

USE bcd_segundoEx;

CREATE TABLE bcd_cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email_cliente VARCHAR(100) NOT NULL,
    tel INT NOT NULL
);

CREATE TABLE bcd_produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco_produto DECIMAL (10,2),
    dt_entrega DATE NOT NULL,
    qtd INT NOT NULL
);

CREATE TABLE bcd_venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    dt_entrada DATE NOT NULL
);

USE bcd_segundoEx;

INSERT INTO bcd_cliente (nome_cliente, email_cliente, tel) VALUES
("leo", "leo@gmail.com", "9999128");

INSERT INTO bcd_cliente (nome_cliente, email_cliente, tel) VALUES
("Julio", "julio@gmail.com", "124365");

INSERT INTO bcd_cliente (nome_cliente, email_cliente, tel) VALUES
("joardson", "joardson@gmail.com", "663923");

SELECT * FROM bcd_cliente;

USE bcd_segundoEx;

INSERT INTO bcd_produto (nome_produto, dt_entrega, preco_produto, qtd) VALUES
("Baggy Jeans", "2026-09-30", 200.45, 2000);

INSERT INTO bcd_produto (nome_produto, dt_entrega, preco_produto, qtd) VALUES
("sandero", "2026-10-23", 50000.99, 1);

INSERT INTO bcd_produto (nome_produto, dt_entrega, preco_produto, qtd) VALUES
("Jersey y2k", "2026-11-01", 150.89, 1902);

SELECT * FROM bcd_produto;

USE bcd_segundoEx;

INSERT INTO bcd_venda (id_cliente, id_produto, dt_entrada) VALUES
(1, 1, "2026-09-30");

INSERT INTO bcd_venda (id_cliente, id_produto, dt_entrada) VALUES
(3, 2, "2021-07-26");

INSERT INTO bcd_venda (id_cliente, id_produto, dt_entrada) VALUES
(2, 3, "2001-02-23");

SELECT * FROM bcd_venda;

USE bcd_segundoEx;

ALTER TABLE bcd_venda
ADD CONSTRAINT fk_bcd_venda_cliente
FOREIGN KEY (id_cliente) 
REFERENCES bcd_cliente(id_cliente);

USE bcd_segundoEx;

ALTER TABLE bcd_venda
ADD CONSTRAINT fk_bcd_venda_produto
FOREIGN KEY (id_produto) 
REFERENCES bcd_produto(id_produto);

USE bcd_segundoEx;

ALTER TABLE bcd_produto
ADD CONSTRAINT uk_bcd_produto_unico UNIQUE (nome_produto);

USE bcd_segundoEx;

ALTER TABLE bcd_cliente
ADD CONSTRAINT uk_bcd_cliente_unico UNIQUE (email_cliente);