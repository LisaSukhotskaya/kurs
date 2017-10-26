class TShirtsController < ApplicationController

  before_action :find_t_shirt, only: %i[show edit update destroy]

  def men_index
    @t_shirts = TShirt.where(gender: 'Мужские').order(created_at: :desc)
  end

  def women_index
    @t_shirts = TShirt.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @t_shirt = TShirt.new
  end

  def create
    @t_shirt = TShirt.create(t_shirt_params)
    redirect_to t_shirt_path(@t_shirt), notice: 'Добавлено'
  end

  def edit; end

  def update
    @t_shirt.update(t_shirt_params)
    redirect_to t_shirt_path(@t_shirt)
  end

  def destroy
    @t_shirt.destroy
    redirect_to root_path
  end

  private

  def find_t_shirt
    @t_shirt = TShirt.find(params[:id])
  end

  def t_shirt_params
    params.require(:t_shirt).permit(:brand, :description,
                                   :color, :size, :print,
                                   :cost, :cloth, :quantity,
                                   :gender, :image)
  end
end
