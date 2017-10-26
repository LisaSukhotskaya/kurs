class PantsController < ApplicationController
  before_action :find_pants, only: %i[show edit update destroy]

  def men_index
    @pants = Pant.where(gender: 'Мужские').order(created_at: :desc)
  end

  def women_index
    @pants = Pant.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @pants = Pant.new
  end

  def create
    @pants = Pant.create(pants_params)
    redirect_to pant_path(@pants), notice: 'Добавлено'
  end

  def edit; end

  def update
    @pants.update(pants_params)
    redirect_to pant_path(@pants)
  end

  def destroy
    @pants.destroy
    redirect_to root_path
  end

  private

  def find_pants
    @pants = Pant.find(params[:id])
  end

  def pants_params
    params.require(:pant).permit(:brand, :description,
                                  :color, :size, :print,
                                  :cost, :cloth, :quantity,
                                  :gender, :image)
  end
end
