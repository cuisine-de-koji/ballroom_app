class MessagesController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @messages = Message.where(post_id: params[:id])
  end
end
