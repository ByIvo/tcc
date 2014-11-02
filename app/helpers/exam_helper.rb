module ExamHelper

	def create_exam(maker, exam_request)

		return nil unless exam_request != nil
		exam = Exam.new
		
		questions = select_question_by_rule exam_request
		exam_questions = create_exam_question_by_selected_questions exam, questions
				
		exam.maker = maker
		exam.exam_questions = exam_questions
		exam.exam_request = exam_request
		exam.start_date = Time.now

		exam.save
		
		exam
	end 

	def finish_exam(exam)
		exam.finish_date = Time.now
		exam.save

		exam
	end

	def search_innitialized_exam(maker, exam_request)
		Exam.find_by(maker: maker, exam_request: exam_request, finish_date: nil)
	end

	private

	def select_question_by_rule(exam_request)
		questions = Array.new

		exam_request.exam_rules.shuffle.each do |rule|
			questions.concat Question.where(classification: rule.classification).sample(rule.quantity)
		end

		questions
	end

	def create_exam_question_by_selected_questions(exam, questions)
		exam_questions = Array.new
		
		questions.each do |question|
			exam_question = ExamQuestion.new

			exam_question.question = question
			exam_question.exam = exam

			exam_questions << exam_question;
		end

		exam_questions.each(&:save)

		exam_questions
	end

	module_function :create_exam, :finish_exam, :select_question_by_rule, :create_exam_question_by_selected_questions, :search_innitialized_exam

end
