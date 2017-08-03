class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
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
      puts "Params: #{params}"
      redirect_to(questions_path)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end