class User::LivesController < ApplicationController
  before_action :require_login
  before_action :set_life, only: [:show, :edit, :destroy, :update]

  def index
    @lives = Life.all.paginate(page: params[:page]).order(created_at: :desc)
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
      flash[:danger] = "Post was not deleted."
    end
  end

  private

  def life_params
    params.require(:life)
      .permit(:title, :content)
  end

  def set_life
    @life = Life.friendly.find(params[:id])
  end

end
