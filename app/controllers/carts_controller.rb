class CartsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @cart = Cart.find(params[:id])
  end
end
