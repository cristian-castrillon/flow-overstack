class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    
  end

  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  def search_question
    
  end

  private
    def question_params
      params.require(:question).permit(:title, :description)
    end

    def find_question
      @question = Question.find(params[:id])
    end
end
