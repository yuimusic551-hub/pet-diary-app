class DiariesController < ApplicationController
  before_action :authenticate_user!

  def index
    # ログイン中のユーザーの日記だけを、新しい順に取得
    @diaries = current_user.diaries.order(created_at: :desc)
  end

  def new
    @diary = current_user.diaries.build
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      redirect_to diaries_path, notice: "日記を大切に保存しました 🐾"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :content)
  end
end