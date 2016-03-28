class LineItemsController < ApplicationController
  def create
    current_user.current_cart ||= Cart.create!
    cart = current_user.current_cart

    item = Item.find(params[:item_id])
    line_item = cart.line_items.detect {|li| li.item == item}
    if line_item.nil?
      line_item ||= LineItem.create(item: item)
      cart.line_items << line_item
    else
      line_item.quantity += 1
      line_item.save
      #binding.pry
    end
    #current_user.current_cart = current_cart
    #current_cart.user = current_user
    current_user.save
    current_user.current_cart.save
    redirect_to cart_path(cart)
  end
end
