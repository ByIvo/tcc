module ExamHelper

	def create_exam(student_name)

		@exam = Exam.new
		@exam.name = student_name
		@exam.start_date = Time.now
		@exam.save

		@questions = Question.all.sample(10).each do |question|
			@exam_question = ExamQuestion.new
			@exam_question.question = question
			@exam_question.exam = @exam

			@exam_question.save
		end

		@exam
		
	end

	module_function :create_exam

end
