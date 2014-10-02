class NomeAlunoController < ApplicationController

	def start_exam
		@created_exam = ExamHelper.create_exam params[:student_name]

		session['exam'] = @created_exam.id
		session['actual_question'] = 0
		session['number_of_right_questions'] = nil
		redirect_to '/resolution'
	end
end
