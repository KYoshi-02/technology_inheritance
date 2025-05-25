class MemosController < ApplicationController
  before_action :authenticate_user!

  def create
    @memo = current_user.memos.new(memo_params)
    if @memo.save
      redirect_to knowhow_post_path(@memo.knowhow_post), notice: "メモを追加しました"
    else
      redirect_to knowhow_post_path(@memo.knowhow_post), alert: "メモの追加に失敗しました"
    end
  end

  def destroy
    memo = current_user.memos.find(params[:id])
    memo.destroy
    redirect_to knowhow_post_path(memo.knowhow_post), notice: "メモを削除しました"
  end

  private

  def memo_params
    params.require(:memo).permit(:content, :knowhow_post_id)
  end
end