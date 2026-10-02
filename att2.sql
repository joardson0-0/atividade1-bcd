create database biblioteca;

use biblioteca;

create table livros (
    id int primary key auto_increment,
    titulo varchar(100) not null,
    autor varchar(100) not null,
    ano_publicacao int not null
);

create table alunos (
    id int primary key auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    curso_aluno varchar(100) not null
);

insert into livros (titulo, autor, ano_publicacao) values
("O Senhor dos Anéis", "J.R.R. Tolkien", 1954);

insert into livros (titulo, autor, ano_publicacao) values
("1984", "George Orwell", 1949);    

insert into livros (titulo, autor, ano_publicacao) values
("O Pequeno Príncipe", "Antoine de Saint-Exupéry", 1943);


select * from biblioteca;

insert into alunos (nome, email, curso_aluno) values
("João Silva", "joao.silva@email.com", "Engenharia de Software");

insert into alunos (nome, email, curso_aluno) values
("Maria Souza", "maria.souza@email.com", "Ciência da Computação");

insert into alunos (nome, email, curso_aluno) values
("Pedro Santos", "pedro.santos@email.com", "Administração");

create table emprestimos (
    id int primary key auto_increment,
    id_aluno int not null,
    id_livro int not null,
    data_emprestimo date not null,
    data_devolucao date not null
);
insert into emprestimos (id_aluno, id_livro, data_emprestimo, data_devolucao) values
(1, 1, "2023-06-01", "2023-06-15");

insert into emprestimos (id_aluno, id_livro, data_emprestimo, data_devolucao) values
(2, 2, "2023-06-05", "2023-06-20"); 

insert into emprestimos (id_aluno, id_livro, data_emprestimo, data_devolucao) values
(3, 3, "2023-06-10", "2023-06-25"); 

alter table emprestimos
add foreign key (id_aluno) references alunos(id);

alter table emprestimos
add foreign key (id_livro) references livros(id);

alter table emprestimos
add constraint fk_aluno foreign key (id_aluno) references alunos(id);