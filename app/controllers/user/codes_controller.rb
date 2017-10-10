class User::CodesController < ApplicationController
  before_action :require_login

  def index
    @codes = Code.all
  end

  def show
    @code = Code.find(params[:id])
  end

end
