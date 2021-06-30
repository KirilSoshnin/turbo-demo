class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id]).increment(:likes_count)
    @post.save

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("post_#{@post.id}", partial: 'posts/post', locals: { post: @post })
      end
      format.html { redirect_to turbo_stream_demo_path }
      end
  end
end
