class QuestionViewController < ApplicationController

	
	def show
		
	end

	def maker_result
		@exams = Exam.all
	end
end
