INSERT INTO empresas
    (nome, cnpj)
VALUES
    ('Bradesco', 33456482000123),
    ('Vale', 37416482000157),
    ('Cielo', 33491742000112);

ALTER TABLE empresas MODIFY cnpj VARCHAR(14);

DESC empresas;

SELECT * FROM empresas;
SELECT * FROM cidades;

INSERT INTO empresas_unidades
    (empresa_id, cidade_id, sede)
VALUES
    (1, 1, 1),
    (1, 2, 0),
    (2, 1, 0),
    (2, 2, 1);