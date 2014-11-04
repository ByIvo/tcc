//ORDERNAR POR TEMPO DE PROVA
select 
	upper(maker.name) as "Nome", 
	div.name as "Turma", 
	date_trunc('second', (exam.start_date - time '02:00:00')) as "Hora Início", 
	date_trunc('second', (exam.finish_date - time '02:00:00')) as "Hora Final", 
	date_trunc('second',(exam.finish_date - exam.start_date)) as "Duração",
	(
		SELECT count(exam_question.id) 
		FROM exam_questions exam_question
		INNER JOIN alternatives answer ON answer.id = exam_question.answer_id
		WHERE exam_question.exam_id = exam.id AND answer.correct is true
	) as acertos
from exams exam
INNER JOIN makers maker ON maker.id = exam.maker_id
INNER JOIN divisions div ON div.id = maker.division_id
WHERE exam.finish_date is not null
ORDER BY "Duração" desc;

//Número de aparições, acertos e erros por questão
SELECT
	question.id as "Número questão",
	classification.name as "Matéria",
	(
	  SELECT count(exam_question.id)
	  FROM exam_questions exam_question
	  WHERE exam_question.question_id = question.id
	) as aparicoes,
	(
	  SELECT count(exam_question.id)
	  FROM exam_questions exam_question
	  INNER JOIN alternatives answer ON answer.id = exam_question.answer_id
	  WHERE 
	    exam_question.question_id = question.id
	    AND answer.correct
	    AND answer.id IN 
	      (
	        SELECT alternative.id 
	        FROM alternatives alternative
	        WHERE alternative.question_id = question.id
	      )
	) as acertos,
	(
	  SELECT count(exam_question.id)
	  FROM exam_questions exam_question
	  INNER JOIN alternatives answer ON answer.id = exam_question.answer_id
	  WHERE 
	    exam_question.question_id = question.id
	    AND not answer.correct
	    AND answer.id IN 
	      (
	        SELECT alternative.id 
	        FROM alternatives alternative
	        WHERE alternative.question_id = question.id
	      )
	)as erros
		
FROM questions question
INNER JOIN classifications classification ON classification.id = question.classification_id
ORDER BY classification.name, aparicoes desc, acertos desc, erros desc;
