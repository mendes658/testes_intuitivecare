/*10 maiores despesas com 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
No último ano*/

SELECT registro_ans, razao_social, SUM(primeirasoma) AS 'despesa_2021'
FROM (
	SELECT op_ativas_ans.registro_ans AS 'registro_ans', op_ativas_ans.razao_social AS 'razao_social', 
	quarto_tri2021.vl_saldo_final AS 'primeirasoma'
	FROM op_ativas_ans
	JOIN quarto_tri2021
	ON op_ativas_ans.registro_ans = quarto_tri2021.reg_ans
	WHERE quarto_tri2021.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
	UNION
	SELECT op_ativas_ans.registro_ans,  op_ativas_ans.razao_social,
	terceiro_tri2021.vl_saldo_final
	FROM op_ativas_ans
	JOIN terceiro_tri2021
	ON op_ativas_ans.registro_ans = terceiro_tri2021.reg_ans
	WHERE terceiro_tri2021.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
	UNION 
	SELECT op_ativas_ans.registro_ans,  op_ativas_ans.razao_social,
	segundo_tri2021.vl_saldo_final
	FROM op_ativas_ans
	JOIN segundo_tri2021
	ON op_ativas_ans.registro_ans = segundo_tri2021.reg_ans
	WHERE segundo_tri2021.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
	UNION 
	SELECT op_ativas_ans.registro_ans,  op_ativas_ans.razao_social,
	primeiro_tri2021.vl_saldo_final
	FROM op_ativas_ans
	JOIN primeiro_tri2021
	ON op_ativas_ans.registro_ans = primeiro_tri2021.reg_ans
	WHERE primeiro_tri2021.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
) AS teste
GROUP BY razao_social
ORDER BY despesa_2021 DESC
LIMIT 10
;
