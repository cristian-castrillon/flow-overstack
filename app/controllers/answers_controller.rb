class AnswersController < ApplicationController
  
  def create
    @question = Question.find(params[:question_id])
    answer = @question.answers.new(answer_params)
    @answers = @question.answers
    if answer.save
      redirect_to(@question)
    else
      @errors = answer.errors.full_messages
      render 'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:body).merge(user: current_user, question_id: params[:question_id])
    end
end
