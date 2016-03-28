class CartsController < ApplicationController

  def show
    @user = current_cart
  end

  def checkout
    @cart = current_user.current_cart
    @cart.status = "submitted"

    @cart.line_items.each do |line|
      line.item.inventory -= line.quantity
      line.item.save
    end
    current_user.current_cart = nil
    redirect_to cart_path(@cart)
  end

end