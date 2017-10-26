class JeansController < ApplicationController
  before_action :find_jeans, only: %i[show edit update destroy]

  def men_index
    @jeans = Jeans.where(gender: 'Мужские').order(created_at: :desc)
  end

  def women_index
    @jeans = Jeans.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @jeans = Jeans.new
  end

  def create
    @jeans = Jeans.create(jeans_params)
    redirect_to jeans_path(@jeans), notice: 'Добавлено'
  end

  def edit; end

  def update
    @jeans.update(jeans_params)
    redirect_to jeans_path(@jeans)
  end

  def destroy
    @jeans.destroy
    redirect_to root_path
  end

  private

  def find_jeans
    @jeans = Jeans.find(params[:id])
  end

  def jeans_params
    params.require(:jeans).permit(:brand, :description,
                                  :color, :size, :print,
                                  :cost, :cloth, :quantity,
                                  :gender, :image)
  end
end
