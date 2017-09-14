class CodesController < ApplicationController
  def index
    @code = Code.all
  end
end
