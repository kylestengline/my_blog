class CodesController < ApplicationController
  def index
    @codes = Code.all
  end

  def show
    @code = Code.friendly.find(params[:id])
  end
end
