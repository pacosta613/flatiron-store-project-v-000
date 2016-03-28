class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  #belongs_to :user

  def add_item(item_id)
    item = Item.find(item_id)
    lineitem = line_items.detect {|v| v.item == item}
    lineitem ||= LineItem.new
    lineitem.cart = self
    lineitem.item = item 
    lineitem
  end

  def total
    total = 0 
    line_items.each do |v|
      total += v.item.price * v.quantity
    end
    total
  end

end