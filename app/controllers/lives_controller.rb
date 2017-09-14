class LivesController < ApplicationController
  def index
    @life = Life.all
  end
end
