class ResolutionController < ApplicationController

  def index
    if @questions == nil
      @questions = Question.all
      @question = @questions.first
    end
  end
end
