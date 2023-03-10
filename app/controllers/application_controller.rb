class ApplicationController < ActionController::Base
  before_action :basic_auth   # これはBASIC認証のためのコード
  before_action :configure_permitted_parameters, if: :devise_controller? # #ログインしてない場合、ログインページに遷移させるメソッド

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']  # 環境変数を読み込む記述に変更
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name, :kana_last_name, :kana_first_name, :birth_date])
  end
end
