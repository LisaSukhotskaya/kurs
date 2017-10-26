class ShoesController < ApplicationController
  before_action :find_shoes, only: %i[show edit update destroy]

  def men_index
    @shoes = Shoe.where(gender: 'Мужские').order(created_at: :desc)
  end

  def women_index
    @shoes = Shoe.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @shoes = Shoe.new
  end

  def create
    @shoes = Shoe.create(shoes_params)
    redirect_to shoe_path(@shoes), notice: 'Добавлено'
  end

  def edit; end

  def update
    @shoes.update(shoes_params)
    redirect_to shoe_path(@shoes)
  end

  def destroy
    @shoes.destroy
    redirect_to root_path
  end

  private

  def find_shoes
    @shoes = Shoe.find(params[:id])
  end

  def shoes_params
    params.require(:shoe).permit(:brand, :description,
                                  :color, :size, :print,
                                  :cost, :cloth, :quantity,
                                  :gender, :image)
  end
end
