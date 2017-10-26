class SportSuitsController < ApplicationController

  before_action :find_sport_suit, only: %i[show edit update destroy]

  def men_index
    @sport_suits = SportSuit.where(gender: 'Мужские').order(created_at: :desc)
  end

  def women_index
    @sport_suits = SportSuit.where(gender: 'Женские').order(created_at: :desc)
  end

  def show; end

  def new
    @sport_suit = SportSuit.new
  end

  def create
    @sport_suit = SportSuit.create(sport_suit_params)
    redirect_to sport_suit_path(@sport_suit), notice: 'Добавлено'
  end

  def edit; end

  def update
    @sport_suit.update(sport_suit_params)
    redirect_to sport_suit_path(@sport_suit)
  end

  def destroy
    @sport_suit.destroy
    redirect_to root_path
  end

  private

  def find_sport_suit
    @sport_suit = SportSuit.find(params[:id])
  end

  def sport_suit_params
    params.require(:sport_suit).permit(:brand, :description,
                                   :color, :size, :print,
                                   :cost, :cloth, :quantity,
                                   :gender, :image)
  end
end
