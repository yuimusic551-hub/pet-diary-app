class DiariesController < ApplicationController
  before_action :authenticate_user!
  # 編集・更新・削除の前に、その日記が本当に自分のかチェックするお守り
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    # 1. ログインしているユーザーのすべての日記を準備
    @diaries = current_user.diaries.order(created_at: :desc)

    # 2. ペットボタンが押されていたら絞り込む
    if params[:animal_id].present?
      @diaries = @diaries.where(animal_id: params[:animal_id])
      @current_animal = Animal.find(params[:animal_id])
    end
  end

  def show
    # 詳細画面用（もし詳細ページを作る場合に必要です）
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

  # ✨ 編集画面を表示する
  def edit
    # set_diary で @diary を準備しているので中身は空でOK
  end

  # ✨ 編集内容を保存（更新）する
  def update
    if @diary.update(diary_params)
      redirect_to diaries_path, notice: "日記を新しく書き直しました ✨"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # ✨ 日記を削除する
  def destroy
    @diary.destroy
    redirect_to diaries_path, notice: "日記をお片付け（削除）しました。"
  end

  # 🐾 年齢早見表ページ
  def age_chart
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :content, :image, :birthday, :animal_id)
  end

  # 自分の日記だけを探し出す共通処理（他の人に勝手に消されないためのガード）
  def set_diary
    @diary = current_user.diaries.find(params[:id])
  end
end