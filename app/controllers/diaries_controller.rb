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
      # 保存に失敗したときに、エラーメッセージを表示しやすくするための設定
      render :new, status: :unprocessable_entity
    end
  end

  # 🐾 年齢早見表ページを表示するためのアクション（追加ポイント！）
  def age_chart
    # 画面を表示するだけなので中身は空でOKです
  end

  private

  def diary_params
    # :birthday を追加して、誕生日も保存できるように許可します
    params.require(:diary).permit(:title, :content, :image, :birthday)
  end
end