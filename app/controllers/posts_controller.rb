class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.prepend('posts', partial: 'posts/post', locals: { post: @post }),
            turbo_stream.replace(:new_post, partial: 'turbo_stream_demos/form', locals: { post: Post.new })
          ]
        end
        format.html { redirect_to turbo_stream_demo_path }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            :new_post, partial: 'turbo_stream_demos/form', locals: { post: @post }
          )
        end
        format.html {
          @posts = Post.all.order(created_at: :desc)
          render template: 'turbo_stream_demos/show'
        }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
