module MessagesHelper
  def current_post
    @current_post = Post.find_by(id: params[:id])
  end
end
