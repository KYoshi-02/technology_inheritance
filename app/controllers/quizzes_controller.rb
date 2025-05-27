class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show]

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to @quiz, notice: "クイズを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:question, :correct_answer)
  end
end