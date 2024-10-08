
CREATE TABLE USUARIOS (
    ID_USUARIO SERIAL,
    NOME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE NOT NULL,
    SENHA VARCHAR(255) NOT NULL,
    TIPO_USUARIO VARCHAR(50) NOT NULL
);

CREATE TABLE AVALIACOES (
    ID_AVALIACAO SERIAL,
    TITULO VARCHAR(255) NOT NULL,
    DESCRICAO TEXT,
    DATA_CRIACAO TIMESTAMP NOT NULL DEFAULT NOW(),
    DATA_ENTREGA TIMESTAMP,
    PROFESSOR_ID INTEGER NOT NULL
);

CREATE TABLE ENTREGAS (
    ID_ENTREGA SERIAL,
    ALUNO_ID INTEGER NOT NULL,
    AVALIACAO_ID INTEGER NOT NULL,
    DATA_SUBMISSAO TIMESTAMP NOT NULL DEFAULT NOW(),
    CONTEUDO TEXT NOT NULL
);

CREATE TABLE NOTAS (
    ID_NOTA SERIAL,
    ENTREGA_ID INTEGER NOT NULL,
    NOTA NUMERIC(4,2) NOT NULL,
    FEEDBACK TEXT,
    DATA_ATRIBUICAO TIMESTAMP NOT NULL DEFAULT NOW()
);


ALTER TABLE USUARIOS ADD CONSTRAINT PK_USUARIOS PRIMARY KEY (ID_USUARIO);
ALTER TABLE AVALIACOES ADD CONSTRAINT PK_AVALIACOES PRIMARY KEY (ID_AVALIACAO);
ALTER TABLE ENTREGAS ADD CONSTRAINT PK_ENTREGAS PRIMARY KEY (ID_ENTREGA);
ALTER TABLE NOTAS ADD CONSTRAINT PK_NOTAS PRIMARY KEY (ID_NOTA);


ALTER TABLE AVALIACOES 
    ADD CONSTRAINT FK_AVALIACOES_PROFESSOR_ID FOREIGN KEY (PROFESSOR_ID) REFERENCES USUARIOS(ID_USUARIO);

ALTER TABLE ENTREGAS 
    ADD CONSTRAINT FK_ENTREGAS_ALUNO_ID FOREIGN KEY (ALUNO_ID) REFERENCES USUARIOS(ID_USUARIO),
    ADD CONSTRAINT FK_ENTREGAS_AVALIACAO_ID FOREIGN KEY (AVALIACAO_ID) REFERENCES AVALIACOES(ID_AVALIACAO);

ALTER TABLE NOTAS 
    ADD CONSTRAINT FK_NOTAS_ENTREGA_ID FOREIGN KEY (ENTREGA_ID) REFERENCES ENTREGAS(ID_ENTREGA);
