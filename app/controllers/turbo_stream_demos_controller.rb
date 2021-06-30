class TurboStreamDemosController < ApplicationController
  def show
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end
end
