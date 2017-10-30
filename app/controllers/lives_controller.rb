class LivesController < ApplicationController
  def index
    @lives = Life.all
  end

  def show
    @life = Life.friendly.find(params[:id])
  end
end
