class TopController < ApplicationController

  def index
    @pics = Picture.all
  end
end
