class User::LivesController < ApplicationController
  before_action :require_login
  before_action :set_life, only: [:show, :edit, :destroy, :update]

  def index
    @lives = Life.all
  end

  def show
  end

  def new
    @life = Life.new
  end

  def create
    @life = current_user.lives.build(life_params)
    if @life.save
      flash[:success] = "Post created successfully."
      redirect_to user_lives_path
    else
      flash.now[:danger] = "Post was not created."
      render :new
    end
  end

  def edit
  end

  def update
    if @life.update(life_params)
      flash[:success] = "Post updated successfully."
      redirect_to user_life_path(@life)
    else
      flash.now[:danger] = "Post was not updated."
      render :edit
    end
  end

  def destroy
    if @life.destroy
      flash[:success] = "Post deleted successfully."
      redirect_to user_lives_path
    else
      render :show
    end
  end

  private

  def life_params
    params.require(:life)
      .permit(:title, :content)
  end

  def set_life
    @life = Life.find(params[:id])
  end

end
