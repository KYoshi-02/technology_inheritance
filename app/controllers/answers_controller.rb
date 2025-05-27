class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @answer = @quiz.answers.build(answer_params.merge(user: current_user))

    if @answer.save
      redirect_to @quiz, notice: "回答を送信しました"
    else
      redirect_to @quiz, alert: "回答の送信に失敗しました"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end