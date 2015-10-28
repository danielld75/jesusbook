class BaptismsController < ApplicationController
  def new
    @baptism = Baptism.new
  end

  def index
    @baptisms = Baptism.all
  end

  def show
  end

  def edit
  end
end
