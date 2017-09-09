class PostsController < ApplicationController

  def life_in_general
    @posts = Post.all
  end

  def show
  end
end
