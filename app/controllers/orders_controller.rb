class OrdersController < ApplicationController

  def index
      
  end


  def create
    item = Item.find(params[:item_id])
    @order.add_item(item.id)
    session[:order] = @order.contents
    flash[:notice] = "Item added to order"
    redirect_to category_name_path(item.category.name)
  end

end