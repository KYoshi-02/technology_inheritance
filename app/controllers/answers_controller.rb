class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @answer = @quiz.answers.build(answer_params)
    @answer.user = current_user

    if @answer.content.strip == @quiz.correct_answer.strip
      @answer.correct = true
    else
      @answer.correct = false
    end

    if @answer.save
      if @answer.content.strip == @quiz.correct_answer.strip
        flash[:notice] = "正解です！"
      else
        flash[:notice] = "不正解です。正解は「#{@quiz.correct_answer}」です。"
      end
      redirect_to @quiz
    else
      flash[:alert] = "回答の送信に失敗しました。"
      render "quizzes/show", status: :unprocessable_entity
    end

  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end