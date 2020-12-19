class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #deviseがインストールされていれば必ず発動する

  protected
  
  # deviseのバリデーションは、専用コントローラーがないので全ての処理が経由するapplicationコントローラーに記載する
  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :email, :birth_date, :first_name, :last_name, :first_name_kana, :last_name_kana]
    #↑各個人の設定した内容によって変わるので、気をつけてね。
    )
  end
end
