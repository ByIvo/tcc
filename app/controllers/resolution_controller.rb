class ResolutionController < ApplicationController

  helper_method :all_filled?

  def show

    if session['actual_question'] == nil
      session['actual_question'] = 0
    end

    @exam = Exam.find(session['exam'])

    redirect_to action: "result" unless @exam.finish_date == nil

    @question = @exam.exam_questions[session['actual_question']]
  end


  def result
    @exam = Exam.find(session['exam'])
  end

  def handle_question

    register_questao params

    if params[:finish_exam] 
        if all_filled?(true)
          finish_exam
          redirect_to action: "result"
        else
          redirect_to action: "show"
        end
    else
      if params[:next_question]
          next_question
      elsif params[:last_question]
          last_question
      elsif params[:btn_question_control]
          especific_question params[:btn_question_control]
      end

      redirect_to action: "show"
    end
  end

  def finish_exam
      ExamHelper.finish_exam @exam
  end

  def all_filled?(strict = false)
    reicidence = false
    to_return = true;

    @exam.exam_questions.each do |question| 
      if question.answer == nil
        to_return = false if reicidence || strict
        reicidence = true
      end
    end
    
    to_return
  end

  private

  def especific_question(new_question)
    session['actual_question'] = new_question.to_f
  end

  def register_questao(params)
    @exam = Exam.find(session['exam'])

    if params[:alternative]
      @question = @exam.exam_questions[session['actual_question']]

      @question.answer = Alternative.find params[:alternative]
      @question.answer_date = Time.now
      @question.save
    end
  end

  def next_question
    count_question = session['actual_question'] + 1

    if @exam.exam_questions.size != count_question
      session['actual_question'] = session['actual_question'] + 1
    else
        session['actual_question'] = 0
    end
      
  end

  def last_question
    
    if session['actual_question'] > 0
      session['actual_question'] = session['actual_question'] - 1
    else
      session['actual_question'] = (@exam.exam_questions.size-1)
    end

  end

end
