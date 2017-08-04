class VotesController < ApplicationController
  def create
    if params[:question_id]
      question = Question.find(params[:question_id])
      question.votes.create(user: current_user)
    else
      puts "Parameters= #{params}"
      redirect_to(root_path)
    end
    redirect_to(question)
  end

  def destroy
    if params[:question_id]
      question = Question.find(params[:question_id])
      question.votes.where(user: current_user).take.try(:destroy)
    else
      puts "Parameters= #{params}"
      redirect_to(root_path)
    end
    redirect_to(question)
  end
end
