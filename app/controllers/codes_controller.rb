class CodesController < ApplicationController
  def index
    @code = Code.all
  end

  def show
    @codes = Code.find(params[:id])
  end
end
