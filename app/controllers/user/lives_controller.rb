class User::LivesController < ApplicationController
  before_action :require_login

  def index
    @lives = Life.all
  end

  def show
    @life = Life.find(params[:id])
  end

end
