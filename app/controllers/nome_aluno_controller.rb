class NomeAlunoController < ApplicationController

	def index

	end

	def request_student_name
		@divisions = Division.all
	end		

	def make_exam
		if params[:new_exam]
			start_exam
		elsif params[:continue_exam]
			continue_exam
		else
			flash[:error] = "Sem gracinhas mocinho!"
			redirect_to :back
		end
	end

	def start_exam
		maker = MakerHelper.verify_maker(params)

		exam_request = ExamRequest.first
		
		if validates_error? maker, exam_request

			created_exam = ExamHelper.create_exam maker, exam_request
			start_resolution created_exam
		else 
			redirect_to :back
		end 
	end

	def continue_exam
		maker = MakerHelper.verify_maker(params)
		exam_request = ExamRequest.first

		if maker.name.downcase != params[:maker_name].downcase
			flash[:error] = "Informe seu nome exatamente igual ao primeiro acesso. Em caso de dúvida, consulte um professor!"
		else
			started_exam = ExamHelper.search_innitialized_exam maker, exam_request
			
			if started_exam == nil
				flash[:error] = "Vocẽ não possui nenhum exâme para continuar."
			else
				start_resolution started_exam
				return
			end
		end

		redirect_to :back, params
	end

	def start_resolution(created_exam)
		session['exam'] = created_exam.id
		session['actual_question'] = 0
		session['number_of_right_questions'] = nil
		
		redirect_to '/resolution'
	end

	private 

	def validates_error?(maker, exam_request)

		if maker == nil
			flash[:error] = "Nenhum Maker para fazer a prova."

		elsif exam_request == nil
			flash[:error] = "Nenhuma prova disponível no momento."

		else
			exam = Exam.find_by(maker: maker, exam_request: exam_request)
			if exam != nil

				if exam.finish_date == nil
					flash[:error] = "Você já inicou esse exâme, tente continuá-lo."
				else
					flash[:error] = "Você já concluiu esse exâme, caso necessite de ajuda, peça ajuda de um professor."
				end
			end

		end

		!flash[:error]
	end
end
