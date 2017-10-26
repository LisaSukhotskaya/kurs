class SkirtsController < ApplicationController

  before_action :find_skirt, only: %i[show edit update destroy]

  def women_index
    @skirts = Skirt.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @skirt = Skirt.new
  end

  def create
    @skirt = Skirt.create(skirt_params)
    redirect_to skirt_path(@skirt), notice: 'Добавлено'
  end

  def edit; end

  def update
    @skirt.update(skirt_params)
    redirect_to skirt_path(@skirt)
  end

  def destroy
    @skirt.destroy
    redirect_to root_path
  end

  private

  def find_skirt
    @skirt = Skirt.find(params[:id])
  end

  def skirt_params
    params.require(:skirt).permit(:brand, :description,
                                   :color, :size, :print,
                                   :cost, :cloth, :quantity,
                                   :gender, :image)
  end
end
