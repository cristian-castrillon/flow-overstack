class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    if params[:question_id]
      @question = Question.find(params[:question_id])
      @answers = @question.answers
      @comment = Comment.new
      if @question.comments << comment
        redirect_to(@question)
      else
        @errors = comment.errors.full_messages
        render 'questions/show'
      end
    else
      answer = Answer.find(params[:answer_id])
      @question = Question.find(answer.question_id)
      @answers = @question.answers
      @comment = Comment.new
      if answer.comments << comment
        redirect_to(@question)
      else
        @errors = comment.errors.full_messages
        render 'questions/show'
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end