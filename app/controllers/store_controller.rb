class StoreController < ApplicationController

  def index
    @products = Product.all
    @cnt = get_count
    @cart = current_cart
  end

end
