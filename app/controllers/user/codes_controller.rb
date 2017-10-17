class User::CodesController < ApplicationController
  before_action :require_login
  before_action :set_code, only: [:show, :edit, :update, :destroy]

  def index
    @codes = Code.all
  end

  def show
  end

  def new
    @code = Code.new
  end

  def create
    @code = current_user.codes.build(code_params)
    if @code.save
      flash[:success] = "Post created successfully."
      redirect_to user_codes_path
    else
      flash.now[:danger] = "Post was not created."
      render :new
    end
  end

  def edit
  end

  def update
    if @code.update(code_params)
      flash[:success] = "Post updated successfully."
      redirect_to user_code_path(@code)
    else
      flash.now[:danger] = "Post was not updated."
      render :edit
    end
  end

  def destroy
    if @code.delete
      flash[:success] = "Post deleted successfully."
      redirect_to user_codes_path
    else
      render :show
    end
  end

  private

  def code_params
    params.require(:code)
      .permit(:title, :content)
  end

  def set_code
    @code = Code.find(params[:id])
  end

end
