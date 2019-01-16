class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]



  def create
    @message = Message.new(params[:message].permit(:post_id, :name, :body))
    @message.save
      flash[:notice] = "投稿を作成しました"
      redirect_to post_path(params[:message][:post_id])
  end

  # def edit
  #   @message = Message.find_by(id: params[:id])
  # end

  # def update
  #   @message = Message.find_by(id: params[:id])
  #   @message.content = params[:content]
  #   if @message.save
  #     flash[:notice] = "投稿を編集しました"
  #     redirect_to("/post/index")
  #   else
  #     render("posts/edit")
  #   end
  # end

  def destroy
    message = Message.find_by(id: params[:id])
    if @message.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to post_path(@message.post.id)
    else
      flash[:alert] = "Some errors occured"
      render action: "index"

    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :body)
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
