class ClothesController < ApplicationController
  def add_to_basket
    @item = Clothes.find(params[:item_id])
    if params[:basket_item_size].nil?
      @item.basket_item_size = 'Будет уточнён оператором'
    else
      @item.basket_item_size = params[:basket_item_size]
    end
    @item.basket = params[:basket]
    @item.basket_count += 1
    @item.save
    redirect_to basket_path
  end

  def delete_from_basket
    @item = Clothes.find(params[:item_id])
    @item.basket = false
    @item.basket_count = 0
    @item.basket_item_size = ''
    @item.save
    redirect_to basket_path
  end

  def add_clothes; end

  def show
    @clothes = Clothes.find(params[:id])
  end

  def new_clothes
    @clothes = Clothes.where("created_at > '#{Time.now - 2.days}'")
  end

  def basket
    @items = Clothes.where(basket: true)
  end
end
