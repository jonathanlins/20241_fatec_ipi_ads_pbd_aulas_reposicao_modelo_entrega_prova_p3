-- ----------------------------------------------------------------
--NÃO APAGUE NADA DESTE ARQUIVO. FAZÊ-LO IMPLICARÁ EM ANULAÇÃO DA SUA PROVA.
-- ----------------------------------------------------------------

--1 Base de dados e criação de tabela
--A base a ser utilizada pode ser obtida a partir do link a seguir. 
--https://www.kaggle.com/datasets/csafrit2/higher-education-students-performance-evaluation
--Ela deve ser importada para uma base de dados gerenciada pelo PostgreSQL. Os dados devem ser armazenados em uma tabela apropriada para as análises --desejadas. Você deve identificar as colunas necessárias, de acordo com a descrição de cada item da prova. Além, é claro, de uma chave primária (de auto --incremento). Neste item, portanto, você deve desenvolver o script de criação da tabela.
--SUA SOLUÇÃO DO ITEM 1 ABAIXO:CREATE DATABASE prova_pbd;
CREATE TABLE tb_student_prediction (
    student_id SERIAL PRIMARY KEY,
    age INT,
    read_freq INT
);

-- ----------------------------------------------------------------
--2 Leitura frequente
--Utilize um cursor não vinculado para exibir a faixa etária de cada aluno que tenha frequẽncia de leitura de materiais não científicos alta.
--SUA SOLUÇÃO DO ITEM 2 ABAIXO:
DO $$
    DECLARE
        cur_faixa_etaria REFCURSOR;
        v_age INT;
        v_faixa_etaria VARCHAR(20);
    BEGIN
        OPEN cur_faixa_etaria FOR
        SELECT age FROM tb_student_prediction
        WHERE read_freq = 3;

        LOOP
            FETCH cur_faixa_etaria INTO v_age;
            EXIT WHEN NOT FOUND;
            
            IF v_age = 1 THEN
                v_faixa_etaria := '18-21';
            ELSIF v_age = 2 THEN
                v_faixa_etaria := '22-25';
            ELSIF v_age = 3 THEN
                v_faixa_etaria := 'acima de 26';
            ELSE
                v_faixa_etaria := 'Desconhecida';
            END IF;

            RAISE NOTICE 'Faixa etária: %', v_faixa_etaria;
        END LOOP;

        CLOSE cur_faixa_etaria;
    END $$;

-- ----------------------------------------------------------------
--3 Aprovação sem ver aula
--Utilize um cursor com query dinâmica para mostrar todos os dados de cada estudante aprovado que nunca viu aula. No final, exiba a quantidade de estudantes.
--SUA SOLUÇÃO DO ITEM 3 ABAIXO:


-- ----------------------------------------------------------------
-- 4 Transporte versus resultado
--Utilize um cursor vinculado para exibir todos os dados de cada estudante que vai de ônibus ou bicicleta para a faculdade e que tenha sido aprovado. No --final, exiba quantos tiraram nota AA.
--SUA SOLUÇÃO DO ITEM 4 ABAIXO:


-- ----------------------------------------------------------------
--5. Limpeza de valores NULL
--Escreva um cursor não vinculado para a remoção de todas as tuplas que possuam o valor NULL em pelo menos um de seus campos. A remoção deve ser feita de --baixo para cima e, antes dela, cada tupla deve ser exibida. A seguir, de cima para baixo, exiba cada tupla remanescente.
--SUA SOLUÇÃO DO ITEM 5 ABAIXO:


-- ----------------------------------------------------------------
