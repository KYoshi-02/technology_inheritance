class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz, only: [:show]

  def index
    @quizzes = Quiz.all.order(created_at: :desc)
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = current_user.quizzes.build(quiz_params)
    if @quiz.save
      redirect_to @quiz, notice: "クイズを投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:question, :correct_answer, :explanation)
  end
end