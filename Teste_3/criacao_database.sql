CREATE TABLE op_ativas_ans(
    registro_ans INT PRIMARY KEY,
    cnpj VARCHAR(20),
    razao_social VARCHAR(150),
    nome_fantasia VARCHAR(100),
    modalidade VARCHAR(80),
    logradouro VARCHAR(70),
    numero VARCHAR(20),
    complemento VARCHAR(80),
    bairro VARCHAR(50),
    cidade VARCHAR(40),
    uf VARCHAR(2),
    cep VARCHAR(25),
    ddd VARCHAR(2),
    telefone VARCHAR(20),
    fax VARCHAR(20),
    endereco_eletronico VARCHAR(70),
    representante VARCHAR(70),
    cargo_representante VARCHAR(70),
    data_registro_ans DATE
);

/* Todos os loads .csv neste sql foram formatados anteriormente no excel para funcionar aqui
 * Necessário colocá-los na pasta 'uploads' e colocar o endereço abaixo
 * os arquivos originais baixados no site não funcionarão, apenas os já formatados*/

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv'
INTO TABLE op_ativas_ans
CHARACTER SET LATIN1
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 3 ROWS;

/*coluna cnpj teve que ser formatada no excel para sair de notação científica */

SET FOREIGN_KEY_CHECKS=0;

/*esse set permite que as fk das demais tabelas referenciem op_ativas_ans.registro_ans
mesmo sem uma pk correspondente*/

CREATE TABLE primeiro_tri2020(
    data_ DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(20),
    descricao VARCHAR(250),
    vl_saldo_final DECIMAL(18, 2),
    PRIMARY KEY(reg_ans, cd_conta_contabil),
    FOREIGN KEY(reg_ans) REFERENCES op_ativas_ans(registro_ans) ON DELETE CASCADE
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2020.csv'
INTO TABLE primeiro_tri2020
CHARACTER SET LATIN1
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

/*colunas vl_saldo_final tiveram que ser formatadas no excel para trocar a separação do decimal*/

CREATE TABLE segundo_tri2020(
    data_ DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(20),
    descricao VARCHAR(250),
    vl_saldo_final DECIMAL(18, 2),
    PRIMARY KEY(reg_ans, cd_conta_contabil),
    FOREIGN KEY(reg_ans) REFERENCES op_ativas_ans(registro_ans) ON DELETE CASCADE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2020.csv'
INTO TABLE segundo_tri2020
CHARACTER SET LATIN1
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

CREATE TABLE terceiro_tri2020(
    data_ DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(20),
    descricao VARCHAR(250),
    vl_saldo_final DECIMAL(18, 2),
    PRIMARY KEY(reg_ans, cd_conta_contabil),
    FOREIGN KEY(reg_ans) REFERENCES op_ativas_ans(registro_ans) ON DELETE CASCADE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2020.csv'
INTO TABLE terceiro_tri2020
CHARACTER SET LATIN1
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

CREATE TABLE quarto_tri2020(
    data_ DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(20),
    descricao VARCHAR(250),
    vl_saldo_final DECIMAL(18, 2),
    PRIMARY KEY(reg_ans, cd_conta_contabil),
    FOREIGN KEY(reg_ans) REFERENCES op_ativas_ans(registro_ans) ON DELETE CASCADE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2020.csv'
INTO TABLE quarto_tri2020
CHARACTER SET LATIN1
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

CREATE TABLE primeiro_tri2021(
    data_ DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(20),
    descricao VARCHAR(250),
    vl_saldo_final DECIMAL(18, 2),
    PRIMARY KEY(reg_ans, cd_conta_contabil),
    FOREIGN KEY(reg_ans) REFERENCES op_ativas_ans(registro_ans) ON DELETE CASCADE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2021.csv'
INTO TABLE primeiro_tri2021
CHARACTER SET LATIN1
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

CREATE TABLE segundo_tri2021(
    data_ DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(20),
    descricao VARCHAR(250),
    vl_saldo_final DECIMAL(18, 2),
    PRIMARY KEY(reg_ans, cd_conta_contabil),
    FOREIGN KEY(reg_ans) REFERENCES op_ativas_ans(registro_ans) ON DELETE CASCADE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2021.csv'
INTO TABLE segundo_tri2021
CHARACTER SET LATIN1
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

CREATE TABLE terceiro_tri2021(
    data_ DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(20),
    descricao VARCHAR(250),
    vl_saldo_final DECIMAL(18, 2),
    PRIMARY KEY(reg_ans, cd_conta_contabil),
    FOREIGN KEY(reg_ans) REFERENCES op_ativas_ans(registro_ans) ON DELETE CASCADE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2021.csv'
INTO TABLE terceiro_tri2021
CHARACTER SET LATIN1
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

CREATE TABLE quarto_tri2021(
    data_ DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(20),
    descricao VARCHAR(250),
    vl_saldo_inicial DECIMAL(18, 2),
    vl_saldo_final DECIMAL(18, 2),
    PRIMARY KEY(reg_ans, cd_conta_contabil),
    FOREIGN KEY(reg_ans) REFERENCES op_ativas_ans(registro_ans) ON DELETE CASCADE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2021.csv'
INTO TABLE quarto_tri2021
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
