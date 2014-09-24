module ResolutionHelper

	def exam_grade(exam, session)
		((number_of_right_questions(exam,session) * 100) / number_of_questions(exam))
	end

	def number_of_questions(exam)
		exam.exam_questions.size
	end

	def number_of_right_questions(exam, session)
		
		number_of_right_questions = session['number_of_right_questions']

		if number_of_right_questions == nil
			count_alternative = 0

			exam.exam_questions.each do |question|
					if question.answer.correct
						count_alternative = count_alternative +	1
					end		
			end	

			number_of_right_questions = count_alternative
		end

		session['number_of_right_questions'] = number_of_right_questions
	end

	def get_right_alternative(question)
		right_alternative = nil
		question.alternatives.each do |alternative|
			if alternative.correct
				right_alternative = alternative
			end
		end
		right_alternative
	end

	module_function :exam_grade, :number_of_questions, :number_of_right_questions, :get_right_alternative
end
