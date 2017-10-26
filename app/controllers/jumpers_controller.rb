class JumpersController < ApplicationController

  before_action :find_jumper, only: %i[show edit update destroy]

  def men_index
    @jumpers = Jumper.where(gender: 'Мужские').order(created_at: :desc)
  end

  def women_index
    @jumpers = Jumper.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @jumper = Jumper.new
  end

  def create
    @jumper = Jumper.create(jumper_params)
    redirect_to jumper_path(@jumper), notice: 'Добавлено'
  end

  def edit; end

  def update
    @jumper.update(jumper_params)
    redirect_to jumper_path(@jumper)
  end

  def destroy
    @jumper.destroy
    redirect_to root_path
  end

  private

  def find_jumper
    @jumper = Jumper.find(params[:id])
  end

  def jumper_params
    params.require(:jumper).permit(:brand, :description,
                                   :color, :size, :print,
                                   :cost, :cloth, :quantity,
                                   :gender, :image)
  end
end
