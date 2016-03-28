class CartsController < ApplicationController
  def show
    #@cart = Cart.find(params[:id])
    @cart = current_user.current_cart
  end

  def checkout
    cart = Cart.find(params[:id])
    if cart == current_user.current_cart
      #binding.pry
      #cart = Cart.find(params[:id])
      cart.line_items.each do |line_item|
        line_item.item.inventory -= line_item.quantity
        line_item.item.save
      end
      cart.status = "submitted"
      cart.save
      #binding.pry
      current_user.carts << current_cart unless current_user.carts.include?(cart)
      current_user.current_cart_id = nil
      current_user.save
      redirect_to cart_path(cart)
    end
  end
end
