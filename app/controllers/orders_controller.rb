class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    order
    redirect_to basket_path
  end

  def order
    @items = Clothes.where(basket: true)
    for item in @items do
      item.update(basket: false, basket_count: 0,
                  quantity: item.quantity - 1)
    end
  end

  private

  def order_params
    params.require(:order).permit(:client_first_name, :client_last_name,
                                  :client_phone, :client_address)
  end

end
