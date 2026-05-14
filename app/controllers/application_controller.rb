class ApplicationController < ActionController::Base
  # ログイン後にどこに飛ばすかを決める命令
  def after_sign_in_path_for(resource)
    diaries_path # 日記一覧ページ（この後作ります）へ飛ばす
  end

  # 新規登録後にどこに飛ばすかを決める命令
  def after_sign_up_path_for(resource)
    diaries_path
  end
end