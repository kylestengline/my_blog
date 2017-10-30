class LivesController < ApplicationController
  def index
    @lives = Life.all
  end

  def show
    @life = Life.find_by(title: params[:title])
  end
end
