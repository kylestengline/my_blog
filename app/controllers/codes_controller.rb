class CodesController < ApplicationController
  def index
    @codes = Code.all.paginate(page: params[:page]).order(created_at: :desc)
  end

  def show
    @code = Code.friendly.find(params[:id])
  end
end
