class VotesController < ApplicationController
  def create
    if params[:question_id]
      question = Question.find(params[:question_id])
      question.votes.create(user: current_user)
    else
      answer = Answer.find(params[:answer_id])
      question = Question.find(answer.question_id)
      answer.votes.create(user: current_user)
    end
    redirect_to(question)
  end

  def destroy
    if params[:question_id]
      question = Question.find(params[:question_id])
      question.votes.where(user: current_user).take.try(:destroy)
    else
      answer = Answer.find(params[:answer_id])
      question = Question.find(answer.question_id)
      answer.votes.where(user: current_user).take.try(:destroy)
    end
    redirect_to(question)
  end
end
