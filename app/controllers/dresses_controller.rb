class DressesController < ApplicationController
  before_action :find_dress, only: %i[show edit update destroy]

  def women_index
    @dresses = Dress.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @dress = Dress.new
  end

  def create
    @dress = Dress.create(dress_params)
    redirect_to dress_path(@dress), notice: 'Добавлено'
  end

  def edit; end

  def update
    @dress.update(dress_params)
    redirect_to dress_path(@dress)
  end

  def destroy
    @dress.destroy
    redirect_to root_path
  end

  private

  def find_dress
    @dress = Dress.find(params[:id])
  end

  def dress_params
    params.require(:dress).permit(:brand, :description,
                                  :color, :size, :print,
                                  :cost, :cloth, :quantity,
                                  :gender, :image)
  end
end
