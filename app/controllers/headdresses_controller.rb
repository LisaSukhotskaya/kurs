class HeaddressesController < ApplicationController
  before_action :find_headdress, only: %i[show edit update destroy]

  def men_index
    @headdresses = Headdress.where(gender: 'Мужские').order(created_at: :desc)
  end

  def women_index
    @headdresses = Headdress.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @headdress = Headdress.new
  end

  def create
    @headdress = Headdress.create(headdress_params)
    redirect_to headdress_path(@headdress), notice: 'Добавлено'
  end

  def edit; end

  def update
    @headdress.update(headdress_params)
    redirect_to headdresses_path(@headdress)
  end

  def destroy
    @headdress.destroy
    redirect_to root_path
  end

  private

  def find_headdress
    @headdress = Headdress.find(params[:id])
  end

  def headdress_params
    params.require(:headdress).permit(:brand, :description,
                                      :color, :size, :print,
                                      :cost, :cloth, :quantity,
                                      :gender, :image)
  end
end
