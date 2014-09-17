class NomeAlunoController < ApplicationController

	def start_exam
		@created_exam = ExamHelper.create_exam params[:student_name]

		session['exam'] = @created_exam.id
		session['actual_question'] = 0
		redirect_to '/resolution'
	end
end
