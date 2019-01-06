class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc).paginate(page: params[:page])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to posts_path
    else
      render new_post_path
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to　users_path
    else
      flash.now[:notice] = "削除する権限がありません"
      render action: "index"

    end
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

    def correct_user
      @post = Post.find_by(id: params[:id])
      @user = @post.user
      redirect_to posts_path unless current_user?(@user)
    end

     # 渡されたユーザーがログイン済みユーザーであれば true を返す
    def current_user?(user)
      user == current_user
    end
end
