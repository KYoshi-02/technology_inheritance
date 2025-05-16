class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_unless_admin  # 管理者以外を弾く

  def index
    @users = User.where(company_id: current_user.company_id)
  end

  private

  def redirect_unless_admin
    unless current_user.admin?
      flash[:alert] = "アクセス権限がありません"
      redirect_to root_path
    end
  end
end