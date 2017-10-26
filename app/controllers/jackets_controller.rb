class JacketsController < ApplicationController

before_action :find_jacket, only: %i[show edit update destroy]

def men_index
  @jackets = Jacket.where(gender: 'Мужские').order(created_at: :desc)
end

def women_index
  @jackets = Jacket.where(gender: 'Женские').order(created_at: :desc)
end

def show; end

def new
  @jacket = Jacket.new
end

def create
  @jacket = Jacket.create(jacket_params)
  redirect_to jacket_path(@jacket), notice: 'Добавлено'
end

def edit; end

def update
  @jacket.update(jacket_params)
  redirect_to jacket_path(@jacket)
end

def destroy
  @jacket.destroy
  redirect_to root_path
end

private

def find_jacket
  @jacket = Jacket.find(params[:id])
end

def jacket_params
  params.require(:jacket).permit(:brand, :description,
                                 :color, :size, :print,
                                 :cost, :cloth, :quantity,
                                 :gender, :image)
end
end
