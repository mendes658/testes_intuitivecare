/*10 maiores despesas com 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR' 
No último trimestre de 2021
**/

SELECT op_ativas_ans.registro_ans, op_ativas_ans.razao_social, 
SUM(quarto_tri2021.vl_saldo_final) AS 'despesa_4tri2021'
FROM op_ativas_ans
JOIN quarto_tri2021
ON op_ativas_ans.registro_ans = quarto_tri2021.reg_ans
WHERE quarto_tri2021.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
GROUP BY op_ativas_ans.razao_social 
ORDER BY despesa_4tri2021 DESC
LIMIT 10;

/*O código em comentário abaixo retorna a diferença entre o saldo final e inicial para retornar as maiores despesas 4tri/21
A coluna saldo inicial só existe no ultimo trimestre, por isso creio que apenas o saldo final deva ser utilizado*/

/*
SELECT op_ativas_ans.registro_ans, op_ativas_ans.razao_social, 
(SUM(quarto_tri2021.vl_saldo_final) - SUM(quarto_tri2021.vl_saldo_inicial)) AS 'DESPESA'
FROM op_ativas_ans
JOIN quarto_tri2021
ON op_ativas_ans.registro_ans = quarto_tri2021.reg_ans
WHERE quarto_tri2021.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
GROUP BY op_ativas_ans.razao_social
ORDER BY despesa DESC
LIMIT 10;*/

