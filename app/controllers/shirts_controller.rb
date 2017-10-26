class ShirtsController < ApplicationController
  before_action :find_shirt, only: %i[show edit update destroy]

  def men_index
    @shirts = Shirt.where(gender: 'Мужские').order(created_at: :desc)
  end

  def women_index
    @shirts = Shirt.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @shirt = Shirt.new
  end

  def create
    @shirt = Shirt.create(shirt_params)
    redirect_to shirt_path(@shirt), notice: 'Добавлено'
  end

  def edit; end

  def update
    @shirt.update(shirt_params)
    redirect_to shirt_path(@shirt)
  end

  def destroy
    @shirt.destroy
    redirect_to root_path
  end

  private

  def find_shirt
    @shirt = Shirt.find(params[:id])
  end

  def shirt_params
    params.require(:shirt).permit(:brand, :description,
                                  :color, :size, :print,
                                  :cost, :cloth, :quantity,
                                  :gender, :image)
  end
end
