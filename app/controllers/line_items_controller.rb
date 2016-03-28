class LineItemsController < ApplicationController

  def create
    if current_user.current_cart.nil?
      current_user.current_cart = Cart.create
    end
  
    current_user.current_cart.add_item(params[:item_id]).save
    redirect_to cart_path(current_user.current_cart)
  end

end