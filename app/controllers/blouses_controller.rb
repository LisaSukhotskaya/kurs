class BlousesController < ApplicationController
  before_action :find_blouse, only: %i[show edit update destroy]

  def women_index
    @blouses = Blouse.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @blouse = Blouse.new
  end

  def create
    @blouse = Blouse.create(blouse_params)
    redirect_to blouse_path(@blouse), notice: 'Добавлено'
  end

  def edit; end

  def update
    @blouse.update(blouse_params)
    redirect_to blouse_path(@blouse)
  end

  def destroy
    @blouse.destroy
    redirect_to root_path
  end

  private

  def find_blouse
    @blouse = Blouse.find(params[:id])
  end

  def blouse_params
    params.require(:blouse).permit(:brand, :description,
                                   :color, :size, :print,
                                   :cost, :cloth, :quantity,
                                   :gender, :image)
  end
end
