class PetsController < ApplicationController
  # ログインしていないとペット登録できないようにする
  before_action :authenticate_user!

  def index
    # ログイン中のユーザーのペットだけを表示する
    @pets = current_user.pets
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pet_params
    # 誰のペットか(user_id)も一緒に保存する
    params.require(:pet).permit(:name, :birth_date, :species_id, :gender_id).merge(user_id: current_user.id)
  end
end