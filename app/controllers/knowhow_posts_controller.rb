class KnowhowPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_knowhow_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @knowhow_posts = current_user.company.knowhow_posts.includes(:user)
  end

  def show; end

  def new
    @knowhow_post = current_user.knowhow_posts.build
  end

  def create
    @knowhow_post = current_user.knowhow_posts.build(knowhow_post_params)
    if @knowhow_post.save
      redirect_to @knowhow_post, notice: '投稿が完了しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @knowhow_post.update(knowhow_post_params)
      redirect_to @knowhow_post, notice: '投稿を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @knowhow_post.destroy
    redirect_to knowhow_posts_path, notice: '投稿を削除しました'
  end

  private

  def set_knowhow_post
    @knowhow_post = KnowhowPost.find(params[:id])
  end

  def knowhow_post_params
    params.require(:knowhow_post).permit(:title, :body)
  end

  def authorize_user!
    unless @knowhow_post.user == current_user || current_user.admin?
      redirect_to root_path, alert: '権限がありません'
    end
  end
end