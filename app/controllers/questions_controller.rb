class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_question, only: [:show]

  def index
    if params[:search]
      @questions = Question.search(params[:search])
    else
      @questions = Question.all
    end
  end

  def show
    @answers = @question.answers
    @comment = Comment.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to(root_path, notice: 'Pregunta publicada con éxito')
    else
      render :new
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :description)
    end

    def find_question
      @question = Question.find(params[:id])
    end
end
