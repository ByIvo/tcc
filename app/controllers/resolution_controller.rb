class ResolutionController < ApplicationController

  def show

    if session['actual_question'] == nil
      session['actual_question'] = 0
    end

    @exam = Exam.find(session['exam'])

    @question = @exam.exam_questions[session['actual_question']]
  end

  def next_question

    session['actual_question'] = session['actual_question'] + 1
   
    redirect_to action: "show"
  end

  def last_question
    
    if session['actual_question'] > 0
      session['actual_question'] = session['actual_question'] - 1
    end

    redirect_to action: "show"
  end

  def atualizar_questao

  end
  
  def confirmar

  end

end
