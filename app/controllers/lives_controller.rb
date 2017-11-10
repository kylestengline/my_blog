class LivesController < ApplicationController
  def index
    @lives = Life.all.paginate(page: params[:page]).order(created_at: :desc)
  end

  def show
    @life = Life.friendly.find(params[:id])
  end
end
