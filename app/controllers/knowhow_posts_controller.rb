class KnowhowPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_knowhow_post, only: [:show, :edit, :update, :destroy]

  def index
    @knowhow_posts = KnowhowPost.includes(:user).where(user: { company_id: current_user.company_id }).order(created_at: :desc)
  end

  def show; end

  def new
    @knowhow_post = KnowhowPost.new
  end

  def create
    @knowhow_post = current_user.knowhow_posts.build(knowhow_post_params)
    if @knowhow_post.save
      redirect_to @knowhow_post, notice: "投稿が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if params[:remove_image] == '1'
      @knowhow_post.image.purge
    end

    if params[:remove_video] == '1'
      @knowhow_post.video.purge
    end

    if @knowhow_post.update(knowhow_post_params)
      redirect_to @knowhow_post, notice: "投稿を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @knowhow_post.destroy
    redirect_to knowhow_posts_path, notice: "削除しました"
  end

  private

  def set_knowhow_post
    @knowhow_post = KnowhowPost.find(params[:id])
  end

  def knowhow_post_params
    params.require(:knowhow_post).permit(:title, :content, :image, :video)
  end
end