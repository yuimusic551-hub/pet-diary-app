class AnimalsController < ApplicationController
  before_action :authenticate_user!

  def new
    @animal = current_user.animals.build
  end

  def create
    @animal = current_user.animals.build(animal_params)
    if @animal.save
      redirect_to diaries_path, notice: "「#{@animal.name}」を登録しました！🐾"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :birthday)
  end
end