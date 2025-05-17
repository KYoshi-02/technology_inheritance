class KnowhowPostsController < ApplicationController
  before_action :set_knowhow_post, only: %i[ show edit update destroy ]

  # GET /knowhow_posts or /knowhow_posts.json
  def index
    @knowhow_posts = KnowhowPost.all
  end

  # GET /knowhow_posts/1 or /knowhow_posts/1.json
  def show
  end

  # GET /knowhow_posts/new
  def new
    @knowhow_post = KnowhowPost.new
  end

  # GET /knowhow_posts/1/edit
  def edit
  end

  # POST /knowhow_posts or /knowhow_posts.json
  def create
    @knowhow_post = current_user.knowhow_posts.build(knowhow_post_params)
    if @knowhow_post.save
      redirect_to @knowhow_post, notice: "ノウハウを投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /knowhow_posts/1 or /knowhow_posts/1.json
  def update
    respond_to do |format|
      if @knowhow_post.update(knowhow_post_params)
        format.html { redirect_to @knowhow_post, notice: "Knowhow post was successfully updated." }
        format.json { render :show, status: :ok, location: @knowhow_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @knowhow_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowhow_posts/1 or /knowhow_posts/1.json
  def destroy
    @knowhow_post.destroy!

    respond_to do |format|
      format.html { redirect_to knowhow_posts_path, status: :see_other, notice: "Knowhow post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowhow_post
      @knowhow_post = KnowhowPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def knowhow_post_params
      params.require(:knowhow_post).permit(:title, :content, :user_id)
    end
end
