class Order < ApplicationRecord

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new
  end

  def add_item(item_id)
    @contents[item_id.to_s] ||= 0
    @contents[item_id.to_s] += 1
  end

  def items
    @contents.reduce({}) do |hash, (id, quantity)|
      hash[Item.find(id.to_i)] = quantity
      hash
    end
  end

  def delete(item_id)
    @contents.delete(item_id.to_s)
  end

  def update_quantity(item_id, quantity)
    @contents[item_id.to_s] = quantity
    delete(item_id.to_s) if quantity == "0"
  end

end
